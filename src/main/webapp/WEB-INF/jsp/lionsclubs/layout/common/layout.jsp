<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	if(request.getProtocol().equals("HTTP/1.1")) {
	    response.setHeader("Cache-Control", "no-cache");
	}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><lions:menutitle menuId="${param.menuId }" kind="title" /></title>
<%--
<!--[if lt IE 9]>
<script src="<c:url value="/js/lionsclubs/html5/html5shiv-printshiv.js" />"></script>
<![endif]-->
 --%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/stylesheet.jsp" %>
<link rel="stylesheet" href="<c:url value="/css/lionsclubs/content_sub.css" />" type="text/css" />
<%@ include file="/WEB-INF/jsp/lionsclubs/common/javascriptHead.jsp" %>
</head>
<body>
<h2 class="blind">스킵네비게이션</h2>
<tiles:insertAttribute name="skipnavi" />

<h2 class="blind">탑메뉴</h2>
<tiles:insertAttribute name="header" />

<!-- Wrap_Area -->
<div id="Wrap">
	<!-- LNB_Area -->
	<tiles:insertAttribute name="leftmenu" />
	<!-- //LNB_Area -->

	<!-- Contents_Table_area -->
	<div id="Contetns_Area">
	<div id="position">
		<h2 class="blind">메뉴 경로</h2>
		<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>개인 기본사항</span></p>
	</div>
			
	<tiles:insertAttribute name="body" />
	
	<tiles:insertAttribute name="message" />
	</div>
	<!-- //Contents_Table_area -->
</div>
<!-- Wrap_Area -->


<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
	 	$(".hasDatepicker").mask("9999.99.99");
	 	$(".hasDatepicker").css("width", "90px");

	 	$(".hasMonthpicker").mask("9999.99");
	 	$(".hasMonthpicker").css("width", "60px");
	 	
	 	$(".table").each(function(){
	 		var tbody = $(this).find("tbody");
	 		if(tbody.find("tr").length == 0){
	 			var len = $(this).find("thead th").length;
	 			$(this).find("tbody").html("<tr><td colspan=" + len + " class='center'>조회 내용이 없습니다.</td></tr>");
	 		}
	 	});
	 	
		$("form").each(function(){
			$(this).append("<input type='hidden' id='menuId' name='menuId' value='${param.menuId}' />");
			$(this).append("<input type='hidden' id='pageIndex' name='pageIndex' value='${param.pageIndex == null ? 1 : param.pageIndex}' />");
		});
		
		var menu1 = "${menuAuthorization.menu1 }";
		var menu2 = "${menuAuthorization.menu2 }";
		var menu3 = "${menuAuthorization.menu3 }";
		GLNB_Select(menu1 == 0 ? 0 : menu1 - 1,menu2 == 0 ? 0 : menu2 - 1,menu3 == 0 ? 0 : menu3 - 1);	
	});
});

</script>
</body>
</html>