package com.myportfolio.web.service;

import com.myportfolio.web.domain.NoticeDto;
import com.myportfolio.web.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    int getCount() throws Exception;

    int remove(Integer nno, String writer) throws Exception;

    int write(NoticeDto noticeDto) throws Exception;

    List<NoticeDto> getList() throws Exception;

    NoticeDto read(Integer nno) throws Exception;

    List<NoticeDto> getPage(Map map) throws Exception;

    int modify(NoticeDto noticeDto) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<NoticeDto> getSearchResultPage(SearchCondition sc) throws Exception;
}
