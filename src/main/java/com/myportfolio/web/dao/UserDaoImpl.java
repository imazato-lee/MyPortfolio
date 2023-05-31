package com.myportfolio.web.dao;


import com.myportfolio.web.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
    //throws Exception 하는 이유?
    //Repository에서 예외처리를 하게 되면 Service에서 트랜잭션 처리를 할 수 없기 때문에
    @Autowired
    private SqlSession session;
    private static String namespace = "com.myportfolio.web.dao.UserMapper.";

    @Override
    public UserDto select(String id) throws Exception {
        return session.selectOne(namespace+"select", id);
    }

    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int delete(String id) throws Exception {
        return session.delete(namespace+"delete", id);
    }

    @Override
    public int insert(UserDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    }

    @Override
    public int update(UserDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    } // int update(String statement, Object parameter)
}