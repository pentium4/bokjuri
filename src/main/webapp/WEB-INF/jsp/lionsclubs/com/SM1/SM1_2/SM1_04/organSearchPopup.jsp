<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
require(['init'], function () {
	$(document).ready(function () {
		var tr = $(".tblType2_1 tbody tr");
		tr.on("click", function(){
			var organCode = $(this).find("#organCode").val();
			var koName = $(this).find("#koName").val();
			var organOfficerMemberName = $(this).find("#organOfficerMemberName").val();
			
			var value = "?organCode=" + organCode + "&koName=" + koName + "&organOfficerMemberName=" + organOfficerMemberName;
			
			var returnfunction = "${param.returnFunction}".isEmpty() ? "_organResult" : "${param.returnFunction}";
			
			eval("opener." + returnfunction + "(value)");
			closeWin();
		});
		
		if(tr.length == 1){
			tr.trigger("click");
		}
	});
});
</script>
<style>
<!--
.tblType2_1 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form id="SM1_04VO" modelAttribute="SM1_04VO">
	<h3><div>조직코드 조회</div></h3>
	
	<div class="popup_bg">
		<div class="tblTitle Scroll_Title">
			<table class="tblType2_1" style="width:98%;">
			<colgroup>
				<col width="80px" />
				<col width="" />
				<col width="100px" />
			</colgroup>
			<thead>
			<tr>
				<th>코드명</th>
				<th>한글명</th>
				<th>조직책임자</th>
			</tr>
			</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1" style="height:200px !important;">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>
								${lions:formatOrganCode(list.organCode) }
								<input type="hidden" id="organCode" value="${list.organCode }" />
								<input type="hidden" id="koName" value="${list.koName }" />
								<input type="hidden" id="organOfficerMemberName" value="${list.organOfficerMemberName }" />
							</td>
							<td class="left">${list.koName }</td>
							<td>${list.organOfficerMemberName }</td>
						</tr>
					</c:forEach>				
				</tbody>
			</table>
		</div>
	</div><!-- popup_bg -->
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>	
	
	<h5><div>조회하실 회원번호를 클릭하세요!</div></h5>
	
	<div class="popupBtn">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
