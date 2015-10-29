<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_56VO.organCode}"
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_56VO.sessionYear}"	// 고정값
			,top:false
		});
		
		var tbl = $("#listTable tbody tr");
		tbl.on("click", function(){		
			var data = $(this).data();
			openPopup("/MM3/MM3_13/MM3_56/repOrganHistoryPopup.do?repOrganCode=" + data.reporgancode, '1000', '600', "repOrganPopup");
		});
		
		//조회 버튼선택
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

//링크페이지
function _search(){
	$("#form_list").submit();
}
</script>
<style>
#listTable tbody tr{
	cursor: pointer;
}
</style>
<form:form id="form_list" modelAttribute="MM3_56VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td><form:select path="organCode" /></td>
					<th rowspan="2">조회순서</th>
					<td rowspan="2">
						<form:radiobutton path="ord" value="1" label="직책순" cssClass="ml10" />
						<form:radiobutton path="ord" value="2" label="클럽코드순" cssClass="ml10" /><br/>
						<form:radiobutton path="ord" value="3" label="클럽명순" cssClass="ml10" />
						<form:radiobutton path="ord" value="4" label="담당자 성명순" cssClass="ml10" />
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
			<img alt="조회" id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Height_0 Scroll_Title">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="180px" />
					<col width="60px" />
					<col width="100px" />
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>조직명</th>
						<th>성명</th>
						<th>직책</th>
						<th>담당시작일</th>
						<th>전화번호</th>
						<th>HP번호</th>
						<th>FAX번호</th>
						<th>메일주소</th>
						<th>근무지</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="listTable">
				<colgroup>
					<col width="50px" />
					<col width="180px" />
					<col width="60px" />
					<col width="100px" />
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr data-reporgancode="${list.repOrganCode }">
							<td class="center">${status.count }</td>
							<td class="left" title="${lions:formatOrganCode(list.repOrganCode) } ${list.repOrganName }">
								${lions:formatOrganCode(list.repOrganCode) } ${list.repOrganName }
							</td>
							<td class="center">${list.memberName }</td>
							<td class="left" title="${list.sectorTitle }">${list.sectorTitle }</td>
							<td class="center">
								<fmt:parseDate var="repStartDate" value="${list.repStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${repStartDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="center">${list.workTel }</td>
							<td class="center">${list.mobile }</td>
							<td class="center">${list.fax }</td>
							<td class="left" title="${list.mailAddress }">${list.mailAddress }</td>
							<td class="left" title="${list.workPlace }">${list.workPlace }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>