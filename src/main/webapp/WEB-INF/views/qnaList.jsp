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
              <tr class="xans-record-">
                <td> 6</td>
                <td class="thumb left"><a href="/product/$1/$2/"><span></span></a></td>
                <td class="displaynone"></td>
                <td class="subject left txtBreak">
                  <span class="displaynone">
                    <a href="#" onclick="">
                      <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기">
                    </a>
                  </span>
                  <a href="">기타문의</a>
                  <span class="txtEm"></span>
                </td>
                <td>아영</td>
                <td class=""><span class="txtNum">2018-06-24</span></td>
              </tr>
              <tr class="xans-record-">
                <td> 5</td>
                <td class="thumb left">
                  <a href="/product/sample-product/11/">
                    <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/11_shop1_15297538936011.jpg" border="0" alt="">
                    <span>SAMPLE PRODUCT</span>
                  </a>
                </td>
                <td class="displaynone"></td>
                <td class="subject left txtBreak">
                  <span class="displaynone">
                    <a href="#" onclick="">
                      <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기">
                    </a>
                  </span>
                  <a href="">배송문의</a>
                  <span class="txtEm"></span>
                </td>
                <td>이화영</td>
                <td class=""><span class="txtNum">2018-06-24</span></td>
                <td class="displaynone"><span class="txtNum">97</span></td>
                <td class="displaynone"><span class="txtNum">0</span></td>
                <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"></td>
              </tr>
              <tr class="xans-record-">
                <td> 4</td>
                <td class="thumb left">
                  <a href="/product/sample-product/12/">
                    <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/12_shop1_15297539280848.jpg" border="0" alt="">
                    <span>SAMPLE PRODUCT</span>
                  </a>
                </td>
                <td class="displaynone"></td>
                <td class="subject left txtBreak">
                  <span class="displaynone">
                    <a href="#" onclick="">
                      <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기">
                    </a>
                  </span>
                  <a href="#">상품문의</a><span class="txtEm"></span>
                </td>
                <td>김하늘</td>
                <td class=""><span class="txtNum">2018-06-24</span></td>
                <td class="displaynone"><span class="txtNum">75</span></td>
                <td class="displaynone"><span class="txtNum">0</span></td>
                <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"></td>
              </tr>
              <tr class="xans-record-">
                <td> 3</td>
                <td class="thumb left">
                  <a href="#">
                    <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/16_shop1_15297539878515.jpg" border="0" alt="">
                    <span>SAMPLE PRODUCT</span>
                  </a>
                </td>
                <td class="displaynone"></td>
                <td class="subject left txtBreak">
                  <span class="displaynone">
                    <a href="#" onclick="">
                      <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기">
                    </a>
                  </span>
                  <a href="#">상품문의</a> <span class="txtEm"></span>
                </td>
                <td>환이</td>
                <td class=""><span class="txtNum">2018-06-24</span></td>
                <td class="displaynone"><span class="txtNum">67</span></td>
                <td class="displaynone"><span class="txtNum">0</span></td>
                <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"></td>
              </tr>
              <tr class="xans-record-">
                <td> 2</td>
                <td class="thumb left"><a href="/product/$1/$2/"><span></span></a></td>
                <td class="displaynone"></td>
                <td class="subject left txtBreak">
                  <span class="displaynone">
                    <a href="#" onclick="">
                      <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기">
                    </a>
                  </span>
                  <a href="#">상품문의</a> <span class="txtEm"></span>
                </td>
                <td>대이영</td>
                <td class=""><span class="txtNum">2018-06-24</span></td>
                <td class="displaynone"><span class="txtNum">44</span></td>
                <td class="displaynone"><span class="txtNum">0</span></td>
                <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"></td>
              </tr>
              <tr class="xans-record-">
                <td> 1</td>
                <td class="thumb left">
                  <a href="#">
                    <img src="//ecudemo97964.cafe24.com/web/product/tiny/201806/15_shop1_15297539710464.jpg" border="0" alt="">
                    <span>SAMPLE PRODUCT</span>
                  </a>
                </td>
                <td class="displaynone"></td>
                <td class="subject left txtBreak">
                  <span class="displaynone">
                    <a href="#" onclick="">
                      <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기">
                    </a>
                  </span>
                  <a href="#">상품문의</a> <span class="txtEm"></span>
                </td>
                <td>김이설</td>
                <td class=""><span class="txtNum">2018-06-24</span></td>
                <td class="displaynone"><span class="txtNum">75</span></td>
                <td class="displaynone"><span class="txtNum">0</span></td>
                <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"></td>
              </tr>
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
                  <select id="search_key" name="search_key">
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="writer_name">글쓴이</option>
                    <option value="member_id">아이디</option>
                    <option value="nick_name">별명</option>
                    <option value="product">상품정보</option>
                  </select>
                  <input id="search" name="search" class="inputTypeText" placeholder="" value="" type="text">
                  <a href="#" onclick="">SEARCH</a>
                </p>
              </fieldset>
            </div>
          </form>
          <div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  ">
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