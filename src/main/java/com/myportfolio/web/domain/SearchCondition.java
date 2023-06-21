package com.myportfolio.web.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.util.UriComponentsBuilder;
@Data
@NoArgsConstructor
public class SearchCondition {
    //검색 조건
    private Integer page = 1; //기본값 컨트롤러에서 값을 못받으면 첫화면을 보여준다.
    private Integer pageSize = 10; //기본값
    //    private Integer offset = 0;   //offset은 page와 pageSize로 계산되는 값이기 때문에 굳이 iv로 저장할 필요 x
    private String keyword ="";
    private String option ="";
    private String time = "";

    public SearchCondition(Integer page, Integer pageSize) {
        this(page, pageSize, "", "", "");
    }

    public SearchCondition(Integer page, Integer pageSize, String option, String keyword, String time) {
        this.page = page;
        this.pageSize = pageSize;
        this.option = option;
        this.keyword = keyword;
        this.time = time;
    }

    public Integer getOffset(){
        return (page-1) * pageSize;
    }

    public String getQueryString(Integer page){
        // ?page1=1&pageSize=10&option=T&keyword="title"
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .queryParam("time",time)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .build().toString();
    }
    public String getQueryString(){
        // ?page1=1&pageSize=10&option=T&keyword="title"
        return getQueryString(page);
    }


}
