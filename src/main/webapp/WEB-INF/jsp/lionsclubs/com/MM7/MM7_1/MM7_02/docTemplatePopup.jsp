<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script src="/js/lionsclubs/daumeditor/js/popup.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		// 조직코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,fixVal: "${MM7_02VO.organCode}"
			,searchable: true
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM7_02VO.sessionYear}"	// 고정값
			,top: false
		});
		
		var tr = $(".tblType2_1 tbody tr");
		tr.on("click", function(){
			if(!confirm("문서템플릿을 불러오면 본문내용이 모두 지워집니다.\n문서템플릿을 불러오시겠습니까?")){
				return false;
			}
			
			var data = $(this).data();
			var params = [];
			params.push({name: "idnNo", value: data.idnno});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM7/MM7_1/MM7_02/objectDocTemplate.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						parent.data = data.object.content;
						parent.action = "done";
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}		
			});			
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
		
		initEmbeder();
	});
});

function initEmbeder() {
	var _opener = PopupUtil.getOpener();
	if(!_opener) {
		alert('잘못된 경로로 접근하셨습니다.');
		return; 
	}

	var _embeder = getEmbeder('media');
	window.execEmbed = _embeder.embedHandler;
}

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
<form:form id="form" modelAttribute="MM7_02VO">
	<h3><div>문서 템플릿 선택</div></h3>
	
	<div class="popup_bg" style="padding-top: 10px;">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>		
			<tr>
				<th>조직코드</th>
				<td><form:select path="organCode" /></td>
			</tr>
			<tr>
				<th>회기선택</th>
				<td><form:select path="sessionYear" /></td>
			</tr>
		</table>
		
		<div class="btnBox2">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" class="pointer" />
		</div>
		
		<div class="tblTitle Scroll_Title">
			<table class="tblType2">
				<thead>
					<tr>
						<th>제목</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1" style="height:200px !important;">
			<table class="tblType2_1">
				<tbody>
					<c:forEach var="list" items="${resultList }">
						<tr data-idnno="${list.idnNo }">
							<td class="left">${list.title }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="close" src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" class="pointer" onclick="closeWin();" />
	</div>
</form:form>
