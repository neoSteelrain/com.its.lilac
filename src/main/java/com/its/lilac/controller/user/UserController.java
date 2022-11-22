package com.its.lilac.controller.user;

import com.its.lilac.common.RESPONSEBODY_RESULT_STING;
import com.its.lilac.datamodel.UserDTO;
import com.its.lilac.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService m_userService;

    @GetMapping("/registration")
    public String registrationPage(){
        return "/user/registration";
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
}
