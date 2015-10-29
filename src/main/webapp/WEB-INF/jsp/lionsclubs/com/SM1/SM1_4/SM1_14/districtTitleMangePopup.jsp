<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		var tbl = $("#listTable tbody tr");
		tbl.find("td:not(:first)").on("click", function(){
			var $tr = $(this).closest("tr");
			var checked = $tr.find(".code").is(":checked");
			$tr.find(".code").prop("checked", !checked);
			$tr.find(".code").trigger("change");
			
			fillChecked();
		});
		
		$(".code").on("click", function(){
			fillChecked();
		});
		
		$("#codeAll").on("click", function(){
			$(".code").prop("checked", $(this).is(":checked"));
			fillChecked();
		});
		
		$(".code").on("change", function(){
			var total = $(".code").length;
			var checkLen = $(".code:checked").length;
			if(total == checkLen){
				$("#codeAll").prop("checked", true);
			} else {
				$("#codeAll").prop("checked", false);
			}
		}).change();

		$("#btnSave").on("click", function(){
			if($(".code:checked").length == 0){
				alert("추가할 직책 코드를 선택해 주세요.");
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$(".code:checked").each(function(index){
				var code = $(this).val();
				var data = $(this).data();
				
				params.push({name: "districtTitleArray[" + index + "].titleCode", value: code});
				params.push({name: "districtTitleArray[" + index + "].titleOrd", value: data.ord});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/SM1/SM1_4/SM1_14/saveDistrictTitle.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						opener._search();
						closeWin();
					} else {
						alert(data.result);
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

function fillChecked(){
	$(".code").each(function(){
		var $tr = $(this).closest("tr");
		
		if($(this).is(":checked")){
			$tr.css("background-color","#E0FFE0");	
		} else {
			$tr.css("background-color","#ffffff");
		}
	});
}
</script>
<style>
#listTable tbody tr{
	cursor: pointer;
}
</style>
<form:form modelAttribute="SM1_14VO" >
	<h3><div>지구직책 추가</div></h3>
	
	<div class="popup_bg">
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th><input id="codeAll" type="checkbox" /></th>
					<th>코드</th>
					<th>순서</th>
					<th>코드명칭</th>
					<th>코드 내용 설명</th>
				</tr>
			</table>
		</div><!-- tblTitle -->
		<div class="tblPopupH2" style="height: 483px;">
			<table class="tblType2_1 Scroll_Table" id="listTable">
				<colgroup>
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>	
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td><form:checkbox path="code" cssClass="code" value="${list.code }" data-ord="${list.ord }" /></td>
							<td>${list.code }</td>
							<td>${list.ord }</td>
							<td class="left" title="${list.codeName }">${list.codeName }</td>
							<td class="left" title="${list.codeDesc }">${list.codeDesc }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="popupBtn">
		<img id="btnSave" src="/images/lionsclubs/btn/btn_save.gif" style="width:57px" title="저장" class="pointer" />
		<img src="/images/lionsclubs/btn/btn_close.gif" style="width:57px" title="닫기" class="pointer" onclick="closeWin();" />
	</div>
	
	<form:hidden path="sessionYear"/>
</form:form>
