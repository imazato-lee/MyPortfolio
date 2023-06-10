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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/js/CommentService.js" />"></script>
<link rel="stylesheet" href="<c:url value='/css/myShop/notice.css'/>">
<script>
  //notice용 script
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
<script>
//comment용 script
var rno;
$(function(){
  getCommentList();
  function getCommentList(){
    CommentService.getList(
            {nno : '<c:out value="${noticeDto.nno}"/>'},
            function(list){
              console.log("list: " + list)
              // showCommentList(list)
            },
            function(error){
              alert(error)
            }
    )
  }
  $("#addComment").on("click",function(){
    let comment = {
      nno : '<c:out value="${noticeDto.nno}"/>',
      comment : $("#comment").val(),
      commenter : '<%= session.getAttribute("id") %>'
    }
    ReplyService.add(comment,
        function(result){
          alert(result)

        },
        function(error){
          alert(error)
        })
  })



})


function showComment() {
  let boardComment = $(".boardComment")
  boardComment.toggle();
}

</script>
  <div id="contents_wrap">
    <div id="container">
      <div id="contents">
        <form id="BoardDelForm">
          <input id="nno" name="nno" value="${noticeDto.nno}" type="hidden">
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
        </form>
        <div class="xans-element- xans-board  xans-board-commentpackage">
          <!-- 코멘트 리스트 -->
          <div class="xans-element- xans-board xans-board-commentlist">
            <ul class="boardComment">
              <li class="first  xans-record-">
                <div class="commentTop">
                  <strong class="name">  이세현</strong>
                  <span class="date">2023-06-10</span>
                </div>
                <span class="button">
                  <a href="" onclick="" class="btn_ccc">MODIFY</a>
                  <a href="" onclick="" class="btn_ccc">DELETE</a>
                </span>
                <div class="comment">
                  <span id="comment_contents">comment</span></div>
              </li>
            </ul>
          </div>
          <!-- 코멘트 페이징 -->
          <!-- 댓글 수정 -->
          <div id="commentModifyForm">
            <div class="xans-element- xans-board xans-board-commentform-4 xans-board-commentform xans-board-4">
              <fieldset>
                <legend>댓글 수정</legend>
                <div class="view">
                  <textarea id="comment_modify" name="comment_modify"></textarea>
                  <span class="submit">
                    <a href="#" id="commentModify" class="btn_ccc_box">MODIFY</a>
                    <a href="#" id="commentModifyCancel" class="btn_ccc_box">CANCEL</a>
                  </span>
                </div>
              </fieldset>
            </div>
          </div>
          <!-- 댓글 쓰기 -->
          <div id="commentWriteForm">
            <div class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 "><!-- 댓글권한 있음 -->
              <div class="">
                <fieldset>
                  <legend>댓글 입력</legend>
                  <p>
                    <span class="">이름  <input id="comment_name" name="comment_name" class="inputTypeText" placeholder="" value="" type="text">
                  </p>
                  <div class="view">
                    <textarea id="comment" name="comment" ></textarea><a href="#" id="addComment" class="submit btn_ccc_box">확인</a>
                  </div>
                </fieldset>
              </div>
            <!-- 댓글권한 없음 -->
              <div class="displaynone">
                <p>회원에게만 댓글 작성 권한이 있습니다.</p>
              </div>
            </div>
          </div>
    </div>


<%@ include file="includes/footer.jsp"%>