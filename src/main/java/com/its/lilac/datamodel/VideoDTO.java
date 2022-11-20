package com.its.lilac.datamodel;

import lombok.Data;

import java.sql.Timestamp;

/**
 * 유튜브 영상을 나타내는 DTO
 *
 */
@Data
public class VideoDTO {
    private String video_id;
    private String video_title;
    private String video_desc;
    private Timestamp video_date;
    private String video_thumbnail;
    // 유튜브영상의 조회수
    private int video_views;
    private String video_channel_id;
    private String video_channel_title;
    private String video_playlist_id;
    // lilac 사이트에서 조회한 조회수, 유튜브 조회수는 API에서 반환한 진짜 조회수 이므로 lilac사이트에서만 사용하는 값이다.
    private int video_search_count;
}
