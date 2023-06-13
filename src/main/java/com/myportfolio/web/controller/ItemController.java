package com.myportfolio.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item/*")
public class ItemController {
    @GetMapping("/write")
    public String write(){
        return "itemRegister";
    }

    @GetMapping("/list")
    public String list(){
        return "itemList";
    }
}
