package com.myportfolio.web.domain;

import lombok.Data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class UserDto {
    private String id;
    private String pwd;
    private String name;
    private String email;
    private Date birth;
    private String mobile;
    private Date reg_date;

    public UserDto() {
    }
    public UserDto(String id, String pwd){
        this.id = id;
        this.pwd = pwd;
    }
    public UserDto(String id, String pwd, String name, String email, String birth, String mobile) throws ParseException {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        setBirth(birth);
        this.mobile = mobile;
    }

    public void setBirth(String birth) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        this.birth = dateFormat.parse(birth);
    }
}