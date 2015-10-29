<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 -->
<div id="content">
	<c:forEach items="${memberList}" var="list" varStatus="status">
		<c:if test="${list.tBoundNo == 0 && list.tClubFNo == 0 }"><h3><div><c:out value="${list.tAreaNo }지역" /></div></h3></c:if>
		<c:if test="${list.tBoundNo > 0 && list.tClubFNo == 0 }"><br /><h3><div><c:out value="${list.tAreaNo }지역 ${list.tBoundNo } 지대" /></div></h3></c:if>
	
		<div class="table">
			<table class="tblType2" summary="<c:out value="${MM6_03VO_PARAM.menuName } ${list.memberName } 기본사항 안내표" />">
				<colgroup>
					<col width="90px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<td rowspan="4" class="Profile_img">
							<c:choose>
								<c:when test="${list.picFile >='' }"><img src="<c:out value="${list.picFile}" />" alt="본인 사진"  onerror="this.src='/images/lionsclubs/mobile/photo.gif'" /></c:when>
								<c:otherwise><img src="/images/lionsclubs/mobile/photo.gif" alt="본인 사진"  onerror="this.src='/images/lionsclubs/mobile/photo.gif'" /></c:otherwise>
							</c:choose>
						</td>
						<td><c:out value="${list.memberName }" />(<c:out value="${list.tClubName }" />)</td>
					</tr>
					<tr>
						<td><c:out value="${list.tPos }" /></td>
					</tr>
					<tr>
						<td><c:out value="${list.tCoPos }" /></td>
					</tr>
					<tr>
						<td><a href="tel:${list.tPhone }"><c:out value="${list.tPhone }" /></a></td>
					</tr>
				</tbody>
			</table>
		</div><!-- table -->
	</c:forEach>		
</div>
