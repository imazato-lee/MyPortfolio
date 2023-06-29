package com.myportfolio.web.domain;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
    public void sendMail(UserDto userDto) throws Exception {
        String charSet = "utf-8";
        String hostSMTP = "smtp.naver.com";
        String hostSMTPid = "tpgus5417"; //네이버 아이디
        String hostSMTPpw = "Wldms0905^^"; //네이버 비밀번호

        //보내는 사람
        String fromEmail = "tpgus5417@naver.com"; //보내는 사람 메일
        String fromName = "SHOPPINGMALLTEST"; //보내는 사람 이름

        String subject = ""; //메일 제목
        String msg = ""; //메일 내용

        subject = "[쇼핑몰] 임시 비밀번호 발급 안내";
        msg += "<div align='left'>";
        msg += "<h3>";
        msg += userDto.getId() + "님의 임시 비밀번호입니다<br> 비밀번호를 변경하여 사용하세요 </h3>";
        msg += "<p>임시 비밀번호: ";
        msg += userDto.getPwd() + "</p></div>";

        //email 전송
        String mailRecipient = userDto.getEmail();
        try {
            HtmlEmail mail = new HtmlEmail();
            mail.setDebug(true);
            mail.setCharset(charSet);
            mail.setSSLOnConnect(true);     //SSL 사용(TLS가 없는 경우에도 SSL사용)
            mail.setHostName(hostSMTP);
            mail.setSmtpPort(587);
            mail.setAuthentication(hostSMTPid,hostSMTPpw);
            mail.setStartTLSEnabled(true);
            mail.addTo(mailRecipient, charSet);
            mail.setFrom(fromEmail, fromName, charSet);
            mail.setSubject(subject);
            mail.setHtmlMsg(msg);
            mail.send();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
