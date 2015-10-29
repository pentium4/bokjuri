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
			,fixVal: "${MM3_10VO_PARAM.orgCode}"
		});
		
		if($("#outCheck").val() == "1"){
			$("input:checkbox[name=ocheck]").attr("checked",true);	
		} 
		
		$("#orgCode").on("change", function(){
			$.saveOrganCode({
				  lvl:3
			     ,organCode: $(this).val()
			});
		});
		
		$("#yearCode").sessionYearCombo({
			  fixVal: "${MM3_10VO_PARAM.yearCode}"  // 고정값
			  ,top:false
			 });
		
		$("#retrieveBtn").click(function(){
			if($("#orgCode").val() == "" || $("#orgCode").val() == null){
				alert("선택된 조직이 없습니다.");
				return false;
			}
			if($("input:checkbox[name=ocheck]").is(":checked") == false){
				$("#outCheck").val("0");
			}else{
				$("#outCheck").val("1");
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

<form:form id="form_list"  modelAttribute="MM3_10VO_PARAM">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="클럽회기별인원현황표">
	<caption>클럽회기별인원현황</caption>
	<colgroup>
		<col width="100px" />
		<col width="500px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>선택조직</th>
		<td><form:select path="orgCode" /></td>
		<td><input type="checkbox" name="ocheck" /> 퇴회자제외
			<form:hidden path="outCheck"/>
		</td>
	</tr>
	<tr>
		<th>회기선택</th>
		<td colspan="2"><form:select path="yearCode" /></td>
	</tr>
	</tbody>
	</table>
	<div class="btnBox2">
		<img id="retrieveBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" /> 
	</div>
</div>
<div class="table" style="margin-bottom:15px !important;">
	<div class="tblTitle mT5 Scroll_Title Height_0">
	<table class="tblType2_1" summary="지역회기별인원현황표">
	<caption>지역회기별인원현황</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
	</colgroup>
	<thead>
		<th>No</th>
		<th>클럽명</th>
		<th>조직총회일</th>
		<th>${MM3_10VO_PARAM.term1}</th>
		<th>${MM3_10VO_PARAM.term2}</th>
		<th>${MM3_10VO_PARAM.term3}</th>
		<th>${MM3_10VO_PARAM.term4}</th>
		<th>${MM3_10VO_PARAM.term5}</th>
		<th>평균</th>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
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
	</thead>
	<tbody>
	<c:set value="0" var="tot1"/>
	<c:set value="0" var="tot2"/>
	<c:set value="0" var="tot3"/>
	<c:set value="0" var="tot4"/>
	<c:set value="0" var="tot5"/>
	<c:forEach items="${resultList}" var="list" varStatus="status">
	<tr>
		<td>${status.count }</td>
		<td class="left" orgCode="${list.orgCode }">${list.orgName }</td>
		<td>
			<fmt:parseDate value="${list.orgMeeting}" var="dateFmt" pattern="yyyyMMdd"/>
			<fmt:formatDate value="${dateFmt}" pattern="yyyy.MM.dd"/>
		</td>
		<td class="right"><fmt:formatNumber value="${list.cnt1}" /></td>
		<td class="right"><fmt:formatNumber value="${list.cnt2}" /></td>
		<td class="right"><fmt:formatNumber value="${list.cnt3}" /></td>
		<td class="right"><fmt:formatNumber value="${list.cnt4}" /></td>
		<td class="right"><fmt:formatNumber value="${list.cnt5}" /></td>
		<td class="right"><fmt:formatNumber value="${list.avgs}" /></td>
		<c:set value="${tot1 + list.cnt1}" var="tot1"/>
		<c:set value="${tot2 + list.cnt2}" var="tot2"/>
		<c:set value="${tot3 + list.cnt3}" var="tot3"/>
		<c:set value="${tot4 + list.cnt4}" var="tot4"/>
		<c:set value="${tot5 + list.cnt5}" var="tot5"/>
	</tr>
	</c:forEach>
	</tbody>
</table>
</div><!-- Height_1 -->
	<div class="Scroll_Title Height_0 ">
	<table class="tblType2_1">
	<colgroup>
		<col width="*" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
		<col width="111px" />
	</colgroup>
	<tfoot>	
	<tr>
		<th>계</th>
		<th class="right"><fmt:formatNumber value="${tot1}" /></th>
		<th class="right"><fmt:formatNumber value="${tot2}" /></th>
		<th class="right"><fmt:formatNumber value="${tot3}" /></th>
		<th class="right"><fmt:formatNumber value="${tot4}" /></th>
		<th class="right"><fmt:formatNumber value="${tot5}" /></th>
		<th class="right"><fmt:formatNumber value="${(tot1 + tot2 + tot3 + tot4 + tot5) / 5}" maxFractionDigits="0"/></th>
	</tr>
	</tfoot>
	</table>
	</div>
</div><!-- table -->

</form:form>


