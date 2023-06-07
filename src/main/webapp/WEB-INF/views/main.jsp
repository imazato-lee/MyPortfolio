<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <link rel="stylesheet" href="<c:url value='/css/myShop/firstPage.css'/>">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<body id="contents_wrap">
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
        <div id="footer_title">아직이름을 못정했어요</div>
</body>
</html>