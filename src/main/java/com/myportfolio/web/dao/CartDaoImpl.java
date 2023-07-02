package com.myportfolio.web.dao;

import com.myportfolio.web.domain.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDaoImpl implements CartDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.myportfolio.web.dao.CartMapper.";

    @Override
    public int addCart(CartDto dto) throws Exception {
        return session.insert(namespace + "addCart", dto);
    }

    @Override
    public int deleteCart(Integer cano) throws Exception {
        return session.delete(namespace + "deleteCart", cano);
    }

    @Override
    public int makeCartEmpty(String id) throws Exception {
        return session.delete(namespace + "makeCartEmpty",id);
    }

    @Override
    public int modifyCount(CartDto dto) throws Exception {
        return session.update(namespace + "modifyCount", dto);
    }

    @Override
    public List<CartDto> getCart(String id) throws Exception {
        return session.selectList(namespace + "getCart", id);
    }

}
