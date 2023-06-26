package com.myportfolio.web.dao;

import com.myportfolio.web.domain.UserDto;

import java.util.List;

public interface UserDao {
    UserDto select(String id) throws Exception;

    int deleteAll();

    int delete(String id) throws Exception;

    int insert(UserDto dto) throws Exception;

    int update(UserDto dto) throws Exception;

    List<UserDto> selectForIdCheck(UserDto dto) throws Exception;
}
