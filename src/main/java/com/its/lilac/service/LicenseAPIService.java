package com.its.lilac.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.its.lilac.common.APIEndPointManager;
import com.its.lilac.datamodel.Items;
import com.its.lilac.datamodel.LicenseInfoDTO;
import com.its.lilac.datamodel.LicenseRawDataDTO;
import com.its.lilac.datamodel.LicenseScheduleDTO;
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
import java.sql.Array;
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

    public List<LicenseInfoDTO> getLicenseList() {
        return m_licenseAPIRepository.getLicenseList();
    }

    /**
     * 사용자가 입력한 키워드를 포함하는 모든 자격증 시험일정 리스트를 반환한다.
     * @param keyword 검색할 자격증 키워드
     * @return 자격증 시험일정 리스트
     */
    public List<LicenseScheduleDTO> getLicenseSchedulesByKeyword(String keyword) {
        /*
        1. 키워드로 검색된 모든 자격증코드를 가져온다.
        2. 각각의 자격증코드에 해당하는 자격증 시험일정을 API를 통해 가져온다.
        3. 자격증 시험일정 리스트를 만들어서 반환한다.
         */
        List<LicenseInfoDTO> lic_list = m_licenseAPIRepository.getLicenseList(keyword);
        if(lic_list == null)
            new ArrayList<LicenseScheduleDTO>(0);

        List<LicenseScheduleDTO> sch_list = new ArrayList<LicenseScheduleDTO>(lic_list.size());
        try {
            for (LicenseInfoDTO lic : lic_list) {
                LicenseScheduleDTO sch = new LicenseScheduleDTO();
                String tmp = callLicenseScheduleAPI(lic.getLicense_code());
                ObjectMapper om = new ObjectMapper();
                LicenseRawDataDTO jsonObj = om.readValue(tmp, LicenseRawDataDTO.class);
                sch.setLicense_schedule_json(jsonObj);
                sch.setLicense_title(lic.getLicense_name());
                sch.setLicense_code(lic.getLicense_code());
                sch_list.add(sch);
            }
        }catch (IOException ioe){
            ioe.printStackTrace();
        }
        return sch_list;
    }

    /**
     * 화면에 출력할 진행단계, 종료일자 를 추가한다.
     * @param dto 추가할 DTO
     * @return 추가된 DTO
     */
    private LicenseScheduleDTO appendViewData(LicenseScheduleDTO dto){
        List<Items> items = dto.getLicense_schedule_json().getBody().getItems();
        // 현재 시험이 어느단계 인지 알아내는 부분


        return dto;
    }

    /**
     * 파라미터로 주어진 자격시험의 전체 회차중 현재 진행중인 회차를 구한다.
     * @param items 자격시험의 전체 회차 리스트
     * @return 현재 진행중인 회차를 나타내는 문자열, 예) "1회차 필기시험 접수중"
     */
    private String getCurrentStep(Items[] items){
        /*
        "docRegStartDt": "20220607",
        "docRegEndDt": "20220610",
        "docExamStartDt": "20220702",
        "docExamEndDt": "20220722",
        "docPassDt": "20220810",
        "pracRegStartDt": "20220905",
        "pracRegEndDt": "20220908",
        "pracExamStartDt": "20221016",
        "pracExamEndDt": "20221028",
        "pracPassDt": "20221111"
         */
        // 현재날짜의 년월일 표현 예) "20221121"
        String nowDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

//        if(nowDate.compareTo(items[0].getDocRegStartDt()) == -1 && Integer.valueOf(nowDate) - Integer.valueOf(items[0].getDocRegStartDt()) ){
//
//        }

        return null;
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
        nvp.add(new BasicNameValuePair("numOfRows", "20"));
        nvp.add(new BasicNameValuePair("pageNo", "1"));
        nvp.add(new BasicNameValuePair("dataFormat", "json"));
        // 적용년도는 올해로 세팅한다.
        nvp.add(new BasicNameValuePair("implYy", String.valueOf(Calendar.getInstance().get(Calendar.YEAR))));
        nvp.add(new BasicNameValuePair("qualgbCd", "T"));
        // 종목코드 세팅
        nvp.add(new BasicNameValuePair("jmCd", String.valueOf(licenseCode)));
        try{
            URI uri = new URIBuilder(new URI(APIEndPointManager.LICENSE_SCHEDULE_API_URL_GET))
                    .addParameters(nvp)
                    .build();
            httpGet.setUri(uri);
        }catch (URISyntaxException urie){
            urie.printStackTrace();
        }

        try(CloseableHttpClient httpClient = HttpClients.createDefault()){
            try(ClassicHttpResponse response = httpClient.execute(httpGet)){
                HttpEntity entity = response.getEntity();
//                System.out.println(EntityUtils.toString(entity));
                result = EntityUtils.toString(entity);
            }catch (ParseException pe){
                pe.printStackTrace();
            }
        }catch (IOException ioe){
            ioe.printStackTrace();
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
