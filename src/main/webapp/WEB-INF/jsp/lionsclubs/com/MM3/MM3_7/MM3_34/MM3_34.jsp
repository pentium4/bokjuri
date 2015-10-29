<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		//조회 버튼선택
		$("#btnSearch").on("click", function(){
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#organCode").val()
			});
			
			_search();
		});
		
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_34VO.organCode}"
		});
		
		
		$("#organCode").on("change", function(){
			$.saveOrganCode({
				 lvl: 3
				,organCode: $(this).val()
			});
		});		
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM3_34VO.sessionYear}"	// 고정값
		});
	});
});

function _search() {
	$("form").submit();
}
</script>
<form:form modelAttribute="MM3_34VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="임원분담금현황">
		<caption>임원분담금현황</caption>
		<colgroup>
			<col width="100px" />
			<col width="*" />
			<col width="100px" />
			<col width="41%" />
		</colgroup>
		<tbody>
		<tr>
			<th>조직코드</th>
			<td><form:select path="organCode" /></td>
			<th>회기선택</th>
			<td><form:select path="sessionYear" cssClass="select" /></td>
		</tr>
		</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" title="조회" class="pointer authorization read" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="클럽 지역지대 연결표">
				<caption>클럽 지역지대 연결</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>부여직책</th>
						<th>인원</th>
						<th>분담금</th>
						<th>인원</th>
						<th>납부금</th>
						<th>인원</th>
						<th>미납금</th>
						<th>인원</th>
						<th>결손금</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<caption>권한그룹 관리</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td class="left">${list.positionName }</td>
							<td><fmt:formatNumber value="${list.impostMemberCount}" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>	
							<td><fmt:formatNumber value="${list.paymentMemberCount}" pattern="#,###" /></td>	
							<td class="right"><fmt:formatNumber value="${list.payment }" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${list.paymentBalanceMemberCount}" pattern="#,###" /></td>	
							<td class="right"><fmt:formatNumber value="${list.balance }" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${list.paymentDefectMemberCount}" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
						
		<div class="Scroll_Title Height_0 ">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
					<col width="50px" />
					<col width="120px" />
				</colgroup>
				<tfoot>	
					<tr>
						<th colspan="2">계</th>
						<th class="right"><fmt:formatNumber value="${sum.impostMemberCount}" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sum.impost }" pattern="#,###" /></th>	
						<th class="right"><fmt:formatNumber value="${sum.paymentMemberCount}" pattern="#,###" /></th>	
						<th class="right"><fmt:formatNumber value="${sum.payment }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sum.paymentBalanceMemberCount}" pattern="#,###" /></th>	
						<th class="right"><fmt:formatNumber value="${sum.balance }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sum.paymentDefectMemberCount}" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sum.paymentDefect }" pattern="#,###" /></th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>