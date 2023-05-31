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
    <link rel="stylesheet" href="<c:url value='/css/myShop/firstPage.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Document</title>
</head>
<script>
    $(document).ready(function() {
        var msg = "${msg}";
        if (msg !== "" && msg !== null) {
            if(msg === 'LOG_OK'){
                alert("성공적으로 로그인하였습니다.")
            }
        }
    });
</script>
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
        </ul><ul class="membership_list"><li class="xans-element- xans-layout xans-layout-statelogoff ">
            <c:choose>
                <c:when test="${not empty sessionScope.id}">
                    <a href="<c:url value='user/logout'/>">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='user/login'/>">Log-in</a>
                </c:otherwise>
            </c:choose>
<%--            <a href='<c:url value="user/login"/>'>Log-in</a>--%>
        </li>
            <li class="xans-element- xans-layout xans-layout-statelogoff "><a href="<c:url value='user/register'/>">Register</a>
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

                <style>
                    html {position: relative; height: 100%;}
                    body {position: relative; height: 100%; overflow:hidden;}
                </style>

                <link rel="stylesheet" href="#">
                <ul id="menu">
                    <li data-menuanchor="firstPage" class="active">
                        <a href="#firstPage">1</a>
                    </li>
                    <li data-menuanchor="secondPage" class="">
                        <a href="#secondPage">2</a>
                    </li>
                    <li data-menuanchor="3rdPage" class="">
                        <a href="#3rdPage">3</a>
                    </li>
                </ul>
                <div class="main_img">
                    <div id="fullpage" class=" fullpage-wrapper" style="height: 100%; position: relative; touch-action: none; transform: translate3d(0px, 0px, 0px); transition: all 700ms ease 0s;">
                        <div class="section fp-section active" data-anchor="firstPage">
                            <img src="./images/sample_bg1.jpg" height="300px;">
                        </div>
                        <div class="section fp-section" data-anchor="secondPage"><img src="./images/sample_bg2.jpeg" height="300px;"></div>
                        <div class="section fp-section" data-anchor="3rdPage"><img src="./images/sample_bg3.jpg" height="300px;"></div>

                    </div>
                </div>

                <script>
                    $(document).ready(function() {
                        var currentSection = 0;
                        var totalSections = $('.section').length;

                        function goToSection(index) {
                            if (index >= 0 && index < totalSections) {
                                currentSection = index;
                                var offset = -currentSection * $(window).height();
                                $('#fullpage').css('transform', 'translate3d(0, ' + offset + 'px, 0)');

                                // 메뉴 활성화 상태 변경
                                $('#menu li').removeClass('active');
                                $('#menu li[data-menuanchor="section' + (currentSection + 1) + '"]').addClass('active');
                            }
                        }

                        $(window).on('wheel', function(e) {
                            e.preventDefault();
                            var delta = e.originalEvent.deltaY;
                            if (delta > 0) {
                                goToSection(currentSection + 1);
                            } else {
                                goToSection(currentSection - 1);
                            }
                        });

                        // 메뉴 항목 클릭 시 해당 섹션으로 이동
                        $('#menu li a').on('click', function(e) {
                            e.preventDefault();
                            console.log('Clicked!');
                            var targetSection = $(this).parent().data('menuanchor');
                            var index = $('[data-anchor="' + targetSection + '"]').index();
                            goToSection(index);
                        });

// 스크롤 이벤트에 따른 메뉴 스타일 변경
                        $(window).on('scroll', { passive: false }, function(e) {
                            e.preventDefault(); // preventDefault를 추가하여 스크롤 이벤트의 기본 동작을 막음

                            var scrollTop = $(this).scrollTop();
                            var windowHeight = $(this).height();

                            var activeSectionId = '';
                            $('[data-anchor]').each(function() {
                                var sectionId = $(this).data('anchor');
                                var sectionOffset = $(this).offset().top;

                                if (scrollTop >= sectionOffset - windowHeight / 2 && scrollTop < sectionOffset + windowHeight / 2) {
                                    activeSectionId = sectionId;
                                    return false; // 해당 섹션을 찾았으므로 반복문을 종료함
                                }
                            });

                            if (activeSectionId !== '') {
                                $('#menu li').removeClass('active'); // 모든 메뉴 항목에서 active 클래스 제거
                                $('#menu li[data-menuanchor="' + activeSectionId + '"]').addClass('active'); // 해당 섹션에 대한 메뉴 항목에 active 클래스 추가
                            }
                        });
                    });
                </script>
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
