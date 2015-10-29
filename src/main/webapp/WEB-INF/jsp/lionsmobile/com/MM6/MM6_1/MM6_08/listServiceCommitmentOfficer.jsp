<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");

	$("#sessionYear").sessionYearCombo({
		 fixVal: "${MM6_08VO.sessionYear}"	// 고정값
		,top: false
		,isMobile: true
	});
	
	$("#month").monthCombo({
		 fixVal : "${MM6_08VO.month}"
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
<form:form modelAttribute="MM6_08VO" action="/m/MM6/MM6_1/MM6_08/listServiceCommitmentOfficer.do" data-ajax="false">
<div id="content">
	<h3><div>회원 납부금 현황</div></h3>
	
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

	<div class="table">
		<ul data-role="listview" data-inset="true">
			<c:set var="tempMemberNo" value="" />
			<c:forEach items="${resultList }" var="list">
				<c:if test="${tempMemberNo ne list.memberNo }">
					<li data-role="list-divider">${list.name }(${list.memberNo })</li>
				</c:if>
			    <li>
				    <h2>${list.detailItemName }</h2>
				    <p>
				    	부과금 : <fmt:formatNumber value="${list.impost }" pattern="#,###" />
				    	<c:if test="${list.dollarKind eq '$' }">
				    		(<fmt:formatNumber value="${list.impostDollar }" pattern="$ #,###" />)
				    	</c:if>
				    </p>
				    <p>
				    	납부금 : <fmt:formatNumber value="${list.payment }" pattern="#,###" />
				    	<c:if test="${list.dollarKind eq '$' }">
				    		(<fmt:formatNumber value="${list.paymentDollar }" pattern="$ #,###" />)
				    	</c:if>
			    	</p>
				    <p>
				    	결손금 : <fmt:formatNumber value="${list.defect }" pattern="#,###" />
				    	<c:if test="${list.dollarKind eq '$' }">
				    		(<fmt:formatNumber value="${list.defectDollar }" pattern="$ #,###" />)
				    	</c:if>
				    </p>
				    <p>
				    	미수금 : <fmt:formatNumber value="${list.balance }" pattern="#,###" />
				    	<c:if test="${list.dollarKind eq '$' }">
				    		(<fmt:formatNumber value="${list.balanceDollar }" pattern="$ #,###" />)
				    	</c:if>
				    </p>
			    </li>
			    <c:set var="tempMemberNo" value="${list.memberNo }" />
			</c:forEach>
		</ul>
	</div><!-- table -->
</div>
</form:form>