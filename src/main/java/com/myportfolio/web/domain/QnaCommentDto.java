package com.myportfolio.web.domain;

import lombok.Data;

import java.util.Date;

@Data
public class QnaCommentDto {
    private Integer cno;
    private Integer qno;
    private String comment;
    private String commenter;
    private Date reg_date;
    private Date up_date;

    public QnaCommentDto(){}

    public QnaCommentDto(Integer qno, String comment, String commenter) {
        this.qno = qno;
        this.comment = comment;
        this.commenter = commenter;
    }
    public QnaCommentDto(String comment,String commenter,Integer cno){
        this.comment = comment;
        this.commenter = commenter;
        this.cno = cno;
    }
}
