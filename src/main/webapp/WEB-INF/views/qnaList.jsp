<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/19
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/css/myShop/qnaList.css'/>">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
  $(function(){
    let list = new Array()
    <c:forEach items="${list}" var="qnaItemDto">
      list.push(<c:out value="${qnaItemDto.ino}"/>);
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
</script>
<div id="contents_wrap">
  <div id="container">
    <div id="contents">
      <div class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
        <div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
          <p class="title_text">
            <font color="333333">Q&amp;A</font>
          </p>
          <p class="imgArea"></p>
        </div>
        <div class="ec-base-table typeList gBorder">
          <table border="1" summary="">
            <caption>상품 게시판 목록</caption>
            <colgroup class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
              <col style="width:50px;">
              <col style="width:180px;">
              <col style="width:100px;" class="displaynone">
              <col style="width:auto;">
              <col style="width:100px;">
              <col style="width:100px;" class="">
            </colgroup>
            <thead class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
              <tr>
                <th scope="col"> NO.</th>
                <th scope="col">PRODUCT</th>
                <th scope="col" class="displaynone">CATEGORY</th>
                <th scope="col" style="width:580px">TITLE</th>
                <th scope="col">POSTED BY</th>
                <th scope="col" class="">DATE</th>
              </tr>
            </thead>
            <tbody class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4 center">
              <c:forEach items="${list}" var="qnaItemDto">
              <tr class="xans-record-">
                <td>${qnaItemDto.qno}</td>
                <td class="thumb left">
                  <a href="<c:url value='/item/read${ph.sc.getQueryString()}&ino=${qnaItemDto.ino}' />" id="<c:out value='${qnaItemDto.ino}' />"></a>
                  <span>${qnaItemDto.itemName}</span>
                </td>
                <td class="displaynone"></td>
                <td class="subject left txtBreak">
                  <c:if test="${qnaItemDto.admin_reply eq true}">
                  <span>
                    <a href="#" onclick="">
                      <img src="<c:url value='/images/replied.gif'/>" alt="내용 보기">
                    </a>
                  </span>
                  </c:if>
                  <a href="<c:url value='/qna/read${ph.sc.getQueryString()}&qno=${qnaItemDto.qno}'/>">${qnaItemDto.title}</a>
                  <span class="txtEm"></span>
                </td>
                <td>${qnaItemDto.writer}</td>
                <td class=""><span class="txtNum"><script>document.write(dateToString(${qnaItemDto.reg_date.time}))</script></span></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          <p class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message displaynone "></p>
        </div>
        <div class="board_footer">
          <form id="boardSearchForm" name="" action="" method="get">
            <input id="board_no" name="board_no" value="6" type="hidden">
            <div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
              <fieldset class="boardSearch">
                <legend>게시물 검색</legend>
                <p class="category displaynone"></p>
                <p>
                  <select id="search_date" name="search_date">
                    <option value="week">일주일</option>
                    <option value="month">한달</option>
                    <option value="month3">세달</option>
                    <option value="all">전체</option>
                  </select>
                  <select id="search_key" name="option">
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="writer_name">글쓴이</option>
                    <option value="member_id">아이디</option>
                    <option value="nick_name">별명</option>
                    <option value="product">상품정보</option>
                  </select>
                  <input id="search" name="keyword" class="inputTypeText" placeholder="" value="" type="text">
                  <a href="#" onclick="">SEARCH</a>
                </p>
              </fieldset>
            </div>
          </form>
          <div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4">
            <a href="#" class="">WRITE</a>
          </div>
        </div>
        <!--// board_footer -->
      </div>

      <div class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4 ec-base-paginate-text">
        <a href="#">PREV</a>
        <ol>
          <li class="xans-record-"><a href="#" class="this">1</a></li>
        </ol>
        <a href="#">NEXT</a>
      </div>
    </div>

<%@ include file="includes/footer.jsp"%>