<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/02
  Time: 11:32 PM
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
  <link rel="stylesheet" href="<c:url value='/css/myShop/notice.css'/>">
  <title>Document</title>
  <script>
    let addZero = function(value=1){
      return value > 9 ? value : "0"+value;
    }

    let dateToString = function(ms) {
      let date = new Date(ms);

      let yyyy = date.getFullYear();
      let mm = addZero(date.getMonth() + 1);
      let dd = addZero(date.getDate());

      // let HH = addZero(date.getHours());
      // let MM = addZero(date.getMinutes());
      // let ss = addZero(date.getSeconds());

      // return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;
      return yyyy+"-"+mm+"-"+dd
    }
  </script>
</head>
<body>
<div id="skipNavigation"><p><a href="#category">전체상품목록 바로가기</a></p><p><a href="#contents">본문 바로가기</a></p></div>
<div id="wrap">
  <div id="LeftMenu">
    <div class="LeftMenu">
      <ul class="xans-element- xans-layout xans-layout-category"><li class="xans-record-"><a href="/product/list.html?cate_no=24">NEW ARRIVALS</a></li>
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






        <form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self" enctype="multipart/form-data">
          <input id="no" name="no" value="14" type="hidden">
          <input id="bulletin_no" name="bulletin_no" value="15" type="hidden">
          <input id="board_no" name="board_no" value="1" type="hidden">
          <input id="member_id" name="member_id" value="ecudemo97964" type="hidden">
          <input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden">
          <input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=14&amp;board_no=1" type="hidden">
          <input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden">
          <input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"><div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002"><!--
$login_page_url = /member/login.html
$deny_access_url = /board/free/list.html
-->
          <div class="board_wrap">
            <div class="board_top ">
              <ul class="left">
                <li class="subject">${noticeDto.title}</li>
                <li class="writer">POSTED BY :  ${noticeDto.writer}  </li>
                <li class="etc">
                  <p class=""><script>document.write(dateToString(${noticeDto.reg_date.time}))</script></p>


                </li>
              </ul></div>

            <div class="detail">
              <div class="fr-view fr-view-article"><p style="font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;">${noticeDto.content}</p></div></div>

            <div class="board_footer ">
              <ul class="left">

              </ul>
              <ul class="right">
                <a href="<c:url value='/notice/list?page=${page}&pageSize=${pageSize}'/>" class="btn_000">LIST</a>
                <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','1');" class="btn_000">DELETE</a>
                <a href="/board/free/modify.html?board_act=edit&amp;no=14&amp;board_no=1" class="btn_000">MODIFY</a>
                <a href="/board/free/reply.html" class="btn_000">REPLY</a>

              </ul>
            </div>
          </div>
          <!-- //board_wrap -->
        </div>
        </form> <!-- //board_read_1002 -->



        <div class="xans-element- xans-board xans-board-commentpackage-1002 xans-board-commentpackage xans-board-1002 "><!-- 코멘트 리스트 -->
          <!-- 코멘트 페이징 -->
          <!-- 댓글 수정 -->
          <form id="commentForm" name="" action="/exec/front/Board/CommentUpdate/1" method="post" target="_self" enctype="multipart/form-data" style="">
            <input id="board_no" name="board_no" value="1" type="hidden">
            <input id="no" name="no" value="14" type="hidden">
            <input id="comment_no" name="comment_no" value="" type="hidden">
            <input id="member_id" name="member_id" value="" type="hidden"><div class="xans-element- xans-board xans-board-commentform-1002 xans-board-commentform xans-board-1002 "><fieldset>
            <legend>댓글 수정</legend>
            <p>비밀번호  <input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value="" type="password"> </p>
            <div class="view">
              <textarea id="comment_modify" name="comment_modify" fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea><span class="submit">
<a href="#none" onclick="BOARD_COMMENT.comment_update_ok('commentForm');" class="btn_ccc_box">MODIFY</a>
<a href="#none" onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');" class="btn_ccc_box">CANCEL</a>
</span>
            </div>

          </fieldset>
          </div>
          </form>
        </div>
      </div>


      <!-- style="text-transform:uppercase" CEO: {$president_name} . CPO : {$cpo_name} -->
      <div id="footer_title">Simple and Basic Market</div>

      <div id="footer">
        <div class="xans-element- xans-layout xans-layout-footer footer "><ul class="xans-element- xans-layout xans-layout-info footer_cs "><li><pre>070-0000-0000　Mon-Fri: 11am-6pm　Sat.Sun.Holiday OFF
    NH 351-0894-7969-53　Account holder : ID5AGIT</pre></li>
        </ul>
          <ul class="sns_list">
            <a href="#" target="blank_">Instagram</a>
          </ul><form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data">
            <input id="banner_action" name="banner_action" value="" type="hidden"><ul class="xans-element- xans-layout xans-layout-searchheader "><li>
            <!--
            $product_page=/product/detail.html
            $category_page=/product/list.html
            -->
            <fieldset>
              <legend>검색</legend>
              <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="Search" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text">
              <input type="image" src="/web/upload/ico_search.png" width="15px" height="15px" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
              &nbsp;</fieldset>
          </li>
          </ul>
          </form><ul class="shop_info">
            Company: ID5AGIT . Ceo Cpo : Haninsuk . Address :   615-1, Daemyeong 1-dong, Nam-gu, Daegu, Korea . Business license : 000-0000-0000 . Online business license : 0000-서울서초-0000<br><a href="/member/agreement.html">Agreement</a>　<a href="/shopinfo/guide.html">Guide</a>　<a href="/member/privacy.html">Privacy</a>
          </ul>
        </div>
      </div>
    </div>
  </div> <!-- #wrap -->


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