<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<form:form id="form_insert" modelAttribute="MM2_17VO" >
	<h3><div>수입항목 - ${MM2_17VO.title } 조회</div></h3>

	<div class="popup_bg">
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2">
				<colgroup>
					<col width="80px" />
					<col width="60px" />
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
					<col width="*" />
					<col width="90px" />
				</colgroup>
				<thead>
					<tr>
						<th>부과일자</th>
						<th>이름</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>금액</th>
						<th>수입내용(참고사항)</th>
						<th>납부일자</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div class="tblPopupH2" style="overflow-y:auto;height:360px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="60px" />
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
					<col width="*" />
					<col width="90px" />
				</colgroup>
				<tbody>
					<c:forEach items="${IncomeList}" var="list" varStatus="status">
						<tr>
							<td>
								<fmt:parseDate var="inexDate" value="${list.inexDate}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${inexDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left">${list.memberName}</td>
							<td class="left">${list.classItemName}</td>
							<td class="left">${list.detailItemName}</td>
							<td class="right">
								<fmt:formatNumber value="${list.realAmount }" pattern="#,###"/>
							</td>
							<td class="left" title="${lions:newline(list.inexDesc) }">${list.inexDesc}</td>
							<td>
								<fmt:parseDate var="incomeInsertDate" value="${list.incomeInsertDate}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${incomeInsertDate }" pattern="yyyy.MM.dd" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- tblTitle -->
	
		<div class="Scroll_Title Height_0">
			<table class="tblType2">
				<colgroup>
					<col width="80px" />
					<col width="60px" />
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
					<col width="*" />
					<col width="90px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="4">합계</th>
						<th class="right">
							<fmt:formatNumber value="${IncomeSum.incomeSum }" pattern="#,###"/>
						</th>
						<th></th>
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






