package com.myportfolio.web.service;

import com.myportfolio.web.domain.QnaDto;
import com.myportfolio.web.domain.QnaItemDto;
import com.myportfolio.web.domain.SearchCondition;

import java.util.List;

public interface QnaService {
    int getCount(int ino) throws Exception;

    int delete(QnaDto dto) throws Exception;

    int insert(QnaDto dto) throws Exception;

    int update(QnaDto dto) throws Exception;

    public List<QnaDto> select(int page, int pageSize, int ino) throws Exception;

    int updateCommentCount(int qno, int cnt) throws Exception;

    List<QnaDto> searchSelectPage(SearchCondition sc) throws Exception;

    int getResultCount(SearchCondition sc) throws Exception;

    List<QnaItemDto> searchAllSelectPage(SearchCondition sc) throws Exception;

    QnaItemDto selectQna(int qno) throws Exception;
}