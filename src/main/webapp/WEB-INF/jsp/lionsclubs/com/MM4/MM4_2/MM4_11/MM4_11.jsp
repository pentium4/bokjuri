<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
		
		$("#orgCode").organCode({
			 lvlEnd: 4
			,searchable: true
			,fixVal: "${MM4_11VO_PARAM.orgCode}"
		});
		
		$("#orgCode").on("change", function(){
			$.saveOrganCode({
			     organCode: $(this).val()
			});
		});
		
		$("#yearCode").sessionYearCombo({
		   fixVal: "${MM4_11VO_PARAM.yearCode}"  // 고정값
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
<form:form id="form_list" modelAttribute="MM4_11VO_PARAM">
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
		<table class="tblType2_1 table-fixed" summary="${param.menuId }표">
			<caption>${param.menuId }</caption>
			<colgroup>
				<col width="50px" />
				<col width="*" />
				<col width="200px" />
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
					<th class="ellipsis" title="클럽명">클럽명</th>
					<th class="ellipsis" title="성명">성명</th>
					<th class="ellipsis" title="입회일자">입회일자</th>
					<th class="ellipsis" title="퇴회일자">퇴회일자</th>
					<th class="ellipsis" title="지구직책">지구직책</th>
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
				<col width="200px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
			</colgroup>
			<tbody>
				<c:set value="0" var="payMentSum" />
				<c:forEach items="${resultList}" var="list" varStatus="status">
				<c:set value="${payMentSum + list.payMent}" var="payMentSum" />
					<tr>
						<td>${status.count }</td>
						<td class="left" <c:if test="${MM4_11VO_PARAM.lvl != '4' && MM4_11VO_PARAM.lvl != ''}">title="<c:out value="${list.orgCode }" />"</c:if>><c:if test="${MM4_11VO_PARAM.lvl != '4' && MM4_11VO_PARAM.lvl != ''}"><c:out value="${list.orgName }" /></c:if></td>
						<td class="left" title="<c:out value="${list.clubCode }" />"><c:out value="${list.clubName }" /></td>
						<td><c:out value="${list.memName }" /></td>
						<td><c:out value="${list.inDate }" /></td>
						<td><c:out value="${list.outDate }" /></td>
						<td class="left" ><c:out value="${list.posName }" /></td>
						<td class="right"><fmt:formatNumber value="${list.payMent}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div class="Scroll_Title Height_0 widthLong">
		<table class="tblType2_1">
			<colgroup>
				<col width="*" />
				<col width="200px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
				<col width="120px" />
			</colgroup>
			<tfoot>	
				<tr>
					<th>계</th>
					<th class="right">-</th>
					<th class="right">-</th>
					<th class="right">-</th>
					<th class="right">-</th>
					<th class="right">-</th>
					<th class="right"><fmt:formatNumber value="${payMentSum }" /></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->
</form:form>


