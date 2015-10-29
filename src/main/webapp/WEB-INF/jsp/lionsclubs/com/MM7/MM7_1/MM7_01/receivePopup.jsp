<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
<!--
var isSave = "N";

require(['init'], function () {
	$(document).ready(function () {
		$("#btnSearch").on("click", function(){
			_search();
		});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			var _this = $(this);			
			tbl.css("background-color","#ffffff");
			_this.css("background-color","#E0FFE0");

			var data = _this.data();
			var params = [];
			params.push({name: "idnNo", value: data.idnno});
			params.push({name: "receiveOrganCode", value: data.receiveorgancode});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  "/MM7/MM7_1/MM7_01/listReceiveMember.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var $receiveMember = $("#receiveMember");
						$receiveMember.find("tbody").empty();
						
						var total = data.resultList.length;
						var html = "";
						$.each(data.resultList, function(index, object){
							html += "<tr>";
							html += "	<td class='center'>" + object.name + "</td>";
							html += "	<td class='center'>" + object.searchDate + "</td>";
							html += "</tr>";
							
							if(total == index + 1){
								$receiveMember.find("tbody").append(html);
								
								$("#dialog-form-receiveMember").dialogPopup({
									 height: 600
									,width: 300
								});
								
								Scroll_Actrion();
								Scroll_Table1();						
							}							
						});
						
						if(total == 0){
							$("#dialog-form-receiveMember").dialogPopup({
								 height: 300
								,width: 500
							});
							
							Scroll_Actrion();
							Scroll_Table1();
						}
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});
		});
	});
});

function _search(){
	$("form").submit();
}
//-->
</script>
<style>
<!--
.tblType2_1 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form id="form" modelAttribute="MM7_01VO">
	<h3><div>수신처 수신확인</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직명</th>
					<td><form:input path="receiveOrganName" cssClass="input" /></td>
				</tr>
			</tbody>
		</table>
		<div class="btnBox2">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer"/>
		</div>
		
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>문서제목</th>
					<td>${result.docTitle }</td>
				</tr>
			</tbody>
		</table>
		
		<div class="tblTitle Scroll_Title mT10">
			<table class="tblType2_1" style="width:98%;">
				<colgroup>
					<col width="250px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<thead>
				<tr>
					<th>조직명</th>
					<th>최초수신일</th>
					<th>수신자</th>
				</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1" style="height:300px !important;">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="250px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr data-idnno="${list.idnNo }" data-receiveorgancode="${list.receiveOrganCode }">
							<td class="left" title="${list.receiveOrganName }">${list.receiveOrganName }</td>
							<td>${fn:substring(list.searchDate, 0, 10) }</td>
							<td class="left" title="${list.receiveMember }">${list.receiveMember }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div><!-- popup_bg -->
	
	<!-- Modal Popup -->  
	<div id="dialog-form-receiveMember" class="dialog" style="display: none;">
		<div id="popup" style="margin-left: -5px;">
			<h3><div>받는사람</div></h3>
			<div class="popup_bg">
				<div class="tblTitle Scroll_Title">
					<table class="tblType2_1">
						<colgroup>
							<col width="100px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th>이름</th>
								<th>읽은날짜</th>
							</tr>
						</thead>
					</table>
				</div><!-- tblTitle -->
				
				<div id="receiveMember" class="Height_1" style="height:340px !important;">
					<table class="tblType2 Scroll_Table">
						<colgroup>
							<col width="100px" />
							<col width="*" />
						</colgroup>
						<tbody>
						</tbody>
					</table>
				</div>				
			</div><!-- popup_bg -->
			
			<div class="popupBtn">
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</div>	
	
	<div class="popupBtn">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
