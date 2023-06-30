<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/30
  Time: 9:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/cartList.css"/>'>

<div id="contents_wrap" style="">
    <div id="container">
        <div id="contents">
            <div class="titleArea">
                <h2>CART</h2>
            </div>
            <!-- 장바구니 모듈 Package -->
            <div class="xans-element- xans-order xans-order-basketpackage">
                <!-- 장바구니 비어있을 때 -->
                <div class="xans-element- xans-order xans-order-empty ">
                    <p>장바구니가 비어 있습니다.</p>
                </div>
                <!-- 일반상품 -->
                <div class="orderListArea ec-base-table typeList gBorder">
                    <!-- 일반상품 (기본배송) -->
                    <table border="1" summary="" class="xans-element- xans-order xans-order-normnormal xans-record-">
                        <caption>
                            기본배송
                        </caption>
                        <colgroup>
                            <col style="width: 27px" />
                            <col style="width: 92px" />
                            <col style="width: auto" />
                            <col style="width: 100px" />
                            <col style="width: 70px" />
                            <col style="width: 70px" />
                            <col style="width: 70px" />
                            <col style="width: 100px" />
                            <col style="width: 110px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">
                                    <input type="checkbox" onclick=""/>
                                </th>
                                <th scope="col">IMAGE</th>
                                <th scope="col">PRODUCT</th>
                                <th scope="col">PRICE</th>
                                <th scope="col">QTY</th>
                                <th scope="col">DELIVERY</th>
                                <th scope="col">CHARGE</th>
                                <th scope="col">TOTAL</th>
                                <th scope="col">CHOICE</th>
                            </tr>
                        </thead>
                        <tfoot class="right">
                            <tr>
                                <td colspan="9">
                                    <span class="gLeft">[기본배송]</span> 상품구매금액 468,000 <span class="displaynone">()</span> + 배송비 0
                                    (무료)<span class="displaynone"> </span><span class="displaynone"> - 상품할인금액 0 </span> =
                                    합계 : <span class="txtEm gIndent10">468,000</span>
                                </td>
                            </tr>
                        </tfoot>
                        <tbody class="xans-element- xans-order xans-order-list center">
                            <tr class="xans-record-">
                                <td>
                                    <input type="checkbox" id="basket_chk_id_0" name="basket_product_normal_type_normal"/>
                                </td>
                                <td class="thumb gClearLine">
                                    <a href="#">
                                        <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/13_shop1_15297539449315.jpg"/>
                                    </a>
                                </td>
                                <td class="left gClearLine">
                                    <a href="#">SAMPLE PRODUCT</a>
                                </td>
                                <td class="center">
                                    <div class="">
                                        78,000
                                        <p class="displaynone"></p>
                                    </div>
                                    <%-- 할인용 --%>
                                    <div class="displaynone">
                                        78,000
                                        <p class="displaynone"></p>
                                    </div>
                                </td>
                                <td>
                                    <span class="">
                                        <span class="ec-base-qty">
                                            <input id="quantity_id_0" name="quantity_name_0" size="2" value="3" type="text" />
                                            <a href="#" onclick="">
                                                <img src="https://img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가" class="up" />
                                            </a>
                                            <a href="#" onclick="">
                                                <img src="https://img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소" class="down" />
                                            </a>
                                        </span>
                                        <a href="#" onclick="">
                                            <img src="<c:url value='/images/edit_btn.gif'/>" alt="변경"/>
                                        </a>
                                    </span>
                                </td>
                                <td>
                                    <div class="txtInfo">기본배송<br /></div>
                                </td>
                                <td rowspan="1" class="">
                                    <p class="displaynone">
                                        0<span class="displaynone"><br/></span><br/>
                                    </p>
                                    무료
                                </td>
                                <td class="center">
                                    234,000
                                    <div class="displaynone"></div>
                                </td>
                                <td class="button">
                                    <a href="#" class="btn_ccc_86">BUY NOW</a>
                                    <a href="#" class="btn_ccc_86">DELETE</a>
                                </td>
                            </tr>
                            <tr class="xans-record-">
                                <td>
                                    <input type="checkbox" id="basket_chk_id_1" name="basket_product_normal_type_normal"/>
                                </td>
                                <td class="thumb gClearLine">
                                    <a href="#">
                                        <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/16_shop1_15297539878515.jpg"/>
                                    </a>
                                </td>
                                <td class="left gClearLine">
                                    <a href="#">SAMPLE PRODUCT</a>
                                    <ul class="xans-element- xans-order xans-order-optionall option">
                                        <li class="xans-record-">
                                            <strong class="displaynone">SAMPLE PRODUCT</strong>[옵션: Beige] <br/>
                                        </li>
                                    </ul>
                                </td>
                                <td class="center">
                                    <div class="">
                                        78,000
                                        <p class="displaynone"></p>
                                    </div>
                                    <div class="displaynone">
                                        78,000
                                        <p class="displaynone"></p>
                                    </div>
                                </td>
                                <td>
                                    <span class="">
                                        <span class="ec-base-qty">
                                            <input id="quantity_id_1" name="quantity_name_1" size="2" value="2" type="text" />
                                            <a href="#">
                                                <img src="https://img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가" class="up" />
                                            </a>
                                            <a href="#">
                                                <img src="https://img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소" class="down" />
                                            </a>
                                        </span>
                                        <a href="#">
                                          <img src="<c:url value='/images/edit_btn.gif'/>" alt="변경"/>
                                        </a>
                                    </span>
                                </td>
                                <td>
                                    <div class="txtInfo">기본배송<br/></div>
                                </td>
                                <td rowspan="1" class="">
                                    <p class="displaynone">
                                        0<span class="displaynone"><br/></span><br/>
                                    </p>
                                    무료
                                </td>
                                <td class="center">
                                    156,000
                                    <div class="displaynone"></div>
                                </td>
                                <td class="button">
                                    <a href="#" class="btn_ccc_86">BUY NOW</a>
                                    <a href="#" class="btn_ccc_86">DELETE</a>
                                </td>
                            </tr>
                            <tr class="xans-record-">
                                <td>
                                    <input type="checkbox" id="basket_chk_id_2" name="basket_product_normal_type_normal"/>
                                </td>
                                <td class="thumb gClearLine">
                                    <a href="#">
                                        <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/15_shop1_15297539710464.jpg"/>
                                    </a>
                                </td>
                                <td class="left gClearLine">
                                    <a href="#">SAMPLE PRODUCT</a>
                                    <ul class="xans-element- xans-order xans-order-optionall option">
                                        <li class="xans-record-">
                                            <strong class="displaynone">SAMPLE PRODUCT</strong>[옵션: One color] <br/>
                                        </li>
                                    </ul>
                                </td>
                                <td class="center">
                                    <div class="">
                                        78,000
                                        <p class="displaynone"></p>
                                    </div>
                                    <div class="displaynone">
                                        78,000
                                        <p class="displaynone"></p>
                                    </div>
                                </td>
                                <td>
                                    <span class="">
                                        <span class="ec-base-qty">
                                            <input id="quantity_id_2" name="quantity_name_2" size="2" value="1" type="text" />
                                            <a href="#">
                                                <img src="https://img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif" alt="수량증가" class="up" />
                                            </a>
                                            <a href="#">
                                                <img src="https://img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif" alt="수량감소" class="down" />
                                            </a>
                                        </span>
                                        <a href="#">
                                            <img src="<c:url value='/images/edit_btn.gif'/>" alt="변경"/>
                                        </a>
                                    </span>
                                    <span class="displaynone">1</span>
                                </td>
                                <td>
                                    <div class="txtInfo">기본배송<br/></div>
                                </td>
                                <td rowspan="1" class="">
                                    <p class="displaynone">
                                        0<span class="displaynone"><br/></span><br/>
                                    </p>
                                    무료
                                </td>
                                <td class="center">
                                    78,000
                                    <div class="displaynone"></div>
                                </td>
                                <td class="button">
                                    <a href="#" class="btn_ccc_86">BUY NOW</a>
                                    <a href="#" class="btn_ccc_86">DELETE</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="xans-element- xans-order xans-order-selectorder ec-base-button">
                    <span class="gLeft">
                        <strong class="text">선택상품을</strong>
                        <a href="#" class="btn_ccc_80">삭제하기</a>
                    </span>
                    <span class="gRight">
                        <a href="#" class="btn_ccc_100">장바구니 비우기</a>
                    </span>
                </div>
                <!-- 총 주문금액 : 국내배송상품 -->
                <div class="xans-element- xans-order xans-order-totalsummary ec-base-table typeList gBorder total">
                    <table border="1" summary="">
                        <caption>
                            총 주문금액
                        </caption>
                        <colgroup>
                            <col style="width: 23%" />
                            <col style="width: 24%" />
                            <col style="width: 23%" class="displaynone" />
                            <col style="width: auto" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">
                                    <strong>총 상품금액</strong>
                                </th>
                                <th scope="col"><strong>총 배송비</strong></th>
                                <th scope="col" class="displaynone">
                                    <strong>총 할인금액</strong>
                                    <a href="#" class="btn_ccc_80">내역보기</a>
                                </th>
                                <th scope="col"><strong>결제예정금액</strong></th>
                            </tr>
                        </thead>
                        <tbody class="center">
                            <tr>
                                <td class="txt23">
                                    <div class="box">
                                        <span>
                                            <span class="total_product_price_display_front">468,000</span>
                                        </span>
                                        <span class="displaynone">
                                            <span class="total_product_price_display_back"></span>
                                        </span>
                                    </div>
                                </td>
                                <td class="txt23">
                                    <div class="box shipping">
                                        +<span>
                                            <span class="total_delv_price_front">0</span>
                                        </span>
                                        <span class="displaynone">
                                            <span class="total_delv_price_back"></span>
                                        </span>
                                        <div class="shippingArea displaynone">
                                            (<span></span>
                                            <div class="shippingFee">
                                                <a href="#" class="button" id="">
                                                    <img src="https://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_details.gif" alt="자세히보기" />
                                                </a>)
                                                <div class="ec-base-tooltip" style="display: none">
                                                    <h3>배송비할인</h3>
                                                    <div class="content">
                                                        <h4></h4>
                                                        <table border="1" summary="">
                                                            <caption>
                                                                배송비 할인 이벤트 정보
                                                            </caption>
                                                            <tbody>
                                                                <tr>
                                                                    <th scope="row">혜택</th>
                                                                    <td>
                                                                        <strong class="txtEm"></strong>
                                                                        <p></p>
                                                                    </td>
                                                                </tr>
                                                                <tr class="displaynone">
                                                                    <th scope="row">기간</th>
                                                                    <td>
                                                                        <strong class="txtEm"></strong>
                                                                        <p></p>
                                                                    </td>
                                                                </tr>
                                                                <tr class="displaynone">
                                                                    <th scope="row">대상</th>
                                                                    <td></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <a href="#" class="btnClose">
                                                        <img src="https://img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기"/>
                                                    </a>
                                                    <span class="edge"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="displaynone txt23">
                                    <div class="box">
                                        - <span>0</span> <span class="displaynone"></span>
                                    </div>
                                </td>
                                <td class="txt23">
                                    <div class="box txtEm">
                                        = <span>468,000</span>
                                        <span class="displaynone"></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 주문 버튼 -->
                <div class="xans-element- xans-order xans-order-totalorder ec-base-button justify">
                    <a href="#" class="btn_000_180">전체상품주문</a>
                    <a href="#" class="btn_000_180">선택상품주문</a>
                </div>
            </div>
            <!-- //장바구니 -->
        </div>
    </div>

<%@ include file="includes/footer.jsp"%>