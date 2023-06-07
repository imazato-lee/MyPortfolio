
<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/05/31
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>
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
  <link rel="stylesheet" href="<c:url value='/css/myShop/myPage.css'/>">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <title>Document</title>
</head>

<body>
<div id="skipNavigation"><p><a href="#category">전체상품목록 바로가기</a></p><p><a href="#contents">본문 바로가기</a></p></div>
<div id="wrap">
  <div id="LeftMenu">
    <div class="LeftMenu">
      <ul class="xans-element- xans-layout xans-layout-category">
        <li class="xans-record-"><a href="/product/list.html?cate_no=24">NEW ARRIVALS</a></li>
        <li class="xans-record-"><a href="/product/list.html?cate_no=25">BEST ITEM</a></li>
        <li>　</li>
        <li class="xans-record-"><a href="/product/list.html?cate_no=26">OUTWEARS</a></li>
        <li class="xans-record-"><a href="/product/list.html?cate_no=27">TOPS</a></li>
        <li class="xans-record-"><a href="/product/list.html?cate_no=28">BOTTOMS</a></li>
        <li class="xans-record-"><a href="/product/list.html?cate_no=42">BAG SHOES</a></li>
        <li class="xans-record-"><a href="/product/list.html?cate_no=43">ACCESSORIES</a></li>
        <li>　</li>
      </ul>
    </div>
  </div>
  <div id="header">
    <div class="header">
      <ul class="board_list"><li><a href="/front/php/b/board_list.php?board_no=1">Notice</a></li>
        <li><a href="/front/php/b/board_list.php?board_no=6">Q&amp;A</a></li>
        <li><a href="/front/php/b/board_list.php?board_no=4">Review</a></li>
        <li><a href="#dialog" name="modal">About</a></li>
      </ul><ul class="logo"><li><a href="/index.html" style="font-family: 'Oswald', sans-serif;">this is logo</a></li>
    </ul><ul class="membership_list"><li class="xans-element- xans-layout xans-layout-statelogoff "><a href="/member/login.html">Log-in</a>
    </li>
      <li class="xans-element- xans-layout xans-layout-statelogoff "><a href="/member/join.html">Register</a>
      </li>
      <li><a href="/myshop/order/list.html">Order</a></li>
      <li><a href="/myshop/index.html">Mypage</a></li>
    </ul><!--<ul class="count_cart">
    <a href="/order/basket.html" module="Layout_orderBasketcount">Cart <span class="count {$basket_count_display_class}"><span class="{$basket_count_class}">{$basket_count}</span></span></a>
    </ul>--></div>
  </div>
  <div id="contents_wrap">
    <div id="container">
      <div id="contents">

        <div class="titleArea">
          <h2>MY PAGE</h2>
        </div>

        <div id="mypage_wrap">


          <div class="xans-element- xans-myshop xans-myshop-orderstate "><ul class="order">
            <li>
              <a href="/myshop/order/list.html?order_status=shipped_before" class="count"><strong>입금전</strong>
                <span id="xans_myshop_orderstate_shppied_before_count">0</span></a>
            </li>
            <li>
              <a href="/myshop/order/list.html?order_status=shipped_standby" class="count"><strong>배송준비중</strong>
                <span id="xans_myshop_orderstate_shppied_standby_count">0</span></a>
            </li>
            <li>
              <a href="/myshop/order/list.html?order_status=shipped_begin" class="count"><strong>배송중</strong>
                <span id="xans_myshop_orderstate_shppied_begin_count">0</span></a>
            </li>
            <li>
              <a href="/myshop/order/list.html?order_status=shipped_complate" class="count"><strong>배송완료</strong>
                <span id="xans_myshop_orderstate_shppied_complate_count">0</span></a>
            </li>
            <li class="cs">
              <p>
                <a href="/myshop/order/list.html?order_status=order_cancel"><strong>취소</strong><span id="xans_myshop_orderstate_order_cancel_count">0</span></a>
                <a href="/myshop/order/list.html?order_status=order_exchange"><strong>교환</strong><span id="xans_myshop_orderstate_order_exchange_count">0</span></a>
                <a href="/myshop/order/list.html?order_status=order_return"><strong>반품</strong><span id="xans_myshop_orderstate_order_return_count">0</span></a>
              </p>
            </li>
          </ul>
          </div>



          <div class="xans-element- xans-myshop xans-myshop-bankbook myshop_bankbook "><ul>
            <li class="mypage_ico"><a href="/myshop/order/list.html"><img src="./images/mypage_ico_order.png"></a></li>
            <li>
              <p class="title">ORDER</p>
              <p class="data"><a href="/myshop/order/list.html">0/0회</a></p>
            </li>
          </ul><ul class="xans-element- xans-layout xans-layout-orderbasketcount "><li class="mypage_ico"><a href="/order/basket.html"><img src="./images/mypage_ico_bag.png"></a></li>
            <li>
              <p class="title">CART</p>
              <p class="data"><a href="/order/basket.html">1</a></p>
            </li>
          </ul>
            <ul class="">
              <li class="mypage_ico"><a href="/myshop/mileage/historyList.html"><img src="./images/mypage_ico_point.png"></a></li>
              <li>
                <p class="title">MILEAGE</p>
                <p class="data"><a href="/myshop/mileage/historyList.html">0원</a></p>
              </li>
            </ul>
          </div>
          <div class="mypage_wrap">
            <ul><li><a href="/myshop/order/list.html"><strong>Order tacking</strong> 주문내역조회</a></li>
              <li><a href="/member/modify.html"><strong>Profile</strong> 내 정보수정</a></li>
              <li class="mypage_last"><a href="/myshop/wish_list.html"><strong>WishList</strong>관심상품</a></li>
              <li><a href="/myshop/board_list.html"><strong>My Writing </strong>내가쓴글</a></li>
              <li><a href="/myshop/mileage/historyList.html"><strong>MILEAGE</strong> 적립금</a></li>
              <li class="mypage_last"><a href="/myshop/coupon/coupon.html"><strong>Coupon</strong> 쿠폰</a></li>
            </ul></div>
        </div>
      </div>

      <!-- style="text-transform:uppercase" CEO: {$president_name} . CPO : {$cpo_name} -->
      <div id="footer_title">Simple and Basic Market</div>


      <div id="boxes">
        <div id="dialog" class="window">
          <!--<a href="#" class="close">Close it</a>-->

          <div id="about_wrap">
            <div class="about_inner">
              <ul><li class="company_title">
    <pre><!-- 타이틀명 시작 -->
    Creative Design Market
    ID5AGIT
      <!-- 타이틀명 끝 -->
    </pre><p class="line">&nbsp;</p>
              </li>
                <li class="inner">
    <pre>
    <!-- 소개 내용 시작 -->
    아이디오아지트는 아이디어를 만들어내는 아지트라는 의미로, 새로움에 도전하는 디자인 그룹입니다.
    많은 사람들이 좋아하는 디자인을 만들어 내는 것은  더이상 많은 사람들이 좋아히지 않습니다.
    우리는 변화를 두려워하지 않는 창조의 아지트입니다.

    또한, 아이디오아지트의 디자인으로 인해 우리와 함께하는
    다른 어떠한 것들이 더 돋보일 수 있는 디자인을 만드는 것이 아이디오아지트의 마인드입니다.

    아이디오아지트는 웹, 모바일, 앱, 배너, 포스터, 명함, 아이콘  등을 디자인합니다.
    표현할 수 있는 공간이 있다면 어디든, 특히나 새로운 공간에서 표현하는것을 좋아합니다.
    아이디오아지트와 함께하세요! 어떠한것도 담을 수 있습니다.
      <!-- 소개 내용 끝 -->
    </pre>
                  <pre class="contact">
    <!-- CONTACT 내용 시작 -->
    Contact. 070-0000-0000
    Mon-Fri 11am-5pm / Sat Sun Holiday OFF
                    <!-- CONTACT 내용 끝 -->
    </pre>
                </li>
              </ul></div>
          </div>
        </div>
        <div id="mask"></div>
      </div>



      <p id="back-top" style="display: none;"><a href="#top">TOP</a></p>




      <!-- 참고: 결제를 위한 필수 영역 -->
      <div id="progressPaybar" style="display:none;">
        <div id="progressPaybarBackground" class="layerProgress"></div>
        <div id="progressPaybarView">
          <div class="box">
            <p class="graph">
              <span><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/layout/txt_progress.gif" alt="현재 결제가 진행중입니다."></span>
              <span><img src="https://img.echosting.cafe24.com/skin/base/layout/img_loading.gif" alt=""></span>
            </p>
            <p class="txt">
              본 결제 창은 결제완료 후 자동으로 닫히며,결제 진행 중에 본 결제 창을 닫으시면<br>
              주문이 되지 않으니 결제 완료 될 때 까지 닫지 마시기 바랍니다.
            </p>
          </div>
        </div>
      </div>
      <!-- //참고 -->

      </span>
      <script type="text/javascript" charset="utf-8"></script>

      </script>
      <div id="modalBackpanel"></div>
      <div id="modalContainer"></div>
</html>