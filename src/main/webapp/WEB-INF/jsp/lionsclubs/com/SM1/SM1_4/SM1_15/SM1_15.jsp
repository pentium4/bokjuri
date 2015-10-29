<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${SM1_15VO.sessionYear}"	// 고정값
		});
	
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 4
			,searchable: true
			,fixVal: "${SM1_15VO.organCode}"
		});
		
		$(".btnCalculateConfirm").on("click", function(){
			var data = $(this).closest("tr").data();
			var caym = data.caym.toString();
			var month = caym.substring(4, 6);
			var params = [];
			params.push({name: "organCode", value: "${SM1_15VO.organCode}"});
			params.push({name: "sessionYear", value: "${SM1_15VO.sessionYear}"});
			params.push({name: "month", value: month});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/SM1/SM1_4/SM1_15/calculateConfirm.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1") {
						_search();
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});
		});
		
		$(".btnCalculateConfirmCancel").on("click", function(){
			var data = $(this).closest("tr").data();
			var caym = data.caym.toString();
			var month = caym.substring(4, 6);
			var params = [];
			params.push({name: "organCode", value: "${SM1_15VO.organCode}"});
			params.push({name: "sessionYear", value: "${SM1_15VO.sessionYear}"});
			params.push({name: "month", value: month});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/SM1/SM1_4/SM1_15/calculateConfirmCancel.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result) {
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});
		});
		
		$(".btnCalculateConfirmLock").on("click", function(){
			var data = $(this).closest("tr").data();
			var caym = data.caym.toString();
			var month = caym.substring(4, 6);
			var params = [];
			params.push({name: "organCode", value: "${SM1_15VO.organCode}"});
			params.push({name: "sessionYear", value: "${SM1_15VO.sessionYear}"});
			params.push({name: "month", value: month});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/SM1/SM1_4/SM1_15/calculateConfirmLock.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result) {
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});
		});	
		
		$(".btnCalculateConfirmLockCancel").on("click", function(){
			var data = $(this).closest("tr").data();
			var caym = data.caym.toString();
			var month = caym.substring(4, 6);
			var params = [];
			params.push({name: "organCode", value: "${SM1_15VO.organCode}"});
			params.push({name: "sessionYear", value: "${SM1_15VO.sessionYear}"});
			params.push({name: "month", value: month});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/SM1/SM1_4/SM1_15/calculateConfirmLockCancel.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1") {
						_search();
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});
		});			
		
		$("#btnSearch").on("click", function(){
			_search();
		});
	});
});

// 조회
function _search(){
	$("form").submit();
}
//-->
</script>

<form:form id="form_list" modelAttribute="SM1_15VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽인원 조회">
			<caption>클럽인원 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td><form:select path="organCode" cssClass="select required" caption="클럽코드" /></td>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select required" caption="회기선택" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" />
		</div>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="클럽인원 조회 안내표">
				<caption>클럽인원 조회</caption>
				<colgroup>
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="100px" />
					<col width="110px" />
					<col width="110px" />
					<col width="80px" />
					<col width="70px" />
					<col width="80px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>회기년월</th>
						<th>이월총잔액</th>
						<th>이월잔액</th>
						<th>이월정기예금</th>
						<th>이월회비미수금</th>
						<th>이월기타미수금</th>
						<th>정산일</th>
						<th>정산횟수</th>
						<th>정산확정일</th>
						<th>정산</th>
						<th>정산확정</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="100px" />
					<col width="110px" />
					<col width="110px" />
					<col width="80px" />
					<col width="70px" />
					<col width="80px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr data-caym="${list.caYm }">
							<td class="center">
								<fmt:parseDate var="caYm" value="${list.caYm }" pattern="yyyyMM" />
								<fmt:formatDate value="${caYm }" pattern="yyyy.MM" />						
							</td>
							<td class="right" title="<fmt:formatNumber value="${list.monthTotal}" pattern="#,###" />"><fmt:formatNumber value="${list.monthTotal}" pattern="#,###" /></td>
							<td class="right" title="<fmt:formatNumber value="${list.monthRemain}" pattern="#,###" />"><fmt:formatNumber value="${list.monthRemain}" pattern="#,###" /></td>
							<td class="right" title="<fmt:formatNumber value="${list.depositTotal}" pattern="#,###" />"><fmt:formatNumber value="${list.depositTotal}" pattern="#,###" /></td>
							<td class="right" title="<fmt:formatNumber value="${list.notIncome1000Total}" pattern="#,###" />"><fmt:formatNumber value="${list.notIncome1000Total}" pattern="#,###" /></td>
							<td class="right" title="<fmt:formatNumber value="${list.notIncomeEtcTotal}" pattern="#,###" />"><fmt:formatNumber value="${list.notIncomeEtcTotal}" pattern="#,###" /></td>
							<td class="center">
								<fmt:parseDate var="confirmDate" value="${list.confirmDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${confirmDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="right"><fmt:formatNumber value="${list.confirmCount}" pattern="#,###" /></td>
							<td class="center">
								<fmt:parseDate var="confirmLockDate" value="${list.confirmLockDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${confirmLockDate }" pattern="yyyy.MM.dd" />
							</td>
							<td>
								<c:if test="${list.confirmLockYn ne 'Y' and list.confirmYn ne 'Y' }">
									<img alt="정산처리" src="/images/lionsclubs/btn/btn_calc_deal.gif" class="btnCalculateConfirm pointer authorization write" />
								</c:if>
								<c:if test="${list.confirmLockYn ne 'Y' and list.confirmYn eq 'Y' }">
									<img alt="정산취소" src="/images/lionsclubs/btn/btn_calc_cancel.gif" class="btnCalculateConfirmCancel pointer authorization write" />
								</c:if>
							</td>
							<td>
								<c:if test="${list.confirmLockYn ne 'Y' and list.confirmYn eq 'Y' }">
									<img alt="정산확정" src="/images/lionsclubs/btn/btn_calc_lock.gif" class="btnCalculateConfirmLock pointer authorization write" />
								</c:if>							
								<c:if test="${list.confirmLockYn eq 'Y' and list.confirmYn eq 'Y' }">
									<img alt="정산확정취소" src="/images/lionsclubs/btn/btn_calc_lock_cancel.png" class="btnCalculateConfirmLockCancel pointer authorization write" />
								</c:if>							
							</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
		<!-- //Contents_Table_area -->
	</div>
</form:form>