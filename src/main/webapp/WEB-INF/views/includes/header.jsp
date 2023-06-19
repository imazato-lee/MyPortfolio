<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/931c9bcf1b.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/myShop/main.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Document</title>
</head>
<body>
<div id="skipNavigation">
    <p>
        <a href="#">전체상품목록 바로가기</a>
    </p>
    <p>
        <a href="#">본문 바로가기</a>
    </p>
</div>
<div id="wrap">
    <div id="LeftMenu">
        <div class="LeftMenu">
            <ul class="xans-element- xans-layout xans-layout-category">
                <li class="xans-record-"><a href='<c:url value="/item/list?option=new"/>'>NEW ARRIVALS</a></li>
                <li class="xans-record-"><a href='<c:url value="/item/list?option=best"/>'>BEST ITEM</a></li>
                <li class="xans-record-"><a href='<c:url value="/item/list"/>'>ALL ITEM</a></li>
                <li>　</li>
                <li class="xans-record-"><a href='<c:url value="/item/list?option=cate&category=OUTWEARS"/>'>OUTWEARS</a></li>
                <li class="xans-record-"><a href='<c:url value="/item/list?option=cate&category=TOPS"/>'>TOPS</a></li>
                <li class="xans-record-"><a href='<c:url value="/item/list?option=cate&category=BOTTOMS"/>'>BOTTOMS</a></li>
                <li class="xans-record-"><a href='<c:url value="/item/list?option=cate&category=BAG"/>'>BAG</a></li>
                <li class="xans-record-"><a href='<c:url value="/item/list?option=cate&category=SHOES"/>'>SHOES</a></li>
                <li class="xans-record-"><a href='<c:url value="/item/list?option=cate&category=ACCESSORIES"/>'>ACCESSORIES</a></li>
                <li>　</li>
            </ul>
        </div>
    </div>
    <div id="header">
        <div class="header">
            <ul class="board_list"><li><a href="<c:url value='/notice/list'/>">Notice</a></li>
                <li><a href="<c:url value='/qna/list'/>">Q&amp;A</a></li>
                <li><a href="">Review</a></li>
                <li><a href="#dialog" name="modal">About</a></li>
            </ul>
            <ul class="logo"><li><a href="/" style="font-family: 'Oswald', sans-serif;">아직이름을못정했어요</a></li></ul>
            <ul class="membership_list">
                <li class="xans-element- xans-layout xans-layout-statelogoff ">
                    <c:choose>
                        <c:when test="${not empty sessionScope.id}">
                            <a href="<c:url value='/user/logout'/>">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/user/login'/>">Log-in</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="xans-element- xans-layout xans-layout-statelogoff ">
                    <c:choose>
                        <c:when test="${not empty sessionScope.id}">
                            <a href="<c:url value='/user/modify'/>">Modify</a>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/user/register'/>">Register</a>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li><a href="/myshop/order/list.html">Order</a></li>
                <li><a href="/myshop/index.html">Mypage</a></li>
                <%--                <c:if test="${sessionScope.id eq 'admin'}">--%>
                <li><a href="<c:url value='/item/write'/>">ITEM</a></li>
                <%--                </c:if>--%>
            </ul>
        </div>
    </div>