<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<form:form id="form_insert" modelAttribute="MM2_17VO" >
	<h3><div>정기예금 현황</div></h3>
	
	<div class="popup_bg">
		<div class="tblTitle Scroll_Title">
			<table class="tblType2">
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th>예금구분</th>
						<th>예금기간</th>
						<th>예금액</th>
						<th>만기금액</th>
						<th>금융기관</th>
						<th>예금주</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div class="tblPopupH2" style="overflow-y:auto;height:360px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<c:forEach items="${DepositList}" var="list" varStatus="status">
						<tr>
							<td>${list.kindName}</td>
							<td>
								<fmt:parseDate var="startDate" value="${list.startDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${startDate }" pattern="yyyy.MM.dd" />
								~
								<fmt:parseDate var="endDate" value="${list.endDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${endDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="right">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.realAmount}" />
							</td>
							<td class="right">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.expireAmount}" />
							</td>
							<td class="left">${list.financialIns}</td>
							<td class="left">${list.holder}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- tblTitle -->
	
		<div class="Scroll_Title">
			<table class="tblType2">
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">합계</th>
						<th class="right">
							<fmt:formatNumber value="${DepositSum.depositSum }" pattern="#,###"/>
						</th>
						<th class="right">
							<fmt:formatNumber value="${DepositSum.expireSum }" pattern="#,###"/>
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






