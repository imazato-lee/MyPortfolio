package com.myportfolio.web.controller;

import com.myportfolio.web.domain.UserDto;
import com.myportfolio.web.service.UserService;
import com.mysql.cj.Session;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    public String login(UserDto userDto, Model m, RedirectAttributes rttr, HttpSession session){
        try {
            UserDto existUser = userService.select(userDto.getId());
//            System.out.println("userDto = " + userDto);
//            System.out.println("existUser = " + existUser);
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
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/register")
    public String signup(){
        return "register";
    }
    @PostMapping("/register")
    public String signup(UserDto userDto,RedirectAttributes rttr,Model m){
        try {
            int RowCnt = userService.insert(userDto);
            if(RowCnt!=1){
                throw new Exception("register failed");
            }
            rttr.addFlashAttribute("msg","REG_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","REG_ERR");
            m.addAttribute("userDto",userDto);
            return "register&modify";
        }
    }
    @GetMapping(value = "/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<String> idCheck(@PathVariable String id){
        try {
            UserDto userDto = userService.select(id);
            if(userDto == null || !userDto.getId().equals(id)){
                return new ResponseEntity<>("success",HttpStatus.OK);
            }
            throw new Exception("this id is duplicated");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("duplicate",HttpStatus.OK);
        }
    }
    @GetMapping("/modify")
    public String modify(Model m,HttpSession session){
        String id = (String)session.getAttribute("id");
        try {
            UserDto userDto = userService.select(id);
            m.addAttribute("mode","modify");
            m.addAttribute("userDto",userDto);
            return "register&modify";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
