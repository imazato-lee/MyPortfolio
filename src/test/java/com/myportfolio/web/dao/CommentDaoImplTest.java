package com.myportfolio.web.dao;

import com.myportfolio.web.domain.CommentDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.xml.stream.events.Comment;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CommentDaoImplTest {
    @Autowired
    CommentDao dao;
    @Test
    public void delete() throws Exception {
        dao.delete(1,"commenter");
        assertTrue(dao.count(422)==0);
    }

    @Test
    public void insert() throws Exception {
        CommentDto dto = new CommentDto(422,"comment","commenter");
        dao.insert(dto);
    }

    @Test
    public void select() throws Exception{
        List<CommentDto> list = dao.selectAll(422);
        for(int i=0;i<list.size();i++){
            System.out.println("list = " + list.get(i));
        }
    }

    @Test
    public void update() throws Exception {
        CommentDto dto = new CommentDto("comment_modified","commenter",1);
        dao.update(dto);
    }
}