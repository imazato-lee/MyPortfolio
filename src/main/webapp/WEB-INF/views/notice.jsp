<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/02
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet" href="<c:url value='/css/myShop/notice.css'/>">
  <script>function showComment() {

  }

  let page = ${sc.page};
    let pageSize = ${sc.pageSize};
    let option = "${sc.option}";
    let keyword = "${sc.keyword}";

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
    function deleteNotice(){
      if(!confirm("정말로 삭제하시겠습니까?")) return;
      let form = $("#BoardDelForm");
      let actionUrl = '/notice/remove?page=' + page + '&pageSize=' + pageSize + '&option=' + option + '&keyword=' + keyword;
      form.attr("action", actionUrl)
      form.attr("method", "post")
      form.submit();
    }
  </script>
  <div id="contents_wrap">
    <div id="container">
      <div id="contents">
        <form id="BoardDelForm">
          <input id="nno" name="nno" value="${nno}" type="hidden">
          <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
            <div class="board_wrap">
              <div class="board_top ">
                <ul class="left">
                  <li class="subject">${noticeDto.title}</li>
                  <li class="writer">POSTED BY :  ${noticeDto.writer}  </li>
                  <li class="etc">
                    <p class=""><script>document.write(dateToString(${noticeDto.reg_date.time}))</script></p>
                  </li>
                </ul>
              </div>
              <div class="detail">
                <div class="fr-view fr-view-article">
                  <p style="font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;">${noticeDto.content}</p>
                </div>
              </div>
              <div class="board_footer ">
                <ul class="left">
                </ul>
                <ul class="right">
                  <a href="<c:url value='/notice/list${sc.getQueryString()}'/>" class="btn_000">LIST</a>
                  <a href="#" onclick="deleteNotice();" class="btn_000">DELETE</a>
                  <a href="<c:url value='/notice/modify${sc.getQueryString()}&nno=${nno}'/>" class="btn_000">MODIFY</a>
                  <a href="#" class="btn_000" onclick="showComment();">REPLY</a>
                </ul>
              </div>
            </div>
          <!-- //board_wrap -->
          </div>
        </form> <!-- //board_read_1002 -->

        <div class="xans-element- xans-board xans-board-commentpackage-1002 xans-board-commentpackage xans-board-1002 "><!-- 코멘트 리스트 -->
          <!-- 코멘트 페이징 -->
          <!-- 댓글 수정 -->
          <form id="commentForm" name="" action="" method="post" >
            <input id="board_no" name="board_no" value="" type="hidden">
            <input id="no" name="no" value="14" type="hidden">
            <input id="comment_no" name="comment_no" value="" type="hidden">
            <input id="member_id" name="member_id" value="" type="hidden">
            <div class="xans-element- xans-board xans-board-commentform-1002 xans-board-commentform xans-board-1002 ">
              <fieldset>
              <legend>댓글 수정</legend>
              <p>비밀번호  <input id="comment_password" name="comment_password" value="" type="password"> </p>
              <div class="view">
                <textarea id="comment_modify" name="comment_modify" style="border: 1px solid rgb(204, 204, 204);"></textarea>
                  <span class="submit">
                    <a href="#none" onclick="BOARD_COMMENT.comment_update_ok('commentForm');" class="btn_ccc_box">MODIFY</a>
                    <a href="#none" onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');" class="btn_ccc_box">CANCEL</a>
                  </span>
              </div>
              </fieldset>
            </div>
          </form>
        </div>
      </div>
    </div>


<%@ include file="includes/footer.jsp"%>