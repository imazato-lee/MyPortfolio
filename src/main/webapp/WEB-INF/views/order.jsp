<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/07/04
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/order.css"/>'>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<div id="contents_wrap" style="">
    <div id="container">
        <div id="contents">
            <div class="titleArea">
                <h2>ORDER</h2>
            </div>

            <form id="frm_order_act" name="frm_order_act" action="" method="post">
                <div class="xans-element- xans-order xans-order-form xans-record-">
                    <!-- 정보 -->
                    <div class="xans-element- xans-order xans-order-dcinfo ec-base-box typeMember">
                        <div class="information">
                            <div class="description">
                                <div class="member">
                                    <p>이세현 님은, [일반회원] 회원이십니다.</p>
                                    <ul class="displaynone">
                                        <li class="displaynone">
                                            <span class="displaynone">0</span> 이상
                                            <span class="displaynone"></span> 구매시
                                            <span></span>을 추가할인 받으실 수 있습니다.
                                            <span class="displaynone">(최대 0)</span>
                                        </li>
                                        <li class="displaynone">
                                            <span class="displaynone"></span> 이상
                                            <span class="displaynone"></span> 구매시
                                            <span></span>을 추가적립 받으실 수 있습니다.
                                            <span class="displaynone">(최대 )</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 국내배송상품 주문내역 -->
                    <div class="orderListArea">
                        <!-- 기본배송 -->
                        <div class="ec-base-table typeList gBorder">
                            <table border="1" summary="">
                                <caption>
                                    기본배송
                                </caption>
                                <colgroup>
                                    <col style="width: 27px" class="" />
                                    <col style="width: 92px" />
                                    <col style="width: auto" />
                                    <col style="width: 98px" />
                                    <col style="width: 85px" />
                                    <col style="width: 98px" />
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col" class="">
                                        <input type="checkbox"/>
                                    </th>
                                    <th scope="col">이미지</th>
                                    <th scope="col">상품정보</th>
                                    <th scope="col">판매가</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">적립금</th>
                                    <th scope="col">합계</th>
                                </tr>
                                </thead>
                                <tfoot class="right">
                                <tr>
                                    <td colspan="7">
                                        <span class="gLeft">[기본배송]</span> 상품구매금액
                                        546,000<span class="displaynone"> (0)</span> +
                                        배송비 <span id="domestic_ship_fee">0 (무료)</span>
                                        <span class="displaynone"> - 상품할인금액 0 </span>
                                        = 합계 :<span id="domestic_ship_fee_sum">546,000</span>
                                        <span class="displaynone"></span>
                                    </td>
                                </tr>
                                </tfoot>
                                <tbody class="xans-element- xans-order xans-order-normallist center">
                                    <tr class="xans-record-">
                                        <td class="">
                                            <input id="chk_order_cancel_list0" name="chk_order_cancel_list_basic0" type="checkbox"/>
                                        </td>
                                        <td class="thumb gClearLine">
                                            <a href="#">
                                                <img src="<c:url value='/images/test2.jpeg'/>">
                                            </a>
                                        </td>
                                        <td class="left gClearLine">
                                            <a href="#">SAMPLE PRODUCT</a>
                                            <div class="option">[옵션: One color]</div>
                                        </td>
                                        <td>
                                            <div class="">
                                                78,000
                                                <p class="displaynone"></p>
                                            </div>
                                        </td>
                                        <td>6</td>
                                        <td><span class="txtInfo">-</span></td>
                                        <td>
                                            468,000
                                            <div class="displaynone"></div>
                                        </td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td class="">
                                            <input id="chk_order_cancel_list1" name="chk_order_cancel_list_basic1" type="checkbox"/>
                                        </td>
                                        <td class="thumb gClearLine">
                                            <a href="#">
                                                <img src="<c:url value='/images/test3.jpeg'/>">
                                            </a>
                                        </td>
                                        <td class="left gClearLine">
                                            <a href="#">SAMPLE PRODUCT</a>
                                            <div class="option">[옵션: Beige]</div>
                                        </td>
                                        <td>
                                            <div class="">
                                                78,000
                                                <p class="displaynone"></p>
                                            </div>
                                        </td>
                                        <td>1</td>
                                        <td><span class="txtInfo">-</span></td>
                                        <td>
                                            78,000
                                            <div class="displaynone"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 선택상품 제어 버튼 -->
                    <div class="ec-base-button">
                        <span class="gLeft">
                        <strong class="text">선택상품을</strong>
                        <a href="#" id="btn_product_delete" class="btn_ccc_100">삭제하기</a>
                        </span>
                    </div>

                    <!-- 배송 정보 -->
                    <div class="orderArea">
                        <div class="title">
                            <h3>배송 정보</h3>
                        </div>
                        <div class="ec-base-table typeWrite">
                            <table border="1" summary="">
                                <caption>
                                    배송 정보 입력
                                </caption>
                                <colgroup>
                                    <col style="width: 180px" />
                                    <col style="width: auto" />
                                </colgroup>

                                <!-- 배송지 정보 -->
                                <tbody class="">
                                    <tr class="">
                                        <th scope="row">배송지 선택</th>
                                        <td>
                                            <div class="address">
                                                <input id="sameaddr0" name="sameaddr" value="M" type="radio" autocomplete="off"/>
                                                <label for="sameaddr0">회원 정보와 동일</label>
                                                <input id="sameaddr1" name="sameaddr" value="F" type="radio" autocomplete="off"/>
                                                <label for="sameaddr1">새로운 배송지</label>
                                                <span class="recent ec-shop-RecentDelivery displaynone">최근 배송지 :</span>
                                                <a href="#" id="btn_shipp_addr" class="btn_ccc_100">주소록보기</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            받으시는 분
                                            <img src="<c:url value='/images/ico_required.gif'/>">
                                        </th>
                                        <td>
                                            <input id="rname" name="rname" class="inputTypeText" placeholder="" size="15" value="" type="text"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            주소
                                            <img src="<c:url value='/images/ico_required.gif'/>">
                                        </th>
                                        <td>
                                            <input id="rzipcode1" name="rzipcode1" class="inputTypeText" size="6" maxlength="6" type="text" readonly="readonly"/>
                                            <a href="#" id="btn_search_rzipcode" class="btn_ccc_100">우편번호</a><br/>
                                            <input id="raddr1" name="raddr1" class="inputTypeText" size="40" value="" type="text" readonly="readonly"/>
                                            <span class="grid">기본주소</span><br/>
                                            <input id="raddr2" name="raddr2" class="inputTypeText" size="40" value="" type="text"/>
                                            <span class="grid">나머지주소</span><span class="grid">(선택입력가능)</span>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">
                                            휴대전화
                                            <span class="">
                                                 <img src="<c:url value='/images/ico_required.gif'/>">
                                            </span>
                                        </th>
                                        <td>
                                            <select id="rphone2_1" name="rphone2_[]">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                            </select>-
                                            <input id="rphone2_2" name="rphone2_[]" maxlength="4" size="4" value="" type="text"/>-
                                            <input id="rphone2_3" name="rphone2_[]" maxlength="4" size="4" value="" type="text"/>
                                        </td>
                                    </tr>
                                </tbody>

                                <!-- 이메일 -->
                                <tbody class="email ec-orderform-emailRow ec-shop-deliverySimpleForm">
                                    <tr>
                                        <th scope="row">
                                            이메일
                                            <img src="<c:url value='/images/ico_required.gif'/>">
                                        </th>
                                        <td>
                                            <input id="oemail1" name="oemail1" class="mailId" value="" type="text"/>@
                                            <input id="oemail2" name="oemail2" class="mailAddress" readonly="readonly" value="" type="text"/>
                                            <select id="oemail3">
                                                <option value="" selected="selected">
                                                    - 이메일 선택 -
                                                </option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="icloud.com">icloud.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="etc">직접입력</option>
                                            </select>
                                            <p class="gBlank5">
                                                이메일을 통해 주문처리과정을 보내드립니다.<br/>이메일
                                                주소란에는 반드시 수신가능한 이메일주소를 입력해
                                                주세요.
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                                <!-- 배송관련 정보 -->
                                <tbody class="delivery">
                                    <tr class="">
                                        <th scope="row">
                                            배송메시지
                                            <span class="displaynone">
                                                 <img src="<c:url value='/images/ico_required.gif'/>">
                                            </span>
                                        </th>
                                        <td>
                                            <textarea id="omessage" name="omessage" maxlength="255" cols="70"></textarea>
                                            <div class="devMessage displaynone">
                                                <label>
                                                    <input id="omessage_autosave0" name="omessage_autosave[]" value="T" type="checkbox" disabled=""/>
                                                    <label for="omessage_autosave0"></label>
                                                    자동저장
                                                </label>
                                                <ul class="gIndent5">
                                                    <li>
                                                        배송메시지란에는 배송시 참고할 사항이 있으면
                                                        적어주십시오.
                                                    </li>
                                                    <li>
                                                        게시글은 비밀글로 저장되며 비밀번호는 주문번호
                                                        뒷자리로 자동 저장됩니다.
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 결제 예정 금액 -->
                    <div class="title">
                        <h3>결제 예정 금액</h3>
                    </div>
                    <div class="totalArea">
                        <div class="ec-base-table typeList gBorder total">
                            <table border="1" summary="">
                                <caption>
                                    결제 예정 금액
                                </caption>
                                <colgroup>
                                    <col style="width: 33.33%" />
                                    <col style="width: 33.33%" class="" />
                                    <col style="width: 33.33%" />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <span>총 주문 금액</span>
                                            <a href="#" class="more btn_ccc_100">내역보기</a>
                                        </th>
                                        <th scope="col" class="">
                                            <span>총 </span>
                                            <span id="total_addsale_text" class="">할인</span>
                                            <span id="plus_mark" class=""> + </span>
                                            <span id="total_addpay_text" class="">부가결제</span>
                                            <span> 금액</span>
                                        </th>
                                        <th scope="col"><span>총 결제예정 금액</span></th>
                                    </tr>
                                </thead>
                                <tbody class="center">
                                    <tr>
                                        <td class="price">
                                            <div class="box txt23">
                                                <span>
                                                    <span id="total_order_price_view" class="txt23">546,000</span>
                                                </span>
                                            </div>
                                        </td>
                                        <td class="option">
                                            <div class="box txt23">
                                                <span>-</span>
                                                <span>
                                                    <span id="total_sale_price_view" class="txt23">0</span>
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="box txtEm txt23">
                                                <span>=</span>
                                                <span>
                                                    <span id="total_order_sale_price_view" class="txt23">546,000</span>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 결제수단 -->
                    <div class="title">
                        <h3>결제수단</h3>
                    </div>
                    <div class="payArea">
                        <div class="payment">
                            <div class="method">
                                <span class="ec-base-label">
                                    <input id="addr_paymethod0" name="addr_paymethod" value="cash" type="radio" checked="checked" autocomplete="off"/>
                                    <label for="addr_paymethod0">무통장 입금</label>
                                </span>
                            </div>
                            <div class="ec-base-table">
                                <!-- 무통장입금 -->
                                <table border="1" summary="" id="payment_input_cash">
                                    <caption>
                                        무통장입금
                                    </caption>
                                    <colgroup>
                                        <col style="width: 150px" />
                                        <col style="width: auto" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row">입금자명</th>
                                            <td>
                                                <input id="pname" name="pname" class="inputTypeText" size="15" maxlength="20" type="text"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">입금은행</th>
                                            <td>
                                                <select id="bankaccount" name="bankaccount">
                                                    <option value="-1">
                                                        ::: 선택해 주세요. :::
                                                    </option>
                                                </select>
                                                <p class="gBlank5">
                                                    <a href="#" id="btn_bank_go" class="btn_ccc_120">은행사이트 바로가기</a>
                                                </p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- 최종결제금액 -->
                        <div class="total">
                            <h4>
                                <strong id="current_pay_name">무통장 입금</strong>
                                <span>최종결제 금액</span>
                            </h4>
                            <p class="price">
                                <input id="total_price" name="total_price" class="inputTypeText" style="text-align: right; clear: none;border: 0px;float: none;" size="10" readonly="readonly" value="546000" type="text"/>
                            </p>
                            <p class="paymentAgree" id="chk_purchase_agreement">
                                <input id="chk_purchase_agreement0" name="chk_purchase_agreement" value="T" type="checkbox"/>
                                <label for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
                            </p>
                            <div class="button">
                                <a href="#" class="btn_order_payment" id="btn_payment">결제하기</a>
                            </div>
                            <div class="mileage">
                                <dl class="ec-base-desc gLarge right">
                                    <dt><strong>총 적립예정금액</strong></dt>
                                    <dd id="mAllMileageSum" class="txtWarn" style="">
                                        0원
                                    </dd>
                                </dl>
                                <dl class="ec-base-desc gLarge right">
                                    <dt>상품별 적립금</dt>
                                    <dd id="mProductMileage">0원</dd>
                                    <dt>회원 적립금</dt>
                                    <dd id="mMemberMileage">0원</dd>
                                    <dt>쿠폰 적립금</dt>
                                    <dd id="mCouponMileage">0원</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <!-- 무이자 할부 이용안내 -->
                    <div class="ec-base-help">
                        <h3>무이자 할부 이용안내</h3>
                        <div class="inner">
                            <ul>
                                <li>
                                    무이자할부가 적용되지 않은 상품과 무이자할부가 가능한
                                    상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해
                                    무이자할부가 적용되지 않습니다.
                                </li>
                                <li>
                                    무이자할부를 원하시는 경우 장바구니에서 무이자할부
                                    상품만 선택하여 주문하여 주시기 바랍니다.
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- 총 주문금액 상세내역 레이어 -->
                    <div id="order_layer_detail" class="totalDetail ec-base-layer" style="top: 1024px; left: 117.938px; display: none">
                        <div class="header">
                            <h3>총 주문금액 상세내역</h3>
                        </div>
                        <div class="content">
                            <p id="total_order_price_id" class="txtEm txt16">546,000</p>
                            <ul class="ec-base-desc typeDot gLarge rightDD">
                                <li>
                                    <strong class="term">상품금액</strong
                                    ><span class="desc">546,000</span>
                                </li>
                                <li>
                                    <strong class="term">배송비</strong
                                    ><span id="total_ship_price_id" class="desc">0</span>
                                </li>
                            </ul>
                        </div>
                        <a href="#" class="close">
                            <img src="<c:url value='/images/btn_close.gif'/>">
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
<%@ include file="includes/footer.jsp"%>