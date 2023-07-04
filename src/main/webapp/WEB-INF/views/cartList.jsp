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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    //이미지 출력
    $(function(){
        let list = new Array()
        <c:forEach items="${list}" var="itemDto">
        list.push(<c:out value="${itemDto.ino}"/>);
        </c:forEach>
        $.getJSON("/item/getAttachListOnList", {list : list},
            function(data){
                console.log(data);
                var html = "";
                var keys = Object.keys(data).sort((a, b) => Number(b)-Number(a))
                $(keys).each(
                    function(i,ino){
                        var attach = data[ino];
                        if(attach[0] != null){
                            if(attach[0].fileType){
                                var fileCallPath = encodeURI(attach[0].uploadPath + '/' + attach[0].uuid + "_" + attach[0].fileName) //원본
                                // var fileCallPath = encodeURI(attach[0].uploadPath + '/s_' + attach[0].uuid + "_" + attach[0].fileName) //썸네일
                                html = "<img src='/display?fileName=" + fileCallPath + "'>"
                            } else {
                                html = "<img src='/resources/images/attach.png'>"
                            }
                            $("#"+ino).html(html);
                        }
                    })
            })
    })
</script>
<script>
    $(function(){
        calculatePrices();

        $(".basket_chk").change(function() {
            calculatePrices();
        });

        function calculatePrices() {
            let totalPrice = 0; // 총 가격
            let deliveryPrice = 0; // 배송비
            let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

            $(".basket_chk:checked").each(function() {
                const cartInfo = $(this).closest("tr").find(".cart_info");
                const individualTotalPrice = parseInt(cartInfo.find(".individual_totalPrice_input").val());
                totalPrice += individualTotalPrice;
            });

            if (totalPrice >= 30000 || totalPrice === 0) {
                deliveryPrice = 0;
            } else {
                deliveryPrice = 3000;
            }
            finalTotalPrice = totalPrice + deliveryPrice;

            $(".totalPrice_span").text(totalPrice.toLocaleString());
            $(".deliveryPrice_span").text(deliveryPrice.toLocaleString());
            $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
        }


        $(".delBtn").on("click",function(e){
            e.preventDefault()
            let cano = $(this).parent().data("cano")
            // form 요소 생성
            let form = $('<form></form>');
            form.attr('method', 'post');
            form.attr('action', '/cart/delete');
            // input 요소 생성 및 값 설정
            let input = $('<input />');
            input.attr('type', 'hidden');
            input.attr('name', 'cano');
            input.attr('value', cano);

            // form에 input 요소 추가
            form.append(input);

            // form을 body에 추가하고 전송
            form.appendTo('body').submit();
        })

        $(".upBtn").on("click",function(e){
            e.preventDefault()
            let itemCountInput = $(this).prev('input');
            let quantity = parseInt(itemCountInput.val());
            itemCountInput.val(++quantity);
            let cano = $(this).data("cano")

            modifyQuantity(cano, quantity);
        })

        $(".downBtn").on("click",function(e){
            e.preventDefault()
            let itemCountInput = $(this).prev().prev('input');
            let quantity = parseInt(itemCountInput.val());
            if(quantity > 1){
                itemCountInput.val(--quantity);
            }
            let cano = $(this).data("cano")

            modifyQuantity(cano, quantity);
        })

        $(".modBtn").on("click",function(e){
            e.preventDefault()
            let itemCountInput = $(this).parent().find('input');
            let quantity = parseInt(itemCountInput.val());
            let cano = $(this).data("cano");

            modifyQuantity(cano, quantity);

        })

        function modifyQuantity(cano, quantity) {
            let form = $('<form></form>');
            form.attr('method', 'post');
            form.attr('action', '/cart/modify');

            let input1 = $('<input />');
            input1.attr('type', 'hidden');
            input1.attr('name', 'itemCount');
            input1.attr('value', quantity);

            let input2 = $('<input />');
            input2.attr('type', 'hidden');
            input2.attr('name', 'cano');
            input2.attr('value', cano);

            form.append(input1);
            form.append(input2);

            form.appendTo('body').submit();
        }

        $(".selectedDelete").on("click",function(e){
            e.preventDefault()

            let selectedCanos = [];
            $(".basket_chk:checked").each(function() {
                let cano = $(this).data("cano");
                selectedCanos.push(cano);
            })
            if(selectedCanos.length === 0) return;

            let form = $("<form></form>");
            form.attr("method", "POST");
            form.attr("action", "/cart/selectedDelete");

            selectedCanos.forEach(function(value) {
                let input = $("<input />");
                input.attr("type", "hidden");
                input.attr("name", "canos");
                input.val(value);
                form.append(input);
            });

            let csrfToken = $("meta[name='_csrf']").attr("content");
            let csrfHeader = $("meta[name='_csrf_header']").attr("content");
            form.append(
                $("<input />")
                    .attr("type", "hidden")
                    .attr("name", csrfHeader)
                    .val(csrfToken)
            );

            form.appendTo("body").submit();
        })
        // 전체 선택 버튼 클릭 시 모든 체크박스 상태 변경
        $("#selectAllCheckbox").on("click",function(){
            let checkboxes = $('.basket_chk');
            checkboxes.prop('checked', $(this).prop('checked'));
            calculatePrices();
        })

        // 개별 체크박스 변경 시 전체 선택 버튼 상태 변경
        $(".basket_chk").change(function() {
            let selectAllCheckbox = $('#selectAllCheckbox');
            let checkboxes = $('.basket_chk');

            let allChecked = true;
            checkboxes.each(function() {
                if (!$(this).prop('checked')) {
                    allChecked = false;
                    return false; // 반복문 종료
                }
            });
            selectAllCheckbox.prop('checked', allChecked);
        });
    })


</script>
<div id="contents_wrap" style="">
    <div id="container">
        <div id="contents">
            <div class="titleArea">
                <h2>CART</h2>
            </div>
            <!-- 장바구니 -->
            <div class="xans-element- xans-order xans-order-basketpackage">
                <c:if test="${empty list}">
                    <!-- 장바구니 비어있을 때 -->
                    <div class="xans-element- xans-order xans-order-empty ">
                        <p>장바구니가 비어 있습니다.</p>
                    </div>
                </c:if>
                <c:if test="${not empty list}">
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
                                <input type="checkbox" id="selectAllCheckbox" checked/>
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
                                <span class="gLeft">[기본배송]</span>
                                상품구매금액 <span class="totalPrice_span"></span>
                                + 배송비 <span class="deliveryPrice_span"></span>
                                = 합계 : <span class="txtEm gIndent10 finalTotalPrice_span"></span>원
                            </td>
                        </tr>
                        </tfoot>
                        <tbody class="xans-element- xans-order xans-order-list center">

                        <c:forEach items="${list}" var="cartDto">

                            <tr class="xans-record-">
                                <td>
                                    <input type="checkbox" class="basket_chk" data-cano="${cartDto.cano}" checked />
                                    <div class="cart_info displaynone">
                                        <input type="hidden" class="individual_itemPrice_input" value="${cartDto.itemPrice}">
                                        <input type="hidden" class="individual_salePrice_input" value="${cartDto.salePrice}">
                                        <input type="hidden" class="individual_totalPrice_input" value="${cartDto.salePrice * cartDto.itemCount}">
                                    </div>
                                </td>
                                <td class="thumb gClearLine">
                                    <a href="<c:url value='/item/read?ino=${cartDto.ino}'/>" id="<c:out value='${cartDto.ino}'/>">
                                    </a>
                                </td>
                                <td class="left gClearLine">
                                    <a href="<c:url value='/item/read?ino=${cartDto.ino}'/>">${cartDto.itemName}</a>
                                    <ul class="xans-element- xans-order xans-order-optionall option">
                                        <li class="xans-record-">
                                                <%--                                            <strong class="displaynone">SAMPLE PRODUCT</strong>[옵션: Beige] <br/>--%>
                                        </li>
                                    </ul>
                                </td>
                                <td class="center">
                                    <div class="">
                                        <fmt:formatNumber value="${cartDto.itemPrice}" pattern="##,###"/>
                                        <c:if test="${not empty cartDto.itemDiscount}">
                                            <p class="" style="color: red"><fmt:formatNumber value="${cartDto.salePrice}" pattern="##,###"/> </p>
                                            <p class="" style="color: orange">[ <fmt:formatNumber value="${cartDto.itemPrice - cartDto.salePrice}" pattern="##,###"/>원 할인]</p>
                                        </c:if>
                                    </div>
                                </td>
                                <td>
                                    <span class="">
                                        <span class="ec-base-qty">
                                            <input id="quantity_id_1" name="quantity_name_1" size="2" value="${cartDto.itemCount}" type="text"/>
                                            <a href="#" class="upBtn" data-cano="${cartDto.cano}">
                                                <img src="<c:url value='/images/quantity_up.gif'/>" alt="수량증가" class="up"/>
                                            </a>
                                            <a href="#" class="downBtn" data-cano="${cartDto.cano}">
                                                <img src="<c:url value='/images/quantity_down.gif'/>" alt="수량감소" class="down"/>
                                            </a>
                                        </span>
                                        <a href="#" class="modBtn" data-cano="${cartDto.cano}">
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
                                    <fmt:formatNumber value="${cartDto.itemPrice * cartDto.itemCount}" pattern="##,###"/>
                                    <c:if test="${not empty cartDto.itemDiscount}">
                                        <div class="" style="color: red">
                                                <%--                                            <fmt:formatNumber value="${(cartDto.itemPrice - (cartDto.itemPrice * cartDto.itemDiscount)) * cartDto.itemCount }" pattern="##,###"/>--%>
                                            <fmt:formatNumber value="${cartDto.totalPrice}" pattern="##,###"/>
                                        </div>
                                        <p class="" style="color: orange">[<fmt:formatNumber value="${(cartDto.itemPrice * cartDto.itemCount) - cartDto.totalPrice}" pattern="##,###"/>원 할인]</p>

                                    </c:if>
                                </td>
                                <td class="button" data-cano="${cartDto.cano}">
                                    <a href="#" class="btn_ccc_86">BUY NOW</a>
                                    <a href="#" class="btn_ccc_86 delBtn">DELETE</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="xans-element- xans-order xans-order-selectorder ec-base-button">
                    <span class="gLeft">
                        <strong class="text">선택상품을</strong>
                        <a href="#" class="btn_ccc_80 selectedDelete">삭제하기</a>
                    </span>
                    <span class="gRight">
                        <a href="<c:url value='/cart/deleteAll'/>" class="btn_ccc_100">장바구니 비우기</a>
                    </span>
                </div>
                <!-- 총 주문금액 -->
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
                                            <span class="total_product_price_display_front totalPrice_span"></span>
                                        </span>
                                </div>
                            </td>
                            <td class="txt23">
                                <div class="box shipping">
                                    +<span>
                                            <span class="total_delv_price_front deliveryPrice_span"></span>
                                        </span>
                                </div>
                            </td>
                            <td class="displaynone txt23">
                                <div class="box">
                                    - <span>0</span> <span class="displaynone"></span>
                                </div>
                            </td>
                            <td class="txt23">
                                <div class="box txtEm">
                                    = <span class="finalTotalPrice_span"></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 주문 버튼 -->
                <div class="xans-element- xans-order xans-order-totalorder ec-base-button justify">
                    <a href="<c:url value='/cart/order'/>" class="btn_000_180">전체상품주문</a>
                    <a href="<c:url value='/cart/order'/>" class="btn_000_180">선택상품주문</a>
                </div>
            </div>
            <!-- //장바구니 -->
            </c:if>
        </div>
    </div>

<%@ include file="includes/footer.jsp"%>