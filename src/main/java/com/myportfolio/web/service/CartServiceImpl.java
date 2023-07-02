package com.myportfolio.web.service;

import com.myportfolio.web.dao.CartDao;
import com.myportfolio.web.domain.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartDao cartDao;

    @Override
    public int addCart(CartDto dto) throws Exception {
        return cartDao.addCart(dto);
    }

    @Override
    public int deleteCart(Integer cano) throws Exception {
        return cartDao.deleteCart(cano);
    }

    @Override
    @Transactional
    public void selectedDelete(List<Integer> canos) throws Exception {
        for (Integer cano : canos) {
            deleteCart(cano);
        }
    }

    @Override
    public boolean deleteAll(String id) throws Exception {
        return cartDao.makeCartEmpty(id) > 0;
    }

    @Override
    public int modifyCount(CartDto dto) throws Exception {
        return cartDao.modifyCount(dto);
    }

    @Override
    public List<CartDto> getCart(String id) throws Exception {
        List<CartDto> list = cartDao.getCart(id);
        for(CartDto dto : list){
                dto.initSaleTotal();
        }
        return list;
    }
}
