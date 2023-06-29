<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/27
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/item.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/myShop/pwdCheck.css"/>' />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $(function(){
    $('.mobile').hide();
    $("#certify_info").hide()
    $("#certificate").hide()

    $('input[name="check_method"]').change(function() {
      var selected = $(this).val();

      if (selected === "1") {
        $('.email').show();
        $('.mobile').hide();
      } else if (selected === "2") {
        $('.email').hide();
        $('.mobile').show();
      }
    })

    $("#submit").on("click",function(e){
      e.preventDefault()

      if ($("#check_method2").is(":checked")) {
        let mobile = $("#mobile1").val() + $("#mobile2").val() + $("#mobile3").val();
        let input = $("<input>").attr("type", "hidden").attr("name", "mobile").val(mobile);
        $("#findPasswdForm").append(input);
      }
      let findPasswdForm = $("#findPasswdForm")
      findPasswdForm.submit();
    })

    $("#sendToEmail").on("click",function(e){
      e.preventDefault()
      let findPasswordMethod = $("#findPasswdMethod")
      findPasswordMethod.submit()
    })

    let certifyNum = "";
    $("#sendToMobile").on("click",function(e){
      e.preventDefault()
      let mobile = $("input[name=mobile]").val()
      $.ajax({
        type : "GET",
        url : "/user/sendSMS",
        data : {
          "mobile" : mobile
        },
      success: function(data){
        alert("인증번호 발송이 완료되었습니다.")
        console.log("data: " + data);
        $("#certify_info").show()
        $("#certificate").show()
        $("#sendToMobile").hide()
        certifyNum = data;

      }
      })
    })

    $("#certificate").on("click",function(e){
      e.preventDefault()
      let certInput = $("#certInput").val()
      console.log("certifyNum: " + certifyNum)
      if(certInput !== certifyNum){
        alert("승인번호가 일치하지 않습니다.")
        return;
      }
      let newPasswordForm = $("#newPasswordForm")
      newPasswordForm.submit();
    })
  })
</script>

<div id="contents_wrap">
  <div id="container">
    <div id="contents">
      <c:if test="${mode eq 'GET'}">
      <form id="findPasswdForm" name="findPasswdForm" action="<c:url value='/user/pwdCheck'/>" method="post">
        <div class="xans-element- xans-member xans-member-findpasswd">
          <div class="findPw">
            <h1>비밀번호 재설정</h1>
            <fieldset>
              <legend>비밀번호 찾기 1단계 정보 입력</legend>
              <ul class="find_form">
                <li>
                  <input id="check_method1" name="check_method" value="1" type="radio" checked="checked"><label for="check_method1">이메일</label>
                  <input id="check_method2" name="check_method" value="2" type="radio">
                  <label for="check_method2">
                    <span id="search_type_mobile_lable" style="display:inline;">휴대폰번호</span>
                  </label>
                </li>
                <li>
                  <strong>아이디</strong>
                  <input id="id" name="id" class="lostInput" placeholder="" value="" type="text">
                </li>
                <li id="name_view" class="name" style="">
                  <strong>이름</strong>
                  <input id="name" name="name" class="lostInput ec-member-name" placeholder="" value="" type="text">
                </li>
                <li id="email_view" class="email" style="">
                  <strong>이메일로 찾기</strong>
                  <input id="email" name="email" class="lostInput" placeholder="" value="" type="text">
                </li>
                <li id="mobile_view" class="mobile" style="">
                  <strong>휴대폰 번호로 찾기</strong>
                  <input id="mobile1" name="mobile1" class="mobile1" placeholder="" maxlength="3" value="" type="text"> - <input id="mobile2" name="mobile2" class="mobile2" placeholder="" maxlength="4" value="" type="text"> - <input id="mobile3" name="mobile3" class="mobile2" placeholder="" maxlength="4" value="" type="text">
                </li>
              </ul>
              <ul class="button ">
                <a href="#" id="submit">FIND PW</a>
              </ul>
            </fieldset>
          </div>
        </div>
      </form>
      </c:if>
      <c:if test="${mode ne 'GET'}">
        <form id="findPasswdMethod" name="" action="<c:url value='/user/tempPwd'/>" method="post">
          <input type="hidden" name="id" value="${userDto.id}">

          <div class="xans-element- xans-member xans-member-findpasswdmethod ">
            <div class="inner">
              <h1>비밀번호 찾기</h1>
              <fieldset>
                <legend>임시 비밀번호 전송</legend>
                <ul class="find_form">
                  <li>
                    <strong>임시 비밀번호</strong>
                    <c:if test="${not empty userDto.email.trim()}">
                    <input id="passwd_method_type0" name="passwd_method_type" value="email" type="radio" checked="checked"><label for="passwd_method_type0">이메일</label>
                    </c:if>
                    <c:if test="${not empty userDto.mobile.trim()}">
                    <input id="passwd_method_type1" name="passwd_method_type" value="mobile" type="radio" checked="checked">
                    <label for="passwd_method_type1" >휴대폰</label>
                    </c:if>
                  </li>
                  <c:if test="${not empty userDto.email.trim()}">
                  <li id="passwd_method_email_info">
                    <strong>이메일</strong><span>${userDto.email}</span>
                  </li>
                  </c:if>
                  <c:if test="${not empty userDto.mobile.trim()}">
                  <li id="passwd_method_mobile_info">
                    <strong>휴대폰 번호</strong><span>${userDto.mobile}</span>
                  </li>
                  </c:if>
                  <li id="certify_info" class="">
                    <strong>인증 번호</strong><span><input type="text" id="certInput" maxlength="4" style="width: 40px"/></span><br>
                    <span class="certificationMsg"></span>
                  </li>
                </ul>
                <ul class="button">
                  <c:if test="${not empty userDto.email.trim()}">
                    <input type="hidden" name="email" value="${userDto.email}"/>
                    <a href="#" id="sendToEmail">임시 비밀번호 전송</a>
                  </c:if>
                  <c:if test="${not empty userDto.mobile.trim()}">
                    <input type="hidden" name="mobile" value="${userDto.mobile}"/>
                    <a href="#" id="sendToMobile" class="">인증번호 전송</a>
                  </c:if>
                  <a href="#" id="certificate" class="">인증하기</a>
                </ul>
              </fieldset>
            </div>
          </div>
        </form>
      </c:if>
    </div>
    <form id="newPasswordForm" action='<c:url value="/user/newPassword"/>' method="GET">
      <input type="hidden" name="id" value="${userDto.id}">
    </form>
    <script>
      <c:if test="${msg == 'error'}">
      alert("입력하신 정보로 가입 된 회원은 존재하지 않습니다.");
      </c:if>
    </script>
<%@ include file="includes/footer.jsp"%>