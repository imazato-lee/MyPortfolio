<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="footer_title">아직이름을 못정했어요</div>

<div id="footer">
    <div class="xans-element- xans-layout xans-layout-footer footer "><ul class="xans-element- xans-layout xans-layout-info footer_cs "><li><pre>070-0000-0000　Mon-Fri: 11am-6pm　Sat.Sun.Holiday OFF
    NH 351-0894-7969-53　Account holder : ID5AGIT</pre></li>
    </ul>
        <ul class="sns_list">
            <a href="#" target="blank_">Instagram</a>
        </ul>
        <form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data">
            <input id="banner_action" name="banner_action" value="" type="hidden">
            <ul class="xans-element- xans-layout xans-layout-searchheader ">
                <li>

                    <fieldset>
                        <legend>검색</legend>
                        <input id="keyword" name="keyword" class="inputTypeText" placeholder="Search" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text">
                        <input type="image" src="<c:url value='/images/ico_search.png'/>" width="15px" height="15px" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">&nbsp;
                    </fieldset>
                </li>
            </ul>
        </form>
        <ul class="shop_info">
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
                <ul>
                    <li class="company_title">
                        <pre>
                            <!-- 타이틀명 시작 -->
                            Creative Design Market
                            ID5AGIT
                            <!-- 타이틀명 끝 -->
                        </pre>
                        <p class="line">&nbsp;</p>
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
                </ul>
            </div>
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