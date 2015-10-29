<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 -->
<div id="content">
	<h3><div>지구임원조회</div></h3>
<div data-role="body">
	<ul data-role="listview" data-inset="true">
		<c:forEach items="${menuList}" var="list" varStatus="status">
			<li><a href="<c:url value="/m/MM6/MM6_1/MM6_03/selectList.do?menuName=${list.menuName }" />" target="_self"><c:out value="${list.menuName }" /></a></li>
		</c:forEach>
	</ul>
</div>
</div>
<!-- 내용 -->
