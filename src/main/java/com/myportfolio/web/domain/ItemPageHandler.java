package com.myportfolio.web.domain;

import lombok.Data;

@Data
public class ItemPageHandler {
    private int page;
    private int pageSize = 6;
    private int totalCnt;
    private int naviSize = 10;
    private int totalPage;
    private int beginPage;
    private int endPage;
    private boolean showPrev;
    private boolean showNext;

    public ItemPageHandler(int totalCnt,int page){
        this.totalCnt = totalCnt;
        this.page = page;

        totalPage = (int)Math.ceil(totalCnt / (double) pageSize);
        beginPage = (page-1) / naviSize * naviSize + 1;
        endPage = Math.min(beginPage + (naviSize-1), totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }
}
