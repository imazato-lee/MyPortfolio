package com.myportfolio.web.dao;

import lombok.Data;

@Data
public class AttachFileDto {
    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean image;
}
