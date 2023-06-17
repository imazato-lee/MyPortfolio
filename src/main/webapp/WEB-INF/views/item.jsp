
<%-- Created by IntelliJ IDEA. User: sehyeon Date: 2023/06/15 Time: 10:20 PM To
change this template use File | Settings | File Templates. --%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/item.css"/>' />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    $(function(){
        let ino = ${itemDto.ino}
        $.getJSON("/item/getAttachList/"+ino, function(attachList){
            console.log(attachList)
            let str = "";
            $(attachList).each(function(i, attach){
                if(attach.fileType){
                    let fileCallPath = encodeURI(attach.uploadPath + '/' + attach.uuid + "_" + attach.fileName)
                    str += "<li data-path='" + attach.uploadPath + "'"
                    str += " data-uuid='" + attach.uuid + "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "'>"
                    str += "<div>"
                    str += "<img src='/display?fileName=" + fileCallPath +"' style=\"width: -webkit-fill-available;\">"
                    str += "</div>"
                    str += "</li>"
                } else {
                    str += "<li data-path='" + attach.uploadPath + "'"
                    str += " data-uuid='" + attach.uuid + "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "'>"
                    str += "<div>"
                    str += "<img src='/resources/images/attach.png'>"
                    str += "</div>"
                    str += "</li>"
                }
            })
            $(".uploadResult").html(str);
        })
    })
</script>
<div id="contents_wrap" style="">
    <div id="container">
        <div id="contents">
            <div id="Detail_wrap">
                <!-- 상단 제품 정보  -->
                <div class="xans-element- xans-product xans-product-detail">
                    <!-- 이미지 영역 -->
                    <div class="xans-element- xans-product xans-product-image imgArea">
                        <div class="thumbnail">
                            <ul class="uploadResult">

                            </ul>
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
                                        <td><span style="font-size: 14px; color: #000000">${itemDto.itemName} </span><br/><br/>
                                        </td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td>
                                            <pre><span style="font-size:12px;color:#000000;">${itemDto.itemContent}</span></pre>
                                        </td>
                                    </tr>
                                    <tr class="xans-record-">
                                        <td><span style="font-size: 14px; color: #000000">
                                            <strong id="span_product_price_text"><fmt:formatNumber value="${itemDto.itemPrice}" pattern="##,###"/></strong>
                                        <input id="product_price" name="product_price" value="" type="hidden"/></span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- //상세정보 내역 -->

                            <div id="totalProduct" class="quantity_wrap">
                                <div class="">
                                    <ul>
                                        <li><span class="quantity">
                                            <input id="quantity" name="quantity_name" style="" value="0" type="text"/>
                                            <a href="#">
                                                <img src="<c:url value='/images/detail_qty_up.jpg'/>" alt="QTY증가" class="QuantityUp up"/>
                                            </a>
                                            <a href="#">
                                                <img src="<c:url value='/images/detail_qty_down.jpg'/>" alt="QTY감소" class="QuantityDown down"/>
                                            </a></span>
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
                                            <ul class="ec-product-button">
                                                <li class="" title="Beige">
                                                    <a href="#"><span>Beige</span></a>
                                                </li>
                                                <li class="" title="Grey">
                                                    <a href="#"><span>Grey</span></a>
                                                </li>
                                            </ul>
                                            <select id="product_option_id1" name="option1" class="ProductOption0 displaynone">
                                                <option value="*">empty</option>
                                                <option value="Beige">Beige</option>
                                                <option value="Grey">Grey</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr class="" id="">
                                        <td class="selectButton">
                                            <a href="#" onclick="">
                                                <img src="<c:url value='/images/btn_manual_select.gif'/>" alt="옵션 선택"/>
                                            </a>
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
                    <div id="prdRelated" class="xans-element- xans-product xans-product-relation xans-record-">
                        <div class="relation">
                            <div class="xans-element- xans-product xans-product-relationlist">
                                <h2>RELATED PRODUCTS</h2>
                                <ul class="prdList">
                                    <li class="item xans-record-">
                                        <div class="box">
                                            <ul>
                                                <li>
                                                    <a href="#">
                                                        <img src="<c:url value='/images/test1.jpeg'/>" alt="SAMPLE PRODUCT" class="thumb"/>
                                                    </a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <a href="#">SAMPLE PRODUCT</a>
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
                                                    <a href="#">
                                                        <img src="<c:url value='/images/test2.jpeg'/>" alt="SAMPLE PRODUCT" class="thumb"/>
                                                    </a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <a href="#">SAMPLE PRODUCT</a>
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
                                        <a href="#" class="btn_ccc">후기작성</a>
                                        <a href="#" class="btn_ccc">모두보기</a>
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
                                        <a href="#" class="btn_ccc">문의작성</a>
                                        <a href="#" class="btn_ccc">모두보기</a>
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
                                                    <a href="#">상품문의</a>
                                                    <span class="txtWarn"></span>
                                                </td>
                                                <td>두용</td>
                                                <td class="txtInfo txt11">2023-06-17</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="xans-element- xans-product xans-product-qnapaging ec-base-paginate1 typeSub">
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
