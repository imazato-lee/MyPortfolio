package com.myportfolio.web.service;

import com.myportfolio.web.domain.UserDto;

public interface UserService {
    UserDto select(String id) throws Exception;

    int deleteAll() throws Exception;

    int delete(String id) throws Exception;

    int insert(UserDto dto) throws Exception;

    int update(UserDto dto) throws Exception;
}
