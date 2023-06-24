package com.myportfolio.web.dao;

import com.myportfolio.web.domain.QnaCommentDto;

import java.util.List;
import java.util.Map;

public interface QnaCommentDao {
    int count(Integer qno) throws Exception;

    int deleteAll(Integer qno);

    int delete(Integer cno, String commenter) throws Exception;

    int insert(QnaCommentDto dto) throws Exception;

    List<QnaCommentDto> selectAll(Integer qno) throws Exception;

    QnaCommentDto select(Integer cno) throws Exception;

    int update(QnaCommentDto dto) throws Exception;

    List<QnaCommentDto> selectPage(Map map) throws Exception;
}
