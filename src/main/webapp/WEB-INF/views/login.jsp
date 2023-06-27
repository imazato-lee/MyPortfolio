<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href='<c:url value="/css/myShop/login.css"/>'>
    <script>
        function submitForm() {
            var form = $('<form>').attr({
                method: 'POST',
                action: '<c:url value="/user/login"/>'
            });

            var id = $('input[name=id]').val();
            var pwd = $('input[name=pwd]').val();
            form.append($('<input>').attr({
                type: 'hidden',
                name: 'id',
                value: id
            }));
            form.append($('<input>').attr({
                type: 'hidden',
                name: 'pwd',
                value: pwd
            }));

            $('body').append(form);
            form.submit();
        }
    </script>
    <div id="contents_wrap">
        <div id="container">
            <div id="contents">
                <form id="loginForm" name="" action="" method="post">
                    <div class="xans-element- xans-member xans-member-login ">
                        <div class="login">
                            <fieldset>
                                <legend>회원로그인</legend>
                                <div class="login_form">
                                <ul>
                                    <li><label class="id ePlaceholder" title="MEMBER ID"><input id="member_id" name="id"  class="inputTypeText" placeholder="MEMBER ID" value="" type="text"></label></li>
                                    <li><label class="password ePlaceholder" title="PASSWORD"><input id="member_passwd" name="pwd" autocomplete="off" value="" type="password" placeholder="PASSWORD"></label></li>
                                </ul>
                                </div>
                                <div class="login_btn">
                                    <ul>
                                        <li class="left">
                                            <a href="<c:url value='/user/register'/>">REGISTER</a>
                                            <a href="<c:url value='/user/idCheck'/>">FORGOT ID</a>
                                            <a href="<c:url value='/user/pwdCheck'/>">FORGOT PW</a>
                                        </li>
                                        <li class="right">
                                            <a href="#" onclick="submitForm()">LOGIN</a>
                                        </li>
                                    </ul>
                                </div>
                            </fieldset>
                        </div>
                        <div class="nomember_buy displaynone">
                            <ul>
<%--                                <li><a href="" onclick="">비회원 구매하기</a></li>--%>
                            </ul>
                        </div>
                    </div>
                </form>
            </div>
        </div>

<%@ include file="includes/footer.jsp"%>