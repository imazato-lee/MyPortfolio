package com.myportfolio.web.controller;

import com.myportfolio.web.domain.*;
import com.myportfolio.web.service.ItemService;
import com.myportfolio.web.service.QnaService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/qna/*")
public class QnaController {

    private QnaService qnaService;
    private ItemService itemService;


    @GetMapping("/list")
    public String list(SearchCondition sc, Model m){
        try {
            int totalCnt = qnaService.getResultCount(sc);
            PageHandler ph = new PageHandler(totalCnt, sc);

            List<QnaItemDto> list = qnaService.searchAllSelectPage(sc);

            m.addAttribute("ph",ph);
            m.addAttribute("totalCnt",totalCnt);
            m.addAttribute("list",list);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }
        return "qnaList";
    }

    @GetMapping("/write")
    public String write(Integer ino, ItemCondition ic, Model m, RedirectAttributes rttr){
        try {
            ItemDto itemDto = itemService.read(ino);
            if(itemDto == null){
                throw new Exception("INO LOAD ERROR");
            }
            m.addAttribute("ic",ic);
            m.addAttribute(itemDto);

        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","INO_LOAD_ERR");
            return "redirect:/item/read" + ic.getQueryString() + "&ino=" + ino;
        }
        return "qnaRegister";
    }

    @PostMapping("/write")
    public String write(QnaDto qnaDto, ItemCondition ic, Model m, RedirectAttributes rttr){
        try {
            int rowCnt = qnaService.insert(qnaDto);
            if(rowCnt != 1){
                throw new Exception("QNA REGISTER ERROR");
            }
            rttr.addFlashAttribute("msg","QNA_REG_OK");
            return "redirect:/item/read" + ic.getQueryString() + "&ino=" + qnaDto.getIno();
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","QNA_REG_ERR");
            m.addAttribute(qnaDto);
            return "qnaRegister";
        }
    }

    @GetMapping("/read")
    public String read(Integer qno, SearchCondition sc, Model m, RedirectAttributes rttr){
        try {
            QnaItemDto qnaItemDto = qnaService.selectQna(qno);
            if(qnaItemDto == null){
                throw new Exception("Q&A READ ERROR");
            }
            m.addAttribute(qnaItemDto);
            m.addAttribute("sc",sc);

            return "qna";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","QNA_READ_ERR");
            return "redirect:/qna/list";
        }
    }

    @GetMapping("/modify")
    public String modify(Integer qno, SearchCondition sc, Model m, RedirectAttributes rttr){
        try {
            QnaItemDto qnaItemDto = qnaService.selectQna(qno);
            if(qnaItemDto == null){
                throw new Exception("Q&A MODIFY ERROR");
            }
            m.addAttribute("itemDto",qnaItemDto);
            m.addAttribute("sc",sc);
            m.addAttribute("mode","modify");

            return "qnaRegister";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","QNA_MOD_ERR");
            return "redirect:/qna/list" +sc.getQueryString();
        }
    }

    @PostMapping("/modify")
    public String modify(QnaDto qnoDto, SearchCondition sc, Model m, RedirectAttributes rttr){
        try {
            int rowCnt = qnaService.update(qnoDto);
            if(rowCnt != 1){
                m.addAttribute("itemDto", qnaService.selectQna(qnoDto.getQno()));
                throw new Exception("QNA MODIFY ERROR");
            }
            return "redirect:/qna/read" + sc.getQueryString() + "&qno=" + qnoDto.getQno();
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","QNA_MOD_ERR");
            return "qnaRegister";
        }
    }

    @PostMapping("/remove")
    public String remove(Integer qno, SearchCondition sc, RedirectAttributes rttr, HttpSession session){
        QnaDto qnaDto = new QnaDto();
        qnaDto.setQno(qno);
        qnaDto.setWriter((String)session.getAttribute("name"));
        try {
            int rowCnt = qnaService.delete(qnaDto);
            if(rowCnt != 1){
                throw new Exception("QNA REMOVE ERROR");
            }
            return "redirect:/qna/list" +sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg","QNA_DEL_ERR");
            return "redirect:/qna/read" +sc.getQueryString() + "&qno=" + qnaDto.getQno();
        }
    }

}