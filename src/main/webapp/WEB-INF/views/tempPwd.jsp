<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/27
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/item.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/myShop/temPwd.css"/>' />

<div id="contents_wrap">
  <div id="container">
    <div id="contents">

      <div class="xans-element- xans-member xans-member-findpasswdresult">
        <div class="findPw">
          <h1>비밀번호 찾기</h1>
          <h2 class="">임시 비밀번호가 고객님 메일로 전송되었습니다.</h2>
          <h2 class="">임시 비밀번호가<br> 고객님 휴대폰 번호로 전송되었습니다.</h2>
          <p>
            <span>asdfasdf</span>
             회원님, 임시 비밀번호를
            <br>
            <span class="">
              <span>klmzzz711@gmail.com</span>
            </span>
            <span class="">
              <span>010-3807-9099</span>
            </span>
            으로 보내드렸습니다.
            <br>
            즐거운 쇼핑 하세요!
        </p>


        <p class="button">
          <a href="<c:url value='/user/login'/>">LOGIN</a>
        </p>
      </div>
      </div>

    </div>



<%@ include file="includes/footer.jsp"%>