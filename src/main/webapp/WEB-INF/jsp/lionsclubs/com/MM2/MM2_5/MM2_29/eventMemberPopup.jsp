<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<style>
<!--
#eventClubList tbody tr{
	cursor: pointer;
}

ul li{
	margin-left: 20px;
	display: inline;
}
-->
</style>
<form:form id="MM2_29VO" modelAttribute="MM2_29VO">
	<h3><div>행사인원 조회</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="300px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>행사일자</th>
					<td>
						<fmt:parseDate var="eventStartDate" value="${detail.eventStartDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
						~
						<fmt:parseDate var="eventEndDate" value="${detail.eventEndDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
					</td>
					<th>행사시간</th>
					<td>${detail.eventStartTime } ~ ${detail.eventEndTime }</td>
				</tr>			
				<tr>
					<th>행사명</th>
					<td>${detail.eventName }</td>				
					<th>행사내용</th>
					<td>${detail.eventDesc }</td>
				</tr>
				<tr>
					<th>행사주최</th>
					<td>${detail.organName }</td>
					<th>마감</th>
					<td>${detail.finishYn }</td>
				</tr>
			</tbody>
		</table>
		
		<h4>행사 인원</h4>
			
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup" summary="회원검색표">
				<caption>회원검색</caption>
				<colgroup>
					<col width="280px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>클럽명</th>
						<th>참가구분</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>시간</th>
						<th>점수</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="eventMemberList" class="tblPopupH2" style="height: 280px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="280px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList }" var="list">
						<tr>
							<td class="left">${lions:formatOrganCode(list.clubCode)} ${list.clubName }</td>
							<td class="center">${list.kindName }</td>
							<td class="center">${list.memberNo }</td>
							<td class="center">${list.name }</td>
							<td class="right"><fmt:formatNumber value="${list.time }" pattern="#,###.##" /></td>
							<td class="right"><fmt:formatNumber value="${list.score }" pattern="#,###.##" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- tblInner -->		
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup" summary="회원검색표">
				<caption>회원검색</caption>
				<colgroup>
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th>
							<ul>
								<li>
									총 봉사시간 : <span id="time"><fmt:formatNumber value="${eventMemberTotal.time }" pattern="#,###.##" /></span>
								</li>
								<li>
									봉사점수 : <span id="score"><fmt:formatNumber value="${eventMemberTotal.score }" pattern="#,###.##" /></span>
								</li>
								<li>
									참가인원 : <span id="memberCnt"><fmt:formatNumber value="${eventMemberTotal.memberNoCnt }" pattern="#,###" /></span>
								</li>
							</ul>
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>