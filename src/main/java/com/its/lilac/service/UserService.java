package com.its.lilac.service;

import com.its.lilac.datamodel.UserDTO;
import com.its.lilac.exception.LilacException;
import com.its.lilac.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@PropertySource("classpath:/profile-path.properties")
@Service
public class UserService {

    @Autowired
    private UserRepository m_userRepository;

    @Value("${member.profile.path}")
    private String m_member_profile_save_path;

    public boolean checkDuplicatedEmail(String email) {
        return m_userRepository.checkDuplicatedEmail(email) > 0;
    }

    public boolean userRegistration(UserDTO userDTO) {
        saveProfile(userDTO);
        return m_userRepository.userRegistration(userDTO) > 0;
    }

    /**
     * 회원가입하는 유저의 프로필이미지를 처리한다.
     * 이메일은 이미 중복검사를 통과하였기 때문에 "이메일주소+회원이 올린 프로파일이미지 파일이름"으로 파일을 저장한다.
     * @param userDTO
     */
    private void saveProfile(UserDTO userDTO){
        if(userDTO.getProfileFile() == null){
            return;
        }
        MultipartFile profile = userDTO.getProfileFile();
        String originalFileName = profile.getOriginalFilename();
        String storedFileName = userDTO.getMember_email() + "-" + originalFileName;
        userDTO.setMember_profile(originalFileName);
        // 프로필이미지 저장
        try{
            // 프로필이미지 폴더가 없으면 만들어준다
            File saveDir = new File(m_member_profile_save_path);
            if(!saveDir.exists()){
                saveDir.mkdir();
            }
            String contextPath = saveDir.getAbsolutePath() + "\\" + storedFileName;
            profile.transferTo(new File(contextPath));
        }catch(IOException ioe){
            throw new LilacException(ioe);
        }
    }

    public UserDTO userLogIn(String email, String password) {
         return m_userRepository.userLogIn(email, password);
    }
}
