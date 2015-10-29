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
		
		$("#movePage25").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_25/MM2_25.do?menuId=368");
			$("#form_list").submit();
		});
			
		$("#movePage26").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_26/MM2_26.do?menuId=369");
			$("#form_list").submit();
		});
		
		$("#movePage27").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_27/MM2_27.do?menuId=370");
			$("#form_list").submit();
		});
		
		$("#movePage28").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_28/MM2_28.do?menuId=371");
			$("#form_list").submit();
		});
	});
});

function openIncome(organCode, sessionYear, month, classItemCode, title){
	if(classItemCode == null || classItemCode == 'undefined') {
		classItemCode = '';
	}
	var url = "/MM2/MM2_4/MM2_28/presentationIncome.do"
			+ "?organCode=" + organCode
			+ "&sessionYear=" + sessionYear
			+ "&month=" + month
			+ "&classItemCode=" + classItemCode 
			+ "&title=" + title;
	
	var open = window.open("about:blank");
	open.location.href = encodeURI(url);	
}

function openExpend(organCode, sessionYear, month, classItemCode, title){
	if(classItemCode == null || classItemCode == 'undefined') {
		classItemCode = '';
	}
	var url = "/MM2/MM2_4/MM2_28/presentationExpend.do"
			+ "?organCode=" + organCode
			+ "&sessionYear=" + sessionYear
			+ "&month=" + month
			+ "&classItemCode=" + classItemCode
			+ "&title=" + title;
	
	var open = window.open("about:blank");
	open.location.href = encodeURI(url);
}

function openDefect(organCode, sessionYear, month, defectGubun, title){
	if(defectGubun == null || defectGubun == 'undefined') {
		defectGubun = '';
	}
	var url = "/MM2/MM2_4/MM2_28/presentationDefect.do"
			+ "?organCode=" + organCode
			+ "&sessionYear=" + sessionYear
			+ "&month=" + month
			+ "&defectGubun=" + defectGubun
			+ "&title=" + title;

	var open = window.open("about:blank");
	open.location.href = encodeURI(url);
}

function openDebt(organCode, sessionYear, month, debtKind, title){
	if(debtKind == null || debtKind == 'undefined') {
		debtKind = '';
	}
	
	var url = "/MM2/MM2_4/MM2_28/presentationDebt.do"
			+ "?organCode=" + organCode
			+ "&sessionYear=" + sessionYear
			+ "&month=" + month
			+ "&debtKind=" + debtKind
			+ "&title=" + title;
	
	var open = window.open("about:blank");
	open.location.href = encodeURI(url);
}

function openDeposit(organCode, sessionYear, month, title){
	var url = "/MM2/MM2_4/MM2_28/presentationDeposit.do"
			+ "?organCode=" + organCode
			+ "&sessionYear=" + sessionYear
			+ "&month=" + month
			+ "&title=" + title;
	
	var open = window.open("about:blank");
	open.location.href = encodeURI(url);
}
</script>
<style>
<!--
div.border {
	padding: 10px;
}

#calculation {
	font-size: 20px;
	font-weight: bold;
	line-height: 20px;
}

.clfix div:first-child {
	width: 20%;
}

.clfix div {
	width: 17%;
}

.tblType2 th{
	height: 35px;
}

.tblType2 td{
	height: 35px;
}

.tblType3 th{
	height: 35px;
}

.tblType3 td{
	height: 35px;
}
-->
</style>
<form:form id="form_list" modelAttribute="MM2_17VO_PARAM">
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
						<div class="fL"><form:select path="organCode"/>
						</div>
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

	<div class="table" id="calculation">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="movePage24" src="/images/lionsclubs/btn/btn_meeting.gif" title="회의진행순서(선택)" class="pointer authorization read" />
			<img id="movePage25" src="/images/lionsclubs/btn/btn_event2.gif" title="총무보고(행사안내)" class="pointer authorization read" />
			<img id="movePage26" src="/images/lionsclubs/btn/btn_case1.gif" title="총무보고(심의안건)" class="pointer authorization read" />
			<img id="movePage27" src="/images/lionsclubs/btn/btn_case2.gif" title="총무보고(건의사항)" class="pointer authorization read" />
			<img alt="조회" id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read"  />
		</div>
	
		<div id="Scroll_Area" class="Height_1 mT0">
			<div class="border clfix">
				<div class="fL mr20">
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
				<div class="fL mr20">
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
				<div class="fL mr20">
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
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>회비미수금</th>
						</tr>
						<tr>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncome1000TotalPrev }" /></td>
						</tr>
					</table>
				</div><!-- fL -->
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>기타미수금</th>
						</tr>
						<tr>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncomeEtcTotalPrev }" /></td>
						</tr>
					</table>
				</div><!-- fL -->
			</div><!-- border -->
	
			<div class="clfix" style="width:100%; margin-left: 10px">
				<div class="fL mr20 mT10">
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
					<div class="fL mr20 mT10" style="${status.first ne true and status.index % 4 eq 0 ? 'padding-left: 20%; margin-left: 20px;' : ''}">
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
	
			<div class="clfix mT10" style="width:100%; margin-left: 10px; ">
				<div class="fL mr20 mT10">
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
					<div class="fL mr20 mT10" style="${status.first ne true and status.index % 4 eq 0 ? 'padding-left: 20%; margin-left: 20px;' : ''}">
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
	
			<div class="border clfix mT10">
				<div class="fL mr20">
					<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
						<tr>
							<th rowspan="2" width="45">결손<br />처리</th>
							<th>총계</th>
						</tr>
						<tr>
							<td align="right">
								<a href="#" onclick="openDefect('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '4','총계'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_1000'] + depTotalData['AMOUNT_CLUB'] + depTotalData['AMOUNT_ETC'] }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>월회비</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openDefect('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '1','회비'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_1000'] }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>클럽결손금</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openDefect('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '2','클럽결손금'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_CLUB'] }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>약정금/임원분담금</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openDefect('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '3','약정금/임원분담금'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['AMOUNT_ETC'] }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>총결손건수</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openDefect('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '4','총결손건수'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${depTotalData['CNT']}" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
			</div><!-- border -->
			
			<div class="border clfix">
				<div class="fL mr20">
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
				<div class="fL mr20">
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
				<div class="fL mr20">
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
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>회비미수금</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openDebt('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '1','회비미수금'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncome1000Total }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
				<div class="fL mr20">
					<table class="tblType3">
						<tr>
							<th>기타미수금</th>
						</tr>
						<tr>
							<td>
								<a href="#" onclick="openDebt('${MM2_17VO_PARAM.organCode }','${MM2_17VO_PARAM.sessionYear}','${MM2_17VO_PARAM.month}', '2','기타미수금'); return false;" title="새창">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${notIncomeEtcTotal }" />
								</a>
							</td>
						</tr>
					</table>
				</div><!-- fL -->
			</div><!-- border -->
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<form:hidden path="yearCode"/>
	<form:hidden path="monthCode"/>
	<form:hidden path="confKindCode"/>
	<form:hidden path="confIdnNo"/>
</form:form>