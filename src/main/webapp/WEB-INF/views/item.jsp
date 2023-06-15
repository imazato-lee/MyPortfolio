<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/15
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/item.css"/>'>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<div id="contents_wrap" style="">
    <div id="container">
        <div id="contents">
            <div id="Detail_wrap">
                <!-- 상단 제품 정보  -->
                <div class="xans-element- xans-product xans-product-detail">
                    <!-- 이미지 영역 -->
                    <div class="xans-element- xans-product xans-product-image imgArea">
                        <div class="thumbnail">
                            <img src="//ecudemo97964.cafe24.com/web/product/big/201806/16_shop1_15297539878515.jpg" alt="SAMPLE PRODUCT" class="BigImage thmubs">
                        </div>
                    </div>
                    <!-- //이미지 영역 -->
                    <div class="detailArea">
                        <!-- 상세정보 내역 -->
                        <div class="infoArea">
                            <div class="xans-element- xans-product xans-product-detaildesign">
                                <table border="1" summary="">
                                    <caption>
                                        기본 정보
                                    </caption>
                                    <tbody>
                                    <tr class="xans-record-">
                                        <td>
                                            <span style="font-size: 14px; color: #000000">SAMPLE PRODUCT</span><br><br>
                                        </td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td>
                              <pre><span style="font-size:12px;color:#000000;">
                                  오버한 핏의 베이직 니트입니다.
                                  성별 상관없이 입을 수 있는 프리 사이즈로 제작되었고,
                                  우측 소매에 새겨진 자수는 니트를 좀 더 위트있게 연출해주네요.
                                  바바리 코트와 함께 착용했을 때 좀 더 무드있게 느껴졌고,
                                  보풀이 거의 일어나지 않는 제품이기 때문에 데일리로 착용하시기에도 좋습니다.

                                  FABRIC : 폴리65% 레이온31% 스판4%
                                  SIZE : 총장 75 | 어깨 45 | 가슴 49 | 팔길이 55</span></pre>
                                        </td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td>
                                            <span style="font-size: 14px; color: #000000"><strong id="span_product_price_text">78,000</strong><input id="product_price" name="product_price" value="" type="hidden"></span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- //상세정보 내역 -->

                            <div id="totalProducts" class="quantity_wrap">
                                <div class="displaynone">
                                    <ul>
                                        <li>
                            <span class="quantity">
                              <input id="quantity" name="quantity_name" style="" value="0" type="text"><a href="#none"><img src="/web/upload/detail_qty_up.jpg" alt="QTY증가" class="QuantityUp up"></a>
                              <a href="#"><img src="<c:url value="/images/sample_page.jpg"/>" alt="QTY감소" class="QuantityDown down"></a>
                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <table border="1" summary="" class="xans-element- xans-product xans-product-option xans-record-">
                                <caption>
                                    상품 옵션
                                </caption>
                                <tbody></tbody>
                                <tbody class="xans-element- xans-product xans-product-option xans-record-">
                                <tr>
                                    <td>
                                        <ul option_product_no="16" option_select_element="ec-option-select-finder" option_sort_no="1" option_type="T" item_listing_type="S" option_title="COLOR" product_type="product_option" product_option_area="product_option_16_0" option_style="button" ec-dev-id="product_option_id1" ec-dev-name="option1" ec-dev-class="ProductOption0" class="ec-product-button" required="true">
                                            <li class="" option_value="Beige" link_image="" title="Beige">
                                                <a href="#none"><span>Beige</span></a>
                                            </li>
                                            <li class="" option_value="Grey" link_image="" title="Grey">
                                                <a href="#none"><span>Grey</span></a>
                                            </li>
                                        </ul>
                                        <select required="true" product_option_area_select="product_option_16_0" id="product_option_id1" name="option1" option_title="COLOR" option_type="T" item_listing_type="S" class="ProductOption0 displaynone">
                                            <option value="*">empty</option>
                                            <option value="Beige">Beige</option>
                                            <option value="Grey">Grey</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody>
                                <tr class="displaynone" id="">
                                    <td class="selectButton">
                                        <a href="#" onclick=""><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_manual_select.gif" alt="옵션 선택"></a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <div id="totalProducts" class=" ">
                                <table border="1" summary="">
                                    <caption>
                                        상품 목록
                                    </caption>
                                    <colgroup>
                                        <col style="width: 200px">
                                        <col style="width: 50px">
                                        <col style="width: 100px">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">PRODUCT</th>
                                        <th scope="col">상품수</th>
                                        <th scope="col">가격</th>
                                    </tr>
                                    </thead>
                                    <!-- 참고 : 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다.-->
                                    <tbody>
                                    <!-- tr>
              <td>
              <p class="product">
              $상품명<br />
              <span>$옵션</span>
              </p>
              </td>
              <td>
              <span class="quantity">
              <input type="text" class="quantity_opt" />
              &nbsp;<a href="#none"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="QTY증가" class="up" /></a>
              <a href="#none"><img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="QTY감소" class="down" /></a>
              </span>
              <a href="#none"><img src="https://img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
              </td>
              <td class="right">
              <span>$가격</span>
              <span class="mileage">(<img src="https://img.echosting.cafe24.com/design/skin/admin/ko_KR/product/ico_pay_point.gif" /> &nbsp;<span class="mileage_price">$적립금</span>)</span>
              </td>
              </tr -->
                                    </tbody>
                                </table>
                            </div>

                            <div class="xans-element- xans-product xans-product-action">
                                <p class="btn_sold displaynone">OUT OF STOCK</p>
                                <a href="#none" class="first" onclick="product_submit(1, '/exec/front/order/basket/', this)">BUY</a>
                                <a href="#none" class="" onclick="product_submit(2, '/exec/front/order/basket/', this)">CART</a>
                                <a href="#none" onclick="add_wishlist_nologin('/member/login.html');" class="">WISH</a>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- //상단 제품 정보 -->

                <div class="xans-element- xans-product xans-product-additional">
                    <!-- 상품상세정보 -->
                    <div id="prdDetail">
                        <div class="cont">
                            <img src="/img/sample_page.jpg">
                        </div>
                    </div>
                    <div id="prdRelated" class="xans-element- xans-product xans-product-relation xans-record-">
                        <div class="relation">
                            <div class="xans-element- xans-product xans-product-relationlist">
                                <h2>RELATED PRODUCTS</h2>
                                <ul class="prdList">
                                    <li class="item xans-record-">
                                        <div class="box">
                                            <ul>
                                                <li>
                                                    <a href="/product/sample-product/13/category/28/display/1/"><img src="//ecudemo97964.cafe24.com/web/product/small/201806/13_shop1_15297539449315.jpg" alt="SAMPLE PRODUCT" class="thumb"></a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <a href="/product/sample-product/13/category/28/display/1/">SAMPLE PRODUCT</a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li class="">78,000</li>
                                                <li class="salePrice displaynone">78,000</li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="item xans-record-">
                                        <div class="box">
                                            <ul>
                                                <li>
                                                    <a href="/product/sample-product/14/category/28/display/1/"><img src="//ecudemo97964.cafe24.com/web/product/small/201806/14_shop1_15297539612594.jpg" alt="SAMPLE PRODUCT" class="thumb"></a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <a href="/product/sample-product/14/category/28/display/1/">SAMPLE PRODUCT</a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li class="">78,000</li>
                                                <li class="salePrice displaynone">78,000</li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 상품사용후기 -->
                    <div id="prdReview" class="ec-base-tab grid5">
                        <div class="board">
                            <div class="board_top text-base-button">
                                <ul>
                                    <li class="left">REVIEW</li>
                                    <li class="right">
                                        <a href="/board/product/write.html?board_no=4&amp;product_no=16&amp;cate_no=25&amp;display_group=1" class="btn_ccc">후기작성</a>
                                        <a href="/board/product/list.html?board_no=4" class="btn_ccc">모두보기</a>
                                    </li>
                                </ul>
                            </div>

                            <p class="nodata">게시물이 없습니다</p>
                        </div>
                    </div>
                    <!-- //상품사용후기 -->
                    <!-- 상품 Q&A -->
                    <div id="prdQnA" class="ec-base-tab grid5">
                        <div class="board">
                            <div class="board_top text-base-button">
                                <ul>
                                    <li class="left">Q&amp;A</li>
                                    <li class="right">
                                        <a href="/board/product/write.html?board_no=6&amp;product_no=16&amp;cate_no=25&amp;display_group=1" class="btn_ccc">문의작성</a>
                                        <a href="/board/product/list.html?board_no=6" class="btn_ccc">모두보기</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="xans-element- xans-product xans-product-qna">
                                <a name="use_qna"></a>
                                <p class="noAccess displaynone">
                                    글읽기 권한이 없습니다.
                                </p>

                                <div class="ec-base-table typeList gBorder">
                                    <table border="1" summary="" class="">
                                        <caption>
                                            상품 Q&amp;A
                                        </caption>
                                        <colgroup>
                                            <col style="width: 70px">
                                            <col style="width: auto">
                                            <col style="width: 100px">
                                            <col style="width: 100px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="col">NO</th>
                                            <th scope="col">TITLE</th>
                                            <th scope="col">POSTED BY</th>
                                            <th scope="col">DATE</th>
                                        </tr>
                                        </thead>
                                        <tbody class="center">
                                        <tr class="xans-record-">
                                            <td>1</td>
                                            <td class="subject left txtBreak">
                                                <a href="/article/qa/6/6/?no=6&amp;board_no=6&amp;spread_flag=T">상품문의</a>
                                                <span class="txtWarn"></span>
                                            </td>
                                            <td>환이</td>
                                            <td class="txtInfo txt11">2018-06-24</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="xans-element- xans-product xans-product-qnapaging ec-base-paginate1 typeSub">
                                <a href="#none" class="border">&lt;&lt;</a>
                                <a href="#none" class="border">&lt;</a>
                                <ol>
                                    <li class="xans-record-">
                                        <a href="?page_6=1#use_qna" class="this">1</a>
                                    </li>
                                </ol>
                                <a href="#none" class="border">&gt;</a>
                                <a href="#none" class="border">&gt;&gt;</a>
                            </div>
                        </div>
                    </div>
                    <!-- //상품Q&A -->
                </div>
            </div>
        </div>
    </div>

    <div id="footer_title">Simple and Basic Market</div>

    <div id="footer">
        <div class="xans-element- xans-layout xans-layout-footer footer">
            <ul class="xans-element- xans-layout xans-layout-info footer_cs">
                <li>
                <pre>070-0000-0000　Mon-Fri: 11am-6pm　Sat.Sun.Holiday OFF
    NH 351-0894-7969-53　Account holder : ID5AGIT</pre>
                </li>
            </ul>
            <ul class="sns_list">
                <a href="#" target="blank_">Instagram</a>
            </ul>
            <form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data">
                <input id="banner_action" name="banner_action" value="" type="hidden">
                <ul class="xans-element- xans-layout xans-layout-searchheader">
                    <li>
                        <!--
          $product_page=/product/detail.html
          $category_page=/product/list.html
          -->
                        <fieldset>
                            <legend>검색</legend>
                            <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="Search" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"><input type="image" src="/web/upload/ico_search.png" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
                            &nbsp;
                        </fieldset>
                    </li>
                </ul>
            </form>
            <ul class="shop_info">
                Company: ID5AGIT . Ceo Cpo : Haninsuk . Address : 615-1, Daemyeong
                1-dong, Nam-gu, Daegu, Korea . Business license : 000-0000-0000 .
                Online business license : 0000-서울서초-0000<br><a href="/member/agreement.html">Agreement</a>　<a href="/shopinfo/guide.html">Guide</a>　<a href="/member/privacy.html">Privacy</a>
            </ul>
        </div>
    </div>
</div>



<%@ include file="includes/footer.jsp"%>