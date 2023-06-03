<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/03
  Time: 10:07 PM
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
    <link rel="stylesheet" href="<c:url value='/css/myShop/noticeWrite&Modify.css'/>">
    <title>Document</title>
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
        </ul></div>
    </div>
    <div id="contents_wrap">
        <div id="container">
            <div id="contents">

                <div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 "><div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 "><p class="title_text"><font color="#555555">NOTICE</font></p>

                </div>
                    <form id="boardWriteForm" name="" action="/exec/front/Board/write/4" method="post" target="_self" enctype="multipart/form-data">
                        <input id="board_no" name="board_no" value="4" type="hidden">
                        <div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
                            <div class="ec-base-table typeWrite ">
                                <table border="1" summary="">
                                    <caption>글쓰기 폼</caption>
                                    <colgroup>
                                        <col style="width:130px;">
                                        <col style="width:auto;">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">제목</th>
                                        <td> <input id="subject" name="subject" fw-filter="isFill" fw-label="제목" fw-msg="" class="inputTypeText" placeholder="" maxlength="125" value="" type="text">  </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">작성자</th>
                                        <td> </td>
                                    </tr>
                                    <tr style="
    border-bottom: 1px solid #dfdfdf;
">
                                        <th scope="row">작성일</th>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" class="clear">

                                            <!-- CSS -->



                                            <!-- HTML -->
                                            <textarea style="width: 96%; border: none;" name="content" id="content" class="ec-fr-never-be-duplicated"></textarea>
                                            <input type="hidden" id="content_hidden" fw-filter="isSimplexEditorFill" fw-label="내용" value="EC_FROALA_INSTANCE">

                                            <!-- JavaScript -->
                                            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2306011209"></script>
                                            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2306011209"></script>
                                            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2306011209"></script>

                                            <!-- Run Froala Script -->
                                        </td>
                                    </tr>

                                    </tbody>


                                </table>
                            </div>
                            <div class="ec-base-button">
            <span class="gLeft">

                <a href="/board/review/4/" class="btn_ccc">목록</a>
            </span>
                                <span class="gRight">
                <a href="#none" onclick="BOARD_WRITE.form_submit('boardWriteForm');" class="btn_000">등록</a>
            </span>
                            </div>
                        </div>
                    </form></div>

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