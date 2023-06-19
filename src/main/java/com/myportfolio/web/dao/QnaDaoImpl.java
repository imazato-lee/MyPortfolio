package com.myportfolio.web.dao;

import com.myportfolio.web.domain.QnaDto;
import com.myportfolio.web.domain.QnaItemDto;
import com.myportfolio.web.domain.SearchCondition;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class QnaDaoImpl implements QnaDao {
    @Autowired
    private SqlSession session;
    private static final String NAMESPACE = "com.myportfolio.web.dao.QnaMapper.";

    // count 조회
    public int getCount(int ino) throws Exception {
        return session.selectOne(NAMESPACE + "count", ino);
    }

    // 삭제
    public int delete(QnaDto dto) throws Exception {
        return session.delete(NAMESPACE + "delete", dto);
    }

    // 등록
    public int insert(QnaDto dto) throws Exception {
        return session.insert(NAMESPACE + "insert", dto);
    }

    // 수정
    public int update(QnaDto dto) throws Exception {
        return session.update(NAMESPACE + "update", dto);
    }

    // 댓글 작성 시 admin_reply 업데이트
    public int updateAdminReplyed(QnaDto dto) throws Exception {
        return session.update(NAMESPACE + "adminReplyed", dto);
    }

    // 조회
    public QnaDto select(int qno) throws Exception {
        return session.selectOne(NAMESPACE + "select", qno);
    }

    // 댓글 카운트 업데이트
    public int updateCommentCount(Map map) throws Exception {
        return session.update(NAMESPACE + "updateCommentCnt", map);
    }

    // 상세 페이지에서 페이징된 결과 조회
    public List<QnaDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(NAMESPACE + "searchSelectPage", sc);
    }

    // 조건별 총 개수 조회
    public int getResultCount(SearchCondition sc) throws Exception {
        return session.selectOne(NAMESPACE + "resultCnt", sc);
    }

    // Q&A 전체 조회에서 페이징된 결과 조회
    public List<QnaItemDto> searchAllSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(NAMESPACE + "searchAllSelectPage", sc);
    }

    // Q&A 전체 조회에서 선택
    public QnaItemDto selectQna(int qno) throws Exception {
        return session.selectOne(NAMESPACE + "selectQna", qno);
    }
}