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
<link rel="stylesheet" href="<c:url value='/css/myShop/qna.css'/>">

<div id="contents_wrap">
  <div id="container">
    <div id="contents">
      <form id="BoardDelForm" name="" action="" method="post">
        <input id="no" name="no" value="" type="hidden">
        <div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
          <div class="board_wrap">
            <div class="board_top ">
              <ul class="left">
                <li class="subject">배송문의</li>
                <li class="writer">POSTED BY :  이화영  </li>
                <li class="etc">
                  <p class="">2018-06-24</p>
                </li>
              </ul>
              <ul class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 right ">
                <li>
                  <p><a href="/product/sample-product/11/">SAMPLE PRODUCT</a></p>
                  <p><a href="/product/sample-product/11/">78,000</a></p>
                </li>
                <li class="thubm">
                  <a href="">
                    <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/11_shop1_15297538936011.jpg" alt="">
                  </a>
                </li>
              </ul>
            </div>

            <div class="detail">
              <div class="fr-view fr-view-article">
                <span style="color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">크리에이티브 디자인 아이디오아지트</span>
                <br style="color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                <span style="color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">CREATIVE DESIGNI D5AGIT</span>
                <br style="color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                <a style="transition:0.3s; color: rgb(0, 0, 0); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: Go, Arial, &quot;malgun gothic&quot;, 맑은고딕, NanumGothic, dotum, 돋움, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; text-decoration: none; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px;" href="http://www.id5agit.com/">WWW.ID5AGIT.COM</a>
              </div>
            </div>
            <div class="board_footer ">
              <ul class="right">
                <a href="#" class="btn_000">LIST</a>
                <a href="#" onclick="" class="btn_000 ">DELETE</a>
                <a href="#" class="btn_000 ">MODIFY</a>
                <a href="#" class="btn_000 displaynone">ANSWER</a>
              </ul>
            </div>
          </div>
          <!-- //board_wrap -->
        </div>
      </form> <!-- //board_read_4 -->

      <div class="xans-element- xans-board xans-board-commentpackage-4 xans-board-commentpackage xans-board-4 "><!-- 코멘트 리스트 -->
        <!-- 코멘트 페이징 -->
        <!-- 댓글 수정 -->
        <form id="commentForm" name="" action="" method="post" style="display: none;">
          <input id="member_id" name="member_id" value="" type="hidden">
          <div class="xans-element- xans-board xans-board-commentform-4 xans-board-commentform xans-board-4 ">
            <fieldset>
              <legend>댓글 수정</legend>
              <p>비밀번호
                <input id="comment_password" name="comment_password" value="" type="password">
                <span class="secret displaynone">
                  <label>비밀댓글</label>
                </span>
              </p>
              <div class="view">
                <textarea id="comment_modify" name="comment_modify"></textarea>
                <span class="submit">
                  <a href="#" onclick="" class="btn_ccc_box">MODIFY</a>
                  <a href="#" onclick="" class="btn_ccc_box">CANCEL</a>
                </span>
              </div>
            </fieldset>
          </div>
        </form>
        <!-- 댓글 쓰기 -->
        <div class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 "><!-- 댓글권한 있음 -->
          <div class="displaynone">
            <fieldset>
              <legend>댓글 입력</legend>
              <p>
                <span class="displaynone">이름  </span>비밀번호
                <span class="secret displaynone">
                  <label>비밀댓글</label>
                </span>
                <a href="#" onclick="" class="displaynone btn_ccc_100">관리자 답변 보기</a>
              </p>
              <div class="view">
                <a href="#" onclick="" class="submit displaynone">
                  <img src="/web/upload/btn_comment_submit.gif" alt="확인">
                </a>
              </div>
              <p class="grade displaynone"></p>
              <p class="captcha displaynone">
                <span class="ec-base-help txtInfo">왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)</span>
              </p>
            </fieldset>
          </div>
          <!-- 댓글권한 없음 -->
          <div class="">
            <p>회원에게만 댓글 작성 권한이 있습니다.</p>
          </div>
        </div>
      </div>
    </div>

<%@ include file="includes/footer.jsp"%>