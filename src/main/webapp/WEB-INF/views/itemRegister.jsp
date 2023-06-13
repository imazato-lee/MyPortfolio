<%--
  Created by IntelliJ IDEA.
  User: sehyeon
  Date: 2023/06/13
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="includes/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href='<c:url value="/css/myShop/itemRegister.css"/>'>
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
<script>
    var ckeditor_config = {
        enterMode : CKEDITOR.ENTER_BR.CKEDITOR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl:''
    }
</script>
<script>
    $(document).ready(function () {
        let regex = new RegExp("(.*\.(exe|zip|alz)$)");
        let maxSize = 5 * 1024 * 1024;

        function checkExtension(filename, fileSize) {
            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }
            if (regex.test(filename)) {
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }

        $("#uploadFile").on("change", function (e) {
            let formData = new FormData();
            let inputFile = $("#uploadFile");
            let files = inputFile[0].files;
            for (let i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }
            $.ajax({
                type: "post",
                url: "/uploadFileAjax",
                processData: false,
                contentType: false,
                data: formData,
                success: function (result) {
                    console.log(result);
                    showUploadResult(result);
                },
            });
        });

        function showUploadResult(result) {
            if (!result || result.length === 0) {
                return;
            }
            let uploadUL = $(".uploadResult ul");
            let str = "";
            $(result).each(function (i, obj) {
                if (obj.image) {
                    let fileCallPath = encodeURIComponent(
                        obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName
                    );
                    str += "<li data-path='" + obj.uploadPath + "'";
                    str += " data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "'>";
                    str += " <div>";
                    // str += " <span> " + obj.fileName + "</span>";
                    str += " <button type='button' data-file='" + fileCallPath + "' ";
                    str +=
                        " data-type='image' class='btn btn-warning btn-circle'><i class='fas fa-times'> </i></button><br>";
                    str += " <img src='/display?fileName=" + fileCallPath + "'>";
                    str += " </div>";
                    str += "</li>";
                } else {
                    let fileCallPath = encodeURIComponent(
                        obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName
                    );
                    str += "<li data-path='" + obj.uploadPath + "'";
                    str +=
                        " data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "'>";
                    str += " <div>";
                    str += " <span> " + obj.fileName + "</span>";
                    str += " <button type='button' data-file='" + fileCallPath + "' ";
                    str +=
                        " data-type='file' class='btn btn-warning btn-circle'><i class='fas fa-times'></i></button><br>";
                    str += " <img src='/images/attach.png'>";
                    str += " </div>";
                    str += "</li>";
                }
            });
            uploadUL.append(str);
        }
        $(".uploadResult").on("click", "li button", function (e) {
            console.log("delete file");
            let targetFile = $(this).data("file");
            let type = $(this).data("type");
            let targetLi = $(this).parent().closest("li");
            let attach = { fileName: targetFile, type: type };
            $.ajax({
                type: "delete",
                url: "/deleteFile",
                data: JSON.stringify(attach),
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    alert(result);
                    targetLi.remove();
                },
            });
        });
        $(".submit").on("click", function (e) {
            e.preventDefault();
            let formObj = $(".ItemRegisterForm");
            let str = "";
            $(".uploadResult ul li").each(function (i, listItem) {
                let liObj = $(listItem);
                console.log("-----------------------");
                console.log(liObj.data("fileName"));
                str += "<input type='hidden' name='attachList[" + i + "].filename' value='" + liObj.data("fileName") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + liObj.data("uuid") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uploadpath' value='" + liObj.data("path") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].filetype' value='" + liObj.data("type") + "'>";
            });
            console.log(str);
            formObj.append(str).submit();
        });
    })
</script>
<div id="contents_wrap">
    <div id="container">
        <div id="contents">
            <div class="titleArea">
                <h2>ITEM REGISTER</h2>
            </div>
            <form id="ItemRegisterForm" method="POST" action="<c:url value='/item/write'/>">
                <div class="xans-element- xans-member xans-member-join">
                    <div class="ec-base-box typeProduct uploadResult">
                        <ul>

                        </ul>
<%--                        <p class="thumbnail">--%>
<%--                            <a href="">--%>
<%--                                <img id="iPrdImg" src="/images/75x75.gif" alt="">--%>
<%--                            </a>--%>
<%--                        </p>--%>
                        <div class="information">
                            <p class="button">
                                <span class="">
                                    <!-- <a href="#" class="btn_ccc_100">상품정보선택</a> -->
                                    <input type="file" id="uploadFile" name="uploadFile">
                                </span>
                            </p>
                        </div>
                    </div>
                    <div class="ec-base-table typeWrite ">
                        <table border="1" summary="">
                            <caption>상품 기본정보</caption>
                            <colgroup>
                                <col style="width:150px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">카테고리
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td>
                                    <select id="category" name="category">
                                        <option value="">필수선택</option>
                                        <option value="OUTWEARS">OUTWEARS</option>
                                        <option value="TOPS">TOPS</option>
                                        <option value="BOTTOMS">BOTTOMS</option>
                                        <option value="BAG">BAG</option>
                                        <option value="SHOES">SHOES</option>
                                        <option value="ACCESSORIES">ACCESSORIES</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">상품명
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td><input id="itemName" name="itemName" placeholder="상품명을 입력하세요" value="" type="text" >
                                    <p class="text_guide"><span id="itemNameMsg"></span></p>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">가격
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td><input id="itemPrice" name="itemPrice" placeholder="가격 입력" value="" type="text">
                                    <p class="text_guide"><span id="itemPriceMsg"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">재고</th>
                                <td><input id="itemStock" name="itemStock" placeholder="재고량 입력(필수아님)" value="" type="text">
                                    <p class="text_guide"><span id="itemStockMsg"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">할인율</th>
                                <td><input id="itemDiscount" name="itemDiscount" placeholder="할인율 입력(필수아님)" value="" type="text">
                                    <p class="text_guide"><span id="itemDiscountlMsg"></span></p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">상품설명
                                    <img src="<c:url value='/images/ico_required.gif'/>">
                                </th>
                                <td>
                                    <textarea name ="itemContent" id="item_content" col="30" rows="10"></textarea>
                                    <p class="text_guide"><span id="itemContentMsg"></span></p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-button-center">
                        <a href="#" id="submit" class="btn_1000">SUBMIT</a>
                    </div>
                </div>
            </form>
        </div>
        <script>
            CKEDITOR.replace("item_content",ckeditor_config)
        </script>

<%@ include file="includes/footer.jsp"%>