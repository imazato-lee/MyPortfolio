package com.myportfolio.web.service;


import com.myportfolio.web.dao.QnaCommentDao;
import com.myportfolio.web.dao.QnaDao;
import com.myportfolio.web.domain.QnaCommentDto;
import com.myportfolio.web.domain.QnaCommentPageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnaCommentServiceImpl implements QnaCommentService {
    @Autowired
    QnaDao qnaDao;
    @Autowired
    QnaCommentDao qnaCommentDao;

    @Override
    public int getCount(Integer qno) throws Exception {
        return qnaCommentDao.count(qno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(QnaCommentDto dto) throws Exception {
        Map map = new HashMap();
        map.put("cnt",-1);
        map.put("qno",dto.getQno());
        int rowCnt = qnaDao.updateCommentCount(map);
        System.out.println("updateCommentCount - rowCnt = " + rowCnt);
        rowCnt = qnaCommentDao.delete(dto.getCno(), dto.getCommenter());
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(QnaCommentDto dto) throws Exception {
        Map map = new HashMap();
        map.put("cnt",1);
        map.put("qno",dto.getQno());
        qnaDao.updateCommentCount(map);
        return qnaCommentDao.insert(dto);
    }

    @Override
    public List<QnaCommentDto> getList(Integer qno) throws Exception {
        return qnaCommentDao.selectAll(qno);
    }

    @Override
    public QnaCommentDto read(Integer cno) throws Exception {
        return qnaCommentDao.select(cno);
    }

    @Override
    public int modify(QnaCommentDto dto) throws Exception {
        return qnaCommentDao.update(dto);
    }

    @Override
    public QnaCommentPageDto getSelectPage(Map map) throws Exception{
        return new QnaCommentPageDto(qnaCommentDao.count((Integer) map.get("qno")),qnaCommentDao.selectPage(map));
    }
}