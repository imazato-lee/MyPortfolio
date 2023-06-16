
<%-- Created by IntelliJ IDEA. User: sehyeon Date: 2023/06/15 Time: 10:20 PM To
change this template use File | Settings | File Templates. --%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/item.css"/>' />
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
                            <img
                                    src="//ecudemo97964.cafe24.com/web/product/big/201806/16_shop1_15297539878515.jpg"
                                    alt="SAMPLE PRODUCT"
                                    class="BigImage thmubs"
                            />
                            <!-- 실제 사진 들어가야함  -->
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
                        <span style="font-size: 14px; color: #000000">
                          <!-- SAMPLE PRODUCT -->
                          ${itemDto.itemName} </span
                        ><br /><br />
                                        </td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td>
                        <pre><span style="font-size:12px;color:#000000;">
                                  <!-- 오버한 핏의 베이직 니트입니다.
                                  성별 상관없이 입을 수 있는 프리 사이즈로 제작되었고,
                                  우측 소매에 새겨진 자수는 니트를 좀 더 위트있게 연출해주네요.
                                  바바리 코트와 함께 착용했을 때 좀 더 무드있게 느껴졌고,
                                  보풀이 거의 일어나지 않는 제품이기 때문에 데일리로 착용하시기에도 좋습니다.

                                  FABRIC : 폴리65% 레이온31% 스판4%
                                  SIZE : 총장 75 | 어깨 45 | 가슴 49 | 팔길이 55 -->
                                  ${itemDto.itemContent}
                                </span></pre>
                                        </td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td>
                        <span style="font-size: 14px; color: #000000"
                        ><strong id="span_product_price_text">
                            <!-- 78,000 -->
                            <fmt:formatNumber
                                    value="${itemDto.itemPrice}"
                                    pattern="##,###"
                            />
                          </strong>
                          <input
                                  id="product_price"
                                  name="product_price"
                                  value=""
                                  type="hidden"
                          /></span>
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
                        <input
                                id="quantity"
                                name="quantity_name"
                                style=""
                                value="0"
                                type="text"
                        /><a href="#"
                      ><img
                              src="<c:url value='/images/detail_qty_up.jpg'/>"
                              alt="QTY증가"
                              class="QuantityUp up"
                      /></a>
                        <a href="#"
                        ><img
                                src="<c:url value='/images/detail_qty_down.jpg'/>"
                                alt="QTY감소"
                                class="QuantityDown down"
                        /></a>
                      </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <table
                                    border="1"
                                    summary=""
                                    class="xans-element- xans-product xans-product-option xans-record-"
                            >
                                <caption>
                                    상품 옵션
                                </caption>
                                <tbody></tbody>
                                <tbody
                                        class="xans-element- xans-product xans-product-option xans-record-"
                                >
                                <tr>
                                    <td>
                                        <ul
                                                option_product_no="16"
                                                option_select_element="ec-option-select-finder"
                                                option_sort_no="1"
                                                option_type="T"
                                                item_listing_type="S"
                                                option_title="COLOR"
                                                product_type="product_option"
                                                product_option_area="product_option_16_0"
                                                option_style="button"
                                                ec-dev-id="product_option_id1"
                                                ec-dev-name="option1"
                                                ec-dev-class="ProductOption0"
                                                class="ec-product-button"
                                                required="true"
                                        >
                                            <li
                                                    class=""
                                                    option_value="Beige"
                                                    link_image=""
                                                    title="Beige"
                                            >
                                                <a href="#"><span>Beige</span></a>
                                            </li>
                                            <li
                                                    class=""
                                                    option_value="Grey"
                                                    link_image=""
                                                    title="Grey"
                                            >
                                                <a href="#"><span>Grey</span></a>
                                            </li>
                                        </ul>
                                        <select
                                                required="true"
                                                product_option_area_select="product_option_16_0"
                                                id="product_option_id1"
                                                name="option1"
                                                option_title="COLOR"
                                                option_type="T"
                                                item_listing_type="S"
                                                class="ProductOption0 displaynone"
                                        >
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
                                        <a href="#" onclick=""
                                        ><img
                                                src="<c:url value='/images/btn_manual_select.gif'/>"
                                                alt="옵션 선택"
                                        /></a>
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
                                        <col style="width: 200px" />
                                        <col style="width: 50px" />
                                        <col style="width: 100px" />
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">PRODUCT</th>
                                        <th scope="col">상품수</th>
                                        <th scope="col">가격</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>

                            <div class="xans-element- xans-product xans-product-action">
                                <c:choose>
                                    <c:when test="${itemDto.itemStock == null || itemDto.itemStock eq 0}">
                                        <p class="btn_sold">OUT OF STOCK</p>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="#" class="first" onclick="">BUY</a>
                                        <a href="#" class="" onclick="">CART</a>
                                        <a href="#" onclick="" class="">WISH</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //상단 제품 정보 -->

                <div class="xans-element- xans-product xans-product-additional">
                    <!-- 상품상세정보 -->
                    <div id="prdDetail">
                        <div class="cont">
                            <img src="<c:url value='/images/sample_page.jpg'/>" />
                        </div>
                    </div>
                    <div
                            id="prdRelated"
                            class="xans-element- xans-product xans-product-relation xans-record-"
                    >
                        <div class="relation">
                            <div class="xans-element- xans-product xans-product-relationlist">
                                <h2>RELATED PRODUCTS</h2>
                                <ul class="prdList">
                                    <li class="item xans-record-">
                                        <div class="box">
                                            <ul>
                                                <li>
                                                    <a
                                                            href="/product/sample-product/13/category/28/display/1/"
                                                    ><img
                                                            src="<c:url value='/images/sample_bg1.jpg'/>"
                                                            alt="SAMPLE PRODUCT"
                                                            class="thumb"
                                                    /></a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <a
                                                            href="/product/sample-product/13/category/28/display/1/"
                                                    >SAMPLE PRODUCT</a
                                                    >
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
                                                    <a
                                                            href="/product/sample-product/14/category/28/display/1/"
                                                    ><img
                                                            src="<c:url value='/images/sample_bg3.jpg'/>"
                                                            alt="SAMPLE PRODUCT"
                                                            class="thumb"
                                                    /></a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <a
                                                            href="/product/sample-product/14/category/28/display/1/"
                                                    >SAMPLE PRODUCT</a
                                                    >
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
                                        <a
                                                href="/board/product/write.html?board_no=4&amp;product_no=16&amp;cate_no=25&amp;display_group=1"
                                                class="btn_ccc"
                                        >후기작성</a
                                        >
                                        <a
                                                href="/board/product/list.html?board_no=4"
                                                class="btn_ccc"
                                        >모두보기</a
                                        >
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
                                        <a
                                                href="/board/product/write.html?board_no=6&amp;product_no=16&amp;cate_no=25&amp;display_group=1"
                                                class="btn_ccc"
                                        >문의작성</a
                                        >
                                        <a
                                                href="/board/product/list.html?board_no=6"
                                                class="btn_ccc"
                                        >모두보기</a
                                        >
                                    </li>
                                </ul>
                            </div>

                            <div class="xans-element- xans-product xans-product-qna">
                                <a name="use_qna"></a>
                                <p class="noAccess displaynone">글읽기 권한이 없습니다.</p>

                                <div class="ec-base-table typeList gBorder">
                                    <table border="1" summary="" class="">
                                        <caption>
                                            상품 Q&amp;A
                                        </caption>
                                        <colgroup>
                                            <col style="width: 70px" />
                                            <col style="width: auto" />
                                            <col style="width: 100px" />
                                            <col style="width: 100px" />
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
                                                <a
                                                        href="/article/qa/6/6/?no=6&amp;board_no=6&amp;spread_flag=T"
                                                >상품문의</a
                                                >
                                                <span class="txtWarn"></span>
                                            </td>
                                            <td>환이</td>
                                            <td class="txtInfo txt11">2018-06-24</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div
                                    class="xans-element- xans-product xans-product-qnapaging ec-base-paginate1 typeSub"
                            >
                                <a href="#" class="border">&lt;&lt;</a>
                                <a href="#" class="border">&lt;</a>
                                <ol>
                                    <li class="xans-record-">
                                        <a href="?page_6=1#use_qna" class="this">1</a>
                                    </li>
                                </ol>
                                <a href="#" class="border">&gt;</a>
                                <a href="#" class="border">&gt;&gt;</a>
                            </div>
                        </div>
                    </div>
                    <!-- //상품Q&A -->
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includes/footer.jsp"%>
