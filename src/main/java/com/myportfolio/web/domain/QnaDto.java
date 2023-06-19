package com.myportfolio.web.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class QnaDto {
    private Integer qno;
    private Integer ino;
    private String title;
    private String content;
    private String writer;
    private Integer comment_cnt;
    private boolean admin_reply;
    private Date reg_date;
    private Date up_date;

    public QnaDto(Integer ino,
                  String title, String content, String writer) {
        this.ino = ino;
        this.title = title;
        this.content = content;
        this.writer = writer;
    }
}