<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/20
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/css/myShop/qnaRegister.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
<script>
  var ckeditor_config = {
    enterMode : CKEDITOR.ENTER_BR.CKEDITOR,
    shiftEnterMode : CKEDITOR.ENTER_P,
    filebrowserUploadUrl:''
  }
</script>
<script>
  $(function(){
    let ino = '<c:out value="${itemDto.ino}"/>'
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
      $(".thumbnail").html(str);
    })

    $("#submitForm").on("click",function(e){
      e.preventDefault()
      if ($("#privacy_agree_radio0").prop("checked")){
        $("#qnaWriteForm").submit()
      } else {
        alert("개인정보 수집 및 이용 동의는 필수입니다.");
      }
    })
  })

</script>
<div id="contents_wrap">
  <div id="container">
    <div id="contents" style="width: 90%;">
      <div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 ">
        <div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
          <p class="title_text">
            <font color="333333">Q&amp;A</font>
          </p>
          <p class="imgArea"></p>
        </div>
        <form id="qnaWriteForm" action="<c:url value='/qna/write'/>" method="post">
          <input id="ino" name="ino" value="${itemDto.ino}" type="hidden">
          <div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
            <!-- 상품정보선택 -->
            <div class="ec-base-box typeProduct">
              <p class="thumbnail">
<%--                <a href="#">--%>
<%--                  <img id="iPrdImg" src="//ecudemo97964.cafe24.com/web/product/tiny/201806/15_shop1_15297539710464.jpg">--%>
<%--                </a>--%>
              </p>
              <div class="information">
                <p class="name"><a href="#" id="aPrdNameLink"><span id="sPrdName">${itemDto.itemName}</span></a></p>
                <p class="price"><span id="sPrdPrice">${itemDto.itemPrice}</span></p>
                <p class="button">
                  <span id="iPrdView" class=""><a href="<c:url value='/item/read${ic.getQueryString()}&ino=${itemDto.ino}'/>" id="aPrdLink" class="btn_ccc_100">상품상세보기</a></span>
                </p>
              </div>
            </div>
            <div class="ec-base-table typeWrite ">
              <table border="1" summary="">
                <caption>글쓰기 폼</caption>
                <colgroup>
                  <col style="width:150px;">
                  <col style="width:auto;">
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row">제목</th>
                    <td>
                      <select id="subject" name="title">
                        <option value="상품문의">상품문의</option>
                        <option value="배송문의">배송문의</option>
                        <option value="교환문의">교환문의</option>
                        <option value="반품문의">반품문의</option>
                        <option value="기타문의">기타문의</option>
                      </select>
                    </td>
                  </tr>
                  <tr class="">
                    <th scope="row">작성자</th>
                    <td>
                      <input id="writer" name="writer" class="inputTypeText" type="text" value="${sessionScope.name}" readonly></td>
                  </tr>
                  <tr style="height: 250px;">
                    <td colspan="2" class="clear">
                      <textarea id="content" name="content" style="width: 95%; height: 100%; border: none;"></textarea>
                    </td>
                  </tr>
                </tbody>
                <tbody>
                  <tr class="agree ">
                    <th scope="row">개인정보 수집 및 <br>이용 동의</th>
                    <td>
                        <textarea id="privacy_agreement" name="privacy_agreement">■ 개인정보의 수집·이용 목적
서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 회원관리 등을 위한 목적

■ 수집하려는 개인정보의 항목
이름, 주소, 연락처, 이메일 등

■ 개인정보의 보유 및 이용 기간
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외없이 해당정보를 파기합니다. </textarea><br>
                    개인정보 수집 및 이용에 동의하십니까? <input id="privacy_agree_radio0" type="radio"><label for="privacy_agree_radio0">동의함</label>
                    <input id="privacy_agree_radio1"  type="radio" checked="checked"><label for="privacy_agree_radio1">동의안함</label>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="ec-base-button">
              <span class="gLeft">
                <span class="">
                  <a href="#" onclick="" class="btn_ccc_100">관리자답변보기</a>
                </span>
                <a href="<c:url value='/item/read${ic.getQueryString()}&ino=${itemDto.ino}'/>" class="btn_ccc">LIST</a>
              </span>
              <span class="gRight">
                <a href="#" id="submitForm" class="btn_000">등록</a>
              </span>
            </div>
          </div>
        </form>
      </div>
    </div>
    <script>
      CKEDITOR.replace("content",ckeditor_config)
    </script>

<%@ include file="includes/footer.jsp"%>