package com.myportfolio.web.service;



import com.myportfolio.web.dao.UserDao;
import com.myportfolio.web.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public UserDto select(String id) throws Exception{
        return userDao.select(id);
    }

    @Override
    public int deleteAll() throws Exception{
        return userDao.deleteAll();
    }

    @Override
    public int delete(String id) throws Exception{
        return userDao.delete(id);
    }

    @Override
    public int insert(UserDto dto) throws Exception{
        return userDao.insert(dto);
    }

    @Override
    public int update(UserDto dto) throws Exception{
        return userDao.update(dto);
    }

    @Override
    public List<UserDto> selectForIdCheck(UserDto dto) throws Exception{
        if(dto.getMobile() == null){
            return userDao.selectWithNameEmail(dto);
        } else {
            return userDao.selectWithNameMobile(dto);
        }
    }
}
