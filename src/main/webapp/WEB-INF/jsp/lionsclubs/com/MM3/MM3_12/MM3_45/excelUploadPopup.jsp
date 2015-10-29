<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
require(['init'], function () {
	$(document).ready(function () {
		var submitCount = 0;

		$("#excelUpload").on("click", function(){
			if(!confirm('클럽명, 수입분류항목, 수입세부항목, 부과일자가 같으면 값이 변경 됩니다.\n엑셀 업로드 하시겠습니까?')) {
				return false;
			}			
			
			if(submitCount == 0){
				progressBar.start();
				submitCount++;
				
				if(!checkFile()){
					return false;
				}
			
				$("form").ajaxSubmit({
					 url: '<c:url value="/MM3/MM3_12/MM3_45/excelUpload.do" />'
					,type: "POST"
					,dataType: "html"
					,async: true
					,success: function(data){
						var r = $.parseJSON(data);
						
						if(r.result == "1"){
							opener._search();
							closeWin();
						} else {
							alert(r.result);
							submitCount = 0;
							progressBar.stop();
						}
					}
					,error:function(request,status,error){
						alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
						submitCount = 0;
						progressBar.stop();
					}
				});
			}
		});
	});
});

function checkFile(){
	if($("#file").val().isEmpty()){
		alert("업로드 할 파일을 지정해 주세요");
		return false;
	}

	var str_value = $("#file").val();
	var str_low = str_value.toLowerCase(str_value);
	var str_dotlocation = str_low.lastIndexOf(".");
	var str_ext = str_low.substring(str_dotlocation+1);
	
	switch (str_ext) {
		case "xls" :
		case "xlsx" :
			return true; 
			break;
		default:
			alert("파일 형식이 맞지 않습니다.\n xls,XLS,xlsx,XLSX 만\n 업로드가 가능합니다!");
			return false;
	}
}
</script>
<div style="width:100%; height:100%;">
	<form:form id="MM3_45VO" modelAttribute="MM3_45VO">
		<h3 style="width:99%;"><div>클럽 제의무금 부과 엑셀올리기</div></h3>
		<div class="popup_bg" style="text-align: center;padding-top:20px;">
			<input type="file" id="file" name="file" accept=".xls,.xlsx" style="width:94%;height:30px;padding:6px;font-size:12px;"/>
		</div>
		<div class="popupBtn" style="margin-top:10px;">
			<img id="excelUpload" src="/images/lionsclubs/btn/btn_excel.gif" style="width:91px" class="pointer" />
			<a href="javascript:closeWin();">
				<img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" />
			</a>
		</div>
		<form:hidden path="organCode" />
		<form:hidden path="sessionYear" />
	</form:form>
</div>