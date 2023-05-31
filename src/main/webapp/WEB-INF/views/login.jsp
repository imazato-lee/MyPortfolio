<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/05/31
  Time: 9:43 AM
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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href='<c:url value="/css/myShop/main.css"/>'>
    <link rel="stylesheet" href='<c:url value="/css/myShop/login.css"/>'>
    <title>Document</title>
    <script>
        function submitForm() {
            // form 요소 동적 생성
            var form = $('<form>').attr({
                method: 'POST',
                action: '<c:url value="/user/login"/>' // 컨트롤러 URL을 여기에 입력하세요
            });

            // 히든 필드 생성 및 값을 설정
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

            // form을 body에 추가하고 전송
            $('body').append(form);
            form.submit();
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



                <form id="member_form_7356660185" name="" action="/exec/front/Member/login/" method="post" target="_self" enctype="multipart/form-data">
                    <input id="returnUrl" name="returnUrl" value="http://ecudemo97964.cafe24.com/article/review/4/9/" type="hidden">
                    <input id="forbidIpUrl" name="forbidIpUrl" value="/index.html" type="hidden">
                    <input id="certificationUrl" name="certificationUrl" value="/intro/adult_certification.html" type="hidden">
                    <input id="sIsSnsCheckid" name="sIsSnsCheckid" value="" type="hidden">
                    <input id="sProvider" name="sProvider" value="" type="hidden"><div class="xans-element- xans-member xans-member-login "><!--
$defaultReturnUrl = /index.html
$forbidIpUrl = member/adminFail.html
-->
                    <div class="login">
                        <fieldset>
                            <legend>회원로그인</legend>
                            <div class="login_form">
                                <ul>
                                    <li><label class="id ePlaceholder" title="MEMBER ID"><input id="member_id" name="id" fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="MEMBER ID" value="" type="text"></label></li>
                                    <li><label class="password ePlaceholder" title="PASSWORD"><input id="member_passwd" name="pwd" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드" fw-msg="" autocomplete="off" value="" type="password" placeholder="PASSWORD"></label></li>
                                </ul>
                            </div>

                            <div class="login_btn">
                                <ul>
                                    <li class="left">
                                        <a href="/member/join.html">REGISTER</a>
                                        <a href="/member/id/find_id.html">FORGOT ID</a>
                                        <a href="/member/passwd/find_passwd_info.html">FORGOT PW</a>
                                        보안접속
                                    </li>
                                    <li class="right">
                                        <a href="#none" onclick="submitForm()">LOGIN</a>
                                    </li>
                                </ul>
                                <ul class="sns_login">
                                    <li class="displaynone"><a href="#none" onclick="" class="btn_facebook">FACEBOOK LOGIN</a></li>
                                    <li class="displaynone"><a href="#none" onclick="" class="btn_naver">NAVER LOGIN</a></li>
                                    <li class="displaynone"><a href="#none" onclick="" class="btn_google">GOOGLE LOGIN</a></li>
                                    <li class="displaynone"><a href="#none" onclick="" class="btn_kakao">KAKAOTALK LOGIN</a></li>
                                </ul>
                            </div>
                        </fieldset>
                    </div>
                    <div class="nomember_buy displaynone">
                        <ul>
                            <li><a href="" onclick="">비회원 구매하기</a></li>
                        </ul>
                    </div>
                </div>
                </form> <!-- module="member_login" -->





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
                            <input type="image" src="<c:url value='/images/ico_search.png'/>" width="15px" height="15px" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
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
</div>
</body>