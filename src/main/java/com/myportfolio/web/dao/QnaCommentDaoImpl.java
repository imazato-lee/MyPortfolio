package com.myportfolio.web.dao;



import com.myportfolio.web.domain.QnaCommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class QnaCommentDaoImpl implements QnaCommentDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.myportfolio.web.dao.QnaCommentMapper.";

    @Override
    public int count(Integer qno) throws Exception {
        return session.selectOne(namespace+"count", qno);
    }

    @Override
    public int deleteAll(Integer qno) {
        return session.delete(namespace+"deleteAll", qno);
    }

    @Override
    public int delete(Integer cno, String commenter) throws Exception {
        Map map = new HashMap();
        map.put("cno", cno);
        map.put("commenter", commenter);
        return session.delete(namespace+"delete", map);
    }

    @Override
    public int insert(QnaCommentDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    }

    @Override
    public List<QnaCommentDto> selectAll(Integer qno) throws Exception {
        return session.selectList(namespace+"selectAll", qno);
    }

    @Override
    public QnaCommentDto select(Integer cno) throws Exception {
        return session.selectOne(namespace + "select", cno);
    }

    @Override
    public int update(QnaCommentDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    } // int update(String statement, Object parameter)

    @Override
    public List<QnaCommentDto> selectPage(Map map) throws Exception{
        return session.selectList(namespace+"selectPage",map);
    }
}
