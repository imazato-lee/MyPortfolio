<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/13
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
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
                            console.log(ino)
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
<div id="contents_wrap" style="">
    <div id="container">
        <div id="contents">
            <div class="xans-element- xans-product xans-product-menupackage ">
                <div class="xans-element- xans-product xans-product-headcategory title ">
                NEW ARRIVALS
                </div>
                <ul class="menuCategory"></ul>
            </div>
            <!-- 일반상품 -->
            <div class="xans-element- xans-product xans-product-normalpackage ">
                <div class="xans-element- xans-product xans-product-listnormal ec-base-product">
                    <ul class="prdList grid3">

                        <c:forEach items="${list}" var="itemDto">
                        <li id="anchorBoxId_16" class="xans-record-">
                            <div class="thumbnail">
                                <a href="<c:url value='/item/read${ph.ic.getQueryString()}&ino=${itemDto.ino}'/>" id="<c:out value='${itemDto.ino}'/>">
                                </a>
                            </div>
                            <div class="description">
                                <ul class="name">
                                    <li class="item_name">
                                        <a href="<c:url value='/item/read${ph.ic.getQueryString()}&ino=${itemDto.ino}'/>" class="">
                                            <span style="font-size:12px;color:#555555;">${itemDto.itemName}</span>
                                        </a>
                                    </li>
                                </ul>
                                <ul class="xans-element- xans-product xans-product-listitem spec">
                                    <li class=" xans-record-">
                                        <span style="font-size:12px;color:#555555;"><fmt:formatNumber value="${itemDto.itemPrice}" pattern="##,###"/></span>
                                        <span id="span_product_tax_type_text" style=""></span>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate-text">
                <c:if test="${totalCnt!=null && totalCnt !=0}">
                    <c:if test="${ph.showPrev}">
                        <a href="<c:url value="/item/list${ph.ic.getQueryString(ph.beginPage-1)}"/>">PREV</a>
                    </c:if>
                    <ol>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <li class="xans-record-"><a href="<c:url value='/item/list${ph.ic.getQueryString(i)}'/>" class="this"> ${i} </a></li>
                        </c:forEach>
                    </ol>
                    <c:if test="${ph.showNext}">
                        <a href="<c:url value='/item/list${ph.ic.getQueryString(ph.endPage+1)}'/>">NEXT</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>

<%@ include file="includes/footer.jsp"%>