package com.myportfolio.web.service;

import com.myportfolio.web.dao.CommentDao;
import com.myportfolio.web.dao.NoticeDao;
import com.myportfolio.web.domain.CommentDto;
import com.myportfolio.web.domain.CommentPageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    NoticeDao noticeDao;
    @Autowired
    CommentDao commentDao;

//    @Autowired
//    public CommentServiceImpl(CommentDao commentDao, NoticeDao noticeDao) {
//        this.commentDao = commentDao;
//        this.noticeDao = noticeDao;
//    }

    @Override
    public int getCount(Integer nno) throws Exception {
        return commentDao.count(nno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)   //댓글 삭제
    public int remove(CommentDto dto) throws Exception {
        Map map = new HashMap();
        map.put("cnt",-1);
        map.put("nno",dto.getNno());
        int rowCnt = noticeDao.updateCommentCnt(map);
        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
        rowCnt = commentDao.delete(dto.getCno(), dto.getCommenter());
        System.out.println("rowCnt = " + rowCnt);
        return rowCnt;
    }

    @Override
    @Transactional(rollbackFor = Exception.class) //댓글 쓰기
    public int write(CommentDto commentDto) throws Exception {
        Map map = new HashMap();
        map.put("cnt",1);
        map.put("nno",commentDto.getNno());
        noticeDao.updateCommentCnt(map);
//                throw new Exception("test");
        return commentDao.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer nno) throws Exception {
//        throw new Exception("test");
        return commentDao.selectAll(nno);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return commentDao.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentDao.update(commentDto);
    }
//    @Override
//    public List<CommentDto> getSelectPage(Map map) throws Exception{
//        return commentDao.selectPage(map);
//    }
    @Override
    public CommentPageDto getSelectPage(Map map) throws Exception{
        return new CommentPageDto(commentDao.count((Integer) map.get("nno")),commentDao.selectPage(map));
    }
}