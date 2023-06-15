package com.myportfolio.web.domain;

import lombok.Data;


@Data
public class ItemPageHandler {
    // private int page;
    // private int pageSize = 6;
    private ItemCondition ic;
    private int totalCnt;
    private int naviSize = 10;
    private int totalPage;
    private int beginPage;
    private int endPage;
    private boolean showPrev;
    private boolean showNext;

    public ItemPageHandler(int totalCnt,ItemCondition ic){
        this.totalCnt = totalCnt;
        this.ic = ic;

        doPaging(totalCnt,ic);
    }
    public void doPaging(int totalCnt, ItemCondition ic){
        this.totalCnt = totalCnt;

        totalPage = (int)Math.ceil(totalCnt / (double) ic.getPageSize());
        beginPage = (ic.getPage()-1) / naviSize * naviSize + 1;
        endPage = Math.min(beginPage + (naviSize-1), totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }
}