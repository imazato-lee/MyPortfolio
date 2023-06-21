package com.myportfolio.web.service;

import com.myportfolio.web.dao.ItemDao;
import com.myportfolio.web.dao.QnaDao;
import com.myportfolio.web.domain.QnaDto;
import com.myportfolio.web.domain.QnaItemDto;
import com.myportfolio.web.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnaServiceImpl implements QnaService {
    @Autowired
    private QnaDao qnaDao;
    @Autowired
    private ItemDao itemDao;

    @Override
    public int getCount(int ino) throws Exception {
        return qnaDao.getCount(ino);
    }

    @Override
    public int delete(QnaDto dto) throws Exception {
        return qnaDao.delete(dto);
    }

    @Override
    public int insert(QnaDto dto) throws Exception {
        return qnaDao.insert(dto);
    }

    @Override
    public int update(QnaDto dto) throws Exception {
        return qnaDao.update(dto);
    }

    @Override
    public List<QnaDto> select(int page, int pageSize, int ino) throws Exception {
        Map map = new HashMap();
        map.put("page",page);
        map.put("pageSize",pageSize);
        map.put("ino",ino);
        return qnaDao.select(map);
    }

    @Override
    public int updateCommentCount(int qno, int cnt) throws Exception {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("qno", qno);
        return qnaDao.updateCommentCount(map);
    }

    @Override
    public List<QnaDto> searchSelectPage(SearchCondition sc) throws Exception {
        return qnaDao.searchSelectPage(sc);
    }

    @Override
    public int getResultCount(SearchCondition sc) throws Exception {
        return qnaDao.getResultCount(sc);
    }

    @Override
    public List<QnaItemDto> searchAllSelectPage(SearchCondition sc) throws Exception {
        return qnaDao.searchAllSelectPage(sc);
    }

    @Override
    public QnaItemDto selectQna(int qno) throws Exception {
        return qnaDao.selectQna(qno);
    }
}