package com.myportfolio.web.dao;

import com.myportfolio.web.domain.CartDto;

import java.util.List;

public interface CartDao {
    int addCart(CartDto dto) throws Exception;

    int deleteCart(Integer cano) throws Exception;

    int modifyCount(CartDto dto) throws Exception;

    List<CartDto> getCart(String id) throws Exception;
}
