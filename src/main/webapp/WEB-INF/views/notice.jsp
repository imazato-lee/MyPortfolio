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
<c:set var="userId" value="${sessionScope.id}" />
<c:set var="userName" value="${sessionScope.name}" />
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
const userName = "${userName}"
const userId = "${userId}"
let pageNum = 1;

$(function(){
  // getCommentList();
  getCommentListWithPaging(pageNum);
  //댓글 추가
  $("#addComment").on("click",function(event){
    event.preventDefault();
    let comment = {
      nno : '<c:out value="${noticeDto.nno}"/>',
      comment : $("#comment").val(),
      commenter : userName
    }
    CommentService.add(comment,
        function(result){
          console.log(result)
          alert(result)
          // getCommentList()
          getCommentListWithPaging(pageNum)
          $("#comment").val('')
        },
        function(error){
          alert(error)
          console.log(result)
        })
  })
  //댓글 삭제
  $(".xans-board-commentlist").on("click","#commentDel",function(event){
    event.preventDefault();
    let comment = {
      cno : $(this).parent().data("cno"),
      nno : '<c:out value="${noticeDto.nno}"/>',
      commenter : userName
    }
    CommentService.remove(comment,
        function(result){
          alert(result)
          // getCommentList()
          getCommentListWithPaging(pageNum)
        },
        function(error){
          alert(error)
        })
  })
  //댓글 수정창 가져오기
  $(document).on("click", "#commentMod", function(event) {
    event.preventDefault();

    let commentModifyForm = $("#commentModifyForm");
    commentModifyForm.css("display", "block");
    let comment = $(this).closest('li').find('.comment');

    comment.append(commentModifyForm)
  })
  //댓글 수정
  $(document).on("click","#commentModify",function(event){
    event.preventDefault()
    let liElement = $(this).closest('li');
    let cno = liElement.data("cno");
    let comment = {
      comment : $("#comment_modify").val(),
      commenter : userName,
      cno : cno
    }

    CommentService.update(comment,
        function(result){
          alert(result)
          $("#commentModifyForm").css("display","none");
          $(".xans-board-commentlist").append($("#commentModifyForm"))
          // getCommentList()
          getCommentListWithPaging(pageNum)
        },
        function(error){
          alert(error)
        })
  })
  $(document).on("click","#commentModifyCancel",function(event){
    event.preventDefault()
    $("#commentModifyForm").css("display","none");
    $(".xans-board-commentlist").append($("#commentModifyForm"))
  })
  let commentPaging = $(".xans-comment-paging")
  commentPaging.on("click","a",function(e){
    e.preventDefault()
    console.log("page clicked")
    let targetPageNum = $(this).attr("href")
    console.log("targetPageNum: " + targetPageNum)
    pageNum = targetPageNum
    getCommentListWithPaging(pageNum)
  })

})
function showCommentPaging(commentCnt){
  let commentPaging = $(".xans-comment-paging")
  let naviSize = 10
  let totalPage = parseInt(Math.ceil(commentCnt / 10.0))
  let beginPage = (Math.floor((pageNum-1) / naviSize) * naviSize) + 1;
  let endPage = Math.min(beginPage + (naviSize-1),totalPage)
  let showPrev = beginPage !== 1
  let showNext = endPage !== totalPage
  let str = ""

  if(commentCnt !=null && commentCnt !==0){
    if(showPrev){
      str += '<a href="'+(beginPage-1)+'">PREV</a>'
    }
    str += '<ol>'
    for(let i = beginPage; i<= endPage; i++){
      let active = pageNum === i ? "active_list" : ""
      str += ' <li class="xans-record-"><a href="'+i+'" class="this">'+i+'</a></li>'
    }
    str += '</ol>'
    if(showNext){
      str += '<a href="'+(endPage+1)+'">NEXT</a>'
    }
    str += '</div>'
    console.log(str)
    commentPaging.html(str)
  }
}
function getCommentList(){
  CommentService.getList(
          {nno : '<c:out value="${noticeDto.nno}"/>'},
          function(list){
            console.log("list: " + list)
            showCommentList(list)
          },
          function(error){
            alert(error)
          })
}

function getCommentListWithPaging(pageNum){
  CommentService.getListWithPaging(
          { nno: '<c:out value="${noticeDto.nno}"/>', page: pageNum},
          function(commentCnt,list){
            console.log("list: " + list)
            showCommentList(list)
            showCommentPaging(commentCnt)
          },
          function(error){
            alert(error);
          })
}

function showCommentList(list){
  let str = "";
  let boardComment = $(".boardComment")
  if(list == null || list.length === 0){
    boardComment.html(str)
    return;
  }
  for (var i = 0, len = list.length || 0; i < len; i++) {
    if (i === 0) {
      str += '<li class="first xans-record-" data-cno="'+ list[i].cno+'">'
    } else {
      str += '<li class="xans-record-" data-cno="'+ list[i].cno+'">'
    }
    str += '<div class="commentTop">'
    str += '<strong class="name">'+list[i].commenter+'</strong>'
    str += '<span class="date">'+CommentService.displayTime(list[i].reg_date)+'</span>';
    str += '</div>'
    if(list[i].commenter === userName) {
      str += '<span class="button" data-cno="'+ list[i].cno+'">'
      str += '<a href="" id="commentMod" class="btn_ccc">MODIFY</a>'
      str += '<a href="" id="commentDel" class="btn_ccc">DELETE</a>'
      str += '</span>'
    }
    str += '<div class="comment">'
    str += '<span id="comment_contents">' + list[i].comment + '</span>'
    str += '</div>'
    str += '</li>'
  }

  boardComment.html(str);
}


</script>
  <div id="contents_wrap">
    <div id="container">
      <div id="contents">
        <form id="BoardDelForm">
          <input id="nno" name="nno" value="${param.nno}" type="hidden">
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
                  <a href="<c:url value='/notice/modify${sc.getQueryString()}&nno=${param.nno}'/>" class="btn_000">MODIFY</a>
<%--                  <a href="#" class="btn_000" onclick="viewCommentList();">REPLY</a>--%>
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