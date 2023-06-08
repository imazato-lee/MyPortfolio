package com.myportfolio.web.controller;

import com.myportfolio.web.domain.CommentDto;
import com.myportfolio.web.service.CommentService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@RestController
@AllArgsConstructor
@RequestMapping("/comments/*")
public class CommentController {
    private CommentService service;

    //지정된 게시물의 모든 댓글을 가져오는 메서드
    @GetMapping(value = "/{nno}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<CommentDto>> list(@PathVariable Integer nno){
        try {
            List<CommentDto> list = service.getList(nno);

            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //댓글을 등록하는 메서드
    @PostMapping(value = "/new", consumes = "application/json",
        produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<String> write(@RequestBody CommentDto dto,Integer nno){
        dto.setNno(nno);
        try {
            if(service.write(dto) != 1)
                throw new Exception("Write Failed.");

            return new ResponseEntity<>("success",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //지정된 댓글을 삭제하는 메서드
    @DeleteMapping(value = "/{cno}" ,produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<String> remove(@PathVariable Integer cno,Integer nno,HttpSession session){
//        String commenter = (String) session.getAttribute("id");
        String commenter = "klmzzz711@gmail.com";

        try {
            int rowCnt = service.remove(cno, nno, commenter);

            if(rowCnt <= 0)
                throw new Exception("Delete Failed.");

            return new ResponseEntity<>("success",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //댓글을 수정하는 메서드
    @PatchMapping(value = "/{cno}", consumes = "application/json",
    produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto dto){
        try {
            if(service.modify(dto)!=1)
                throw new Exception("Modify Failed");

            return new ResponseEntity<>("success",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
