package com.myportfolio.web.controller;

import com.myportfolio.web.domain.CommentDto;
import com.myportfolio.web.domain.CommentPageDto;
import com.myportfolio.web.domain.UserDto;
import com.myportfolio.web.service.CommentService;
import com.myportfolio.web.service.UserService;
import lombok.AllArgsConstructor;
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
@AllArgsConstructor
@RequestMapping("/comments/*")
public class CommentController {
    @Autowired
    private CommentService commentService;

    //지정된 게시물의 모든 댓글을 가져오는 메서드
    @GetMapping(value = "/{nno}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<CommentDto>> list(@PathVariable Integer nno){
        try {
            List<CommentDto> list = commentService.getList(nno);

            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //댓글을 등록하는 메서드
    @PostMapping(value = "/new", consumes = "application/json",
        produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> write(@RequestBody CommentDto dto,HttpSession session){
        System.out.println("dto = " + dto);
        try {
            if(commentService.write(dto) != 1)
                throw new Exception("Write Failed.");

            return new ResponseEntity<>("success",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    //지정된 댓글을 삭제하는 메서드
    @DeleteMapping(value = "/{cno}" ,consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable Integer cno,@RequestBody CommentDto dto,HttpSession session){
        try {
            int rowCnt = commentService.remove(dto);

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
    produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto dto){
        try {
            if(commentService.modify(dto)!=1)
                throw new Exception("Modify Failed");

            return new ResponseEntity<>("success",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "/{nno}/{page}", produces = { MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<CommentPageDto> getselectPage(@PathVariable Integer nno, @PathVariable Integer page){
        Map map = new HashMap();
        map.put("offset",(page-1)*10);
        map.put("nno",nno);
        map.put("pageSize",10);
        try {
            CommentPageDto dto = commentService.getSelectPage(map);
            System.out.println("dto = " + dto);
            return new ResponseEntity<>(dto,HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }
}
