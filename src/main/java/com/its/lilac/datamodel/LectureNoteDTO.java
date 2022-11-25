package com.its.lilac.datamodel;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class LectureNoteDTO {
    /*
    lct_note_id
lct_note_title
lct_desc
lct_note_date
lct_progress
member_id
license_schedule_id
     */
    private long lct_note_id;
    private String lct_note_title;
    private String lct_desc;
    private Timestamp lct_note_date;
    private int lct_progress;
    private long member_id;
    private long license_schedule_id;
}
