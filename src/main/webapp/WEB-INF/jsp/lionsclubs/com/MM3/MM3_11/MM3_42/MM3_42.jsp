<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_42VO.sessionYear}"	// 고정값
			,top:false
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_42VO.organCode}"
		});

		$("#organCode").on("change", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $(this).val()
			});
		});
		
		$("#btnCalculateConfirm").on("click", function(){
			var params = [];
			params.push({name: "organCode", value: "${MM3_42VO.organCode}"});
			params.push({name: "sessionYear", value: "${MM3_42VO.sessionYear}"});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_11/MM3_42/districtCalculateConfirm.do" />',
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
		
		$("#btnCalculateConfirmCancel").on("click", function(){
			var params = [];
			params.push({name: "organCode", value: "${MM3_42VO.organCode}"});
			params.push({name: "sessionYear", value: "${MM3_42VO.sessionYear}"});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_11/MM3_42/districtCalculateConfirmCancel.do" />',
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
		
		$("#btnCalculateConfirmLock").on("click", function(){
			var params = [];
			params.push({name: "organCode", value: "${MM3_42VO.organCode}"});
			params.push({name: "sessionYear", value: "${MM3_42VO.sessionYear}"});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_11/MM3_42/districtCalculateConfirmLock.do" />',
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
		
		$("#btnCalculateConfirmLockCancel").on("click", function(){
			var params = [];
			params.push({name: "organCode", value: "${MM3_42VO.organCode}"});
			params.push({name: "sessionYear", value: "${MM3_42VO.sessionYear}"});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_11/MM3_42/districtCalculateConfirmLockCancel.do" />',
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

//링크페이지
function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM3_42VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="150px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td><form:select path="organCode"/></td>
					<th>정산횟수</th>
					<td class="right"><fmt:formatNumber value="${objectDistrictCalculate.confirmCount }" pattern="#,###" /></td>
					<th>정산일자</th>
					<td>
						<fmt:parseDate var="confirmDate" value="${objectDistrictCalculate.confirmDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${confirmDate }" pattern="yyyy.MM.dd" />					
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
					<th>회계구분</th>
					<td><lions:codeselect groupCode="6760" path="accountKind" topLabel="--전체--" /></td>
					<th>정산확정일자</th>
					<td>
						<fmt:parseDate var="confirmLockDate" value="${objectDistrictCalculate.confirmLockDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${confirmLockDate }" pattern="yyyy.MM.dd" />					
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4>
			<lions:menutitle menuId="${param.menuId }" kind="subtitle" />
			<em style="position:absolute; margin-left: 50px;">
				잔액 : <fmt:formatNumber value="${sum.incomeRealAmount - sum.expendRealAmount }" pattern="#,###"/>		
			</em>
		</h4>
		<div class="btnBox">
			<img alt="조회" id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
			
			<c:if test="${objectDistrictCalculate.confirmYn ne 'Y' }">
				<img alt="정산처리" id="btnCalculateConfirm" src="/images/lionsclubs/btn/btn_calc_deal.gif" class="pointer authorization write" />
			</c:if>
			<c:if test="${objectDistrictCalculate.confirmYn eq 'Y' and objectDistrictCalculate.confirmLockYn ne 'Y' }">
				<img alt="정산취소" id="btnCalculateConfirmCancel" src="/images/lionsclubs/btn/btn_calc_cancel.gif" class="pointer authorization write" />
				<img alt="정산처리확정" id="btnCalculateConfirmLock" src="/images/lionsclubs/btn/btn_calc_lock.gif" class="pointer authorization write" />
			</c:if>
			<c:if test="${objectDistrictCalculate.confirmLockYn eq 'Y' and objectDistrictCalculate.confirmYn eq 'Y' }">
				<!-- 지구직책이 국장일때만 정산확정취소를 할 수 있다. -->
				<c:if test="${districtTitleCode eq '9000' }">
					<img alt="정산확정취소" id="btnCalculateConfirmLockCancel" src="/images/lionsclubs/btn/btn_calc_lock_cancel.png" class="pointer authorization write" />
				</c:if>
			</c:if>
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th colspan="4">수입예산</th>
						<th colspan="4">지출예산</th>
					</tr>
					<tr>
						<th>수입세부항목</th>
						<th>예산금액</th>
						<th>결산금액</th>
						<th>차액</th>
						<th>지출세부항목</th>
						<th>예산금액</th>
						<th>결산금액</th>
						<th>차액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<c:set var="fStyle" value="" />
							<c:choose>
								<c:when test="${list.incomeType eq 'B' and list.incomeClassItemCode eq '1030' }">
									<c:set var="fStyle" value="color:blue" />
								</c:when>
								<c:when test="${list.incomeType eq 'B' and list.incomeClassItemCode eq '1040' }">
									<c:set var="fStyle" value="color:green" />								
								</c:when>
								<c:when test="${list.incomeType eq 'B' and list.incomeClassItemCode eq '1100' }">
									<c:set var="fStyle" value="color:#FF00FF" />
								</c:when>
							</c:choose>
							<td class="left" style="${fStyle}" title="${list.incomeDetailItemName }">${list.incomeDetailItemName }</td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.incomeBudgetAmount }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.incomeRealAmount }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.incomeBal }" pattern="#,###"/></td>
							
							<c:set var="fStyle" value="" />
							<c:choose>
								<c:when test="${list.expendType eq 'B' and list.expendClassItemCode eq '1030' }">
									<c:set var="fStyle" value="color:blue" />
								</c:when>
								<c:when test="${list.expendType eq 'B' and list.expendClassItemCode eq '1040' }">
									<c:set var="fStyle" value="color:green" />
								</c:when>
								<c:when test="${list.expendType eq 'B' and list.expendClassItemCode eq '1100' }">
									<c:set var="fStyle" value="color:#FF00FF" />
								</c:when>
							</c:choose>
							<td class="left" style="${fStyle}" title="${list.expendDetailItemName }">${list.expendDetailItemName }</td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.expendBudgetAmount }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.expendRealAmount }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.expendBal }" pattern="#,###"/></td>
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th>총 계</th>
						<th class="right"><fmt:formatNumber value="${sum.incomeBudgetAmount }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.incomeRealAmount }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.incomeBal }" pattern="#,###"/></th>
						<th>총 계</th>
						<th class="right"><fmt:formatNumber value="${sum.expendBudgetAmount }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.expendRealAmount }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.expendBal }" pattern="#,###"/></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->
	</div><!-- table -->
</form:form>