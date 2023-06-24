<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $("#searchForm").on("click",function(e){
        e.preventDefault()
        let searchBarForm = $("#searchBarForm")
        let keyword = $("#keyword").val()
        let action = "/item/list?option=key&keyword=" + encodeURIComponent(keyword);
        searchBarForm.attr("action",action)
        searchBarForm.submit();
    })
</script>
<div id="footer_title">SHOPPING MALL</div>

<div id="footer">
    <div class="xans-element- xans-layout xans-layout-footer footer ">
        <ul class="xans-element- xans-layout xans-layout-info footer_cs ">
            <li>
                <pre>010-3807-9099　Mon-Fri: 11am-6pm　Sat.Sun.Holiday OFF
    　All copyrights  : ID5AGIT</pre>
            </li>
        </ul>
        <ul class="sns_list">
            <a href="#" target="blank_">Instagram</a>
        </ul>
        <form id="searchBarForm" method="get">
            <ul class="xans-element- xans-layout xans-layout-searchheader ">
                <li>
                    <fieldset>
                        <legend>검색</legend>
                        <input type="hidden" name="option" value="key">
                        <input id="keyword" name="keyword" class="inputTypeText" placeholder="Search" value="" type="text">
                        <input type="image" id="searchForm" src="<c:url value='/images/ico_search.png'/>" width="15px" height="15px" alt="검색">&nbsp;
                    </fieldset>
                </li>
            </ul>
        </form>
        <ul class="shop_info">
            <br>
            <a href="#">Agreement</a>　
            <a href="#">Guide</a>　
            <a href="#">Privacy</a>
        </ul>
    </div>
</div>
</div>
</div> <!-- #wrap -->




</html>