package com.myportfolio.web.controller;

import com.myportfolio.web.domain.PageHandler;
import com.myportfolio.web.domain.QnaItemDto;
import com.myportfolio.web.domain.SearchCondition;
import com.myportfolio.web.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
    @Autowired
    QnaService qnaService;

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

}