<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		var tr = $(".tblType2_1 tbody tr");
		tr.on("click", function(){
			var memberNo = $(this).find("td").eq(0).text();
			var name = $(this).find("td").eq(1).text();
			var birth = $(this).find("td").eq(2).text();
			
			var value = "?memberNo=" + memberNo + "&name=" + name + "&birth=" + birth.trim();
			opener._memberResult(value);
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
<form:form id="MM1_01VO" modelAttribute="MM1_01VO">
	<h3><div>성명순 조회</div></h3>
	
	<div class="popup_bg">
		<div class="tblTitle Scroll_Title">
			<table class="tblType2_1" summary="경력(선임/위촉) 안내표">
				<caption>경력(선임/위촉)</caption>
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="100px" />
					<col width="150px" />
					<col width="120px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>성명</th>
						<th>생년월일</th>
						<th>소속지구</th>
						<th>소속클럽</th>
						<th>클럽직책</th>
						<th>지구직책</th>
						<th>퇴회일자</th>
						<th>퇴회사유</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" style="overflow-y:auto;height:200px !important;">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="100px" />
					<col width="150px" />
					<col width="120px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>${list.memberNo }</td>
							<td>${list.name }</td>
							<td>
								<fmt:parseDate var="birth" value="${list.birth }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${birth }" pattern="yyyy.MM.dd" />										
							</td>
							<td class="left"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td class="left"></td>
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
