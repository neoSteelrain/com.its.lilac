package com.its.lilac.controller.user;

import com.its.lilac.common.RESPONSEBODY_RESULT_STING;
import com.its.lilac.common.SESSION_KEY;
import com.its.lilac.datamodel.UserDTO;
import com.its.lilac.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService m_userService;

    @GetMapping("/registration")
    public String registrationPage(){
        return "/user/registration";
    }

    @GetMapping("/log-in")
    public String logInPage(){
        return "/user/log-in";
    }

    @GetMapping("/checkDuplicatedEmail")
    @ResponseBody
    public String checkDuplicatedEmail(@RequestParam("email") String email){
        boolean isDuplicated = m_userService.checkDuplicatedEmail(email);
        return isDuplicated ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }

    @PostMapping("/registration")
    @ResponseBody
    public String userRegistration(@ModelAttribute UserDTO userDTO){
        boolean isRegistered = m_userService.userRegistration(userDTO);
        return isRegistered ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }

    @PostMapping("/log-in")
    public String userLogIn(@RequestParam("email") String email,
                            @RequestParam("password") String password,
                            HttpSession httpSession){
        UserDTO userDTO = m_userService.userLogIn(email, password);
        if(userDTO == null){
            return "/user/log-in";
        }

        httpSession.setAttribute(SESSION_KEY.MEMBER_ID, userDTO.getMember_id());
        httpSession.setAttribute(SESSION_KEY.MEMBER_EMAIL, userDTO.getMember_email());
        httpSession.setAttribute(SESSION_KEY.MEMBER_NICKNAME, userDTO.getMember_nickname());
        httpSession.setAttribute(SESSION_KEY.MEMBER_GRADE, userDTO.getMember_grade());

        return "/index";
    }

    @GetMapping("log-out")
    public String userLogOut(HttpSession httpSession){
        httpSession.invalidate();
        return "/index";
    }

    @GetMapping("/user-info")
    public String userInfo(@RequestParam("memberId") String memberId){
        return "/user/user-info";
    }
}
