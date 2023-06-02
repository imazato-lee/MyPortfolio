package com.myportfolio.web.dao;

import com.myportfolio.web.domain.NoticeDto;
import junit.framework.TestCase;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class NoticeDaoImplTest extends TestCase {
    @Autowired
    NoticeDao noticeDao;
    @Test
    public void testInsert() throws Exception {
        for(int i=0;i<210;i++){
            NoticeDto dto = new NoticeDto("title"+i,"content"+i,"admin");
            noticeDao.insert(dto);
        }
    }
}