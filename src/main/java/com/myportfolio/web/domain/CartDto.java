package com.myportfolio.web.domain;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
public class CartDto {
    private Integer cano;
    private String id;
    private Integer ino;
    private Integer itemCount;

    private String itemName;
    private Integer itemPrice;
    private Double itemDiscount;

    @Setter(AccessLevel.NONE)
    private int salePrice;
    @Setter(AccessLevel.NONE)
    private int totalPrice;

    public void initSaleTotal() {
        this.salePrice = (int) (this.itemPrice * (1-this.itemDiscount));
        this.totalPrice = this.salePrice * this.itemCount;
    }
}
