<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#excelUpload").on("click", function(){
			openPopup("/MM3/MM3_4/MM3_18/excelUploadPopup.do?districtCode=${MM3_18VO.districtCode}&sessionYear=${MM3_18VO.sessionYear}", '600', '185', "excelUpload");
		});
		
		$("#excelTemplateDownload").on("click", function(){
			if($("#sessionYear").val() == ""){
				alert("회기를 선택해 주세요.");
				return false;
			}
			
			$(window).unbind();
			$.download("/MM3/MM3_4/MM3_18/excelTemplateDownload.do", $("form").serialize());
		});
		
		$("#districtCode").organCode({
			 lvl:3
			,fixVal: "${MM3_18VO.districtCode}"
			,searchable:true
		});
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM3_18VO.sessionYear}"
		});
		
		$("#searchBtn").on("click", function(){
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#districtCode").val()
			});
			
			_search();
		});
	});
});

function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM3_18VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="입주클럽 관리비 부과표">
			<caption>입주클럽 관리비 부과</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="41%" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td>
						<form:select path="districtCode" cssClass="select" />
					</td>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
			<img id="excelTemplateDownload" src="/images/lionsclubs/btn/btn_excel3.gif" alt="엑셀폼받기" class="pointer authorization write"/>
			<img id="excelUpload" src="/images/lionsclubs/btn/btn_excel.gif" style="width:91px" alt="엑셀올리기" class="pointer authorization write" />
		</div>

		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="입주 클럽 관리비 부과 조회표">
				<caption>입주 클럽 관리비 부과</caption>
				<colgroup>
					<col width="30px" />
					<col width="*" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>클럽명</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="*" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList }" var="list" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td class="left" title="${fn:substring(list.clubCode, 0, 3)}-${fn:substring(list.clubCode, 3, 8)}">${list.clubName }</td>				
							<td class="right f11"><fmt:formatNumber value="${list.julDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.augDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.sepDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.octDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.novDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.decDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.janDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.febDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.marDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.aprDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.mayDue }" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.junDue }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="입주 클럽 관리비 부과 조회표">
				<caption>입주 클럽 관리비 부과</caption>
				<colgroup>
					<col width="30px" />
					<col width="*" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
					<col width="71px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">합 계</th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.julDue }' />"><fmt:formatNumber value="${expensesSum.julDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.augDue }' />"><fmt:formatNumber value="${expensesSum.augDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.sepDue }' />"><fmt:formatNumber value="${expensesSum.sepDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.octDue }' />"><fmt:formatNumber value="${expensesSum.octDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.novDue }' />"><fmt:formatNumber value="${expensesSum.novDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.decDue }' />"><fmt:formatNumber value="${expensesSum.decDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.janDue }' />"><fmt:formatNumber value="${expensesSum.janDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.febDue }' />"><fmt:formatNumber value="${expensesSum.febDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.marDue }' />"><fmt:formatNumber value="${expensesSum.marDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.aprDue }' />"><fmt:formatNumber value="${expensesSum.aprDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.mayDue }' />"><fmt:formatNumber value="${expensesSum.mayDue }" /></th>
						<th class="right f11" title="<fmt:formatNumber value='${expensesSum.junDue }' />"><fmt:formatNumber value="${expensesSum.junDue }" /></th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>