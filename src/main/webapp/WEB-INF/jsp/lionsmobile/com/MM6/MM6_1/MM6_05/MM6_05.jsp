<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!-- 내용 -->
<div id="content">
	<h3 data-position="fixed"><div>${yearTitle }회기&nbsp;회장</div></h3>
	<c:forEach items="${memberList}" var="list" varStatus="status">
		<div class="table">
			<table class="tblType2" summary="회기별회장 사진" >
				<colgroup>
					<col width="90px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<td rowspan="4" class="Profile_img">
							<c:choose>
								<c:when test="${list.memPicFile > '' }"><img src="<c:out value="${list.memPicFile}" />" alt="본인 사진"  onerror="this.src='/images/lionsclubs/mobile/photo.gif'" /></c:when>
								<c:otherwise><img src="/images/lionsclubs/mobile/photo.gif" alt="본인 사진"  onerror="this.src='/images/lionsclubs/mobile/photo.gif'" /></c:otherwise>
							</c:choose>
						</td>
						<td><c:out value="${list.name }" /></td>
					</tr>
					<tr>
						<td><c:out value="${list.sectorClub}" /></td>
					</tr>
					<tr>
						<td><c:out value="${list.companyName }" />/<c:out value="${list.companyTitle }" /></td>
					</tr>
					<tr>
						<td><a href="tel:${list.mobile }"><c:out value="${list.mobile }" /></a></td>
					</tr>
				</tbody>
			</table>
		</div><!-- table -->
	</c:forEach>	
</div>
<!-- 내용 -->