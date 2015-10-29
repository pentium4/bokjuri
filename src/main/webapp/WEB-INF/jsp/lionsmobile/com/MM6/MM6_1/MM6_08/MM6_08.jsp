<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 -->
<div id="content">
	<h3><div>납부금 현황</div></h3>
	<div data-role="body">
		<ul data-role="listview" data-inset="true">
			<li><a class="show-page-loading-msg" href="<c:url value="/m/MM6/MM6_1/MM6_08/listServicePersonal.do" />" target="_self">개인 납부금 현황</a></li>
			<li><a class="show-page-loading-msg" href="<c:url value="/m/MM6/MM6_1/MM6_08/listServiceMember.do" />" target="_self">회원 납부금 현황</a></li>
			<li><a class="show-page-loading-msg" href="<c:url value="/m/MM6/MM6_1/MM6_08/listServiceUnpaidMember.do" />" target="_self">회원 미납금 현황</a></li>
			<li><a class="show-page-loading-msg" href="<c:url value="/m/MM6/MM6_1/MM6_08/listServiceCommitmentOfficer.do" />" target="_self">회원 약정금/임원분담금 현황</a></li>
			<li><a class="show-page-loading-msg" href="<c:url value="/m/MM6/MM6_1/MM6_08/listClubExpend.do" />" target="_self">클럽 지출 현황</a></li>
		</ul>
	</div>
</div>
<!-- 내용 -->
