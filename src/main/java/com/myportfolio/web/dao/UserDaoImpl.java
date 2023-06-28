package com.myportfolio.web.dao;


import com.myportfolio.web.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    }

    @Override
    public List<UserDto> selectWithNameEmail(UserDto dto) throws Exception {
        return session.selectList( namespace + "selectWithNameEmail", dto);
    }

    @Override
    public List<UserDto> selectWithNameMobile(UserDto dto) throws Exception {
        return session.selectList( namespace + "selectWithNameMobile", dto);
    }
    @Override
    public UserDto selectWithIdNameEmail(UserDto dto) throws Exception {
        return session.selectOne(namespace + "selectWithIdNameEmail", dto);
    }

    @Override
    public UserDto selectWithIdNameMobile(UserDto dto) throws Exception {
        return session.selectOne(namespace + "selectWithIdNameMobile", dto);
    }

    @Override
    public int updateTempPwd(UserDto dto) throws Exception {
        return session.update(namespace + "updateTempPwd", dto);
    }
}