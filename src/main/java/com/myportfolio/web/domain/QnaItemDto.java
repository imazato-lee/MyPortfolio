package com.myportfolio.web.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class QnaItemDto {
    private Integer qno;
    private Integer ino;
    private String itemName;
    private Integer itemPrice;
    private String title;
    private String content;
    private String writer;
    private Integer comment_cnt;
    private boolean admin_reply;
    private Date reg_date;
    private Date up_date;

}