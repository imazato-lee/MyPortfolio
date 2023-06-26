package com.myportfolio.web.controller;

import com.myportfolio.web.domain.UserDto;
import com.myportfolio.web.service.UserService;
import com.mysql.cj.Session;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user/*")
public class UserController {
    @Autowired
    private UserService userService;
//    @Autowired
//    private BCryptPasswordEncoder pwEncoder;

    @GetMapping("/login")
    public String login(){ return "login";};
    @PostMapping("/login")
    public String login(UserDto userDto, Model m, RedirectAttributes rttr, HttpSession session){
        try {
            UserDto existUser = userService.select(userDto.getId());
            if(!existUser.getPwd().equals(userDto.getPwd())){
                throw new Exception("login Failed");
            }
//            if(false == pwEncoder.matches(userDto.getPwd(),existUser.getPwd())) //pwEncoder되면 암호화된 비밀번호와 match여부 확인
            session.setAttribute("id",userDto.getId());
            session.setAttribute("name",existUser.getName());
            rttr.addFlashAttribute("msg","LOG_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","LOG_ERR");
            m.addAttribute(userDto);
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
        return "register&modify";
    }
    @PostMapping("/register")
    public String signup(UserDto userDto,RedirectAttributes rttr,Model m){
//        String rawPw = "";      //인코딩 전 비밀번호
//        String encodePw = "";   //인코딩 후 비밀번호
//
//        rawPw = userDto.getPwd();
//        encodePw = pwEncoder.encode(rawPw);
//        userDto.setPwd(encodePw);

        try {
            int rowCnt = userService.insert(userDto);
            if(rowCnt!=1){
                throw new Exception("register failed");
            }
            rttr.addFlashAttribute("msg","REG_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","REG_ERR");
            m.addAttribute(userDto);
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
            m.addAttribute(userDto);
            return "register&modify";
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @PostMapping("/modify")
    public String modify(UserDto userDto,Model m,RedirectAttributes rttr){
        System.out.println("userDto = " + userDto);
        try {
            int rowCnt = userService.update(userDto);
            if(rowCnt!=1){
                throw new Exception("user modify failed");
            }
            rttr.addFlashAttribute("msg","USER_MOD_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","USER_MOD_ERR");
            m.addAttribute(userDto);
            return "register&modify";
        }
    }

    @GetMapping("/idCheck")
    public String idCheck(Model m){
        m.addAttribute("mode","GET");
        return "idCheck";
    }
    @PostMapping("/idCheck")
    public String idCheck(UserDto userDto,Model m,RedirectAttributes rttr){
        try {
            List<UserDto> list = userService.selectForIdCheck(userDto);
            if(list.size() == 0){
                throw new Exception("ID CHECK FAILED");
            }

            for (int i = 0; i < list.size(); i++) {
                UserDto dto = list.get(i);
                dto.setId(maskId(dto.getId()));
            }

            m.addAttribute(userDto);
            m.addAttribute("list",list);
            m.addAttribute("totalCnt",list.size());

        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","error");
        }
        return "idCheck";
    }

    private String maskId(String id) {
        //아이디 가공 : 마지막 3글자만 '*'로 가려주기
        return id.substring(0, id.length() - 3) + "*".repeat(3);
    }
}
