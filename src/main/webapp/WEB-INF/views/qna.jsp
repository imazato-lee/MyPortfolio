<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/19
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/css/myShop/notice.css'/>">
<link rel="stylesheet" href="<c:url value='/css/myShop/qna.css'/>">
<script>
  $(function(){
    let ino = '<c:out value="${qnaItemDto.ino}"/>'
    $.getJSON("/item/getAttachList/" + ino, function(attachList){
      let str = '';
      $(attachList).each(function(i, attach){
        if(attach.fileType){
          let fileCallPath = encodeURIComponent( attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
          str += "<a href='#' data-path='" + attach.uploadPath + "'"
          str += " data-uuid='" + attach.uuid + "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "'>"
          str += " <img src='/display?fileName=" + fileCallPath + "'>";
          str += "</a>";
        } else {
          var fileCallPath = encodeURIComponent( attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
          str += "<a href='#' data-path='" + attach.uploadPath + "'"
          str += " data-uuid='" + attach.uuid + "' data-fileName='" + attach.fileName + "' data-type='" + attach.fileType + "'>"
          str += "<img id=src='/resources/images/attach.png'/>"
          str += "</a>"
        }
      })
      $(".thubm").html(str);
    })

    $("#remove").on("click",function(e){
        e.preventDefault()
        let deleteForm = $("#deleteForm")
        deleteForm.submit();
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
      <form id="deleteForm" action="<c:url value='/qna/remove'/>" method="post">
        <input name="qno" value="${qnaItemDto.qno}" type="hidden">
        <div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
          <div class="board_wrap">
            <div class="board_top ">
              <ul class="left">
                <li class="subject">${qnaItemDto.title}</li>
                <li class="writer">POSTED BY :  ${qnaItemDto.writer}  </li>
                <li class="etc">
                  <p class=""><script>document.write(dateToString(${qnaItemDto.reg_date.time}))</script></p>
                </li>
              </ul>
              <ul class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 right ">
                <li>
                  <p><a href="#">${qnaItemDto.itemName}</a></p>
                  <p><a href="#"><fmt:formatNumber value="${qnaItemDto.itemPrice}" pattern="##,###"/>원</a></p>
                </li>
                <li class="thubm">
<%--                  <a href="">--%>
<%--                    <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/11_shop1_15297538936011.jpg" alt="">--%>
<%--                  </a>--%>
                </li>
              </ul>
            </div>

            <div class="detail">
              <div class="fr-view fr-view-article">
                <span style="color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">${qnaItemDto.content}</span>
              </div>
            </div>
            <div class="board_footer ">
              <ul class="right">
                <a href="<c:url value='/qna/list${sc.getQueryString()}'/>" class="btn_000">LIST</a>
                <a href="#" id="remove" class="btn_000">DELETE</a>
                <a href="<c:url value='/qna/modify${sc.getQueryString()}&qno=${qnaItemDto.qno}'/>" class="btn_000">MODIFY</a>
                <a href="#" class="btn_000 displaynone">ANSWER</a>
              </ul>
            </div>
          </div>
          <!-- //board_wrap -->
        </div>
      </form> <!-- //board_read_4 -->

        <div class="xans-element- xans-board  xans-board-commentpackage">
            <!-- 코멘트 리스트 -->
            <div class="xans-element- xans-board xans-board-commentlist">
                <ul class="boardComment">

                </ul>
            </div>
            <div class="xans-comment-paging">

            </div>

            <!-- 댓글 쓰기 -->
            <div id="commentWriteForm">
                <div class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 ">
                    <!-- 댓글권한 있음 -->
                    <c:if test="${sessionScope.name ne null}">
                        <div class="">
                            <fieldset>
                                <legend>댓글 입력</legend>
                                <p>
                                    <span class="">댓글 입력</span>
                                </p>
                                <div class="view">
                                    <textarea id="comment" name="comment" ></textarea><a href="#" id="addComment" class="submit btn_ccc_box">확인</a>
                                </div>
                            </fieldset>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.name eq null}">
                    <!-- 댓글권한 없음 -->
                    <div>
                        <p>회원에게만 댓글 작성 권한이 있습니다.</p>
                    </div>
                </div>
                </c:if>
            </div>
        </div>

        <!-- 댓글 수정 -->
        <div id="commentModifyForm" style="display: none">
            <div class="xans-element- xans-board xans-board-commentform-4 xans-board-commentform xans-board-4">
                <fieldset>
                    <legend>댓글 수정</legend>
                    <div class="view">
                        <textarea id="comment_modify" name="comment_modify" placeholder="수정할 내용을 입력해주세요."></textarea>
                        <span class="submit">
                    <a href="#" id="commentModify" class="btn_ccc_box">MODIFY</a>
                    <a href="#" id="commentModifyCancel" class="btn_ccc_box">CANCEL</a>
                  </span>
                    </div>
                </fieldset>
            </div>
        </div>

<%@ include file="includes/footer.jsp"%>