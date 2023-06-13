package com.myportfolio.web.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDto {
    private int ino;
    private String itemName;
    private String category;
    private int itemPrice;
    private int itemStock;
    private double itemDiscount;
    private String itemContent;
    private int viewCnt;
    private Date reg_date;
    private Date up_date;
}
