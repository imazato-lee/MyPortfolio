package com.myportfolio.web.dao;

import com.myportfolio.web.domain.ItemDto;

import java.util.List;
import java.util.Map;

public interface ItemDao {
    int deleteAll();

    int count() throws Exception;

    int delete(int ino) throws Exception;

    int insert(ItemDto itemdto) throws Exception;

    ItemDto select(int ino) throws Exception;

    int update(ItemDto itemDto) throws Exception;

    int increaseViewCnt(int ino) throws Exception;

    List<ItemDto> selectPage(Map<String, Object> map) throws Exception;

    List<ItemDto> selectPageWithCategory(Map<String, Object> map) throws Exception;

    int selectPageWithCategoryCount(String category) throws Exception;

    List<ItemDto> selectPageWithViewCnt(Map<String, Object> map) throws Exception;
}
