package com.myportfolio.web.service;



import com.myportfolio.web.dao.UserDao;
import com.myportfolio.web.domain.MailUtil;
import com.myportfolio.web.domain.UserDto;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public UserDto select(String id) throws Exception{
        return userDao.select(id);
    }

    @Override
    public int deleteAll() throws Exception{
        return userDao.deleteAll();
    }

    @Override
    public int delete(String id) throws Exception{
        return userDao.delete(id);
    }

    @Override
    public int insert(UserDto dto) throws Exception{
        return userDao.insert(dto);
    }

    @Override
    public int update(UserDto dto) throws Exception{
        return userDao.update(dto);
    }

    @Override
    public List<UserDto> selectForIdCheck(UserDto dto) throws Exception{
        if(dto.getMobile() == null){
            return userDao.selectWithNameEmail(dto);
        } else {
            return userDao.selectWithNameMobile(dto);
        }
    }

    @Override
    public UserDto selectForPwdCheck(UserDto dto) throws Exception {
        if(dto.getMobile() == null){
            return userDao.selectWithIdNameEmail(dto);
        } else {
            return userDao.selectWithIdNameMobile(dto);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateTempPwd(UserDto dto) throws Exception {
        //1. 임시비밀번호를 만들어서 비밀번호를 임시 비밀번호로 바꾼다.
        String tempPwd = UUID.randomUUID().toString().replace("-","");
        tempPwd = tempPwd.substring(0,10);
        dto.setPwd(tempPwd);
        System.out.println("dto = " + dto);

        try {
            int rowCnt = userDao.updateTempPwd(dto);
            if(rowCnt != 1){
                throw new Exception("UPDATE TEMP PWD ERROR");
            }

            //2. 바꾼 임시비밀번호를 메일로 전송한다.
            MailUtil mail = new MailUtil();
            mail.sendMail(dto);
            return true;

        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateNewPwd(UserDto dto){
        try {
            int rowCnt = userDao.updateTempPwd(dto);
            if(rowCnt !=1){
                throw new Exception("UPDATE TEMP PWD ERROR");
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void certifiedPhoneNumber(String mobile, int randomNumber) {
        String api_key = "NCSJ0YUJYRWQ3T1N";
        String api_secret = "CMB1UZAUAHQCYD2SVHEHZT6IWIG63G99";
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", mobile);    // 수신전화번호
        params.put("from", "01038079099");    // 발신전화번호
        params.put("type", "SMS");
        params.put("text", "[쇼핑몰테스트] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }
}
