<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvlEnd: 3
			,searchable: true
			,fixVal: "${MM4_08VO_PARAM.orgCode}"
		});
		
		$("#orgCode").on("change", function(){
			$.saveOrganCode({
			     organCode: $(this).val()
			});
		});
		
		$("#yearCode").sessionYearCombo({
		   fixVal: "${MM4_08VO_PARAM.yearCode}"  // 고정값
		  ,top:false
		 });
		
		$("#retrieveBtn").click(function(){
			if($("#orgCode").val() == "" || $("#orgCode").val() == null){
				alert("선택된 조직이 없습니다.");
				return false;
			}
			$("#form_list").submit();
		});
	});
});

function moveSubOrg(orgCode){
	$("#orgCode").val(orgCode);
	$("#retrieveBtn").click();
}
</script>
<form:form id="form_list" modelAttribute="MM4_08VO_PARAM">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="<lions:menutitle menuId="${param.menuId }" kind="title" />표">
		<caption><lions:menutitle menuId="${param.menuId }" kind="title" /></caption>
		<colgroup>
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>선택조직</th>
				<td><form:select path="orgCode" /></td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td><form:select path="yearCode" /></td>
			</tr>
		</tbody>
	</table>
	<div class="btnBox2">
		<img id="retrieveBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" /> 
	</div>
</div>
<div class="table">
	<div class="tblTitle mT5 Scroll_Title Height_0 widthLong">
		<table class="tblType2_1 table-fixed" summary="회원연령구성현황표">
			<caption>회원연령구성현황</caption>
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="100px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
			</colgroup>
			<thead>
				<tr>
					<th class="ellipsis" title="No.">No.</th>
					<th class="ellipsis" title="조직명">조직명</th>
					<th class="ellipsis" title="조직총회일">조직총회일</th>
					<th class="ellipsis" title="총원">총원</th>
					<th class="ellipsis" title="35미만">35미만</th>
					<th class="ellipsis" title="35-40">35-40</th>
					<th class="ellipsis" title="40-45">40-45</th>
					<th class="ellipsis" title="45-50">45-50</th>
					<th class="ellipsis" title="50-55">50-55</th>
					<th class="ellipsis" title="55-60">55-60</th>
					<th class="ellipsis" title="60이상">60이상</th>
					<th class="ellipsis" title="평균">평균</th>
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
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
			</colgroup>
			<tbody>
				<c:set value="0" var="tot1"/>
				<c:set value="0" var="tot2"/>
				<c:set value="0" var="tot3"/>
				<c:set value="0" var="tot4"/>
				<c:set value="0" var="tot5"/>
				<c:set value="0" var="tot6"/>
				<c:set value="0" var="tot7"/>
				<c:set value="0" var="tot8"/>
				<c:set value="0.0" var="tot9"/>
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td class="left" title="<c:out value="${list.orgCode }" />" <c:if test="${list.orgCode!='' && MM4_08VO_PARAM.lvl != '3' && MM4_08VO_PARAM.lvl != ''}">onclick="moveSubOrg('${list.orgCode }')" style="cursor:pointer;"</c:if>><c:out value="${list.orgName }" /></td>
						<td>
							<fmt:parseDate value="${list.orgMeeting}" var="dateFmt" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
						</td>
						<td class="right"><fmt:formatNumber value="${list.sumMemCnt}" /></td>
						<td class="right"><fmt:formatNumber value="${list.age1}" /></td>
						<td class="right"><fmt:formatNumber value="${list.age2}" /></td>
						<td class="right"><fmt:formatNumber value="${list.age3}" /></td>
						<td class="right"><fmt:formatNumber value="${list.age4}" /></td>
						<td class="right"><fmt:formatNumber value="${list.age5}" /></td>
						<td class="right"><fmt:formatNumber value="${list.age6}" /></td>
						<td class="right"><fmt:formatNumber value="${list.age7}" /></td>
						<td class="right">${list.ageAvg}</td>
					</tr>
					
					<c:set value="${tot1 + list.sumMemCnt}" var="tot1"/>
					<c:set value="${tot2 + list.age1}" var="tot2"/>
					<c:set value="${tot3 + list.age2}" var="tot3"/>
					<c:set value="${tot4 + list.age3}" var="tot4"/>
					<c:set value="${tot5 + list.age4}" var="tot5"/>
					<c:set value="${tot6 + list.age5}" var="tot6"/>
					<c:set value="${tot7 + list.age6}" var="tot7"/>
					<c:set value="${tot8 + list.age7}" var="tot8"/>
					<c:set value="${tot9 + list.ageAvg}" var="tot9"/>
					<c:set value="${status.count}" var="listCnt"/>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div class="Scroll_Title Height_0 widthLong">
		<table class="tblType2_1">
			<colgroup>
				<col width="*" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
				<col width="80px" />
			</colgroup>
			<tfoot>	
				<tr>
					<th>계</th>
					<th class="right"><fmt:formatNumber value="${tot1}" /></th>
					<th class="right"><fmt:formatNumber value="${tot2}" /></th>
					<th class="right"><fmt:formatNumber value="${tot3}" /></th>
					<th class="right"><fmt:formatNumber value="${tot4}" /></th>
					<th class="right"><fmt:formatNumber value="${tot5}" /></th>
					<th class="right"><fmt:formatNumber value="${tot6}" /></th>
					<th class="right"><fmt:formatNumber value="${tot7}" /></th>
					<th class="right"><fmt:formatNumber value="${tot8}" /></th>
					<th class="right"><fmt:formatNumber value="${tot9/listCnt}" pattern="0.0" /></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->

</form:form>

