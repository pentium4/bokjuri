<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");

	$("#sessionYear").sessionYearCombo({
		 fixVal: "${MM2_34VO.sessionYear}"	// 고정값
		,top: false
		,isMobile: true
	});
	
	$("#month").monthCombo({
		 fixVal : "${MM2_34VO.month}"
		,isMobile: true
	});
	
	$("#month").change(function(){
		_search();
	});
	
	var jsonHeadList = '${jsonHeadList}';
	var list = $.parseJSON(jsonHeadList);
	$("#scroller table").width(400 + list.length * 100);
});

function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM2_34VO" action="/m/MM6/MM6_1/MM6_08/listServiceUnpaidMember.do" data-ajax="false">
<div id="content">
	<h3><div>회원 미납금 현황</div></h3>
	
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
				<col width="100px" />
				<c:forEach items="${headList}">
					<col width="100px" />
				</c:forEach>
			</colgroup>
			<thead>
				<tr>
					<th class="fixed">성 명</th>
					<th class="fixed">합계</th>
					<c:forEach items="${headList}" var="list" varStatus="status">
						<th>${list.detailItemName}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<c:set var="colSum" value="0" />	
					<c:forEach items="${headList}" var="headList" varStatus="status">
						<c:set var="colSum" value="${colSum + list[headList.plusItemCode] }" />	
					</c:forEach>
					<tr>
						<th class="center">${list.memberName }</th>
						<th class="right"><fmt:formatNumber value="${colSum }" pattern="#,###"/></th>
						<c:forEach items="${headList}" var="headList" varStatus="status">
							<td class="right"><fmt:formatNumber value="${list[headList.plusItemCode] }" pattern="#,###" /></td>
						</c:forEach>
					</tr>
				</c:forEach>
				<tr>
					<c:set var="colTotSum" value="0" />
					<c:forEach items="${headList}" var="list" varStatus="status">
						<c:set var="colTotSum" value="${colTotSum + balanceSum[list.plusItemCode] }" />
					</c:forEach>
				
					<th>총계</th>
					<th class="right">
						<fmt:formatNumber value="${colTotSum}" pattern="#,###"/>
					</th>
											
					<c:forEach items="${headList}" var="list" varStatus="status">
						<td class="right">
							<fmt:formatNumber value="${balanceSum[list.plusItemCode] }" pattern="#,###"/>
						</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
</div>
</form:form>