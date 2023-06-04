package com.myportfolio.web.dao;

import com.myportfolio.web.domain.CommentDto;

import java.util.List;
import java.util.Map;

public interface CommentDao {
    int count(Integer nno) throws Exception
    ;

    int deleteAll(Integer nno)
    ;

    int delete(Integer cno, String commenter) throws Exception
    ;

    int insert(CommentDto dto) throws Exception
    ;

    List<CommentDto> selectAll(Integer nno) throws Exception
    ;

    CommentDto select(Integer cno) throws Exception
    ;

    int update(CommentDto dto) throws Exception
    ;

    List<CommentDto> selectPage(Map map) throws Exception;
}
