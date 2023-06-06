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

    @RequestMapping("/list")
    public String list(SearchCondition sc, Model m, HttpSession session) {
//        if(!loginCheck(session)){
//            return "redirect:/user/login";
//        }
        try {
            int totalCnt = noticeService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler ph = new PageHandler(totalCnt, sc);

            List<NoticeDto> list = noticeService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", ph);
        } catch (Exception e) {
//            return "redirect:/";
        }
        return "noticeList";
    }

    private boolean loginCheck(HttpSession session) {
        return session.getAttribute("id") != null;
    }

    @GetMapping("/read")
    public String read(Integer nno, SearchCondition sc, Model m) {
        try {
            NoticeDto noticeDto = noticeService.read(nno);
            m.addAttribute(noticeDto);
            m.addAttribute("sc", sc);
            m.addAttribute("nno", nno);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "notice";
    }

    @GetMapping("/write")
    public String write(SearchCondition sc, Model m) {
        m.addAttribute("sc", sc);
        return "noticeWrite&Modify";
    }

    @PostMapping("/write")
    public String write(NoticeDto noticeDto, Model m, HttpSession session, RedirectAttributes rttr) {
//        String writer = (String) session.getAttribute("id");
//        noticeDto.setWriter(writer);
        noticeDto.setWriter("test");
        try {
            int rowCnt = noticeService.write(noticeDto);
            if (rowCnt != 1)
                throw new Exception("write failed");
            rttr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/notice/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(noticeDto);
            rttr.addFlashAttribute("msg", "WRT_ERR");
            return "noticeWrite&Modify";
        }
    }

    @GetMapping("/modify")
    public String modify(Integer nno, SearchCondition sc, Model m, RedirectAttributes rttr) {
        try {
            NoticeDto noticeDto = noticeService.read(nno);
            m.addAttribute(noticeDto);
            m.addAttribute("sc",sc);
            m.addAttribute("mode", "modify");
            return "noticeWrite&Modify";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "GET_MOD_ERR");
            rttr.addAttribute("nno", nno);
            return "redirect:/notice/read"+sc.getQueryString();
        }
    }

    @PostMapping("/modify")
    public String modify(SearchCondition sc, NoticeDto noticeDto, RedirectAttributes rttr, Model m) {
        ///notice/modify?page=page&pageSize=pageSize
        System.out.println("noticeDto = " + noticeDto);
        try {
            int rowCnt = noticeService.modify(noticeDto);

            if (rowCnt != 1)
                throw new Exception("Modify failed");

            rttr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/notice/list"+sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("noticeDto = " + noticeDto);
            m.addAttribute(noticeDto);
            m.addAttribute("sc",sc);
            m.addAttribute("mode", "modify");
            rttr.addFlashAttribute("msg", "MOD_ERR");
            return "noticeWrite&Modify";
        }
    }

    @PostMapping("/remove")
    public String remove(Integer nno, SearchCondition sc, HttpSession session, Model m, RedirectAttributes rttr) {
//        String writer = (String) session.getAttribute("id");
        String writer = "admin";
        try {

            int rowCnt = noticeService.remove(nno, writer);

            if (rowCnt != 1)
                throw new Exception("notice remove error");

            rttr.addFlashAttribute("msg", "DEL_OK");
            return "redirect:/notice/list"+sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/notice/list";
    }

}
