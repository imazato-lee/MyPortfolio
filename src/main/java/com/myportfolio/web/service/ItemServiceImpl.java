package com.myportfolio.web.service;

import com.myportfolio.web.dao.ItemDao;
import com.myportfolio.web.domain.ItemDto;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ItemServiceImpl implements ItemService {
    @Setter(onMethod_=@Autowired)
    ItemDao itemDao;

    @Override
    public int deleteAll() {
        return itemDao.deleteAll();
    }

    @Override
    public int getCount() throws Exception {
        return itemDao.count();
    }

    @Override
    public int remove(int ino) throws Exception {
        return itemDao.delete(ino);
    }

    @Override
    public int write(ItemDto itemDto) throws Exception {
        return itemDao.insert(itemDto);
    }

    @Override
    public ItemDto read(int ino) throws Exception {
        //조회 시 view_cnt를 올려준다.
       itemDao.increaseViewCnt(ino);
        return itemDao.select(ino);
    }

    @Override
    public int modify(ItemDto itemDto) throws Exception {
        return itemDao.update(itemDto);
    }

    @Override
    public List<ItemDto> selectPage(Map<String, Object> map) throws Exception {
        return itemDao.selectPage(map);
    }

    @Override
    public List<ItemDto> selectPageWithCategory(Map<String, Object> map) throws Exception {
        return itemDao.selectPageWithCategory(map);
    }

    @Override
    public int selectPageWithCategoryCount(Map<String, Object> map) throws Exception {
        return itemDao.selectPageWithCategoryCount(map);
    }

    @Override
    public List<ItemDto> selectPageWithViewCnt(Map<String, Object> map) throws Exception {
        return itemDao.selectPageWithViewCnt(map);
    }

}
