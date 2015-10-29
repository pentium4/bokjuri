<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<%
	HashMap<String, Integer> pref = new HashMap<String, Integer>();
%>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvlEnd: 3
			,searchable: true
			,fixVal: "${MM4_09VO_PARAM.orgCode}"
		});
	
		$("#orgCode").on("change", function(){
			$.saveOrganCode({
			     organCode: $(this).val()
			});
		});
		
		$("#yearCode").sessionYearCombo({
		   fixVal: "${MM4_09VO_PARAM.yearCode}"  // 고정값
		  ,top:false
		 })
		 
		 $("#month").monthCombo({
	           fixVal: "${MM4_09VO_PARAM.month}" // 고정값
	         ,searchable: false // 검색콤보박스 true/false
	         ,top:true
	 	});
		
		$("#retrieveBtn").click(function(){
			if($("#orgCode").val() == "" || $("#orgCode").val() == null){
				alert("선택된 조직이 없습니다.");
				return false;
			}
			$("#form_list").submit();
		});
		
		// 스크롤 이동 처리
		$('.Scroll_Title').on( 'scroll', function() {
			$('.Height_1').scrollLeft( $(this).scrollLeft() );
			$('.Scroll_Title').scrollLeft( $(this).scrollLeft() );
		});
	});
});

function moveSubOrg(orgCode){
	$("#orgCode").val(orgCode);
	$("#retrieveBtn").click();
}
</script>

<form:form id="form_list" modelAttribute="MM4_09VO_PARAM">
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
<div class="table" style="margin-bottom:15px !important;">
	<div class="tblTitle Height_0 Scroll_Title widthLong" style="overflow-x: hidden;">
		<table class="tblType2 table-fixed" summary="지역봉사사업현황표">
			<caption>지역봉사사업현황</caption>
			<colgroup>
				<col width="50px" />
				<col width="150px" />
				<c:forEach items="${codeList}" var="code" varStatus="status">
					<col width="110px" />
				</c:forEach>
				<col width="110px" />
			</colgroup>
			<thead>
				<tr>
					<th class="ellipsis" title="No.">No.</th>
					<th class="ellipsis" title="조직명">조직명</th>
					<c:forEach items="${codeList}" var="code" varStatus="status">
						<th style="font-size:12px;" class="ellipsis" title="<c:out value="${code.codeName }" />"><c:out value="${code.codeName }" /></th>
					</c:forEach>
					<th class="ellipsis" title="계">계</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table" id="listTable">
			<colgroup>
				<col width="50px" />
				<col width="150px" />
				<c:forEach items="${codeList}" var="code" varStatus="status">
					<col width="110px" />
				</c:forEach>
				<col width="110px" />
			</colgroup>
			<tbody>
				<%-- 합계 --%>
				<c:set value="0" var="totSum"/>
				<c:forEach items="${codeList}" var="codelist" varStatus="status">
					<c:set value="0" property="${codelist.code }" target="<%=pref %>"/>
				</c:forEach>
				<%-- 리스트 --%>
				<c:forEach items="${resultList}" var="list" varStatus="status">
				<tr>
					<td><c:out value="${status.count }" /></td>
					<td class="left" title="<c:out value="${list.orgCode }" />" <c:if test="${list.orgCode!='' && MM4_09VO_PARAM.lvl != '3' && MM4_09VO_PARAM.lvl != ''}">onclick="moveSubOrg('${list.orgCode }')" style="cursor:pointer;"</c:if>><c:out value="${list.orgName }" /></td>
					
					<c:set value="<%=pref %>" var="m"/>
					<c:forEach items="${codeList}" var="codeData" varStatus="status">
						<c:set value="${codeData.code}" var="dataKey" />
						<c:set value="${m[dataKey] + list[dataKey] }" property="${codeData.code }" target="<%=pref %>"/>
						<td class="right"><fmt:formatNumber value="${list[dataKey]}"/></td>
					</c:forEach>
					<td class="right"><fmt:formatNumber value="${list.amountSum}"/></td>
				</tr>
			
					<c:set value="${totSum + list.amountSum }" var="totSum"/>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div id="ftScroll" class="Scroll_Title Height_0 widthLong" style="margin-bottom:-14px; overflow-x: auto;">
		<table class="tblType2_1">
			<colgroup>
				<col width="200px" />
				<c:forEach items="${codeList}" var="code" varStatus="status">
					<col width="110px" />
				</c:forEach>
				<col width="110px" />
			</colgroup>
			<tfoot>	
				<tr>
					<th>계</th>
					<c:set value="<%=pref %>" var="aSum"/>
					<c:forEach items="${codeList}" var="plist" varStatus="status">
						<c:set var="aCode" value="${plist.code }" />
						<th class="right"><fmt:formatNumber value="${aSum[aCode]}"/></th>
					</c:forEach>
					<th class="right"><fmt:formatNumber value="${totSum}"/></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->
</form:form>
