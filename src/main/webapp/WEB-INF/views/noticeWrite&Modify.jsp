<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <link rel="stylesheet" href="<c:url value='/css/myShop/noticeWrite&Modify.css'/>">

    <script>
        let page = ${sc.page};
        let pageSize = ${sc.pageSize};
        let option = "${sc.option}";
        let keyword = "${sc.keyword}";

        function formsubmit() {
            var form = $('#noticeWriteForm');

            var actionUrl = '/notice/write';
            if (${mode eq "modify"}) {
                actionUrl = '/notice/modify?page=' + page + '&pageSize=' + pageSize + '&option=' + option + '&keyword=' + keyword;
            }
            form.attr('action', actionUrl);

            $('#noticeWriteForm').submit();
        }
    </script>


<body>

    <div id="contents_wrap">
        <div id="container">
            <div id="contents">
                <div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 ">
                    <div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
                        <p class="title_text">
                            <font color="#555555">NOTICE</font>
                        </p>
                    </div>
                    <form id="noticeWriteForm" name="" method="post">
                        <input id="nno" name="nno" value="${mode eq 'modify' ? noticeDto.nno : ''}" type="hidden">
                        <div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
                            <div class="ec-base-table typeWrite ">
                                <table border="1" summary="">
                                    <caption>글쓰기 폼</caption>
                                    <colgroup>
                                        <col style="width:130px;">
                                        <col style="width:auto;">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">제목</th>
                                        <td><input id="subject" name="title" class="inputTypeText" placeholder="" maxlength="125" value="${mode eq 'modify' ? noticeDto.title : ''}" type="text"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">작성자</th>
                                        <td>세션에서 id 가져올 것</td>
                                    </tr>
                                    <tr style="
    border-bottom: 1px solid #dfdfdf;
">
                                        <th scope="row">작성일</th>
                                        <td>${mode eq 'modify' ? noticeDto.reg_date : ''}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="clear">
                                            <textarea style="width: 96%; border: none;" name="content" id="content" class="ec-fr-never-be-duplicated">${mode eq 'modify' ? noticeDto.content : ''}</textarea>

                                            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2306011209"></script>
                                            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2306011209"></script>
                                            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2306011209"></script>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="ec-base-button">
                                <span class="gLeft">
                                    <a href="<c:url value='/notice/list${sc.getQueryString()}'/>" class="btn_ccc">목록</a>
                                </span>
                                <span class="gRight">
                                    <a href="#" onclick="formsubmit()" class="btn_000">${mode eq 'modify' ? '수정' : '등록'}</a>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


<%@ include file="includes/footer.jsp"%>