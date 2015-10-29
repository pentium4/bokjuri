<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#addPopup").click(function() {
			$("#dialog-form-add").dialogPopup({
				 height: 370
				,width: 500
			});
		});
		
		$("#add").click(function() {
			var params = $("#formInsert").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_3/SM1_09/insert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 입력 되었습니다.');
						goUrl('<c:url value="/SM1/SM1_3/SM1_09/selectList.do?pageIndex=${param.pageIndex == null ? 1 : param.pageIndex}" />');
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		$("#updatePopup").click(function() {
			var uiNo = $("#formUpdate #uiNo").val();
			
			if(uiNo == ""){
				alert("수정할 메뉴를 선택해 주세요.");
				return;
			}
			
			$("#dialog-form-update").dialogPopup({
				 height: 370
				,width: 500
			});
		});	
		
		$("#update").click(function() {
			var params = $("#formUpdate").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_3/SM1_09/update.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 수정 되었습니다.');
						goUrl('<c:url value="/SM1/SM1_3/SM1_09/selectList.do?pageIndex=${param.pageIndex == null ? 1 : param.pageIndex}" />');
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});	
		
		
		$("#delete").click(function() {
			var uiNo = $("#formDelete #uiNo").val();
			
			if(uiNo == ""){
				alert("삭제할 메뉴를 선택해 주세요.");
				return;
			}
			
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			var params = $("#formDelete").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_3/SM1_09/delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						alert('정상적으로 삭제 되었습니다.');
						goUrl('<c:url value="/SM1/SM1_3/SM1_09/selectList.do?pageIndex=${param.pageIndex == null ? 1 : param.pageIndex}" />');
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var uiNo = $(this).find(".uiNo").val();
			var menu1 = $(this).find(".menu1").val();
			var menu2 = $(this).find(".menu2").val();
			var menu3 = $(this).find(".menu3").val();
			var title = $(this).find(".title").val();
			var mainTitle = $(this).find(".mainTitle").val();
			var subTitle = $(this).find(".subTitle").val();
			var programName = $(this).find(".programName").val();
			var noticeKindCode = $(this).find(".noticeKindCode").val();
			var url = $(this).find(".url").val();
			
			// 업데이트
			$("#formUpdate #uiNo").val(uiNo);
			$("#formUpdate #menu1").val(menu1);
			$("#formUpdate #menu2").val(menu2);
			$("#formUpdate #menu3").val(menu3);
			$("#formUpdate #title").val(title);
			$("#formUpdate #mainTitle").val(mainTitle);
			$("#formUpdate #subTitle").val(subTitle);
			$("#formUpdate #programName").val(programName);
			$("#formUpdate #noticeKindCode").val(noticeKindCode);
			$("#formUpdate #url").val(url);
			
			// 삭제
			$("#formDelete #uiNo").val(uiNo);
			
			$("#formUpdate #noticeKindCode").trigger("change");
		});
		
	    $("#formInsert #menu1, #formUpdate #menu1").numericOnly();
	    $("#formInsert #menu2, #formUpdate #menu2").numericOnly();
	    $("#formInsert #menu3, #formUpdate #menu3").numericOnly();
	    
	    $("#formInsert #noticeKindCode, #formUpdate #noticeKindCode").on("change", function(){
	    	var $this = $(this);
	    	if(!$this.val().isEmpty()){
	    		$this.closest("form").find("#url").val("/notice/notice.do").prop("readonly", true);
	    	} else {
	    		$this.closest("form").find("#url").prop("readonly", false);
	    	}
	    }).change();
	});
});

function linkPage(index){
	$("#pageIndex").val(index);
	$("#form").submit();
}
</script>

<style>
<!--
.tblType2_1 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form id="form" modelAttribute="SM1_09VO" action="/SM1/SM1_3/SM1_09/selectList.do">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
	
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="addPopup" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer authorization write"/>
			<img id="updatePopup" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write"/>
			<img id="delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write"/>
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="메뉴출력정의 표">
				<caption>메뉴출력정의</caption>
				<colgroup>
					<col width="50px" />
					<col width="50px" />
					<col width="50px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>메뉴1</th>
						<th>메뉴2</th>
						<th>메뉴3</th>
						<th>프로그램 제목</th>
						<th>프로그램 주 제목</th>
						<th>프로그램 중제목</th>
						<th>URL(프로그램 위치)</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="50px" />
					<col width="50px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td>
								${list.menu1 }
								<input type="hidden" class="uiNo" value="${list.uiNo }" />
								<input type="hidden" class="menu1" value="${list.menu1 }" />
								<input type="hidden" class="menu2" value="${list.menu2 }" />
								<input type="hidden" class="menu3" value="${list.menu3 }" />
								<input type="hidden" class="title" value="${list.title }" />
								<input type="hidden" class="mainTitle" value="${list.mainTitle }" />
								<input type="hidden" class="subTitle" value="${list.subTitle }" />
								<input type="hidden" class="programName" value="${list.programName }" />
								<input type="hidden" class="noticeKindCode" value="${list.noticeKindCode }" />
								<input type="hidden" class="url" value="${list.url }" />
							</td>
							<td>${list.menu2 }</td>
							<td>${list.menu3 }</td>
							<td class="left">${list.title }</td>
							<td class="left">${list.mainTitle }</td>
							<td class="left">${list.subTitle }</td>
							<td class="left">${list.url }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>
<!-- 본문 내용 끝 -->

<!-- Modal Popup -->  
<div id="dialog-form-add" class="dialog" style="display: none;">
	<form:form id="formInsert" modelAttribute="SM1_09VO" action="/SM1/SM1_3/SM1_09/insert.do">
		<div id="popup">
		<h3><div>프로그램 메뉴 추가</div></h3>
		
		<div class="popup_bg">
			<table class="tblType2" style="width:98%;">
			<colgroup>
				<col width="200px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th class="left">메뉴1(타이틀)</th>
					<td>
						<form:input path="menu1" cssClass="input" size="5" maxlength="5" />
					</td>
				</tr>
				<tr>
					<th class="left">메뉴2(제목메뉴)</th>
					<td>
						<form:input path="menu2" cssClass="input" size="5" maxlength="5" />
					</td>
				</tr>
				<tr>
					<th class="left">메뉴3(프로그램 제목)</th>
					<td>
						<form:input path="menu3" cssClass="input" size="5" maxlength="5" />
					</td>
				</tr>
				<tr>
					<th class="left">프로그램 제목</th>
					<td>
						<form:input path="title" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
				<tr>
					<th class="left">프로그램 주 제목</th>
					<td>
						<form:input path="mainTitle" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
				<tr>
					<th class="left">프로그램 중 제목</th>
					<td>
						<form:input path="subTitle" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
				<tr>
					<th class="left">게시판 종류</th>
					<td>
						<lions:codeselect groupCode="8540" path="noticeKindCode" cssClass="select" />
					</td>
				</tr>				
				<tr>
					<th class="left">URL(프로그램 위치)</th>
					<td>
						<form:input path="url" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
			</tbody>
			</table>
		</div><!-- popup_bg -->
		
		<div class="popupBtn">
			<img id="add" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer" />
			<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
		</div>
		
		<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
		</div><!-- popup -->
	</form:form>
</div>

<div id="dialog-form-update" class="dialog" style="display: none;">
	<form:form id="formUpdate" modelAttribute="SM1_09VO" action="/SM1/SM1_3/SM1_09/update.do">
		<div id="popup">
		<h3><div>프로그램 메뉴 수정</div></h3>
		
		<div class="popup_bg">
			<table class="tblType2" style="width:98%;">
			<colgroup>
				<col width="200px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th class="left">메뉴1(타이틀)</th>
					<td>
						<form:input path="menu1" cssClass="input" size="5" maxlength="5" />
						<form:hidden path="uiNo"/>
					</td>
				</tr>
				<tr>
					<th class="left">메뉴2(제목메뉴)</th>
					<td>
						<form:input path="menu2" cssClass="input" size="5" maxlength="5" />
					</td>
				</tr>
				<tr>
					<th class="left">메뉴3(프로그램 제목)</th>
					<td>
						<form:input path="menu3" cssClass="input" size="5" maxlength="5" />
					</td>
				</tr>
				<tr>
					<th class="left">프로그램 제목</th>
					<td>
						<form:input path="title" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
				<tr>
					<th class="left">프로그램 주 제목</th>
					<td>
						<form:input path="mainTitle" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
				<tr>
					<th class="left">프로그램 중 제목</th>
					<td>
						<form:input path="subTitle" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
				<tr>
					<th class="left">게시판 종류</th>
					<td>
						<lions:codeselect groupCode="8540" path="noticeKindCode" />
					</td>
				</tr>
				<tr>
					<th class="left">URL(프로그램 위치)</th>
					<td>
						<form:input path="url" cssClass="input" size="50" cssStyle="width:99%;" />
					</td>
				</tr>
			</tbody>
			</table>
		</div><!-- popup_bg -->
		
		<div class="popupBtn">
			<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer" />
			<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
		</div>
		
		<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
		</div><!-- popup -->
	</form:form>
</div>

<form:form id="formDelete" modelAttribute="SM1_09VO" action="/SM1/SM1_3/SM1_09/delete.do">
	<form:hidden path="uiNo" />
</form:form>