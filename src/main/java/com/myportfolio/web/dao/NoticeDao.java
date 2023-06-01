package com.myportfolio.web.dao;

import com.myportfolio.web.domain.NoticeDto;
import com.myportfolio.web.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface NoticeDao {
    int count() throws Exception;

    int deleteAll();

    int delete(Integer nno, String writer) throws Exception;

    int insert(NoticeDto noticeDto) throws Exception;

    List<NoticeDto> selectAll() throws Exception;

    NoticeDto select(int nno) throws Exception;

    List<NoticeDto> selectPage(Map map) throws Exception;

    int update(NoticeDto noticeDto) throws Exception;

    int updateCommentCnt(Map map) throws Exception;

    void increaseViewCnt(int nno) throws Exception;

    int searchResultCnt(SearchCondition sc) throws Exception;

    List<NoticeDto> searchSelectPage(SearchCondition sc) throws Exception;
}
