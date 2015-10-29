<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#sessionYear").sessionYearCombo({
		 fixVal: "${MM6_08VO.sessionYear}"
		,top: false
		,isMobile: true
	});
	
	$("#month").monthCombo({
		  fixVal: "${MM6_08VO.month}"
		 ,top: false
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
#scroller table{
	width: 1200px;
}
-->
</style>
<!-- 내용 -->
<form:form modelAttribute="MM6_08VO" action="/m/MM6/MM6_1/MM6_08/listServicePersonal.do" data-ajax="false">
<div id="content">
	<h3><div>개인 납부금 현황</div></h3>

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
				<col width="120px" />
				<col width="150px" />
				<col width="150px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th class="fixed">부과일자</th>
					<th>수입분류항목</th>
					<th>수입세부항목</th>
					<th>부과금</th>
					<th>납부일</th>
					<th>납부금</th>
					<th>결손금</th>
					<th>미수금</th>
					<th>참고사항</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr style="${list.type eq 'B' ? 'background: #f2dcdb' : ''}">
						<c:choose>
							<c:when test="${list.rnum eq '1' }">
								<th class="center">
									<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
									<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
								</th>
								<td class="left" title="${list.classItemName }">${list.classItemName }</td>
								<td class="left" title="${list.detailItemName }">${list.detailItemName }</td>
								<td class="right"><fmt:formatNumber value="${list.impost }" pattern="#,###"/></td>
							</c:when>
							<c:otherwise>
								<th></th>
								<td></td>
								<td></td>
								<td></td>
							</c:otherwise>
						</c:choose>
						<td class="center">
							<fmt:parseDate var="paymentDate" value="${list.paymentDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${paymentDate }" pattern="yyyy.MM.dd" />
						</td>
						<td class="right"><fmt:formatNumber value="${list.payment }" pattern="#,###"/></td>
						<td class="right"><fmt:formatNumber value="${list.defect }" pattern="#,###"/></td>
						<c:choose>
							<c:when test="${list.rnum eq list.pcount or list.pcount eq '0'}">
								<td class="right"><fmt:formatNumber value="${list.balance }" pattern="#,###"/></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${list.rnum eq '1' }">
								<td class="left">${list.reference }</td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
				<tr>
					<th>합 계</th>
					<td></td>
					<td></td>
					<td class="right"><fmt:formatNumber value="${sum.impost }" pattern="#,###" /></td>
					<td></td>
					<td class="right"><fmt:formatNumber value="${sum.payment }" pattern="#,###" /></td>
					<td class="right"><fmt:formatNumber value="${sum.defect }" pattern="#,###" /></td>
					<td class="right"><fmt:formatNumber value="${sum.balance }" pattern="#,###" /></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>	
</div>
</form:form>
<!-- 내용 -->
