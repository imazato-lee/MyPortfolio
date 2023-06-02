package com.myportfolio.web.dao;

import com.myportfolio.web.domain.NoticeDto;
import com.myportfolio.web.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NoticeDaoImpl implements NoticeDao {
    @Autowired
    private SqlSession session;
    private static final String NAMESPACE = "com.myportfolio.web.dao.NoticeMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(NAMESPACE + "count");
    }

    @Override
    public int deleteAll() {
        return session.delete(NAMESPACE + "deleteAll");
    }

    @Override
    public int delete(Integer nno, String writer) throws Exception {
        Map map = new HashMap();
        map.put("nno",nno);
        map.put("writer", writer);
        return session.delete(NAMESPACE + "delete", map);
    }

    @Override
    public int insert(NoticeDto noticeDto) throws Exception {
        return session.insert(NAMESPACE + "insert", noticeDto);
    }

    @Override
    public List<NoticeDto> selectAll() throws Exception {
        return session.selectList(NAMESPACE + "selectAll");
    }

    @Override
    public NoticeDto select(int nno) throws Exception {
        return session.selectOne(NAMESPACE + "select", nno);
    }

    @Override
    public List<NoticeDto> selectPage(Map map) throws Exception {
        return session.selectList(NAMESPACE + "selectPage", map);
    }

    @Override
    public int update(NoticeDto noticeDto) throws Exception {
        return session.update(NAMESPACE + "update", noticeDto);
    }

    @Override
    public int updateCommentCnt(Map map) throws Exception {
        return session.update(NAMESPACE + "updateCommentCnt", map);
    }
    @Override
    public void increaseViewCnt(int nno) throws Exception  {
        session.update(NAMESPACE + "increaseViewCnt", nno);
    }
    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        System.out.println("sc in searchResultCnt() = " + sc);
        System.out.println("session = " + session);
        return session.selectOne(NAMESPACE+"searchResultCnt", sc);
    }

    @Override
    public List<NoticeDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(NAMESPACE+"searchSelectPage", sc);
    }
}