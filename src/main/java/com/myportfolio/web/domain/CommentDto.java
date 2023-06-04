package com.myportfolio.web.domain;

import lombok.Data;
import java.util.Date;
@Data
public class CommentDto {
    private Integer cno;
    private Integer nno;
    private String comment;
    private String commenter;
    private Date reg_date;
    private Date up_date;

    public CommentDto(){}

    public CommentDto(Integer nno, String comment, String commenter) {
        this.nno = nno;
        this.comment = comment;
        this.commenter = commenter;
    }
    public CommentDto(String comment,String commenter,Integer cno){
        this.comment = comment;
        this.commenter = commenter;
        this.cno = cno;
    }
}
