package com.myportfolio.web.controller;

import com.myportfolio.web.domain.QnaCommentDto;
import com.myportfolio.web.domain.QnaCommentPageDto;
import com.myportfolio.web.service.QnaCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/qnaComments/*")
public class QnaCommentController {

    @Autowired
    private QnaCommentService qnaCommentService;

    //지정된 게시물의 모든 댓글을 가져오는 메서드
    @GetMapping( value = "/{qno}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<QnaCommentDto>> list(@PathVariable Integer qno){
        try {
            if(qno == null){
                throw new Exception("qno LOAD ERROR");
            }
            List<QnaCommentDto> list = qnaCommentService.getList(qno);
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //댓글을 등록하는 메서드
    @PostMapping( value = "/new" , consumes = "application/json",
        produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> write(@RequestBody QnaCommentDto dto){
        try {
            if(qnaCommentService.write(dto) != 1){
                throw new Exception("QNA COMMENT WRITE ERROR");
            }

            return new ResponseEntity<>("succeess", HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
    }

    //지정된 댓글을 삭제하는 메서드
    @DeleteMapping( value = "/${cno}" , consumes = "application/json" , produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable Integer cno, @RequestBody QnaCommentDto dto){
        try {
            if(qnaCommentService.remove(dto) != 1){
                throw new Exception("QNA COMMENT DELETE ERROR");
            }

            return new ResponseEntity<>("success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //댓글을 수정하는 메서드
    @PatchMapping( value = "/{cno}", consumes = "application/json",
        produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody QnaCommentDto dto){
        try {
            if(qnaCommentService.modify(dto) != 1) {
                throw new Exception("QNA COMMENT MODIFY ERROR");
            }

            return new ResponseEntity<>("success",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping( value = "/{pno}/{page}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<QnaCommentPageDto> getSelectPage(@PathVariable Integer pno, @PathVariable Integer page){
        Map map = new HashMap();
        map.put("offset",(page-1)*10);
        map.put("pno",pno);
        map.put("pageSize",10);

        try {
            QnaCommentPageDto dto = qnaCommentService.getSelectPage(map);
            System.out.println("dto = " + dto);
            return new ResponseEntity<>(dto,HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
