package com.myportfolio.web.controller;

import com.myportfolio.web.domain.ItemDto;
import com.myportfolio.web.service.ItemService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@AllArgsConstructor
@RequestMapping("/item/*")
public class ItemController {

    private ItemService itemService;
    @GetMapping("/write")
    public String write(){
        return "itemRegister";
    }

    @PostMapping("/write")
    public String write(ItemDto itemDto, Model m, RedirectAttributes rttr){
        System.out.println("itemDto = " + itemDto);
        try {
            int rowCnt =itemService.write(itemDto);
            if(rowCnt != 1)
                throw new Exception("ITEM WRITE FAILED");
            rttr.addFlashAttribute("msg","WRT_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(itemDto);
            rttr.addFlashAttribute("msg","WRT_ERR");
            return "itemRegister";
        }
    }

    @GetMapping("/list")
    public String list(){
        return "itemList";
    }
}
