<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<form:form id="form_insert" modelAttribute="MM2_17VO" >
	<h3><div>미수금 - ${MM2_17VO.title } 조회</div></h3>
	
	<div class="popup_bg">
		<div class="tblTitle Scroll_Title">
			<table class="tblType2">
				<colgroup>
					<col width="70px" />
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>성명</th>
						<th>발생일자</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>금액</th>
						<th>참고사항</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div class="tblPopupH2" style="overflow-y:auto;height:360px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="70px" />
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${NotGetList}" var="list" varStatus="status">
						<tr>
							<td>${list.memberName}</td>
							<td>
								<fmt:parseDate var="genDate" value="${list.genDate}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left">${list.classItemName}</td>
							<td class="left">${list.detailItemName}</td>
							<td class="right">
								<fmt:formatNumber value="${list.realAmount }" pattern="#,###"/>
							</td>
							<td class="left" title="${lions:newline(list.inexDesc) }">${list.inexDesc}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- tblTitle -->
	
		<div class="tblTitle Scroll_Title">
			<table class="tblType2">
				<colgroup>
					<col width="70px" />
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="4">합계</th>
						<th class="right" colspan=""><fmt:formatNumber value="${NotGetSum.notGetSum}" /></th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->
	
		<div class="popupBtn">
			<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
		</div>
	</div><!-- popup -->
	
	<form:hidden path="memberNo" />
	<form:hidden path="organCode" value="${organCode}" />
</form:form>






