package com.myportfolio.web.dao;

import com.myportfolio.web.domain.UserDto;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest extends TestCase {
    @Autowired
    UserDao userdao;
    @Test
    public void testSelect() throws Exception {
        String id = "asdf1234";
        UserDto dto = userdao.select(id);
        System.out.println("dto = " + dto);
    }
    @Test
    public void testInsert() throws Exception{
        UserDto userDto = new UserDto("asdf4321","asdf4321!","lee","tpgus5417@naver.com","1993-12-21","01033334444");
        userdao.insert(userDto);
    }
}