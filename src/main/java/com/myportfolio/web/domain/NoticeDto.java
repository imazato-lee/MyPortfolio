package com.myportfolio.web.domain;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeDto {
    private Integer nno;
    private String title;
    private String content;
    private String writer;
    private int view_cnt;
    private int comment_cnt;
    private Date reg_date;
    private Date up_date;

    public NoticeDto() {}

    public NoticeDto(String title, String content, String writer) {
        this.title = title;
        this.content = content;
        this.writer = writer;
    }
}