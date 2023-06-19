package com.myportfolio.web.dao;

import com.myportfolio.web.domain.QnaDto;
import com.myportfolio.web.domain.QnaItemDto;
import com.myportfolio.web.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface QnaDao {
    int getCount(int ino) throws Exception;

    int delete(QnaDto dto) throws Exception;

    int insert(QnaDto dto) throws Exception;

    int update(QnaDto dto) throws Exception;

    int updateAdminReplyed(QnaDto qnaDto) throws Exception;

    QnaDto select(int qno) throws Exception;

    int updateCommentCount(Map map) throws Exception;

    List<QnaDto> searchSelectPage(SearchCondition sc) throws Exception;

    int getResultCount(SearchCondition sc) throws Exception;

    List<QnaItemDto> searchAllSelectPage(SearchCondition sc) throws Exception;

    QnaItemDto selectQna(int qno) throws Exception;
}