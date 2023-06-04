package com.myportfolio.web.service;

import com.myportfolio.web.domain.CommentDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface CommentService {
    int getCount(Integer nno) throws Exception;

    @Transactional(rollbackFor = Exception.class)
        //댓글 삭제
    int remove(Integer cno, Integer nno, String commenter) throws Exception;

    @Transactional(rollbackFor = Exception.class)
        //댓글 쓰기
    int write(CommentDto commentDto) throws Exception;

    List<CommentDto> getList(Integer nno) throws Exception;

    CommentDto read(Integer cno) throws Exception;

    int modify(CommentDto commentDto) throws Exception;

    List<CommentDto> getSelectPage(Map map) throws Exception;
}
