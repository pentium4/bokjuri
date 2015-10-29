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
			,fixVal: "${MM4_10VO_PARAM.orgCode}"
		});
	
		$("#orgCode").on("change", function(){
			$.saveOrganCode({
			     organCode: $(this).val()
			});
		});
		
		$("#yearCode").sessionYearCombo({
		   fixVal: "${MM4_10VO_PARAM.yearCode}"  // 고정값
		  ,top:false
		 });
		
		$("#month").monthCombo({
	        fixVal: "${MM4_10VO_PARAM.month}" // 고정값
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
	});
});

function moveSubOrg(orgCode){
	$("#orgCode").val(orgCode);
	$("#retrieveBtn").click();
}
</script>
<form:form id="form_list" modelAttribute="MM4_10VO_PARAM">
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
<div class="table">
	<div class="tblTitle mT5 Scroll_Title Height_0 widthLong">
		<table class="tblType2_1 table-fixed" summary="${param.menuId }표">
			<caption>${param.menuId }</caption>
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
			</colgroup>
			<thead>
				<tr>
					<th class="ellipsis" title="No.">No.</th>
					<th class="ellipsis" title="조직명">조직명</th>
					<th class="ellipsis" title="<c:out value="${MM4_10VO_PARAM.yearCode - 1 }-${MM4_10VO_PARAM.yearCode     }" />"><c:out value="${MM4_10VO_PARAM.yearCode - 1 }-${MM4_10VO_PARAM.yearCode     }" /></th>
					<th class="ellipsis" title="<c:out value="${MM4_10VO_PARAM.yearCode - 2 }-${MM4_10VO_PARAM.yearCode - 1 }" />"><c:out value="${MM4_10VO_PARAM.yearCode - 2 }-${MM4_10VO_PARAM.yearCode - 1 }" /></th>
					<th class="ellipsis" title="<c:out value="${MM4_10VO_PARAM.yearCode - 3 }-${MM4_10VO_PARAM.yearCode - 2 }" />"><c:out value="${MM4_10VO_PARAM.yearCode - 3 }-${MM4_10VO_PARAM.yearCode - 2 }" /></th>
					<th class="ellipsis" title="<c:out value="${MM4_10VO_PARAM.yearCode - 4 }-${MM4_10VO_PARAM.yearCode - 3 }" />"><c:out value="${MM4_10VO_PARAM.yearCode - 4 }-${MM4_10VO_PARAM.yearCode - 3 }" /></th>
					<th class="ellipsis" title="<c:out value="${MM4_10VO_PARAM.yearCode - 5 }-${MM4_10VO_PARAM.yearCode - 4 }" />"><c:out value="${MM4_10VO_PARAM.yearCode - 5 }-${MM4_10VO_PARAM.yearCode - 4 }" /></th>
					<th class="ellipsis" title="계">계</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table">
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
			</colgroup>
			<tbody>
				<c:set value="0" var="stotal1" />
				<c:set value="0" var="stotal2" />
				<c:set value="0" var="stotal3" />
				<c:set value="0" var="stotal4" />
				<c:set value="0" var="stotal5" />
				<c:set value="0" var="stot" />
				<c:forEach items="${resultMap}" var="list" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td class="left" orgCode="<c:out value="${list.orgCode }" />" <c:if test="${list.orgCode!='' && MM4_10VO_PARAM.lvl != '3' && MM4_10VO_PARAM.lvl != ''}">onclick="moveSubOrg('${list.orgCode }')" style="cursor:pointer;"</c:if>><c:out value="${list.orgName }" /></td>
						<td class="right"><fmt:formatNumber value="${list.sum1}" /></td>
						<td class="right"><fmt:formatNumber value="${list.sum2}" /></td>
						<td class="right"><fmt:formatNumber value="${list.sum3}" /></td>
						<td class="right"><fmt:formatNumber value="${list.sum4}" /></td>
						<td class="right"><fmt:formatNumber value="${list.sum5}" /></td>
						<td class="right"><fmt:formatNumber value="${list.tot}" /></td>
					</tr>
					<c:set value="${stotal1 + list.sum1 }" var="stotal1" />
					<c:set value="${stotal2 + list.sum2 }" var="stotal2" />
					<c:set value="${stotal3 + list.sum3 }" var="stotal3" />
					<c:set value="${stotal4 + list.sum4 }" var="stotal4" />
					<c:set value="${stotal5 + list.sum5 }" var="stotal5" />
					<c:set value="${stot + list.tot }" var="stot" />
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div class="Scroll_Title Height_0 widthLong">
		<table class="tblType2_1">
			<colgroup>
				<col width="*" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
			</colgroup>
			<tfoot>	
				<tr>
					<th>계</th>
					<th class="right"><fmt:formatNumber value="${stotal1}" /></th>
					<th class="right"><fmt:formatNumber value="${stotal2}" /></th>
					<th class="right"><fmt:formatNumber value="${stotal3}" /></th>
					<th class="right"><fmt:formatNumber value="${stotal4}" /></th>
					<th class="right"><fmt:formatNumber value="${stotal5}" /></th>
					<th class="right"><fmt:formatNumber value="${stot}" /></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->
</form:form>
