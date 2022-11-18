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
    private int video_views;
    private String video_channel_id;
    private String video_channel_title;
    private String video_playlist_id;
}
