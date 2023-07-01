package com.myportfolio.web.controller;

import com.myportfolio.web.domain.CartDto;
import com.myportfolio.web.service.CartService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/cart/*")
public class CartController {

    CartService cartService;
    @GetMapping("/myPage")
    public String myPage(HttpSession session, Model m, RedirectAttributes rttr){
        String id = (String) session.getAttribute("id");
        if(id == null){
            rttr.addFlashAttribute("msg","not_login");
            return "redirect:/user/login";
        }
        try {
            List<CartDto> list = cartService.getCart(id);
            m.addAttribute("cartCnt",list.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "myPage";
    }
    @GetMapping("/list")
    public String list(HttpSession session,Model m){
        String id = (String) session.getAttribute("id");
        try {
            m.addAttribute("list",cartService.getCart(id));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "cartList";
    }

    @PostMapping(value = "/new", consumes = "application/json",
            produces = {MediaType.TEXT_PLAIN_VALUE})
    @ResponseBody
    public ResponseEntity<String> write(@RequestBody CartDto dto, HttpSession session){
        System.out.println("dto = " + dto);
        try {
            if(cartService.addCart(dto) != 1)
                throw new Exception("Write Failed.");

            return new ResponseEntity<>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
