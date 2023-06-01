package com.myportfolio.web.domain;


import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {
    //검색 조건
    private Integer page = 1; //기본값 컨트롤러에서 값을 못받으면 첫화면을 보여준다.
    private Integer pageSize = 10; //기본값
    //    private Integer offset = 0;   //offset은 page와 pageSize로 계산되는 값이기 때문에 굳이 iv로 저장할 필요 x
    private String keyword ="";
    private String option ="";

    public SearchCondition(Integer page, Integer pageSize, String keyword, String option) {
        this.page = page;
        this.pageSize = pageSize;
        this.keyword = keyword;
        this.option = option;
    }
    public SearchCondition(){}
    public String getQueryString(Integer page){
        // ?page1=1&pageSize=10&option=T&keyword="title"
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .build().toString();
    }
    public String getQueryString(){
        // ?page1=1&pageSize=10&option=T&keyword="title"
        return getQueryString(page);
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getOffset() {
        return (page-1)* pageSize;
    }
    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }
    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", offset=" + getOffset() +
                ", keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                '}';
    }
}
