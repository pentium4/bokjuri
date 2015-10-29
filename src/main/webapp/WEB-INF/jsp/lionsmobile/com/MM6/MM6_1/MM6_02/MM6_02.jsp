<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 -->
<div id="content">
	<h3><div>클럽4역 조회(<c:out value="${clubInfo.clubName }" />)</div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽4역 기본사항 안내표">
			<caption>클럽4역 기본사항</caption>
			<colgroup>
				<col width="33%" />
				<col width="31%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직총회일</th>
					<th>헌장의밤</th>
					<th>국제본부No</th>
				</tr>
				<tr>
					<td class="center"><c:out value="${clubInfo.organMeeting }" /></td>
					<td class="center"><c:out value="${clubInfo.spotNight }" /></td>
					<td class="center"><c:out value="${clubInfo.registerNo }" /></td>
				</tr>
				<tr>
					<th>전화</th>
					<td colspan="2"><a href="tel:${clubInfo.tel }"><c:out value="${clubInfo.tel }" /></a></div></td>
				</tr>
				<tr>
					<th>팩스</th>
					<td colspan="2"><c:out value="${clubInfo.fax }" /></div></td>
				</tr>
				<tr>
					<th>월례회</th>
					<td colspan="2"><c:out value="${clubInfo.monthlyMeeting }" /></div></td>
				</tr>
				<tr>
					<th>이사회</th>
					<td colspan="2"><c:out value="${clubInfo.executiveMeeting }" /></div></td>
				</tr>
				<tr>
					<th>스폰스</th>
					<td colspan="2"><c:out value="${clubInfo.sponserClubName }" /></div></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	<br />	
	<c:forEach items="${memberList}" var="list" varStatus="status">
		<div class="table">
			<table class="tblType2" summary="클럽4역 기본사항 사진" >
				<colgroup>
					<col width="90px" />
					<col width="*" />
				</colgroup>
				<tbody>
				<tr>
					<td rowspan="4" class="Profile_img">
						<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.memPicFile}" onerror="this.src='/images/lionsclubs/mobile/photo.gif'" />
					</td>
					<td><c:out value="${list.name }" /></td>
				</tr>
				<tr>
					<td><c:out value="${list.lvlName }" /></td>
				</tr>
				<tr>
					<td><c:out value="${list.companyName }" />/<c:out value="${list.companyTitle }" /></td>
				</tr>
				<tr>
					<td><a href="tel:${list.mobile }"><c:out value="${list.mobile }" /></a></td>
				</tr>
			</table>
		</div><!-- table -->
	</c:forEach>			
</div>
<!-- 내용 -->
