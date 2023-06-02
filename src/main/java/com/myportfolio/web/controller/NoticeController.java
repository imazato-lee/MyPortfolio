package com.myportfolio.web.controller;

import com.myportfolio.web.domain.NoticeDto;
import com.myportfolio.web.domain.PageHandler;
import com.myportfolio.web.domain.SearchCondition;
import com.myportfolio.web.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    @GetMapping("/list")
    public String list(SearchCondition sc, Model m,HttpSession session){
//        if(!loginCheck(session)){
//            return "redirect:/user/login";
//        }
        try {
            int totalCnt = noticeService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt",totalCnt);

            PageHandler ph = new PageHandler(totalCnt,sc);

            List<NoticeDto> list = noticeService.getSearchResultPage(sc);
            m.addAttribute("list",list);
            m.addAttribute("ph",ph);
        } catch (Exception e) {
            return "redirect:/";
        }
        return "noticeList";
    }
    private boolean loginCheck(HttpSession session) {
        return session.getAttribute("id")!=null;
    }
}

