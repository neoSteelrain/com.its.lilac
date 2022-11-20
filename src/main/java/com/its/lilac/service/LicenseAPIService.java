package com.its.lilac.service;

import com.its.lilac.common.APIEndPointManager;
import com.its.lilac.datamodel.LicenseInfoDTO;
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
import java.util.ArrayList;
import java.util.List;

@PropertySource(value = "classpath:/api-keys.properties")
@Service
public class LicenseAPIService {

    @Autowired
    private LicenseAPIRepository m_licenseAPIRepository;

    @Value("${qualExamSchd.apikey}")
    private String m_apiKey;


    public LicenseScheduleDTO getLicenseSchedule(String licenseName) {

        return null;
    }

    /**
     * 사용자가 입력한 자격증 검색어에 해당하는 자격증 정보를 반환한다.
     * @param licenseName
     * @return
     */
    public List<LicenseInfoDTO> getLicenseInfo(String licenseName) {
        return m_licenseAPIRepository.getLicenseCode(licenseName);
    }

    /**
     * 자격증에 대한 시험정보를 반환한다.
     * @param licenseCode 자격증 종목 코드.
     * @return 자격증의 시험정보일정
     */
    public List<LicenseScheduleDTO> getLicenseSchedules(int licenseCode) {
        List<LicenseScheduleDTO> res = searchLicenseSchedules(licenseCode);
        return null;
    }


    private List<LicenseScheduleDTO> searchLicenseSchedules(int licenseCode) {

        HttpGet httpGet = new HttpGet(APIEndPointManager.LICENSE_SCHEDULE_API_URL_GET);
        List<NameValuePair> nvp = new ArrayList<>(6);
        nvp.add(new BasicNameValuePair("serviceKey", m_apiKey));
        nvp.add(new BasicNameValuePair("numOfRows", "10"));
        nvp.add(new BasicNameValuePair("pageNo", "1"));
        nvp.add(new BasicNameValuePair("dataFormat", "json"));
        nvp.add(new BasicNameValuePair("implYy", "2022"));
        nvp.add(new BasicNameValuePair("qualgbCd", "T"));
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
                System.out.println(EntityUtils.toString(entity));
            }catch (ParseException pe){
                pe.printStackTrace();
            }
        }catch (IOException ioe){
            ioe.printStackTrace();
        }
        return null;

    }

/*
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
