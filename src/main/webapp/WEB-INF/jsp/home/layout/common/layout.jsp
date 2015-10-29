<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>라이온스 홈페이지</title>
<%@ include file="/WEB-INF/jsp/home/common/stylesheet.jsp" %>
<%@ include file="/WEB-INF/jsp/home/common/javascriptHead.jsp" %>
</head>

<body>
	<div class="wrapper">
		<tiles:insertAttribute name="header" />
		
		<div class="content">
			<div class="primary">
				<tiles:insertAttribute name="top" />
				<tiles:insertAttribute name="body" />
			</div>
			<tiles:insertAttribute name="leftmenu" />
		</div>
		
		<tiles:insertAttribute name="footer" />
	</div>
</body>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("form").each(function(){
			$(this).append("<input type='hidden' id='pageIndex' name='pageIndex' value='${param.pageIndex == null ? 1 : param.pageIndex}' />");
		});
	});
});
</script>

</html>