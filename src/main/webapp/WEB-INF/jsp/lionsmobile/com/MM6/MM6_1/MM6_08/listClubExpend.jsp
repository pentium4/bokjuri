<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");

	$("#sessionYear").sessionYearCombo({
		 fixVal: "${MM2_15VO.sessionYear}"	// 고정값
		,top: false
		,isMobile: true
	});
	
	$("#month").monthCombo({
		 fixVal : "${MM2_15VO.month}"
		,isMobile: true
	});
	
	$("#month").change(function(){
		_search();
	});
});

function _search(){
	$("form").submit();
}
</script>
<style>
<!--
.tblType2 {
	width: 1200px;
}
-->
</style>
<form:form modelAttribute="MM2_15VO" action="/m/MM6/MM6_1/MM6_08/listClubExpend.do" data-ajax="false">
<div id="content">
	<h3><div>클럽 지출 현황</div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" /></td>
				</tr>
				<tr>
					<th>월</th>
					<td><form:select path="month" /></td>
				</tr>	
			</tbody>
		</table>
	</div><!-- table -->
	<div class="table component">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="*" />
				<col width="100px" />
			</colgroup>
			<thead>
				<tr>
					<th class="fixed">지출일자</th>
					<th>지출분류항목</th>
					<th>지출세부항목</th>
					<th>금액</th>
					<th>지출내용(참고사항)</th>
					<th>입력일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<c:set var="fStyle" value="" />
					<c:choose>
						<c:when test="${list.classItemCode eq '1040' and not empty list.moneyIdnNo}">
							<c:set var="fStyle" value="color:green" />
						</c:when>
						<c:when test="${list.classItemCode eq '1160' and not empty list.moneyIdnNo}">
							<c:set var="fStyle" value="color:blue" />
						</c:when>
						<c:when test="${list.classItemCode eq '1110' and not empty list.moneyIdnNo}">
							<c:set var="fStyle" value="color:#FF00FF" />
						</c:when>
						<c:when test="${list.classItemCode eq '1120' and not empty list.moneyIdnNo}">
							<c:set var="fStyle" value="color:tomato" />
						</c:when>
					</c:choose>
					<tr data-classitemcode="${list.classItemCode }" data-moneyidnno="${list.moneyIdnNo }">
						<th class="center" style="${fStyle}">
							<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display:none;" />
							<fmt:parseDate var="inexDate" value="${list.inexDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${inexDate }" pattern="yyyy.MM.dd" />
						</th>
						<td class="left" style="${fStyle}">${list.classItemName }</td>
						<td class="left" style="${fStyle}" title="${list.detailItemName }">${list.detailItemName }</td>
						<td class="right" style="${fStyle}">
							<fmt:formatNumber value="${list.amount }" pattern="#,###"/>
						</td>
						<td class="left" style="${fStyle}" title="${lions:newline(list.inexDesc) }">${list.inexDesc }</td>
						<td class="center" style="${fStyle}">
							<fmt:parseDate var="incomeInsertDate" value="${list.incomeInsertDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${incomeInsertDate }" pattern="yyyy.MM.dd" />
						</td>
					</tr>	
				</c:forEach>			
			</tbody>
		</table>	
	</div><!-- table -->
</div>
</form:form>