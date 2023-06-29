<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href='<c:url value="/css/myShop/login.css"/>'>
    <script>
        $(function() {
            /* SECTION - PASSWORD */
            // pw: 패스워드 pwRe: 패스워드 재입력 isPwValid: 패스워드 유효 여부
            let pw = "", pwRe = "", isPwValid = false;
            $("#pwdInput").change(function () {
                let pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
                pw = $("#pwdInput").val()
                console.log(pw)
                if (pwRegExp.test(pw)) {
                    $("#pwMsg").css("color", "green")
                    $("#pwMsg").text("사용가능한 비밀번호입니다.")
                } else {
                    $("#pwMsg").css("color", "red")
                    $("#pwMsg").text('8~20자의 영문, 숫자, 특수문자를 모두 포함한 비밀번호를 입력해주세요.')
                }
            })

            /* SECTION - PASSWORD RECHECK */
            $("#pwdCheckInput").on("input", function () {
                pwRe = $("#pwdCheckInput").val()
                if (pw === pwRe) {
                    $("#pwConfirmMsg").css("color", "green")
                    $("#pwConfirmMsg").text("비밀번호가 일치합니다")
                    console.log("pw: " + pw + "pwRe: " + pwRe)
                    isPwValid = true;
                } else {
                    $("#pwConfirmMsg").css("color", "red")
                    $("#pwConfirmMsg").text("비밀번호가 일치하지 않습니다")
                    isPwValid = false;
                }
            })

            $("#submit").on("click", function (e) {
                e.preventDefault()
                if (!isPwValid) {
                    alert("비밀번호가 유효하지 않습니다.")
                    return
                }
                let newPasswordForm = $("#newPasswordForm")
                newPasswordForm.submit()
            })
        })
    </script>
    <div id="contents_wrap">
        <div id="container">
            <div id="contents">
                <form id="newPasswordForm" action="<c:url value='/user/newPassword'/>" method="POST">
                    <input type="hidden" name="id" value="${id}"/>
                    <div class="xans-element- xans-member xans-member-login ">
                        <div class="login">
                            <fieldset>
                                <legend>비밀번호재발급</legend>
                                <div class="login_form">
                                <ul>
                                    <li>
                                        <span>새 비밀번호 입력</span>
                                        <label class="id ePlaceholder" title="pwdInput">
                                            <input id="pwdInput" name="pwd"  class="inputTypeText" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8~20자)" type="password">
                                            <p class="text_guide"><span id="pwMsg"></span></p>
                                        </label>
                                    </li>
                                    <li>
                                        <span>비밀번호 확인</span>
                                        <label class="password ePlaceholder" title="pwdCheckInput">
                                            <input id="pwdCheckInput" name="pwdCheckInput" autocomplete="off" type="password" placeholder="비밀번호 재입력">
                                            <p class="text_guide"><span id="pwConfirmMsg"></span></p>
                                        </label>
                                    </li>
                                </ul>
                                </div>
                                <div class="login_btn">
                                    <ul>
                                        <li class="right">
                                            <a href="#" id="submit">UPDATE</a>
                                        </li>
                                    </ul>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
        </div>

<%@ include file="includes/footer.jsp"%>