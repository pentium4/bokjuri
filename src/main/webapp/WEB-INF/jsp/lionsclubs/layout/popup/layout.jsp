<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta name="author" content="국제라이온스협회 업무통합관리시스템"/>
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
<meta name="keyword" content="국제라이온스협회 업무통합관리시스템"/>
<title>국제라이온스협회 업무통합관리시스템</title>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/stylesheet.jsp" %>
<link rel="stylesheet" href="<c:url value="/css/lionsclubs/content_sub.css" />" type="text/css" />
<%@ include file="/WEB-INF/jsp/lionsclubs/common/javascriptHead.jsp" %>
</head>
<body onLoad="window.focus()">

<div id="popup">
	<tiles:insertAttribute name="body" />
</div>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
	 	$(".hasDatepicker").mask("9999.99.99");
	 	$(".hasDatepicker").css("width", "80px");
		
	 	$(".tblPopupH2 tbody").each(function(){
	 		var tbody = $(this);
	 		if(tbody.find("tr").length == 0){
	 			var len = $(this).closest("table").find("thead th").length;
	 			$(this).html("<tr><td colspan=" + len + " class='center'>조회 내용이 없습니다.</td></tr>");
	 		}
	 	});
	 	
		$("form").each(function(){
			$(this).append("<input type='hidden' id='pageIndex' name='pageIndex' value='${param.pageIndex == null ? 1 : param.pageIndex}' />");
		});
		
		$(document).on("keypress", function(event){
			if ( event.which == 27 ) {
				closeWin();
				event.preventDefault();
			}
		});
	});
});
</script>
</body>
</html>