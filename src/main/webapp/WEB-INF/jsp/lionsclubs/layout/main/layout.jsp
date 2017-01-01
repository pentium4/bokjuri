<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=dege;">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta name="author" content="복주리 봉사단"/>
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
<meta name="keyword" content="복주리 봉사단"/>
<title>개인 기본사항</title>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/stylesheet.jsp" %>
<link rel="stylesheet" href="<c:url value="/css/lionsclubs/content_main.css" />" type="text/css" />
<%@ include file="/WEB-INF/jsp/lionsclubs/common/javascriptHead.jsp" %>
</head>
<body>
<tiles:insertAttribute name="header" />

<hr/>

<tiles:insertAttribute name="body" />

<hr/>

<tiles:insertAttribute name="footer" />
</body>
</html>