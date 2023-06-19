package com.myportfolio.web.dao;

import com.myportfolio.web.domain.ItemAttachDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemAttachDaoImple implements ItemAttachDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.myportfolio.web.dao.ItemAttachMapper.";

    @Override
    public void insert(ItemAttachDto dto) {
        session.insert(namespace + "insert", dto);
    }

    @Override
    public List<ItemAttachDto> findByIno(Integer ino) {
        return session.selectList(namespace + "findByIno", ino);
    }

    @Override
    public void deleteAll(Integer ino) throws Exception {
        session.delete(namespace + "deleteAll" , ino);
    }
}
