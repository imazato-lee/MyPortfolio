package com.myportfolio.web.service;

import com.myportfolio.web.domain.ItemAttachDto;
import com.myportfolio.web.domain.ItemCondition;
import com.myportfolio.web.domain.ItemDto;

import java.util.List;
import java.util.Map;

public interface ItemService {
    int deleteAll();

    int getCount() throws Exception;

    int remove(int ino) throws Exception;

    int write(ItemDto itemDto) throws Exception;
    List<ItemAttachDto> getAttachList(Integer ino);

    ItemDto read(int ino) throws Exception;

    int modify(ItemDto itemDto) throws Exception;

    List<ItemDto> selectPage(ItemCondition ic) throws Exception;

    int resultCnt(ItemCondition ic) throws Exception;

}