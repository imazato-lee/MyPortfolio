<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/26
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/item.css"/>' />
<link rel="stylesheet" href='<c:url value="/css/myShop/idCheck.css"/>' />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    let addZero = function(value=1){
        return value > 9 ? value : "0"+value;
    }

    let dateToString = function(ms) {
        let date = new Date(ms);

        let yyyy = date.getFullYear();
        let mm = addZero(date.getMonth() + 1);
        let dd = addZero(date.getDate());

        return yyyy+"-"+mm+"-"+dd
    }

    $(function(){
        $("#submit").on("click",function(e){
            e.preventDefault()
            let findIdForm = $("#findIdForm")
            findIdForm.submit();
        })
    })
</script>
<div id="contents_wrap">
    <div id="container">
        <div id="contents">
            <c:if test="${mode eq 'GET'}">
            <form id="findIdForm" name="findIdForm" action="<c:url value='/user/idCheck'/>" method="post">
                <div class="xans-element- xans-member xans-member-findid ">
                    <div class="findId">
                        <h1>아이디 찾기</h1>
                        <h2>이메일 또는 휴대전화번호로 아이디 찾기가 가능합니다.<br>
                            찾기가 어려우시면, 고객센터로 문의주세요</h2>
                        <fieldset>
                            <legend>아이디 찾기</legend>

                            <ul class="find_form">
                                <li class="method">
                                    <input id="check_method0" name="check_method" value="1" type="radio" style="display: none;">
                                    <label for="check_method0" style="display: none;">
                                        <span id="ssn_lable" style="display: none;"></span>
                                    </label>
                                    <input id="check_method1" name="check_method" value="2" type="radio" checked="checked">
                                    <label for="check_method1">이메일</label>
                                    <input id="check_method2" name="check_method" value="3" type="radio">
                                    <label for="check_method2">
                                        <span id="search_type_mobile_lable" style="display:inline;">휴대폰번호</span>
                                    </label>
                                </li>
                                <li class="name">
                                    <strong>NAME</strong>
                                    <input id="name" name="name" class="lostInput" placeholder="이름을 입력하세요." value="" type="text"></li>
                                <li class="email" style="">
                                    <strong>E MAIL</strong>
                                    <input id="email" name="email" class="lostInput" placeholder="이메일을 입력하세요." value="" type="text">
                                </li>
                                <li class="mobile" style="display:none;">
                                    <strong>MOBILE</strong>
                                    <input id="mobile1" name="mobile1" class="mobile1" placeholder="" maxlength="3" value="" type="text"> ― <input id="mobile2" name="mobile2" class="mobile2" placeholder="" maxlength="4" value="" type="text"> ― <input id="mobile3" name="mobile3" class="mobile2" placeholder="" maxlength="4" value="" type="text">
                                </li>
                            </ul>
                            <ul class="button">
                                <a href="#" id="submit">FIND ID</a>
                            </ul>
                        </fieldset>
                    </div>
                </div>
            </form>
            </c:if>
            <c:if test="${mode ne 'GET'}">
            <%-- 결과 출력 --%>
            <div class="xans-element- xans-member xans-member-findidresult">
                <div class="findId">
                    <h1>아이디 찾기</h1>
                    <h2>아이디 찾기가 완료되었습니다.</h2>
                    <h3>다음정보로 가입된 아이디가 총 ${totalCnt}개 있습니다.</h3>
                    <ul class="find_wrap">
                        <li>
                            <strong>NAME</strong>
                            <span>${userDto.name}</span>
                        </li>
                        <li>
                            <strong>이메일 </strong>
                            <span>${userDto.email}</span>
                        </li>
                        <li>
                            <c:forEach items="${list}" var="userDto" varStatus="loop">
                            <label>
                                <input type="radio" name="selectedUser" <c:if test="${loop.index == 0}">checked</c:if>>
                                <span class="id">${userDto.id}</span>
                                <span class="gaip">( 회원, <script>document.write(dateToString(${userDto.reg_date.time}))</script> 가입 )</span>
                            </label>
                            <br>
                            </c:forEach>
                        </li>
                    </ul>
                    <ul class="button">
                        <a href="<c:url value='/user/login'/>" class="">LOG IN</a>
                        <a href="#" class="">FIND PW</a>
                    </ul>
                </div>
            </div>
            </c:if>
        </div>
    </div>


<%@ include file="includes/footer.jsp"%>
