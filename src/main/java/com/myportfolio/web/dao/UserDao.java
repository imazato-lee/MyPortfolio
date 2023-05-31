package com.myportfolio.web.dao;

import com.myportfolio.web.domain.UserDto;

public interface UserDao {
    UserDto select(String id) throws Exception;

    int deleteAll();

    int delete(String id) throws Exception;

    int insert(UserDto dto) throws Exception;

    int update(UserDto dto) throws Exception // int update(String statement, Object parameter)
    ;
}
