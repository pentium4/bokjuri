<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		var _noticeCode = null;
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			_noticeCode = $(this).find(".noticeCode").val();
		});
		
		$("#update").on("click", function(){
			
			if(_noticeCode == null){
				alert("수정할 게시판 코드를 선택해 주세요.");
				return false;
			}
			
			var url = "/notice/noticeManagerPopup.do?noticeCode=" + _noticeCode;
			openPopup(url, '500', '230');
		});
		
		$("#del").on("click", function(){
			if(_noticeCode == null){
				alert("삭제할 게시판 코드를 선택해 주세요.");
				return false;
			}
			
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			var params =[];
			params.push({name: "noticeCode", value: _noticeCode});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/notice/noticeManageDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
<form:form id="form" modelAttribute="noticeVO" action="/notice/noticeManager.do">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<a href="/notice/noticeManagerPopup.do" onclick="openPopup(this.href, '500', '230'); return false;">
			<img src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer authorization write"/>
		</a>
		<a href="#" id="update">
			<img src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write"/>
		</a>
		<img id="del" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
	</div>
	
	<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2" summary="메뉴출력정의 표">
	<caption>메뉴출력정의</caption>
	<colgroup>
		<col width="150px" />
		<col width="180px" />
		<col width="*" />
		<col width="120px" />
	</colgroup>
	<thead>
	<tr>
		<th>게시판 코드</th>
		<th>게시판 이름</th>
		<th>게시판 용도설명</th>
		<th>게시판 사용유무</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="150px" />
		<col width="180px" />
		<col width="*" />
		<col width="120px" />
	</colgroup>
	<tbody>
	<c:forEach var="list" items="${resultList }">
		<tr>
			<td class="left">
				${list.noticeCode }
				<input type="hidden" class="noticeCode" value="${list.noticeCode }" />
			</td>
			<td class="left">${list.noticeName }</td>
			<td class="left">${list.noticeDesc }</td>
			<td class="center">${list.noticeYn }</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</div><!-- Height_1 -->
</div><!-- table -->
</form:form>