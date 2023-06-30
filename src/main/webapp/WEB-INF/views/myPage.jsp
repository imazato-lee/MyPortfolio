
<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/05/31
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/css/myShop/myPage.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div id="contents_wrap">
  <div id="container">
    <div id="contents">
      <div class="titleArea">
        <h2>MY PAGE</h2>
      </div>
      <div id="mypage_wrap">
        <div class="xans-element- xans-myshop xans-myshop-orderstate ">
          <ul class="order">
            <li>
              <a href="#" class="count">
                <strong>입금전</strong><span id="xans_myshop_orderstate_shppied_before_count">0</span>
              </a>
            </li>
            <li>
              <a href="#" class="count">
                <strong>배송준비중</strong><span id="xans_myshop_orderstate_shppied_standby_count">0</span>
              </a>
            </li>
            <li>
              <a href="#" class="count">
                <strong>배송중</strong><span id="xans_myshop_orderstate_shppied_begin_count">0</span>
              </a>
            </li>
            <li>
              <a href="#" class="count">
                <strong>배송완료</strong><span id="xans_myshop_orderstate_shppied_complate_count">0</span>
              </a>
            </li>
            <li class="cs">
              <p>
                <a href="#"><strong>취소</strong><span id="xans_myshop_orderstate_order_cancel_count">0</span></a>
                <a href="#"><strong>교환</strong><span id="xans_myshop_orderstate_order_exchange_count">0</span></a>
                <a href="#"><strong>반품</strong><span id="xans_myshop_orderstate_order_return_count">0</span></a>
              </p>
            </li>
          </ul>
        </div>

        <div class="xans-element- xans-myshop xans-myshop-bankbook myshop_bankbook ">
          <ul>
            <li class="mypage_ico">
              <a href="#">
                <img src="<c:url value='/images/order.png'/>">
              </a>
            </li>
            <li>
              <p class="title">ORDER</p>
              <p class="data"><a href="#">0/0회</a></p>
            </li>
          </ul>
          <ul class="xans-element- xans-layout xans-layout-orderbasketcount ">
            <li class="mypage_ico">
              <a href="<c:url value='/cart/list'/>">
                <img src="<c:url value='/images/cart.png'/>">
              </a>
            </li>
            <li>
            <p class="title">CART</p>
            <p class="data"><a href="#">3</a></p>
            </li>
          </ul>
          <ul class="">
            <li class="mypage_ico">
              <a href="#">
                <img src="<c:url value='/images/mileage.png'/>">
              </a>
            </li>
            <li>
              <p class="title">MILEAGE</p>
              <p class="data"><a href="#">0원</a></p>
            </li>
          </ul>
        </div>
        <div class="mypage_wrap">
          <ul>
            <li><a href="#"><strong>Order tacking</strong> 주문내역조회</a></li>
            <li><a href="<c:url value='/user/modify'/>"><strong>Profile</strong> 내 정보수정</a></li>
            <li class="mypage_last"><a href="#"><strong>WishList</strong>관심상품</a></li>
            <li><a href="#"><strong>My Writing </strong>내가쓴글</a></li>
            <li><a href="#"><strong>MILEAGE</strong> 적립금</a></li>
          </ul>
        </div>
      </div>
    </div>

<%@ include file="includes/footer.jsp"%>