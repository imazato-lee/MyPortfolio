
<%-- Created by IntelliJ IDEA. User: sehyeon Date: 2023/06/15 Time: 10:20 PM To
change this template use File | Settings | File Templates. --%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/css/myShop/item.css"/>' />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    let addZero = function(value=1){
        return value > 9 ? value : "0"+value;
    }

    let dateToString = function(ms) {
        let date = new Date(ms);

        let yyyy = date.getFullYear();
        let mm = addZero(date.getMonth() + 1);
        let dd = addZero(date.getDate());

        return yyyy+"-"+mm+"-"+dd
    }
    let page = 1;
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

        $.ajax({
            url: "/item/" + ino + "/" + page ,
            type: "GET",
            dataType: "json",
            success: function (list) {
                console.log(list)
                showQnaList(list)
            },
            error: function (xhr, status, error) {
                console.log("Q&A LIST READ ERR")
            }
        })

        $("#quantityUp").on("click",function(){
            let quantity = parseInt($("#quantity").val())
            quantity = quantity + 1
            $("#quantity").val(quantity)
        })

        $("#quantityDown").on("click",function(){
            let quantity = parseInt($("#quantity").val())
            quantity = quantity -1
            if(quantity < 0 ){
                alert("올바르지 않는 값입니다.")
                return;
            }
            $("#quantity").val(quantity);
        })
    })

    function showQnaList(list) {
        let str = "";
        let center = $(".center");
        if (list == null || list.length === 0) {
            center.html(str);
            return;
        }
        for (var i = 0, len = list.length || 0; i < len; i++) {
            str += '<tr class="xans-record-">';
            str += '<td>' + (i+1) + '</td>';
            str += '<td class="subject left txtBreak">';
            str += '<a href="#">' + list[i].title + '</a>';
            str += '<span class="txtWarn">[' + list[i].comment_cnt + ']</span>';
            str += '</td>';
            str += '<td>' + list[i].writer + '</td>';
            str += '<td class="txtInfo txt11">' + dateToString(list[i].reg_date) + '</td>';
            str += '</tr>';
        }
        center.html(str);
    }
</script>
<script>
    $(function(){
        $("#cart").on("click",function(e){
            e.preventDefault()
            let quantity = $("#quantity").val()
            if(quantity <= 0){
                alert("갯수를 올바르게 입력해주세요")
                return
            }
            let CartDto = {
                id : "${sessionScope.id}",
                ino : ${itemDto.ino},
                itemCount : quantity
            }

            $.ajax({
                url: "/cart/new",
                type: "POST",
                data: JSON.stringify(CartDto),
                contentType: "application/json",
                success: function(response) {
                    console.log(response);
                    alert("장바구니 등록 성공!")
                },
                error: function(xhr, status, error) {
                    console.error(error);
                    alert("이미 장바구니에 존재합니다")
                }
            });
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
                                            <strong id="span_product_price_text"><fmt:formatNumber value="${itemDto.itemPrice}" pattern="##,###"/>원</strong>
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
                                            <a href="#" id="quantityUp">
                                                <img src="<c:url value='/images/detail_qty_up.jpg'/>" alt="QTY증가" class="QuantityUp up"/>
                                            </a>
                                            <a href="#" id="quantityDown">
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
                                        <%--                                            <ul class="ec-product-button">--%>
                                        <%--                                                <li class="" title="Beige">--%>
                                        <%--                                                    <a href="#"><span>Beige</span></a>--%>
                                        <%--                                                </li>--%>
                                        <%--                                                <li class="" title="Grey">--%>
                                        <%--                                                    <a href="#"><span>Grey</span></a>--%>
                                        <%--                                                </li>--%>
                                        <%--                                            </ul>--%>
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
                                        <a href="#" class="btn_ccc">옵션선택</a>
                                        <a href='<c:url value="/item/modify${ic.getQueryString()}&ino=${itemDto.ino}"/>' class="btn_ccc" id="ItemModBtn">MODIFY</a>

                                        <%--                                            <a href="#" onclick="">--%>
                                        <%--                                                <img src="<c:url value='/images/btn_manual_select.gif'/>" alt="옵션 선택"/>--%>
                                        <%--                                            </a>--%>
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
                                        <a href="#" class="" id="cart">CART</a>
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
                            <img src="<c:url value='/images/sample_page.jpeg'/>" />
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
                                        <a href="<c:url value='/qna/write${ic.getQueryString()}&ino=${itemDto.ino}'/>" class="btn_ccc">문의작성</a>
                                        <a href="<c:url value='/qna/list'/>" class="btn_ccc">모두보기</a>
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
                                        <%--                                        <tr class="xans-record-">--%>
                                        <%--                                            <td>1</td>--%>
                                        <%--                                            <td class="subject left txtBreak">--%>
                                        <%--                                                <a href="">상품문의</a>--%>
                                        <%--                                                <span class="txtWarn">[1]</span>--%>
                                        <%--                                            </td>--%>
                                        <%--                                            <td>세현</td>--%>
                                        <%--                                            <td class="txtInfo txt11">2023-06-21</td>--%>
                                        <%--                                        </tr>--%>
                                        <tr id="product-qna-read" style=" display: none">
                                            <td colspan="4">
                                                <div class="view">
                                                    <p></p>
                                                    <div class="fr-view fr-view-article">
                                                        <p>
                                                            <span>크리에이티브 디자인 아이디오아지트</span>
                                                        </p>
                                                    </div>
                                                    <p></p>
                                                    <p></p>
                                                    <p class="ec-base-button">
                                                        <span class="gLeft"></span>
                                                    </p>
                                                </div>

                                                <ul class="boardComment">   <%--댓글 출력--%>
                                                    <li>
                                                        <strong class="name"> 이세현</strong>
                                                        <span class="date">2023-06-21</span>
                                                        <p class="comment">
                                                            <span id="comment_contents8">gg</span>
                                                        </p>
                                                    </li>
                                                </ul>

                                                <form name="commentWriteForm_6" id="commentWriteForm_6">
                                                    <div class="memoCont">
                                                        <div class="writer">
                                                            <p class="user">
                                                                <span class="nameArea">이름 <input id="comment_name" name="comment_name" class="inputTypeText" placeholder="" value="" type="text"></span>
                                                            </p>
                                                            <div class="view">
                                                                <textarea id="comment" name="comment" ></textarea><a href="#" id="addComment" class="submit btn_ccc_box" style="margin-left: 5px;">확인</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </td>
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
