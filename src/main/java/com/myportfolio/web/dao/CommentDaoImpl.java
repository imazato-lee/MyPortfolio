package com.myportfolio.web.dao;


import com.myportfolio.web.domain.CommentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommentDaoImpl implements CommentDao {
    //throws Exception 하는 이유?
    //Repository에서 예외처리를 하게 되면 Service에서 트랜잭션 처리를 할 수 없기 때문에
    @Autowired
    private SqlSession session;
    private static String namespace = "com.myportfolio.web.dao.CommentMapper.";

    @Override
    public int count(Integer nno) throws Exception {
        return session.selectOne(namespace+"count", nno);
    } // T selectOne(String statement)

    @Override
    public int deleteAll(Integer nno) {
        return session.delete(namespace+"deleteAll", nno);
    } // int delete(String statement)

    @Override
    public int delete(Integer cno, String commenter) throws Exception {
        Map map = new HashMap();
        map.put("cno", cno);
        map.put("commenter", commenter);
        return session.delete(namespace+"delete", map);
    } // int delete(String statement, Object parameter)

    @Override
    public int insert(CommentDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    } // int insert(String statement, Object parameter)

    @Override
    public List<CommentDto> selectAll(Integer nno) throws Exception {
        return session.selectList(namespace+"selectAll", nno);
    } // List<E> selectList(String statement)

    @Override
    public CommentDto select(Integer cno) throws Exception {
        return session.selectOne(namespace + "select", cno);
    } // T selectOne(String statement, Object parameter)

    @Override
    public int update(CommentDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    } // int update(String statement, Object parameter)

    @Override
    public List<CommentDto> selectPage(Map map) throws Exception{
        return session.selectList(namespace+"selectPage",map);
    }
}
