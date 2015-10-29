<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");

		$(".docTitle").on("click", function(){
			var data = $(this).data();
			openPopup('<c:url value="/MM7/MM7_1/MM7_01/docReceptionDetailPopup.do?idnNo=' + data.idnno + '" />', 1000, 750, 'docPopup');
		});
		
		$(".receive").on("click", function(){
			var data = $(this).data();
			openPopup('<c:url value="/MM7/MM7_1/MM7_01/receivePopup.do?idnNo=' + data.idnno + '" />', 800, 500, 'receivePopup');
		});
		
		// 발신 조직
		$("#outgoingOrganCode").organCode({
			 searchable: true
			,top: true
			,auth: false
			,fixVal: "${MM7_01VO.outgoingOrganCode}"
		});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
		
		$("#docTitle").on("keypress", function(event){
			if (event.which == 13) {
				_search();
			}
		});
	});
});

function _search(){
	$("#pageIndex").val(1);
	$("form").submit();
}
</script>

<style>
<!--
.tblType2_1 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form id="form" modelAttribute="MM7_01VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="80px" />
				<col width="400px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>수신조직</th>
					<td>
						<form:select path="receiveOrganCode">
							<form:option value="" label="--전체--" />
							<c:forEach items="${listWriteOrganCode }" var="list">
								<form:option value="${list.organCode }">${list.organName }</form:option>
							</c:forEach>
						</form:select>	
					</td>
					<th>발신조직</th>
					<td><form:select path="outgoingOrganCode" /></td>
				</tr>
				<tr>
					<th>문서제목</th>
					<td colspan="3"><form:input path="docTitle" cssClass="input" size="100" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" alt="검색" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2">
				<colgroup>
					<col width="50px" />
					<col width="120px" />
					<col width="*" />
					<col width="200px" />
					<col width="200px" />
					<col width="100px" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>문서번호</th>
						<th>문서제목</th>
						<th>발신조직</th>
						<th>수신조직</th>
						<th>수신일시</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="120px" />
					<col width="*" />
					<col width="200px" />
					<col width="200px" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }">
						<tr style="${list.readYn eq 'N' ? 'font-weight:bold' : ''}">
							<td class="center">${list.rnum }</td>
							<td class="center">${fn:substring(list.docNo, 8, 21) }</td>
							<td class="left pointer docTitle" data-idnno="${list.idnNo }" title="${list.docTitle }">${list.docTitle }</td>
							<td class="left" title="${lions:formatOrganCode(list.outgoingOrganCode)} ${list.outgoingOrganName }">${lions:formatOrganCode(list.outgoingOrganCode)} ${list.outgoingOrganName }</td>
							<c:choose>
								<c:when test="${not empty list.receive }">
									<td class="left pointer receive" data-idnno="${list.idnNo }" title="모든수신처 보기">${list.receive }</td>
								</c:when>
								<c:otherwise>
									<td class="left"></td>
								</c:otherwise>
							</c:choose>
							
							<td class="center"><fmt:formatDate value="${list.updateDate }" pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>
	</div><!-- table -->
</form:form>
