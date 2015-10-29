<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvlEnd: 3
			,searchable: true     // 검색콤보박스 true/false
			,fixVal:"${MM4_05VO_PARAM.orgCode}"
		});	
		
		$("#yearCode").sessionYearCombo({
			 fixVal: "${MM4_05VO_PARAM.yearCode}"  // 고정값
			,top:false
		 })
		 
		 $("#month").monthCombo({
			 fixVal: "${MM4_05VO_PARAM.month}" // 고정값
			,searchable: false // 검색콤보박스 true/false
			,top:false
		});
		
		$("#retrieveBtn").click(function(){
			
			if($("#orgCode").val() == null){
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
	$("#retrieveBtn").click();
}
</script>

<form:form id="form_list" modelAttribute="MM4_05VO_PARAM">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="<lions:menutitle menuId="${param.menuId }" kind="title" />표">
		<caption><lions:menutitle menuId="${param.menuId }" kind="title" /></caption>
		<colgroup>
			<col width="100px" />
			<col width="500px" />
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>선택조직</th>
				<td colspan="3"><form:select path="orgCode" /></td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td><form:select path="yearCode" /></td>
				<th>월선택</th>
				<td><form:select path="month" /></td>
			</tr>
		</tbody>
	</table>
	<div class="btnBox2">
		<img id="retrieveBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" /> 
	</div>
</div>
<div class="table" >
	<div class="tblTitle mT5 Scroll_Title Height_0 widthLong">
		<table class="tblType2_1" summary="지역별인원현황표">
			<caption>지역별인원현황</caption>
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="100px" />
				<col width="70px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="70px" />
				<col width="70px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="70px" />
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">No</th>
					<th rowspan="2">조직명</th>
					<th rowspan="2">책임자</th>
					<th rowspan="2">목표</th>
					<th colspan="5">클럽증감</th>
					<th colspan="5">회원증감</th>
				</tr>
				<tr>
					<th>취임</th>
					<th>신생</th>
					<th>해체</th>
					<th>증감</th>
					<th>현재</th>
					<th>취임</th>
					<th>입회</th>
					<th>퇴회</th>
					<th>증감</th>
					<th>현재</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table">
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="100px" />
				<col width="70px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="70px" />
				<col width="70px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="70px" />
			</colgroup>
			<tbody>
				<c:set value="0" var="tmCntSum" />
				<c:set value="0" var="fromClubCnt" />
				<c:set value="0" var="inClubCnt" />
				<c:set value="0" var="outClubCnt" />
				<c:set value="0" var="calClubCnt" />
				<c:set value="0" var="toClubCnt" />
				<c:set value="0" var="memberCntFrom" />
				<c:set value="0" var="memberCntNew" />
				<c:set value="0" var="memberCntOut" />
				<c:set value="0" var="calMemberCnt" />
				<c:set value="0" var="memberCntTo" />
			
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td class="left" title="<c:out value="${list.orgCode }" />" <c:if test="${list.orgCode!='' && MM4_05VO_PARAM.lvl != '3' && MM4_05VO_PARAM.lvl != ''}">onclick="moveSubOrg('${list.orgCode }')" style="cursor:pointer;"</c:if>><c:out value="${list.orgName }" /></td>
						<td><c:out value="${list.presidentName }" /></td>
						<td class="right"><c:out value="${list.tmCnt }" /></td>
						<td class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${list.fromClubCnt}" /></c:if></td>
						<td class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${list.inClubCnt}" /></c:if></td>
						<td class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${list.outClubCnt}" /></c:if></td>
						<td class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${list.calClubCnt}" /></c:if></td>
						<td class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${list.toClubCnt}" /></c:if></td>
						<td class="right"><fmt:formatNumber value="${list.memberCntFrom}" /></td>
						<td class="right"><fmt:formatNumber value="${list.memberCntNew}" /></td>
						<td class="right"><fmt:formatNumber value="${list.memberCntOut}" /></td>
						<td class="right"><fmt:formatNumber value="${list.calMemberCnt}" /></td>
						<td class="right"><fmt:formatNumber value="${list.memberCntTo}" /></td>
						<c:set value="${tmCntSum 		+ list.tmCnt }" var="tmCntSum" />
						<c:set value="${fromClubCnt 	+ list.fromClubCnt }" var="fromClubCnt" />
						<c:set value="${inClubCnt 		+ list.inClubCnt }" var="inClubCnt" />
						<c:set value="${outClubCnt 		+ list.outClubCnt }" var="outClubCnt" />
						<c:set value="${calClubCnt 		+ list.calClubCnt }" var="calClubCnt" />
						<c:set value="${toClubCnt 		+ list.toClubCnt }" var="toClubCnt" />
						<c:set value="${memberCntFrom 	+ list.memberCntFrom }" var="memberCntFrom" />
						<c:set value="${memberCntNew 	+ list.memberCntNew }" var="memberCntNew" />
						<c:set value="${memberCntOut 	+ list.memberCntOut }" var="memberCntOut" />
						<c:set value="${calMemberCnt 	+ list.calMemberCnt }" var="calMemberCnt" />
						<c:set value="${memberCntTo 	+ list.memberCntTo }" var="memberCntTo" />
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div class="Scroll_Title Height_0 widthLong">
		<table class="tblType2_1">
			<colgroup>
				<col width="*" />
				<col width="70px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="70px" />
				<col width="70px" />
				<col width="60px" />
				<col width="60px" />
				<col width="60px" />
				<col width="70px" />
			</colgroup>
			<tfoot>	
				<tr>
					<th>계</th>
					<th class="right"><fmt:formatNumber value="${tmCntSum}" /></th>
					<th class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${fromClubCnt}" /></c:if><c:if test="${MM4_05VO_PARAM.lvl == '3'}">&nbsp;</c:if></th>
					<th class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${inClubCnt}" /></c:if><c:if test="${MM4_05VO_PARAM.lvl == '3'}">&nbsp;</c:if></th>
					<th class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${outClubCnt}" /></c:if><c:if test="${MM4_05VO_PARAM.lvl == '3'}">&nbsp;</c:if></th>
					<th class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${calClubCnt}" /></c:if><c:if test="${MM4_05VO_PARAM.lvl == '3'}">&nbsp;</c:if></th>
					<th class="right"><c:if test="${MM4_05VO_PARAM.lvl != '3'}"><fmt:formatNumber value="${toClubCnt}" /></c:if><c:if test="${MM4_05VO_PARAM.lvl == '3'}">&nbsp;</c:if></th>
					<th class="right"><fmt:formatNumber value="${memberCntFrom}" /></th>
					<th class="right"><fmt:formatNumber value="${memberCntNew}" /></th>
					<th class="right"><fmt:formatNumber value="${memberCntOut}" /></th>
					<th class="right"><fmt:formatNumber value="${calMemberCnt}" /></th>
					<th class="right"><fmt:formatNumber value="${memberCntTo}" /></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->
</form:form>


