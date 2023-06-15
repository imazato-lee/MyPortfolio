package com.myportfolio.web.controller;

import com.myportfolio.web.domain.*;
import com.myportfolio.web.service.ItemService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item/*")
public class ItemController {
    @Autowired
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
    public String list(ItemCondition ic, Model m){


        try {
            int totalCnt = itemService.getCount();
            ItemPageHandler ph = new ItemPageHandler(totalCnt,ic);
            Map map = new HashMap();
            map.put("offset",(ic.getPage()-1)*6);
            map.put("pageSize",ic.getPageSize());
            List<ItemDto> list = itemService.selectPage(map);
            m.addAttribute("list",list);
            m.addAttribute("ph",ph);
            m.addAttribute("totalCnt",totalCnt);

        } catch (Exception e) {
           return "redirect:/";
        }
        return "itemList";
    }

    @GetMapping( value = "/getAttachListOnList", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<Integer, List<ItemAttachDto>>> getAttachListOnList(
            @RequestParam(value = "list[]") List<Integer> list){
       Map<Integer, List<ItemAttachDto>> map = new HashMap<Integer, List<ItemAttachDto>>();
       list.stream().forEach(ino->map.put(ino, itemService.getAttachList(ino)));
       return new ResponseEntity<>(map, HttpStatus.OK);
    }
    @GetMapping("/read")
    public String read(){
        return "item";
    }
}
