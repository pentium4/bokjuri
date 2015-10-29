<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
var _sessionYear = "${MM2_17VO_PARAM.sessionYear}";
var _month = "${MM2_17VO_PARAM.month}";
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_17VO_PARAM.sessionYear}"	// 고정값
			,top:false
		});
	
		$("#month").monthCombo({
			fixVal : "${MM2_17VO_PARAM.month}"
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_17VO_PARAM.organCode}"
		});
		
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
		
			$("#form_list").submit();
		});
		
		//취소 버튼선택
		$("#calculateCancel").on("click", function(){
			var organCode = $("#organCode").val();
			var sessionYear = $("#sessionYear").val();
			var month = $("#month").val();
			
			if(_sessionYear != sessionYear) {
				alert("회기년도가 변경되었습니다. 다시 조회한 후 취소할 수 있습니다.");
				return false;
			}
			
			if(_month != month) {
				alert("선택월이 변경되었습니다. 다시 조회한 후 취소할 수 있습니다.");
				return false;
			}
			
			var params = $("#form_insert").serializeArray();
			params.push({name: "organCode", value: organCode});
			params.push({name: "sessionYear", value: sessionYear});
			params.push({name: "month", value: month});
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_2/MM2_17/calculateCancel.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result=="CONFIRM") {
						alert(data.message);
					}else if(data.result){
						$("#searchBtn").trigger("click");
						//alert('정상적으로 처리 되었습니다.');
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
				}
			});
			
			
		});
		
		//업데이트 버튼선택
		$("#calculateConfirm").on("click", function(){
			var organCode = $("#organCode").val();
			var sessionYear = $("#sessionYear").val();
			var month = $("#month").val();
			if(organCode == null){
				alert("조직을 선택해 주세요.");
				return false;
			}
			if(sessionYear == null){
				alert("정산년도를 선택해 주세요.");
				return false;
			}
			if(month == null){
				alert("정산월을 선택해 주세요.");
				return false;
			}
	
			if(_sessionYear != sessionYear) {
				alert("회기년도가 변경되었습니다. 다시 조회한 후 정산처리를 할 수 있습니다.");
				return false;
			}
			
			if(_month != month) {
				alert("선택월이 변경되었습니다. 다시 조회한 후 정산처리를 할 수 있습니다.");
				return false;
			}
	
			var sessionYearText = sessionYear;
			if(month > '06') {
				sessionYearText = parseInt(sessionYear) -1;
			}
	
			if(!confirm('정산처리되면 당월 수입/지출입력이 불가합니다.\n' + sessionYearText + '년 ' + $("#month option:selected").val() + '월 정산처리를 하시겠습니까?')){
				return false;
			}
			
			var params = $("#form_insert").serializeArray();
			params.push({name: "organCode", value: organCode});
			params.push({name: "sessionYear", value: sessionYear});
			params.push({name: "month", value: month});
	
			params.push({name: "monthTotal", value: "<c:out value="${monthTotal}" />"});	// 총계
			params.push({name: "monthRemain", value: "<c:out value="${monthRemain}" />"});	// 잔액
			params.push({name: "depositTotal", value: "<c:out value="${depositTotal}" />"});	// 정기예금
			params.push({name: "notIncome1000Total", value: "<c:out value="${notIncome1000Total}" />"});	// 회비미수금
			params.push({name: "notIncomeEtcTotal", value: "<c:out value="${notIncomeEtcTotal}" />"});	// 기타미수금
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_2/MM2_17/calculateConfirm.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "CONFIRM") {
						alert(data.message);
					}else if(data.result){
						$("#searchBtn").trigger("click");
						//alert('정상적으로 처리 되었습니다.');
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
			
		//정산확정 버튼선택
		$("#calculateEnd").on("click", function(){
	
			var organCode = $("#organCode").val();
			var sessionYear = $("#sessionYear").val();
			var month = $("#month").val();
			if(organCode == null){
				alert("조직을 선택해 주세요.");
				return false;
			}
			if(sessionYear == null){
				alert("정산년도를 선택해 주세요.");
				return false;
			}
			if(month == null){
				alert("정산월을 선택해 주세요.");
				return false;
			}
			
			if(_sessionYear != sessionYear) {
				alert("회기년도가 변경되었습니다. 다시 조회한 후 정산확정을 할 수 있습니다.");
				return false;
			}
			
			if(_month != month) {
				alert("선택월이 변경되었습니다. 다시 조회한 후 정산확정을 할 수 있습니다.");
				return false;
			}
	
			var sessionYearText = sessionYear;
			if(month > '06') {
				sessionYearText = parseInt(sessionYear) -1;
			}
			
			if(!confirm('정산확정처리되면 당월 수입/지출입력이 불가합니다.\n또한 정산처리 및 정산 취소 처리또한 불가능하게 됩니다.\n' + sessionYearText + '년 ' + $("#month option:selected").val() + '월 정산확정을 하시겠습니까?')){
				return false;
			}
			
			var params = $("#form_insert").serializeArray();
			params.push({name: "organCode", value: organCode});
			params.push({name: "sessionYear", value: sessionYear});
			params.push({name: "month", value: month});
			
			params.push({name: "monthTotal", value: "<c:out value="${monthTotal}" />"});	// 총계
			params.push({name: "monthRemain", value: "<c:out value="${monthRemain}" />"});	// 잔액
			params.push({name: "depositTotal", value: "<c:out value="${depositTotal}" />"});	// 정기예금
			params.push({name: "notIncome1000Total", value: "<c:out value="${notIncome1000Total}" />"});	// 회비미수금
			params.push({name: "notIncomeEtcTotal", value: "<c:out value="${notIncomeEtcTotal}" />"});	// 기타미수금
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_2/MM2_17/calculateConfirmLock.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "CONFIRM") {
						alert('해당 회기의 월정산이 이미 확정되어 입력할 수 없습니다.');
					}else if(data.result){
						$("#searchBtn").trigger("click");
						//alert('정상적으로 처리 되었습니다.');
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		if(!"${MM2_24VO_PARAM.confKindCode}".isEmpty()){
			$("#movePage24").click(function(){
				$("#form_list").attr("action","/MM2/MM2_4/MM2_24/MM2_24.do?menuId=367");
				$("#form_list").submit();
			});
		
			$("#movePage25").click(function(){
				$("#form_list").attr("action","/MM2/MM2_4/MM2_25/MM2_25.do?menuId=368");
				$("#form_list").submit();
			});
		
			$("#movePage26").click(function(){
				$("#form_list").attr("action","/MM2/MM2_4/MM2_26/MM2_26.do?menuId=369");
				$("#form_list").submit();
			});
		
			$("#movePage27").click(function(){
				$("#form_list").attr("action","/MM2/MM2_4/MM2_27/MM2_27.do?menuId=370");
				$("#form_list").submit();
			});
		}
	});
});

function openIncome(organCode, sessionYear, month, classItemCode, title){
	if(classItemCode == null || classItemCode == 'undefined') {
		classItemCode = '';
	}
	var url = "/MM2/MM2_2/MM2_17/MM2_17_Popup_Income.do?organCode=" + organCode
	+ "&sessionYear=" + sessionYear
	+ "&month=" + month
	+ "&classItemCode=" + classItemCode
	+ "&title=" + title;
	
	openPopup(url, '800', '500', 'MM2_17_Popup_Income');
}

function openExpend(organCode, sessionYear, month, classItemCode,title){
	if(classItemCode == null || classItemCode == 'undefined') {
		classItemCode = '';
	}
	var url = "/MM2/MM2_2/MM2_17/MM2_17_Popup_Expend.do?organCode=" + organCode
	+ "&sessionYear=" + sessionYear
	+ "&month=" + month
	+ "&classItemCode=" + classItemCode
	+ "&title=" + title;
	
	openPopup(url, '800', '500', 'MM2_17_Popup_Expend');
}


function openDeficit(organCode, sessionYear, month, deficitGubun, title){
	if(deficitGubun == null || deficitGubun == 'undefined') {
		deficitGubun = '';
	}
	var url = "/MM2/MM2_2/MM2_17/MM2_17_Popup_Deficit.do?organCode=" + organCode
	+ "&sessionYear=" + sessionYear
	+ "&month=" + month
	+ "&deficitGubun=" + deficitGubun
	+ "&title=" + title;
	
	openPopup(url, '900', '500', 'MM2_17_Popup_Deficit');
}

function openNotGet(organCode, sessionYear, month, notGetGubun,title){
	if(notGetGubun == null || notGetGubun == 'undefined') {
		notGetGubun = '';
	}
	var url = "/MM2/MM2_2/MM2_17/MM2_17_Popup_NotGet.do?organCode=" + organCode
	+ "&sessionYear=" + sessionYear
	+ "&month=" + month
	+ "&notGetGubun=" + notGetGubun
	+ "&title=" + title;
	
	openPopup(url, '800', '500', 'MM2_17_Popup_NotGet');
}

function openDeposit(organCode, sessionYear, month,title){
	var url = "/MM2/MM2_2/MM2_17/MM2_17_Popup_Deposit.do?organCode=" + organCode
	+ "&sessionYear=" + sessionYear
	+ "&month=" + month
	+ "&title=" + title;
	
	openPopup(url, '960', '500', 'MM2_17_Popup_Deposit');
}
</script>
<style>
<!--
div.border{
	padding: 10px;
}
-->
</style>
<form:form id="form_list" modelAttribute="MM2_17VO_PARAM">
	<input type="hidden" name="yearCode" value="${MM2_24VO_PARAM.yearCode }" />
	<input type="hidden" name="monthCode" value="${MM2_24VO_PARAM.monthCode }" />
	<input type="hidden" name="confKindCode" value="${MM2_24VO_PARAM.confKindCode }" />
	<input type="hidden" name="confIdnNo" value="${MM2_24VO_PARAM.confIdnNo }" />
	
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="정산현황표">
			<caption>정산현황</caption>
			<colgroup>
				<col width="70px" />
				<col width="160px" />
				<col width="70px" />
				<col width="160px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="90px" />
				<col width="110px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>선택조직</th>
					<td colspan="3">
						<div class="fL"><form:select path="organCode"/></div>
					</td>
					<th>회장</th>
					<td><c:out value='${memberData["1000"] }' /></td>
					<th>총무</th>
					<td><c:out value='${memberData["1060"] }' /></td>
					<th>재무</th>
					<td><c:out value='${memberData["1070"] }' /></td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
					</td>
					<th>선택월</th>
					<td>
						<strong class="month">
							<form:select path="month" cssClass="select" style="width:100px;" />
						</strong> 
					</td>
					<th>정산횟수</th>
					<td class="right"><c:out value='${calcData["CONFIRM_COUNT"] }' /></td>
					<th>정산일자</th>
					<td>
						<fmt:parseDate var="confirmDate" value="${calcData['CONFIRM_DATE'] }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${confirmDate }" pattern="yyyy.MM.dd" />
					</td>
					<th>정산확정일자</th>
					<td>
						<fmt:parseDate var="confirmLockDate" value="${calcData['CONFIRM_LOCK_DATE'] }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${confirmLockDate }" pattern="yyyy.MM.dd" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
</form:form>

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<c:if test="${MM2_24VO_PARAM.confKindCode > '' }">
			<img id="movePage24" src="/images/lionsclubs/btn/btn_meeting.gif" title="회의진행순서(선택)" class="pointer authorization read" />
			<img id="movePage25" src="/images/lionsclubs/btn/btn_event2.gif" title="총무보고(행사안내)" class="pointer authorization read" />
			<img id="movePage26" src="/images/lionsclubs/btn/btn_case1.gif" title="총무보고(심의안건)" class="pointer authorization read" />
			<img id="movePage27" src="/images/lionsclubs/btn/btn_case2.gif" title="총무보고(건의사항)" class="pointer authorization read" />
		</c:if>
		<img alt="조회" id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read"  />
		<c:if test="${MM2_17VO_PARAM.month !='' && calcData['CONFIRM_LOCK_YN'] !='Y' && calcData['CONFIRM_YN'] !='Y' }">
			<img alt="정산처리" id="calculateConfirm" src="/images/lionsclubs/btn/btn_calc_deal.gif" class="pointer authorization write" />
		</c:if>
		<c:if test="${MM2_17VO_PARAM.month !='' && calcData['CONFIRM_LOCK_YN'] !='Y' && calcData['CONFIRM_YN'] =='Y' }">
			<img alt="정산취소" id="calculateCancel" src="/images/lionsclubs/btn/btn_calc_cancel.gif" class="pointer authorization write" />
		</c:if>
		<c:if test="${MM2_17VO_PARAM.month !='' && calcData['CONFIRM_LOCK_YN'] !='Y' && calcData['CONFIRM_YN'] =='Y' }">
			<img alt="정산완료" id="calculateEnd" src="/images/lionsclubs/btn/btn_calc_lock.gif" class="pointer authorization write" />
		</c:if>
	</div>

	<div id="Scroll_Area" class="Height_1 mT0">
		<div class="border clfix">
			<div class="fL mr20 w15">
				<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
					<tr>
						<th rowspan="2" width="45">이월</th>
						<th>총계</th>
					</tr>
					<tr>
						<td align="right">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${prevMonthTotal }" />
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>잔액</th>
					</tr>
					<tr>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${prevMonthRemain }" />
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>정기예금</th>
					</tr>
					<tr>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${depositTotalPrev }" />
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>회비미수금</th>
					</tr>
					<tr>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncome1000TotalPrev }" /></td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>기타미수금</th>
					</tr>
					<tr>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncomeEtcTotalPrev }" /></td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL w15">
				<table class="tblType3">
					<tr>
						<th class="Gbg">
							<a href="#" 
						onclick="openPopup('/MM2/MM2_2/MM2_17/MM2_17_Popup_NotGet.do?organCode=${list.organCode }&sessionYear=${sessionYear}&month=${month}&classItemCode=${list.classItemCode}', '800', '260', 'MM2_16_Popup'); return false;" title="새창">
							미수금합계</a>
						</th>
					</tr>
					<tr>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncomeTotalPrev}" />
						</td>
					</tr>
				</table>
			</div><!-- fL -->
		</div><!-- border -->

		<div class="clfix" style="width:100%; margin-left: 10px">
			<div class="fL mr20 w15 mt20">
				<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
					<tr>
						<th rowspan="2" width="45">수입<br />항목</th>
						<th>총계 </th>
					</tr>
					<tr>
						<td align="right">
							<a href="#" onclick="openIncome('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}','','총계'); return false;" title="새창">
								<fmt:formatNumber  value="${incomeTotal }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<c:forEach items="${incomeList}" var="list" varStatus="status">
				<c:set var="len" value="${fn:length(incomeList) }" />
				<c:if test="${status.index!=0 && status.index%5 == 0}">
					<div class="fL mr20 w15">&nbsp;</div>
				</c:if>
				<div class="fL mr20 w15 mt20">
					<table class="tblType3">
						<tr>
							<th>${list.classItemCodeName }</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openIncome('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}','${list.classItemCode}','${list.classItemCodeName }'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.amountSum }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
			</c:forEach>	
		</div><!-- border -->


		<div class="clfix" style="width:100%; margin-left: 10px; ">
			<div class="fL mr20 w15 mt20">
				<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
					<tr>
						<th rowspan="2" width="45">지출<br />항목</th>
						<th>총계</th>
					</tr>
					<tr>
						<td align="right">
							<a href="#" onclick="openExpend('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '','총계'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${expTotal }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
		
			<c:forEach items="${expList}" var="list" varStatus="status">
				<c:set var="len" value="${fn:length(expList) }" />
				<c:if test="${status.index != 0 && status.index%5 == 0}">
					<div class="fL mr20 w15">&nbsp;</div>
				</c:if>
				<div class="fL mr20 w15 mt20">
					<table class="tblType3">
						<tr>
							<th>${list.classItemCodeName }</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openExpend('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}','${list.classItemCode}','${list.classItemCodeName }'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.amountSum }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
			</c:forEach>	
		</div>

		<div class="border clfix">
			<div class="fL mr20 w15">
				<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
					<tr>
						<th rowspan="2" width="45">결손<br />처리</th>
						<th>총계</th>
					</tr>
					<tr>
						<td align="right">
							<a href="#" onclick="openDeficit('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '4','총계'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_1000'] + depTotalData['AMOUNT_CLUB'] + depTotalData['AMOUNT_ETC'] }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>월회비</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openDeficit('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '1','회비'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_1000'] }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>클럽결손금</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openDeficit('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '2','클럽결손금'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_CLUB'] }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>약정금/임원분담금</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openDeficit('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '3','약정금/임원분담금'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_ETC'] }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>총결손건수</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openDeficit('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '4','총결손건수'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['CNT']}" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15 Red">
				결손금은 결산현황에 반영되지 않습니다.
			</div><!-- fL -->
		</div><!-- border -->
		
		<div class="border clfix">
			<div class="fL mr20 w15">
				<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
					<tr>
						<th rowspan="2" width="45">잔액</th>
						<th>총계</th>
					</tr>
					<tr>
						<td align="right">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${monthTotal }" />
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>잔액</th>
					</tr>
					<tr>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${monthRemain }" />
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>정기예금</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openDeposit('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}','정기예금'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${depositTotal }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>회비미수금</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openNotGet('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '1','회비미수금'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncome1000Total }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL mr20 w15">
				<table class="tblType3">
					<tr>
						<th>기타미수금</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openNotGet('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '2','기타미수금'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncomeEtcTotal }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
			<div class="fL w15">
				<table class="tblType3">
					<tr>
						<th class="Gbg">미수금합계</th>
					</tr>
					<tr>
						<td>
							<a href="#" onclick="openNotGet('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '','미수금합계'); return false;" title="새창">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncomeTotal }" />
							</a>
						</td>
					</tr>
				</table>
			</div><!-- fL -->
		</div><!-- border -->
	</div>
	<!-- //Contents_Table_area -->
</div>
