<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${fn:length(resultList)}</span>건의 데이터를 조회하였습니다.");
	
		//기관 클럽코드 세팅
		$("#districtCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_21VO.districtCode}"
		});
		
		$("#sessionYear").sessionYearCombo({
			  fixVal: "${MM3_21VO.sessionYear}"  
			  ,top:false
			  //,topLabel: '회기미적용'
		});
	
		// 정산처리
		$("#confirm").on("click", function(){
			
			var sessionYear = '${MM3_21VO.sessionYear}' - 1 + ' ~  ${MM3_21VO.sessionYear}';
			
			if(!confirm('정산처리되면 ' + sessionYear + '회기 클럽납부금입력이 불가합니다.\n' + sessionYear + '회기 정산처리를 하시겠습니까?')){
				return false;
			}
			
			var params = $("#form_list").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_4/MM3_21/confirm.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
					} else {
						alert(data.result);	
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});	
		});
	
		// 정산취소
		$("#confirmCancel").on("click", function(){
			var params = $("#form_list").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_4/MM3_21/confirmCancel.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
					} else {
						alert(data.result);	
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});	
		});
	
		// 정산확정
		$("#confirmLock").on("click", function(){
			var sessionYear = '${MM3_21VO.sessionYear}' - 1 + ' ~  ${MM3_21VO.sessionYear}';
			
			if(!confirm('정산확정되면 ' + sessionYear + '회기 클럽납부금입력이 불가합니다.\n또한 정산처리 및 정산 취소 처리또한 불가능하게 됩니다.\n' + sessionYear + '회기 정산확정을 하시겠습니까?')){
				return false;
			}
			
			var params = $("#form_list").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_4/MM3_21/confirmLock.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
					} else {
						alert(data.result);	
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});
		
		$("#btnSearch").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#districtCode").val()
			});		
			
			_search();
		});
		
		$(".clubPayment").on("click", function(){
			var tr = $(this).closest("tr");
			var data = tr.data();
			
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: data.clubcode
			});				
			
			location.href = "/MM3/MM3_4/MM3_22/MM3_22.do?menuId=402&clubCode=" + data.clubcode;
		});
	});
});

function _search(){
	$("#form_list").submit();
}
//-->
</script>
<form:form id="form_list" modelAttribute="MM3_21VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="<lions:menutitle menuId="${param.menuId }" kind="title" />표">
		<caption><lions:menutitle menuId="${param.menuId }" kind="title" /></caption>
		<colgroup>
			<col width="75px" />
			<col width="*" />
			<col width="75px" />
			<col width="100px" />
			<col width="75px" />
			<col width="100px" />
			<col width="100px" />
			<col width="100px" />
		</colgroup>
		<tbody>
			<tr>
				<th>선택조직</th>
				<td colspan="7">
					<div class="fL">
						<form:select path="districtCode" cssClass="select" />
					</div>
				</td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td>
					<form:select path="sessionYear" cssClass="select" />
				</td>
				<th>정산횟수</th>
				<td>
					${objectPaymentSettle.confirmCount }
				</td>
				<th>정산일자</th>
				<td>
					<c:if test="${objectPaymentSettle.confirmYn eq 'Y' }">
						<fmt:parseDate var="confirmDate" value="${objectPaymentSettle.confirmDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${confirmDate }" pattern="yyyy.MM.dd" />
					</c:if>
				</td>
				<th>정산확정일자</th>
				<td>
					<c:if test="${objectPaymentSettle.confirmLockYn eq 'Y' }">
						<fmt:parseDate var="confirmLockDate" value="${objectPaymentSettle.confirmLockDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${confirmLockDate }" pattern="yyyy.MM.dd" />
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>	
	<div class="btnBox">
		<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read"/>
		<c:if test="${objectPaymentSettle.confirmYn ne 'Y' and objectPaymentSettle.confirmLockYn ne 'Y' }">
			<img alt="정산처리" id="confirm" src="/images/lionsclubs/btn/btn_calc_deal.gif" class="pointer authorization write" />
		</c:if>
		<c:if test="${objectPaymentSettle.confirmYn eq 'Y' and objectPaymentSettle.confirmLockYn ne 'Y' }">
			<img alt="정산취소" id="confirmCancel" src="/images/lionsclubs/btn/btn_calc_cancel.gif" class="pointer authorization write" />
			<img alt="정산확정" id="confirmLock" src="/images/lionsclubs/btn/btn_calc_lock.gif" class="pointer authorization write" />
		</c:if>
	</div>

	<div class="tblTitle Height_0 Scroll_Title" style="overflow-x: hidden;">
		<table class="tblType2" summary="클럽별 부과금 조회표">
			<caption>클럽별 부과금액 조회</caption>
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="110px" />
				<col width="110px" />
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">No</th>
					<th rowspan="2">클럽명</th>
					<th colspan="3">상반기</th>
					<th colspan="3">하반기</th>
					<th rowspan="2">총금액</th>
					<th rowspan="2">잔액</th>
				</tr>
				<tr>
					<th>미납금</th>
					<th>제의무금</th>
					<th>관리비</th>
					<th>미납금</th>
					<th>제의무금</th>
					<th>관리비</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table" id="listTable">
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="110px" />
				<col width="110px" />
			</colgroup>
			<tbody>
				<c:forEach var="list" items="${resultList}" varStatus="status">
					<tr data-clubcode="${list.clubCode }">
						<td class="center">${status.count}</td>
						<td class="left pointer clubPayment">${list.clubName}</td>
						<td class="right f11"><fmt:formatNumber value="${list.firstUnPaid}" pattern="#,###"/></td>
						<td class="right f11"><fmt:formatNumber value="${list.firstMyDues}" pattern="#,###"/></td>
						<td class="right f11"><fmt:formatNumber value="${list.firstExpenses}" pattern="#,###"/></td>
						<td class="right f11"><fmt:formatNumber value="${list.secUnPaid}" pattern="#,###"/></td>
						<td class="right f11"><fmt:formatNumber value="${list.secMyDues}" pattern="#,###"/></td>
						<td class="right f11"><fmt:formatNumber value="${list.secExpenses}" pattern="#,###"/></td>
						<td class="right f11"><fmt:formatNumber value="${list.totDue}" pattern="#,###"/></td>
						<td class="right f11"><fmt:formatNumber value="${list.balance}" pattern="#,###"/></td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div id="ftScroll" class="Scroll_Title Height_0" style="overflow-x: auto;">
		<table class="tblType2_1"> 
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="90px" />
				<col width="110px" />
				<col width="110px" />
			</colgroup>
			<tfoot>	
				<tr>
					<th colspan="2">합 계</th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.firstUnPaid}" pattern="#,###"/></th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.firstMyDues}" pattern="#,###"/></th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.firstExpenses}" pattern="#,###"/></th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.secUnPaid}" pattern="#,###"/></th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.secMyDues}" pattern="#,###"/></th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.secExpenses}" pattern="#,###"/></th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.totDue}" pattern="#,###"/></th>
					<th class="right f11"><fmt:formatNumber value="${expensesSum.balance}" pattern="#,###"/></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->
</form:form>