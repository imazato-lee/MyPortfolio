package com.myportfolio.web.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemAttachDto {
    private String uuid;
    private String uploadPath;
    private String fileName;
    private boolean fileType;
    private Integer ino;
}
