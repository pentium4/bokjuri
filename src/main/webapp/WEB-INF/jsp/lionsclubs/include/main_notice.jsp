<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>	

<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$(".eventMemberPopup").on("click", function(){
			var idnNo = $(this).prop("id");
			openPopup('<c:url value="/MM2/MM2_5/MM2_29/eventMemberPopup.do?idnNo='+ idnNo +'" />', 800, 550, 'eventMemberPopup');
		});
		
		$(".eventMore").on("click", function(){
			var organCode = $(this).prop("id");
			location.href = "/MM2/MM2_5/MM2_29/MM2_29.do?menuId=373&organCode=" + organCode;
		});
		
		$('.event').each(function(){
			$(this).tooltipster({
			     content: $(this).html()
			    ,contentAsHTML: true
			});
		});
	});
});

function _search(){
	$("form").submit();
}
//-->
</script>

<div class="clfix">
	<div class="fL notice">
		<h3>클럽소식</h3>
		<table class="tblNotice table-fixed">
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="*" />
			<colgroup>
			<tbody>
				<c:forEach items="${clubEventList }" var="list">
					<tr id="${list.idnNo }" class="eventMemberPopup pointer">
						<td>
							<span class="date">
								<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							</span>
						</td>
						<td class="ellipsis event">
							${list.eventName }
							<c:if test="${not empty list.eventDesc }">
								(${list.eventDesc })
							</c:if>							
						</td>
						<td class="right ellipsis" title="${list.clubName } ${list.insertName } ${list.title }"><span class="writer">${list.clubName } ${list.insertName } ${list.title }</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="more">
			<img src="/images/lionsclubs/more.gif" id="${clubCode }" class="eventMore pointer" alt="클럽소식 더보기" />
		</div>
	</div><!-- notice -->

	<div class="fR notice">
		<h3>지구소식</h3>
		<table class="tblNotice table-fixed">
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="*" />
			<colgroup>
			<tbody>
				<c:forEach items="${districtEventList }" var="list">
					<tr id="${list.idnNo }" class="eventMemberPopup pointer">
						<td>
							<span class="date">
								<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							</span>
						</td>
						<td class="ellipsis event">
							${list.eventName }
							<c:if test="${not empty list.eventDesc }">
								(${list.eventDesc })
							</c:if>							
						</td>
						<td class="right ellipsis" title="${list.clubName } ${list.insertName } ${list.title }"><span class="writer">${list.clubName } ${list.insertName } ${list.title }</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="more">
			<img src="/images/lionsclubs/more.gif" id="${districtCode }" class="eventMore pointer" alt="지구소식 더보기" />
		</div>
	</div><!-- notice -->
</div><!-- clfix -->

<div class="clfix mt20">
	<div class="fL notice">
		<h3>복합지구</h3>
		<table class="tblNotice table-fixed">
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="*" />
			<colgroup>
			<tbody>
				<c:forEach items="${complexEventList }" var="list">
					<tr id="${list.idnNo }" class="eventMemberPopup pointer">
						<td>
							<span class="date">
								<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							</span>
						</td>
						<td class="ellipsis event">
							${list.eventName }
							<c:if test="${not empty list.eventDesc }">
								(${list.eventDesc })
							</c:if>							
						</td>
						<td class="right ellipsis" title="${list.clubName } ${list.insertName } ${list.title }"><span class="writer">${list.clubName } ${list.insertName } ${list.title }</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="more">
			<img src="/images/lionsclubs/more.gif" id="${complexCode }" class="eventMore pointer" alt="복합지구 더보기" />
		</div>
	</div><!-- notice -->

	<div class="fR notice">
		<h3>연합회</h3>
		<table class="tblNotice table-fixed">
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="*" />
			<colgroup>
			<tbody>
				<c:forEach items="${associationEventList }" var="list">
					<tr id="${list.idnNo }" class="eventMemberPopup pointer">
						<td>
							<span class="date">
								<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
							</span>
						</td>
						<td class="ellipsis event">
							${list.eventName }
							<c:if test="${not empty list.eventDesc }">
								(${list.eventDesc })
							</c:if>							
						</td>
						<td class="right ellipsis" title="${list.clubName } ${list.insertName } ${list.title }"><span class="writer">${list.clubName } ${list.insertName } ${list.title }</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="more">
			<img src="/images/lionsclubs/more.gif" id="${associationCode }" class="eventMore pointer" alt="연합회 더보기" />
		</div>
	</div><!-- notice -->
</div><!-- clfix -->


<div class="notice2" style="display: none;">
	<h3>공지사항</h3>
	<table class="tblNoticeBox">
	<colgroup>
		<col width="15px" />
		<col width="*" />
		<col width="15px" />
	<colgroup>
	<tr>
		<td class="left_bg">&nbsp;</td>
		<td class="center_bg">
			<table class="tblNotice2">
			<colgroup>
				<col width="*" />
				<col width="150px" />
				<col width="90px" />
			<colgroup>
			<tr>
				<td><span class="official">봉사활동 실시 안내</span></td>
				<td><span class="writer">울산클럽원 홍길동 총무</span></td>
				<td class="right"><span class="date">2014.02.25</span></td>
			</tr>
			<tr>
				<td><span class="text">봉사활동 실시 안내</span></td>
				<td><span class="writer">울산클럽원 홍길동 총무</span></td>
				<td class="right"><span class="date">2014.02.25</span></td>
			</tr>
			<tr>
				<td><span class="text">봉사활동 실시 안내</span></td>
				<td><span class="writer">울산클럽원 홍길동 총무</span></td>
				<td class="right"><span class="date">2014.02.25</span></td>
			</tr>
			<tr>
				<td><span class="text">봉사활동 실시 안내</span></td>
				<td><span class="writer">울산클럽원 홍길동 총무</span></td>
				<td class="right"><span class="date">2014.02.25</span></td>
			</tr>
			<tr>
				<td><span class="text">봉사활동 실시 안내</span></td>
				<td><span class="writer">울산클럽원 홍길동 총무</span></td>
				<td class="right"><span class="date">2014.02.25</span></td>
			</tr>
			</table>
		</td>
		<td class="right_bg">&nbsp;</td>
	</tr>
	</table>
	<div class="more">
		<a href="/"><img src="/images/lionsclubs/more.gif"alt="공지사항 더보기" /></a>
	</div>
</div><!-- 공지사항 -->
