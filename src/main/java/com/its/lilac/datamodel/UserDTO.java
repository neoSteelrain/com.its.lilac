package com.its.lilac.datamodel;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class UserDTO {
    private long member_id;
    private String member_nickname;
    private String member_email;
    private String member_desc;
    private String member_password;
    private String member_profile;
    private String member_address;
    private Timestamp member_date;
    private MultipartFile profileFile;
    private String member_grade;
}
