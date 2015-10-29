<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM1_19VO.organCode}"
		});
	
		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM1_19VO.sessionYear}"	// 고정값
		});
		
		$("#btnSearch").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#organCode").val()
			});
		
			_search();
		});
	});
});

// 조회
function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM1_19VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="80px" />
				<col width="380px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td><form:select path="organCode" cssClass="select" /></td>
					<th rowspan="2">조회순서</th>
					<td rowspan="2">
						<form:radiobutton path="order" value="1" label="미처리순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="미승인순" cssClass="ml10" /><br/>
						<form:radiobutton path="order" value="3" label="클럽순" cssClass="ml10" />
						<form:radiobutton path="order" value="4" label="클럽명순" cssStyle="margin-left: 24px" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" alt="조회" class="pointer authorization read" />
		</div>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="회원 입/출 현황">
				<caption>회원 입/출 현황</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" style="border-right: 2px solid black;" />
					<col width="50px" style="border-top: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" style="border-top: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" style="border-top: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" style="border-top: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">NO</th>
						<th rowspan="2">클럽명(클럽코드)</th>
						<th colspan="4">신입회원</th>
						<th colspan="4">퇴회회원</th>
						<th colspan="4">전입회원</th>
						<th colspan="4">재입회원</th>
						<th rowspan="2">전체 미처리</th>
					</tr>
					<tr>
						<th>입력</th>
						<th>승인</th>
						<th>처리</th>
						<th>미처리</th>
						<th>입력</th>
						<th>승인</th>
						<th>처리</th>
						<th>미처리</th>
						<th>입력</th>
						<th>승인</th>
						<th>처리</th>
						<th>미처리</th>
						<th>입력</th>
						<th>승인</th>
						<th>처리</th>
						<th>미처리</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="*" style="border-right: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" />
					<col width="50px" style="border-right: 2px solid black;" />
					<col width="50px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>${list.rnum }</td>
							<td class="left" title="${list.organName }(${lions:formatOrganCode(list.organCode) })">${list.organName }(${lions:formatOrganCode(list.organCode) })</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.newTotalCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.newApproveCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.newTreatmentCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.newUnTreatmentCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.retireTotalCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.retireApproveCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.retireTreatmentCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.retireUnTreatmentCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.moveinTotalCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.moveinApproveCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.moveinTreatmentCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.moveinUnTreatmentCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.reinductTotalCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.reinductApproveCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.reinductTreatmentCnt }</td>
							<td style="${status.last eq true ? 'border-bottom: 2px solid black;' : ''}">${list.reinductUnTreatmentCnt }</td>
							<td>${list.totalUnTreatment }</td>
						</tr>
					</c:forEach>				
				</tbody>
			</table>
		</div>
		<!-- //Contents_Table_area -->
	</div>
</form:form>