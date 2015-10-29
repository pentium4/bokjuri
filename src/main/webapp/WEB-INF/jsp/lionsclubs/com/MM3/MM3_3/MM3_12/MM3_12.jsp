<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${vo.orgCode}"
		});	
		
		$("#orgCode").on("change", function(){
			$.saveOrganCode({
				  lvl:3
			     ,organCode: $(this).val()
			});
		});
		
		$("#thisYear").sessionYearCombo({
			  fixVal: "${vo.thisYear}"  // 고정값
			  ,top:false
		});
		
		$("#form_list").submit(function() {
			if($("#orgCode").val()=="" || $("#orgCode").val()==null){
				return false;
			}
		});
		
		$("#btnSearch").bind("click", function(){
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
<form:form id="form_list" modelAttribute="MM3_12VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="회원연령 구성현황표">
	<caption>회원연령 구성현황</caption>
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
	<H4>회원연령구성현황</H4>
	<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
	</div>
	<div class="tblTitle mT5 Scroll_Title Height_0">
	<table class="tblType2_1" summary="회원연령구성현황 조회표">
	<caption>회원연령구성현황</caption>
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
		<th title="35미만">35미만</th>
		<th title="35-40">35-40</th>
		<th title="40-45">40-45</th>
		<th title="45-50">45-50</th>
		<th title="50-55">50-55</th>
		<th title="55-60">55-60</th>
		<th title="60이상">60이상</th>
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
	<c:set value="0" var="tot9"/>
	<c:forEach items="${resultList}" var="list" varStatus="status">
		<tr>
				<td>${status.count}</td>
				<td class="left" title="${fn:substring(list.organCode, 0, 3)}-${fn:substring(list.organCode, 3, 8)}">${list.organNmClub}</td>
				<td>
					<fmt:parseDate value="${list.organMeeting}" var="dateFmt" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
				</td>
				<td class="right">${list.totCnt}</td>
				<td class="right">${list.age1}</td>
				<td class="right">${list.age2}</td>
				<td class="right">${list.age3}</td>
				<td class="right">${list.age4}</td>
				<td class="right">${list.age5}</td>
				<td class="right">${list.age6}</td>
				<td class="right">${list.age7}</td>
				<td class="right">${list.avg}</td>
				<c:set value="${tot1 + list.totCnt}" var="tot1"/>
				<c:set value="${tot2 + list.age1}" var="tot2"/>
				<c:set value="${tot3 + list.age2}" var="tot3"/>
				<c:set value="${tot4 + list.age3}" var="tot4"/>
				<c:set value="${tot5 + list.age4}" var="tot5"/>
				<c:set value="${tot6 + list.age5}" var="tot6"/>
				<c:set value="${tot7 + list.age6}" var="tot7"/>
				<c:set value="${tot8 + list.age7}" var="tot8"/>
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
		<th class="right"><fmt:formatNumber value="${tot9/listCnt}" pattern="#.#" /></th>
	</tr>
	</tfoot>
	</table>
	</div>
</div><!-- table -->

</form:form>