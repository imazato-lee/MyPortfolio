package com.myportfolio.web.dao;

import com.myportfolio.web.domain.ItemAttachDto;

import java.util.List;

public interface ItemAttachDao {
    void insert(ItemAttachDto dto);

    List<ItemAttachDto> findByIno(Integer ino);
}
