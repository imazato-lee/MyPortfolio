package com.myportfolio.web.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDto {
    private Integer ino;
    private String itemName;
    private String category;
    private Integer itemPrice;
    private Integer itemStock;
    private Double itemDiscount;
    private String itemContent;
    private Integer viewCnt;
    private Date reg_date;
    private Date up_date;

    private List<ItemAttachDto> attachList;
}
