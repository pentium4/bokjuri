<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$(".docTitle").on("click", function(){
			var data = $(this).data();
			openPopup('<c:url value="/MM7/MM7_1/MM7_01/docReceptionDetailPopup.do?idnNo=' + data.idnno + '" />', 1000, 750, 'docPopup');
		});
		
		$(".receive").on("click", function(){
			var data = $(this).data();
			openPopup('<c:url value="/MM7/MM7_1/MM7_01/receivePopup.do?idnNo=' + data.idnno + '" />', 800, 500, 'receivePopup');
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
	});
});

function _search(){
	$("form").submit();
}
</script>
<style>
.tblType2_1 tbody tr{
	cursor: pointer;
}
</style>
<form:form id="form" modelAttribute="MM7_01VO">
	<h3><div>읽지않은 수신문서</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="80px" />
				<col width="350px" />
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
					<th>문서제목</th>
					<td><form:input path="docTitle" cssClass="input" size="35" /></td>
				</tr>
			</tbody>
		</table>
		<div class="btnBox2">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer"/>
		</div>
			
		<div class="tblTitle Scroll_Title mT10">
			<table class="tblType2">
				<colgroup>
					<col width="50px" />
					<col width="120px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
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
		
		<div id="Scroll_Area" class="Height_1" style="height: 380px !important;">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="120px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }">
						<tr>
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
		</div>
		
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>		
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
