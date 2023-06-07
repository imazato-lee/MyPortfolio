<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <link rel="stylesheet" href="<c:url value='/css/myShop/noticeList.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Document</title>
    <script>
        let addZero = function(value=1){
            return value > 9 ? value : "0"+value;
        }

        let dateToString = function(ms) {
            let date = new Date(ms);

            let yyyy = date.getFullYear();
            let mm = addZero(date.getMonth() + 1);
            let dd = addZero(date.getDate());

            // let HH = addZero(date.getHours());
            // let MM = addZero(date.getMinutes());
            // let ss = addZero(date.getSeconds());

            // return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;
            return yyyy+"-"+mm+"-"+dd
        }
        function searchFormSubmit() {
            let form = $('#search-form');
            form.submit();
        }
    </script>

    <div id="contents_wrap">
        <div id="container">
            <div id="contents">
                <div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
                    <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                        <p class="title_text"><font color="#555555">NOTICE</font></p>
                    </div>
                    <div class="ec-base-table typeList gBorder">
                        <table border="1" summary="">
                            <caption>상품 게시판 목록</caption>
                            <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                                <col style="width:50px;">
                                <col style="width:auto;">
                                <col style="width:100px;">
                                <col style="width:100px;">
                                <col style="width:100px;" class="">
                            </colgroup>
                            <thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                                <tr>
                                    <th scope="col"> NO.</th>
                                    <th scope="col">TITLE</th>
                                    <th scope="col">POSTED BY</th>
                                    <th scope="col" >VIEW</th>
                                    <th scope="col" class="">DATE</th>
                                </tr>
                            </thead>
                            <tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
                            <c:forEach items="${list}" var="noticeDto">
                                <tr class="xans-record-">
                                    <td>${noticeDto.nno}</td>
                                    <td class="subject left txtBreak">
                                        <a href="/notice/read${ph.sc.getQueryString()}&nno=${noticeDto.nno}">${noticeDto.title}</a>
                                    </td>
                                    <td>${noticeDto.writer}</td>
                                    <td>${noticeDto.view_cnt}</td>
                                    <td class=""><span class="txtNum"><script>document.write(dateToString(${noticeDto.reg_date.time}))</script></span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="board_footer" style="padding-top: 30px;">
                        <form id="search-form" action="<c:url value='/notice/list'/>" method="get" style="width: 90%;  float: left;">
                            <fieldset class="boardSearch">
                                <legend>게시물 검색</legend>
                                <p>
                                    <select class="search-option" name="option">
                                        <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                                        <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                                        <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
                                    </select>
                                    <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                                        <a href="#" onclick="searchFormSubmit();">SEARCH</a>
                                </p>
                            </fieldset>
                        </form>
                        <div class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002  " style="float: right;padding-right: 20px;">
                            <a href="<c:url value='/notice/write${ph.sc.getQueryString()}'/>">WRITE</a>
                        </div>
                    </div>
                    <!--// board_footer -->
                </div>

                <div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate-text">
                    <c:if test="${totalCnt!=null && totalCnt!=0}">
                        <c:if test="${ph.showPrev}">
                            <a href="<c:url value="/notice/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">PREV</a>
                        </c:if>
                        <ol>
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <li class="xans-record-"><a href="<c:url value="/notice/list${ph.sc.getQueryString(i)}"/>" class="this">${i}</a></li>
                            </c:forEach>
                        </ol>
                        <c:if test="${ph.showNext}">
                            <a href="<c:url value="/notice/list${ph.sc.getQueryString(ph.endPage+1)}"/>">NEXT</a>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>

<%@ include file="includes/footer.jsp"%>