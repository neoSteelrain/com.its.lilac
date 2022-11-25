package com.its.lilac.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.its.lilac.common.APIEndPointManager;
import com.its.lilac.datamodel.Items;
import com.its.lilac.datamodel.LicenseCategoryDTO;
import com.its.lilac.datamodel.LicenseDTO;
import com.its.lilac.datamodel.LicenseScheduleJsonDTO;
import com.its.lilac.exception.LicenseAPIException;
import com.its.lilac.exception.LicenseException;
import com.its.lilac.repository.LicenseAPIRepository;
import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.ClassicHttpResponse;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.NameValuePair;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.message.BasicNameValuePair;
import org.apache.hc.core5.net.URIBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@PropertySource(value = "classpath:/api-keys.properties")
@Service
public class LicenseAPIService {

    @Autowired
    private LicenseAPIRepository m_licenseAPIRepository;

    @Value("${qualExamSchd.apikey}")
    private String m_apiKey;

    /**
     * DB에 있는 모든 자격증 종목코드, 자격증이름을 반환한다.
     * @return 종목코드를 포함한 자격증정보 리스트
     */
    public List<LicenseCategoryDTO> getLicenseCategoryList() {
        return m_licenseAPIRepository.getLicenseCategoryList();
    }

    /**
     * 사용자가 입력한 키워드를 포함하는 모든 자격증 리스트를 반환한다.
     * @param keyword 검색할 자격증 키워드
     * @return 자격증 리스트
     */
    public List<LicenseDTO> getLicenseSchedulesByKeyword(String keyword) {
        /*
        TODO : 배치작업으로 처리하면 필요없는 작업이지만 아직 배치작업구현이 안되었으므로 일단 검색할때 조건검사로 대체한다. 나중에 바꿔야 한다.
        - 작업순서
        1. 키워드로 검색된 모든 자격증코드,이름,공공데이터 API호출 응답 json 값들을 가져온다.
        2. license_schedule_json 필드가 null 인지 검사해서
           null 이라면 처음검색되는 자격증이므로 API를 호출하여 응답 json을 DB에 update 해주고 json 값 처리를 진행한다.
           null 이 아니라면 DB에서 가져온 값으로 json 값처리를 진행한다.
        3. 자격증 시험일정 리스트를 만들어서 반환한다.
        */
        List<LicenseDTO> lic_list = m_licenseAPIRepository.getLicenseInfoList(keyword);
        if(lic_list == null)
            new ArrayList<LicenseDTO>(0);

        ObjectMapper om = new ObjectMapper();
        try {
            // 자격증 갯수만큼 API호출해서 시험일정을 가져온다.
            for (LicenseDTO lic : lic_list) {
                // license_schedule_json 필드가 null 이면 API호출 하고 응답 json을 DB에 update 한다.
                if(lic.getLicense_schedule_json() == null){
                    String jsonString = callLicenseScheduleAPI(lic.getLicense_code());
                    boolean isUpdated = m_licenseAPIRepository.updateLicenseJson(lic.getLicense_code(), jsonString) > 0;
                    if(!isUpdated)
                        new ArrayList<LicenseDTO>(0);

                    lic.setLicense_schedule_json(om.readValue(jsonString, LicenseScheduleJsonDTO.class));
                }
                appendViewData(lic);
            }
        }catch (IOException ioe){
            throw new LicenseException("키워드로 자격증을 검색하는 도중 예외가 발생하였습니다.", ioe);
        }
        return lic_list;
    }

    public List<LicenseDTO> getLicenseSchedulesByCode(int licenseCode) {
        /*
        TODO : 배치작업으로 처리하면 필요없는 작업이지만 아직 배치작업구현이 안되었으므로 일단 검색할때 조건검사로 대체한다. 나중에 바꿔야 한다.
        앞서 구현된 키워드검색과 비슷한 로직으로 처리한다.
         */

        //종목코드만 있어도 API호출은 가능하지만 API응답에는 자격증이름이 없기 때문에 DB에서 이름을 가져와야 한다.
        LicenseDTO lic_info = m_licenseAPIRepository.getLicenseInfo(licenseCode);
        if(lic_info == null)
            new ArrayList<LicenseDTO>(0);

        /*
         license_schedule_json 필드가 null 이라면 처음 검색되는 자격증이므로 API호출로 값을 가져오지만
         null 아닌경우에는 이미 호출되어서 값이 세팅되어 있으므로 DB에서 바로 가져오고 리턴한다.
         */
        List<LicenseDTO> lic_list = new ArrayList<>(1);
        ObjectMapper om = new ObjectMapper();
        try{
            if(lic_info.getLicense_schedule_json() == null){
                String jsonString = callLicenseScheduleAPI(licenseCode);
                boolean isUpdated = m_licenseAPIRepository.updateLicenseJson(licenseCode, jsonString) > 0;
                if(!isUpdated)
                    new ArrayList<LicenseDTO>(0);

                lic_info.setLicense_schedule_json(om.readValue(jsonString, LicenseScheduleJsonDTO.class));
            }
            appendViewData(lic_info);
            lic_list.add(lic_info);
        }catch (IOException ioe){
            throw new LicenseException("종목코드로 자격증을 검색하는 도중 예외가 발생하였습니다",ioe);
        }
        return lic_list;
    }

    /**
     * 화면에 출력할 정보들을 세팅한다.
     * 출력에 필요한 정보들 : 회차 진행수, 진행단계, 종료일자를 추가한다.
     * 현재날짜를 기준으로 지금 진행중인 시험일정이 있는지 검사해서 LicenseDTO에 세팅한다.
     * @param dto 진행단계를 세팅할 DTO
     */
    private void appendViewData(LicenseDTO dto){
        List<Items> items = dto.getLicense_schedule_json().getBody().getItems();
        // 문자열보다는 숫자로 하는 비교가 더 확실하므로 자격증 날짜와 비교할 현재날짜를 int로 구한다.
        int now = Integer.parseInt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")));
        dto.setLic_desc(String.format("총 %d 회차 진횅",items.size()));
        // 현재 시험이 어느단계 인지 알아내는 부분
        for(Items item : items){
            // 필기시험 단계 검사
            if(Integer.parseInt(item.getDocRegStartDt()) <= now && Integer.parseInt(item.getDocRegEndDt()) >= now ){
                dto.setLic_step(item.getImplSeq() + "회차 필기시험 접수중");
                dto.setLic_end_date(item.getDocRegEndDt());
                continue;
            }
            if(Integer.parseInt(item.getDocExamStartDt()) <= now && Integer.parseInt(item.getDocExamEndDt()) >= now ){
                dto.setLic_step(item.getImplSeq() + "회차 필기시험 진행중");
                dto.setLic_end_date(item.getDocExamEndDt());
                continue;
            }
            if(Integer.parseInt(item.getDocPassDt()) == now){
                dto.setLic_step(item.getImplSeq() + "회차 필기시험 결과발표");
                dto.setLic_end_date(item.getDocPassDt());
                continue;
            }
            // 실기시험 단계 검사
            if(Integer.parseInt(item.getPracRegStartDt()) <= now && Integer.parseInt(item.getPracRegEndDt()) >= now ){
                dto.setLic_step(item.getImplSeq() + "회차 실기시험 접수중");
                dto.setLic_end_date(item.getPracRegEndDt());
                continue;
            }
            if(Integer.parseInt(item.getPracExamStartDt()) <= now && Integer.parseInt(item.getPracExamEndDt()) >= now ){
                dto.setLic_step(item.getImplSeq() + "회차 실기시험 진행중");
                dto.setLic_end_date(item.getPracExamEndDt());
                continue;
            }
            if(Integer.parseInt(item.getPracPassDt()) == now){
                dto.setLic_step(item.getImplSeq() + "회차 실기시험 결과발표");
                dto.setLic_end_date(item.getPracPassDt());
                continue;
            }
            /*
            여기까지 오면 현재날짜가 시험일정에 해당하지않는 것이므로 해당사항 없음으로 설정
             */
            dto.setLic_step("해당사항 없음");
            dto.setLic_end_date("-");
        }
    }

    /**
     * 국가자격 시험일정 서비스 API를 호출하는 헬퍼메서드
     * 아파치 HttpClient 5 로 구현되어 있다.
     * @param licenseCode 자격증종목코드
     * @return
     */
    private String callLicenseScheduleAPI(int licenseCode) {
        String result = null;
        HttpGet httpGet = new HttpGet(APIEndPointManager.LICENSE_SCHEDULE_API_URL_GET);
        List<NameValuePair> nvp = new ArrayList<>(6);
        nvp.add(new BasicNameValuePair("serviceKey", m_apiKey));
        // 1페이지 결과수
        nvp.add(new BasicNameValuePair("numOfRows", "50")); // 50개 까지가 API가 정한 한계수치, 1년 동안 50번 이상 치루는 시험은 없을것이다...
        nvp.add(new BasicNameValuePair("pageNo", "1"));
        nvp.add(new BasicNameValuePair("dataFormat", "json"));
        // 적용년도는 올해로 세팅한다.
        nvp.add(new BasicNameValuePair("implYy", String.valueOf(Calendar.getInstance().get(Calendar.YEAR))));
        /*
        자격구분코드
        T : 국가기술자격
        C : 과정평가형
        W : 일학습병행자격
        S : 국가전문자격
        정보처리기사 같은 정보기술 분야는 국가기술자격에 속하므로 T로 설정한다.
         */
        nvp.add(new BasicNameValuePair("qualgbCd", "T"));
        // 종목코드 세팅
        nvp.add(new BasicNameValuePair("jmCd", String.valueOf(licenseCode)));
        try{
            URI uri = new URIBuilder(new URI(APIEndPointManager.LICENSE_SCHEDULE_API_URL_GET))
                    .addParameters(nvp)
                    .build();
            httpGet.setUri(uri);
        }catch (URISyntaxException urie){
            throw new RuntimeException("공공데이터 API 호출시 에외 발생", urie);
        }

        try(CloseableHttpClient httpClient = HttpClients.createDefault()){
            try(ClassicHttpResponse response = httpClient.execute(httpGet)){
                HttpEntity entity = response.getEntity();
                result = EntityUtils.toString(entity);
            }catch (ParseException pe){
                throw new RuntimeException("공공데이터 API 호출시 에외 발생", pe);
            }
        }catch (IOException ioe){
            throw new RuntimeException("공공데이터 API 호출시 에외 발생", ioe);
        }
        return result;
    }

/* WebClient 테스트 코드 : 안됨... ㅆ 아파치 HttpClient 쓴다.
    private String getWebClient(int licenseCode) {

        LicenseScheduleDTO res = null;
        try{
            res = m_webClient.get().uri(uriBuilder -> uriBuilder.path("https://apis.data.go.kr/B490007/qualExamSchd/getQualExamSchdList")
                            .queryParam("serviceKey", m_apiKey)
                            .queryParam("numOfRows", 10)
                            .queryParam("pageNo", 1)
                            .queryParam("dataFormat", "json")
                            .queryParam("implYy", 2022)
                            .queryParam("qualgbCd", "T")
                            .queryParam("jmCd", licenseCode)
                            .build()
                    ).accept(MediaType.APPLICATION_JSON)
                    .retrieve()
                    .bodyToFlux(LicenseScheduleDTO.class)
                    .toStream()
                    .findFirst()
                    .orElseThrow(()->new IOException("자걱시험 일정 조회 예외"));
        }catch (IOException ioe){
            ioe.printStackTrace();
        }
        return null;
    }*/
}
