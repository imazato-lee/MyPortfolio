package com.myportfolio.web.service;

import com.myportfolio.web.dao.ItemAttachDao;
import com.myportfolio.web.dao.ItemDao;
import com.myportfolio.web.domain.ItemAttachDto;
import com.myportfolio.web.domain.ItemCondition;
import com.myportfolio.web.domain.ItemDto;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class ItemServiceImpl implements ItemService {
    @Setter(onMethod_=@Autowired)
    ItemDao itemDao;

    @Setter(onMethod_=@Autowired)
    ItemAttachDao itemAttachDao;

    @Override
    @Transactional
    public int write(ItemDto itemDto) throws Exception {
        int rowCnt  = itemDao.insert(itemDto);
        System.out.println("itemDto.getIno() = " + itemDto.getIno());
        List<ItemAttachDto> list = itemDto.getAttachList();
        if(list == null || list.isEmpty()){
            return rowCnt;
        }
        for (ItemAttachDto attach : list) {
            attach.setIno(itemDto.getIno());
            itemAttachDao.insert(attach);
        }
        return rowCnt;
    }
    @Override
    public List<ItemAttachDto> getAttachList(Integer ino){
        return itemAttachDao.findByIno(ino);
    }

    @Override
    public ItemDto read(int ino) throws Exception {
        //조회 시 view_cnt를 올려준다.
        itemDao.increaseViewCnt(ino);
        return itemDao.select(ino);
    }

    @Override
    public int deleteAll() {
        return itemDao.deleteAll();
    }

    @Override
    public int getCount() throws Exception {
        return itemDao.count();
    }

    @Override
    public boolean remove(int ino) throws Exception {
        return itemDao.delete(ino) ==1;
    }

    @Override
    @Transactional
    public boolean modify(ItemDto itemDto) throws Exception {
        itemAttachDao.deleteAll(itemDto.getIno());

        boolean modifyResult = itemDao.update(itemDto) == 1;

        List<ItemAttachDto> list = itemDto.getAttachList();
        if(modifyResult && list != null){
            for(ItemAttachDto dto : list){
                dto.setIno(itemDto.getIno());
                itemAttachDao.insert(dto);
            }
        }
        return modifyResult;
    }

    @Override
    public List<ItemDto> selectPage(ItemCondition ic) throws Exception {
        return itemDao.selectPage(ic);
    }

    @Override
    public int resultCnt(ItemCondition ic) throws Exception {
        return itemDao.resultCnt(ic);
    }
}