package com.myportfolio.web.service;

import com.myportfolio.web.domain.CartDto;

import java.util.List;

public interface CartService {
    int addCart(CartDto dto) throws Exception;

    int deleteCart(Integer cano) throws Exception;

    void selectedDelete(List<Integer> canos) throws Exception;

    boolean deleteAll(String id) throws Exception;

    int modifyCount(CartDto dto) throws Exception;

    List<CartDto> getCart(String id) throws Exception;
}
