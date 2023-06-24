package com.myportfolio.web.controller;

import com.google.gson.Gson;
import com.myportfolio.web.domain.*;
import com.myportfolio.web.service.ItemService;
import com.myportfolio.web.service.QnaService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@AllArgsConstructor
@RequestMapping("/item/*")
public class ItemController {

    private QnaService qnaService;
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
            int totalCnt = itemService.resultCnt(ic);
            ItemPageHandler ph = new ItemPageHandler(totalCnt,ic);
            List<ItemDto> list = itemService.selectPage(ic);
            m.addAttribute("list",list);
            m.addAttribute("ph",ph);
            m.addAttribute("totalCnt",totalCnt);

        } catch (Exception e) {
           return "redirect:/";
        }
        return "itemList";
    }

//    @GetMapping( value = "/getAttachListOnList", produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Map<Integer, List<ItemAttachDto>>> getAttachListOnList(
//            @RequestParam(value = "list[]") List<Integer> list){
//       Map<Integer, List<ItemAttachDto>> map = new HashMap<Integer, List<ItemAttachDto>>();
//       list.stream().forEach(ino->map.put(ino, itemService.getAttachList(ino)));
//       return new ResponseEntity<>(map, HttpStatus.OK);
//    }
    @GetMapping(value = "/getAttachListOnList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<String> getAttachListOnList(@RequestParam(value = "list[]") List<Integer> list){
        Map<Integer, List<ItemAttachDto>> map = new HashMap<Integer,List<ItemAttachDto>>();
        for( Integer ino : list) {
            map.put(ino, itemService.getAttachList(ino));
        }
        String gson = new Gson().toJson(map, HashMap.class);
        return new ResponseEntity<>(gson, HttpStatus.OK);
    }

    @GetMapping("/read")
    public String read(Integer ino,Model m, ItemCondition ic, RedirectAttributes rttr){
        try {
            ItemDto itemDto = itemService.read(ino);
            if(itemDto == null || itemDto.getIno() != ino){
                throw new Exception("ITEM READ ERROR");
            }
            m.addAttribute(itemDto);
            m.addAttribute("ic",ic);
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","READ_ERR");
            return "redirect:/item/read"+ic.getQueryString();
        }
        return "item";
    }

    @GetMapping(value = "/getAttachList/{ino}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<ItemAttachDto>> getAttachList(@PathVariable Integer ino){
        return new ResponseEntity<>(itemService.getAttachList(ino), HttpStatus.OK);
    }

    @GetMapping("/modify")
    public String modify(Integer ino,ItemCondition ic, Model m,RedirectAttributes rttr){
        try {
            ItemDto itemDto = itemService.read(ino);
            if(itemDto == null){
                throw new Exception("ITEM MODIFY ERROR");
            }
            m.addAttribute(itemDto);
            m.addAttribute("ic",ic);

        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","ITEM_MOD_ERR");
            return "redirect:/item/read"+ic.getQueryString()+"&ino="+ino;
        }
        return "itemModify";
    }

    @PostMapping("/modify")
    public String modify(ItemDto dto,ItemCondition ic,RedirectAttributes rttr){
        try {
            if(!itemService.modify(dto)){
                throw new Exception("MODIFY_ERROR");
            }
            rttr.addFlashAttribute("msg","MOD_OK");
            return "redirect:/item/read" + ic.getQueryString() + "&ino=" + dto.getIno();
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","MOD_ERR");
            return "redirect:/item/modify"+ ic.getQueryString() +"&ino="+dto.getIno();
        }
    }

    @PostMapping("/remove")
    public String remove(Integer ino,ItemCondition ic, RedirectAttributes rttr){
        List<ItemAttachDto> attachList = itemService.getAttachList(ino);
        try {
            if(!itemService.remove(ino)){
                throw new Exception("ITEM REMOVE ERROR");
            }
            deleteFiles(attachList);
            rttr.addFlashAttribute("msg","REM_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","REM_ERR");
            return "redirect:/item/modify" + ic.getQueryString() + "&ino=" + ino;
        }
        return "redirect:/item/list" + ic.getQueryString();
    }

    private void deleteFiles(List<ItemAttachDto> attachList){
        if(attachList == null || attachList.size() == 0) return;

        for(ItemAttachDto attachDto : attachList){
            try {
                Path file = Paths.get("/Users/sehyeon/upload/" + attachDto.getUploadPath() +
                        "/" + attachDto.getUuid() + "_" + attachDto.getFileName());
                Files.deleteIfExists(file);
                if(Files.probeContentType(file).startsWith("image")){
                    Path thumbNail = Paths.get("/Users/sehyeon/upload/" + attachDto.getUploadPath() +
                            "/s_" + attachDto.getUuid() + "_" + attachDto.getFileName());
                    Files.delete(thumbNail);
                }
            } catch (Exception e) {
               e.printStackTrace();
            }
        }
    }

    @GetMapping(value = "/{ino}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public ResponseEntity<List<QnaDto>> getPage(@PathVariable Integer ino, @PathVariable Integer page){
        try {
            List<QnaDto> list = qnaService.select(page,10,ino);
            if(list == null || list.size() == 0){
                throw new Exception("Q&A PAGE ROAD ERROR");
            }

            return new ResponseEntity<>(list,HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
