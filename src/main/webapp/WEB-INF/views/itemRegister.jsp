<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/13
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href='<c:url value="/css/myShop/itemRegister.css"/>'>
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
<script>
    var ckeditor_config = {
        enterMode : CKEDITOR.ENTER_BR.CKEDITOR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl:''
    }
</script>
<div id="contents_wrap">
    <div id="container">
        <div id="contents">
            <div class="titleArea">
                <h2>ITEM REGISTER</h2>
            </div>
            <form id="registerForm" method="POST" action="user/register">
                <div class="xans-element- xans-member xans-member-join">
                    <div class="ec-base-box typeProduct  ">
                        <p class="thumbnail">
                            <a href="">
                                <img id="iPrdImg" src="/images/75x75.gif" alt="">
                            </a>
                        </p>
                        <div class="information">
                            <p class="button">
                                <span class="">
                                    <!-- <a href="#" class="btn_ccc_100">상품정보선택</a> -->
                                    <input type="file">
                                </span>
                            </p>
                        </div>
                    </div>
                    <div class="ec-base-table typeWrite ">
                        <table border="1" summary="">
                            <caption>상품 기본정보</caption>
                            <colgroup>
                                <col style="width:150px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">카테고리
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td>
                                    <select id="category" name="category">
                                        <option value="">필수선택</option>
                                        <option value="OUTWEARS">OUTWEARS</option>
                                        <option value="TOPS">TOPS</option>
                                        <option value="BOTTOMS">BOTTOMS</option>
                                        <option value="BAG">BAG</option>
                                        <option value="SHOES">SHOES</option>
                                        <option value="ACCESSORIES">ACCESSORIES</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">상품명
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td><input id="itemName" name="itemName" placeholder="상품명을 입력하세요" value="" type="text" >
                                    <p class="text_guide"><span id="itemNameMsg"></span></p>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">가격
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td><input id="itemPrice" name="itemPrice" placeholder="가격 입력" value="" type="text">
                                    <p class="text_guide"><span id="itemPriceMsg"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">재고</th>
                                <td><input id="itemStock" name="itemStock" placeholder="재고량 입력(필수아님)" value="" type="text">
                                    <p class="text_guide"><span id="itemStockMsg"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">할인율</th>
                                <td><input id="itemDiscount" name="itemDiscount" placeholder="할인율 입력(필수아님)" value="" type="text">
                                    <p class="text_guide"><span id="itemDiscountlMsg"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">상품설명
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td>
                                    <textarea name ="itemContent" id="item_content" col="30" rows="10"></textarea>
                                    <p class="text_guide"><span id="itemContentMsg"></span></p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-button-center">
                        <a href="#" id="submit" class="btn_1000">SUBMIT</a>
                    </div>
                </div>
            </form>
        </div>
        <script>
            CKEDITOR.replace("item_content",ckeditor_config)
        </script>

<%@ include file="includes/footer.jsp"%>