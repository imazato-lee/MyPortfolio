package com.myportfolio.web.dao;

import com.myportfolio.web.domain.ItemCondition;
import com.myportfolio.web.domain.ItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ItemDaoImpl implements ItemDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.myportfolio.web.dao.ItemMapper.";

    @Override
    public int deleteAll() {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }

    @Override
    public int delete(int ino) throws Exception {
        return session.delete(namespace + "delete", ino);
    }

    @Override
    public int insert(ItemDto itemdto) throws Exception {
        return session.insert(namespace + "insert", itemdto);
    }

    @Override
    public ItemDto select(int ino) throws Exception {
        return session.selectOne(namespace + "select", ino);
    }

    @Override
    public int update(ItemDto itemDto) throws Exception {
        return session.update(namespace + "update", itemDto);
    }

    @Override
    public int increaseViewCnt(int ino) {
        return session.update(namespace + "increaseViewCnt", ino);
    }

    @Override
    public List<ItemDto> selectPage(ItemCondition ic) throws Exception {
        return session.selectList(namespace + "selectPage", ic);
    }

    @Override
    public int resultCnt(ItemCondition ic) throws Exception {
        return session.selectOne(namespace + "resultCnt", ic);
    }

}