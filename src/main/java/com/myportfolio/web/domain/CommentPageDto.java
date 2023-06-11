package com.myportfolio.web.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentPageDto {
    private int commentCnt;
    private List<CommentDto> list;
}
