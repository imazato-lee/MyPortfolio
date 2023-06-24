package com.myportfolio.web.service;

import com.myportfolio.web.domain.QnaCommentDto;
import com.myportfolio.web.domain.QnaCommentPageDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface QnaCommentService {
    int getCount(Integer qno) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int remove(QnaCommentDto dto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int write(QnaCommentDto dto) throws Exception;

    List<QnaCommentDto> getList(Integer qno) throws Exception;

    QnaCommentDto read(Integer cno) throws Exception;

    int modify(QnaCommentDto dto) throws Exception;

    QnaCommentPageDto getSelectPage(Map map) throws Exception;
}
