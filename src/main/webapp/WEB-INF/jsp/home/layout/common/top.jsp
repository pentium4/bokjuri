<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<c:choose>
	<c:when test="${top eq 'ptContact' }">
		<img src="/images/home/top/${top }.png">
	</c:when>
	<c:otherwise>
		<img src="/images/home/top/pt${top }.png">
	</c:otherwise>
</c:choose>
