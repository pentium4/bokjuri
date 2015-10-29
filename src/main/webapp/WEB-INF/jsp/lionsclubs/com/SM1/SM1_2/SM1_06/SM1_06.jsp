<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		/*
			그룹코드 추가
		*/
		$("#add").on("click", function() {
			$("#dialog-form-add").dialogPopup({
				 height: 300
				,width: 500
			});
		});	
		
		$("#codeAdd").on("click", function() {
			var params = $("#formInsert").serializeArray();
			
			if($("#formInsert #groupCode").val() == ""){
				alert("그룹코드를 입력해 주세요.");
				$("#formInsert #groupCode").focus();
				return;
			}
			
			$.ajax({
				url: '<c:url value="/SM1/SM1_2/SM1_06/SM1_06_InputInsert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						goUrl('<c:url value="/SM1/SM1_2/SM1_06/SM1_06.do?pageIndex=${param.pageIndex == null ? 1 : param.pageIndex}" />');
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				}
			});	
		});	
		
		/*
			그룹코드 수정
		*/
		$("#update").bind("click", function() {
			var groupCode = $("#formUpdate #groupCode").val();
			
			if(groupCode == ""){
				alert("수정할 그룹코드를 선택해 주세요.");
				return;
			}
			
			$("#dialog-form-update").dialogPopup({
				 height: 300
				,width: 500
			});	
		});
		
		$("#codeUpdate").on("click", function() {
			var params = $("#formUpdate").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_2/SM1_06/SM1_06_EditUpdate.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						goUrl('<c:url value="/SM1/SM1_2/SM1_06/SM1_06.do?pageIndex=${param.pageIndex == null ? 1 : param.pageIndex}" />');
					}
				}
			});
		});		
	
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $("#form .tblType2 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var groupCode = $(".groupCode").eq(index).val();
			var groupCodeName = $(".groupCodeName").eq(index).val();
			var groupCodeDesc = $(".groupCodeDesc").eq(index).val();
			var ord = $(".ord").eq(index).val();
			var useYn = $(".useYn").eq(index).val();
			var insertDate = $(".insertDate").eq(index).val();
			
			// 업데이트
			$("#formUpdate #groupCodeText").text(groupCode);
			$("#formUpdate #groupCode").val(groupCode);
			$("#formUpdate #groupCodeName").val(groupCodeName);
			$("#formUpdate #groupCodeDesc").val(groupCodeDesc);
			$("#formUpdate #ord").val(ord);
			$("#formUpdate #useYn").val(useYn);
			$("#formUpdate #insertDate").text(insertDate);
			
			// 삭제
			$("#formDelete #groupCode").val(groupCode);
		});
		
		
		/*
			그룹코드 삭제
		*/
		$("#delete").on("click", function() {
			var groupCode = $("#formDelete #groupCode").val();
	
			if(groupCode == ""){
				alert("삭제할 그룹코드를 선택해 주세요.");
				return;
			}
			
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}		
			
			var params = $("#formDelete").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_2/SM1_06/SM1_06_Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						goUrl('<c:url value="/SM1/SM1_2/SM1_06/SM1_06.do?pageIndex=${param.pageIndex == null ? 1 : param.pageIndex}" />');
					}
				}
			});
		});	
		
		$("#formInsert #groupCode").mask("9999").numericOnly();
	});
});

function linkPage(index){
	$("#pageIndex").val(index);
	$("#form").submit();
}
</script>
<style>
.tblType2 tbody tr{
	cursor: pointer;
}
</style>
<form:form id="form" modelAttribute="SM1_06VO" action="/SM1/SM1_2/SM1_06/SM1_06.do">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="title" /></h4>
	<div class="btnBox">
		<img id="add" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer authorization write"/>
		<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write"/>
		<img id="delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write"/>	
	</div>

	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2" summary="그룹코드 입력표">
			<caption>그룹코드 입력</caption>
			<colgroup>
				<col width="100px" />
				<col width="250px" />
				<col width="120px" />
				<col width="*" />
			</colgroup>
			<tr>
				<th>그룹코드</th>
				<th>그룹코드 명칭</th>
				<th>등록일자</th>
				<th>그룹코드 명칭 설명</th>
			</tr>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2 Scroll_Table">
			<colgroup>
				<col width="100px" />
				<col width="250px" />
				<col width="120px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:forEach var="list" items="${resultList }">
					<tr>
						<td class="center">
							<a href="#" onclick="goUrl('<c:url value="/SM1/SM1_2/SM1_07/SM1_07.do?menuId=468&groupCode=${list.groupCode }" />')">${list.groupCode }</a>
							<input type="hidden" class="groupCode" value="${list.groupCode }" />
							<input type="hidden" class="groupCodeName" value="${list.groupCodeName }" />
							<input type="hidden" class="groupCodeDesc" value="${list.groupCodeDesc }" />
							<input type="hidden" class="ord" value="${list.ord }" />
							<input type="hidden" class="useYn" value="${list.useYn }" />
							<input type="hidden" class="insertDate" value="<fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" />" />
						</td>
						<td>${list.groupCodeName }</td>
						<td class="center">
							<fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" />
						</td>
						<td>${list.groupCodeDesc }</td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div><!-- Height_1 -->
</div><!-- table -->

<!-- 본문 내용 끝 -->
<form:hidden path="groupCode"/>
</form:form>

<!-- Modal Popup -->  
<div id="dialog-form-add" class="dialog" style="display: none;">
	<form:form id="formInsert" modelAttribute="SM1_06VO" action="/SM1/SM1_2/SM1_06/SM1_06_InputInsert.do">
		<div id="popup">
			<h3><div>그룹코드 추가</div></h3>
			<div class="popup_bg">
				<table class="tblType2">
					<colgroup>
						<col width="120px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>그룹코드<span class="require">*</span></th>
							<td>
								<form:input path="groupCode" cssClass="input" size="4" maxlength="4" />
							</td>
						</tr>
						<tr>
							<th>그룹코드 명칭</th>
							<td>
								<form:input path="groupCodeName" cssClass="input" size="25" maxlength="400" />
							</td>
						</tr>
						<tr>
							<th>등록일자</th>
							<td>
								<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" />
							</td>
						</tr>
						<tr>
							<th>그룹코드 설명</th>
							<td style="padding:5px 0 5px 5px;">
								<form:textarea path="groupCodeDesc" cols="40" rows="3" cssStyle="width:98%;border:1px solid #aaa;" maxlength="400" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg -->
			
			<div class="popupBtn">
				<input type="image" id="codeAdd" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" onclick="return false;" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</form:form>	
</div>

<!-- Modal Popup -->  
<div id="dialog-form-update" class="dialog" style="display: none;">
	<form:form id="formUpdate" modelAttribute="SM1_06VO" action="/SM1/SM1_2/SM1_06/SM1_06_EditUpdate.do">
		<div id="popup">
			<h3><div>그룹코드 수정</div></h3>
			
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="120px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>그룹코드</th>
							<td>
								<span id="groupCodeText"></span>
								<form:hidden path="groupCode" />
							</td>
						</tr>
						<tr>
							<th>그룹코드 명칭</th>
							<td>
								<form:input path="groupCodeName" cssClass="input" size="25" maxlength="400" />
							</td>
						</tr>
						<tr>
							<th>등록일자</th>
							<td>
								<span id="insertDate"></span>
							</td>
						</tr>
						<tr>
							<th>그룹코드 설명</th>
							<td style="padding:5px 0 5px 5px;">
								<form:textarea path="groupCodeDesc" cols="40" rows="3" cssStyle="width:98%;border:1px solid #aaa;" maxlength="400" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg -->
			
			<div class="popupBtn">
				<input type="image" id="codeUpdate" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" onclick="return false;" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</form:form>
</div>

<form:form id="formDelete" modelAttribute="SM1_06VO" action="/SM1/SM1_2/SM1_06/SM1_06_Delete.do">
	<form:hidden path="groupCode" />
</form:form>
