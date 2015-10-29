<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvl:3
			,fixVal: "${vo.orgCode}"
			,searchable: true
		});
		
		$("#thisYear").sessionYearCombo({
			  fixVal: "${vo.thisYear}"  // 고정값
			  ,top:false
		});
		
		$("#form_list").submit(function() {
			if($("#orgCode").val() == null){
				return false;
			}
		});
		
		$("#btnSearch").on("click", function(){
			$.saveOrganCode({
				 lvl:3
				,organCode: $("#orgCode").val()
			});
			checkFormSubmit();
		});
		
		var checkFormSubmit =  function(){
			if($("#orgCode").val()=="" || $("#orgCode").val()==null){
				alert("조직을 선택하세요");
				return false;
			}else{
				$("#form_list").submit();
			}		
		};
	});
});

</script>
<form:form id="form_list" modelAttribute="MM3_11VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="회원입회 경력현황표">
	<caption>회원입회 경력현황</caption>
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
		<td><form:select path="thisYear" /></td>
	</tr>
	</tbody>
	</table>
</div>
<div class="table" style="margin-bottom:15px !important;">
	<h4>회원입회경력현황</h4>
	<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
	</div>
	<div class="tblTitle mT5 Scroll_Title Height_0">
	<table class="tblType2_1" summary="회원입회경력현황 조회표">
	<caption>회원입회경력현황</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="110px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
	</colgroup>
	<thead>
		<th>No</th>
		<th>클럽명</th>
		<th>조직총회일</th>
		<th>총원</th>
		<th>1-3년</th>
		<th>3-5년</th>
		<th>5-8년</th>
		<th>8-10년</th>
		<th>10-15년</th>
		<th>15-20년</th>
		<th>20년이상</th>
		<th>평균</th>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="110px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
	</colgroup>
	<thead>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
		<th style="display:none;"></th>
	</thead>
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
	<c:forEach items="${resultList}" var="list" varStatus="status">
		<tr>
				<td>${status.count}</td>
				<td class="left" title="${fn:substring(list.organCode, 0, 3)}-${fn:substring(list.organCode, 3, 8)}">${list.organNmClub}</td>
				<td>
					<fmt:parseDate value="${list.organMeeting}" var="dateFmt" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
				</td>
				<td class="right">${list.yearCntSum}</td>
				<td class="right">${list.year1To3}</td>
				<td class="right">${list.year1To5}</td>
				<td class="right">${list.year1To8}</td>
				<td class="right">${list.year1To10}</td>
				<td class="right">${list.year1To15}</td>
				<td class="right">${list.year1To20}</td>
				<td class="right">${list.year20More}</td>
				<td class="right">${list.avg}</td>
				<c:set value="${tot1 + list.yearCntSum}" var="tot1"/>
				<c:set value="${tot2 + list.year1To3}" var="tot2"/>
				<c:set value="${tot3 + list.year1To5}" var="tot3"/>
				<c:set value="${tot4 + list.year1To8}" var="tot4"/>
				<c:set value="${tot5 + list.year1To10}" var="tot5"/>
				<c:set value="${tot6 + list.year1To15}" var="tot6"/>
				<c:set value="${tot7 + list.year1To20}" var="tot7"/>
				<c:set value="${tot8 + list.year20More}" var="tot8"/>
				<c:set value="${tot9 + list.avg}" var="tot9"/>
				<c:set value="${status.count}" var="listCnt"/>
			</tr>
	</c:forEach>
	</tbody>
</table>
</div><!-- Height_1 -->
	<div class="Scroll_Title Height_0 ">
		<table class="tblType2_1">
			<colgroup>
				<col width="*" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
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
					<th class="right"><fmt:formatNumber value="${avg }" pattern="0.0"/></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->

</form:form>