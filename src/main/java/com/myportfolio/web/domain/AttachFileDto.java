package com.myportfolio.web.domain;

import lombok.Data;

@Data
public class AttachFileDto {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean image;
}
