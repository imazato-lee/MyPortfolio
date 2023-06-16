package com.myportfolio.web.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.util.UriComponentsBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemCondition{
    private Integer page = 1;  //초기값
    private Integer pageSize = 6;
    private String option = "";
    private String keyword = "";
    private String category = "";

    public ItemCondition(Integer page, Integer pageSize){
        this(page, pageSize, "","","");
    }

    public Integer getOffset(){
        return (page-1) * pageSize;
    }

    public String getQueryString(Integer page){
        return UriComponentsBuilder.newInstance()
                .queryParam("page",page)
                .queryParam("pageSize",pageSize)
                .queryParam("option",option)
                .queryParam("keyword",keyword)
                .build().toString();
    }

    public String getQueryString(){
        return getQueryString(page);
    }
}
