package com.its.lilac.repository;

import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import com.its.lilac.datamodel.VideoDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Repository
public class YoutubeAPIRepository {

    @Autowired
    private SqlSessionTemplate m_sql;


    /**
     * tbl_youtube 테이블에 insert 한다.
     * 조회수(video_views) 정보를 얻기 위해서는 별도의 Videos API를 호출해야 하므로 일단 보류한다.
     * tbl_youtube 테이블의 컬럼들
     * video_id
     * video_title
     * video_desc
     * video_date
     * video_thumbnail
     * video_views
     * video_channel_id
     * video_channel_title
     * video_playlist_id
     * @param list 유튜브영상 리스트
     * @return 저장한 유뷰트영상 갯수
     */
    public int saveVideoList(List<SearchResult> list) {
        int insertCount = 0;
        for(SearchResult video : list){
            Map<String, Object> param = new HashMap<>();
            ResourceId rId = video.getId();

            param.put("video_id", rId.getVideoId());
            param.put("video_title", video.getSnippet().getTitle());
            param.put("video_desc", video.getSnippet().getDescription());
            param.put("video_date", new Timestamp(video.getSnippet().getPublishedAt().getValue()));
            param.put("video_thumbnail", video.getSnippet().getThumbnails().getHigh().getUrl());
            param.put("video_channel_id", video.getSnippet().getChannelId());
            param.put("video_channel_title", video.getSnippet().getChannelTitle());
            param.put("video_playlist_id", rId.getPlaylistId());
            insertCount += m_sql.insert("Video.saveVideo", param);
        }

        return insertCount;
    }

    public List<VideoDTO> getVideoListPaging(String keyword, int offset, int videoCount) {
        Map<String, Object> param = new HashMap<>();
        param.put("keyword", keyword);
        param.put("offset", offset);
        param.put("videoCount", videoCount);
        return m_sql.selectList("Video.listPaging", param);
    }

    public List<VideoDTO> getRecommendedVideoList() {
        return m_sql.selectList("Video.recommendedVideoList");
    }

    public VideoDTO getVideoInfo(String videoId) {
        return m_sql.selectOne("Video.videoInfo", videoId);
    }
}
