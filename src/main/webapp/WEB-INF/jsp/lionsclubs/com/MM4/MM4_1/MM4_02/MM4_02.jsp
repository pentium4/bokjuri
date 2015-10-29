<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvlEnd: 2
			,searchable: true     // 검색콤보박스 true/false
			,fixVal:"${MM4_02VO_PARAM.orgCode}"
		});		
		
		$("#yearCode").sessionYearCombo({
			 fixVal: "${MM4_02VO_PARAM.yearCode}"  // 고정값
			,top:false
		});
		
		$("#retrieveBtn").click(function(){
			if($("#orgCode").val() == "" || $("#orgCode").val() == null){
				alert("선택된 조직이 없습니다.");
				return false;
			}
			
			$.saveOrganCode({
			     organCode: $("#orgCode").val()
			});
			
			$("#form_list").submit();
		});
	});
});

function moveSubOrg(orgCode){
	$("#orgCode").val(orgCode);
	$("#form_list").submit();
}
</script>
<form:form id="form_list"  modelAttribute="MM4_02VO_PARAM">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="지역연도별인원현황표">
			<caption>지역연도별인원현황</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>선택조직</th>
					<td><form:select path="orgCode" cssClass="select" /></td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="yearCode" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="retrieveBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" /> 
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="클럽 및 지구행사 입력 조회표">
				<caption>클럽 및 지구행사 입력</caption>
				<colgroup>
					<col width="50px" />
					<col width="100px" />
					<col width="100px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>직책</th>
						<th>성명</th>
						<th>지구</th>
						<th>지구직책</th>
						<th>소속클럽</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="100px" />
					<col width="100px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td><c:out value="${status.count }" /></td>
							<td class="left"><c:out value="${list.sPos1 }" /></td>
							<td><c:out value="${list.memberName }" /></td>
							<td class="left"><c:out value="${list.sOrganCode }" /></td>
							<td class="left"><c:out value="${list.sPos2 }" /></td>
							<td class="left"><c:out value="${list.sClubName }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>
