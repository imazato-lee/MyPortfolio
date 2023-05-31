package com.myportfolio.web.controller;

import com.myportfolio.web.domain.UserDto;
import com.myportfolio.web.service.UserService;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user/*")
public class UserController {
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String login(){ return "login";};
    @PostMapping("/login")
    public String login(@ModelAttribute("userDto") UserDto userDto, Model m, RedirectAttributes rttr, HttpSession session){
        try {
            UserDto existUser = userService.select(userDto.getId());
            if(!existUser.getPwd().equals(userDto.getPwd())){
                throw new Exception("login Failed");
            }
            session.setAttribute("id",userDto.getId());
            rttr.addFlashAttribute("msg","LOG_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","LOG_ERR");
            m.addAttribute("userDto",userDto);
            return "redirect:/user/login";
        }
    }
//    @PostMapping("/signup")
//    public String signup(UserDto userDto, Model m, RedirectAttributes rttr){
//        try {
//            int rowCnt = userService.insert(userDto);
//            if(rowCnt != 1){
//                throw new Exception("insert Failed");
//            }
//            rttr.addFlashAttribute("msg","REG_OK");
//            return "redirect:/";
//        } catch (Exception e) {
//            e.printStackTrace();
//            rttr.addFlashAttribute("msg","REG_ERR");
//            m.addAttribute("UserDto",userDto);
//            return "login";
//        }
//    }

}
