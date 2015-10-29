<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%
	HashMap<String, Integer> pref = new HashMap<String, Integer>();
%>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvlEnd: 3
			,searchable: true     // 검색콤보박스 true/false
			,fixVal:"${MM4_07VO_PARAM.orgCode}"
		});		
		
		$("#yearCode").sessionYearCombo({
			 fixVal: "${MM4_07VO_PARAM.yearCode}"  // 고정값
			,top: false
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
		
		// 스크롤 이동 처리
		$('.Scroll_Title').on( 'scroll', function() {
			$('.Height_1').scrollLeft( $(this).scrollLeft() );
			$('.Scroll_Title').scrollLeft( $(this).scrollLeft() );
		});
	});
});
</script>

<form:form id="form_list"  modelAttribute="MM4_07VO_PARAM">
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
</div><!-- table -->

<div class="table">
	<div class="tblTitle Height_0 Scroll_Title widthLong" style="overflow-x: hidden;">
		<table class="tblType2 table-fixed" summary="회원입회경력 현황표">
			<caption>회원입회경력</caption>
			<colgroup>
				<col width="50px" />
				<col width="120px" />
				<col width="100px" />
				<c:forEach items="${codeList}" var="list" varStatus="status">
					<col width="90px" />
				</c:forEach>
				<col width="100px" />
			</colgroup>
			<thead>
				<tr>
					<th class="ellipsis" title="No.">No</th>
					<th class="ellipsis" title="입회경력">입회경력</th>
					<th class="ellipsis" title="구성원">구성원</th>
					<c:forEach items="${codeList}" var="endCodeData" varStatus="status">
					<th style="font-size:12px;" class="ellipsis" title="<c:out value="${endCodeData.codeName }"/>"><c:out value="${endCodeData.codeName }"/></th>
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
				<col width="120px" />
				<col width="100px" />
				<c:forEach items="${codeList}" var="list" varStatus="status">
					<col width="90px" />
				</c:forEach>
				<col width="100px" />
			</colgroup>
			<tbody>
				<%-- 합계 --%>
				<c:set value="0" var="memSum"/>
				<c:set value="0" var="totSum"/>
				<c:forEach items="${codeList}" var="codelist" varStatus="status">
					<c:set value="0" property="${codelist.code }" target="<%=pref %>"/>
				</c:forEach>
		
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td class="left">${list["KEY_DESC"] }</td>
						<td class="right"><fmt:formatNumber value="${list.memCnt }" /></td>
						
						<c:set value="<%=pref %>" var="m"/>
						<c:forEach items="${codeList}" var="codeData" varStatus="status">
							<c:set value="${codeData.code}" var="dataKey" />
							<c:set value="${m[dataKey] + list[dataKey] }" property="${codeData.code }" target="<%=pref %>"/>
							<td class="right"><fmt:formatNumber value="${list[dataKey] }" /></td>
						</c:forEach>
						
						<td class="right"><fmt:formatNumber value="${list.outCnt }" /></td>
					</tr>
					
					<c:set value="${memSum + list.memCnt}" var="memSum"/>
					<c:set value="${totSum + list.outCnt}" var="totSum"/>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div id="ftScroll" class="Scroll_Title Height_0 widthLong" style="overflow-x: auto;">
		<table class="tblType2_1">
			<colgroup>
				<col width="*" />
				<col width="100px" />
				<c:forEach items="${codeList}" var="endCodeData" varStatus="status">
					<col width="90px" />
				</c:forEach>
				<col width="100px" />
			</colgroup>
			<tfoot>	
			<tr>
				<th>계</th>
				<th class="right"><fmt:formatNumber value="${memSum}" /></th>
		
				<c:set value="<%=pref %>" var="aSum"/>
				<c:forEach items="${codeList}" var="plist" varStatus="status">
					<c:set var="aCode" value="${plist.code }" />
					<th class="right"><fmt:formatNumber value="${aSum[aCode]}"/></th>
				</c:forEach>
				
				<th class="right"><fmt:formatNumber value="${totSum}" /></th> 
			</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->
</form:form>



