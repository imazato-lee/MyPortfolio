package com.myportfolio.web.controller;

import com.myportfolio.web.domain.NoticeDto;
import com.myportfolio.web.domain.PageHandler;
import com.myportfolio.web.domain.SearchCondition;
import com.myportfolio.web.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
//            return "redirect:/";
        }
        return "noticeList";
    }
    private boolean loginCheck(HttpSession session) {
        return session.getAttribute("id")!=null;
    }
    @GetMapping("/read")
    public String read(Integer nno, Integer page, Integer pageSize, Model m){
        try {
            NoticeDto noticeDto = noticeService.read(nno);
            m.addAttribute(noticeDto);
            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);
            m.addAttribute("nno",nno);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "notice";
    }
    @GetMapping("/write")
    public String write(Integer page, Integer pageSize,Model m){
        m.addAttribute("page",page);
        m.addAttribute("pageSize",pageSize);
        return "noticeWrite&Modify";
    }
    @PostMapping("/write")
    public String write(NoticeDto noticeDto,Model m,HttpSession session, RedirectAttributes rttr){
//        String writer = (String) session.getAttribute("id");
//        noticeDto.setWriter(writer);
        noticeDto.setWriter("test");
        try {
            int rowCnt = noticeService.write(noticeDto);
            if(rowCnt != 1)
                throw new Exception("write failed");
            rttr.addFlashAttribute("msg","WRT_OK");
            return "redirect:/notice/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(noticeDto);
            rttr.addFlashAttribute("msg","WRT_ERR");
            return "noticeWrite&Modify";
        }
    }

}

