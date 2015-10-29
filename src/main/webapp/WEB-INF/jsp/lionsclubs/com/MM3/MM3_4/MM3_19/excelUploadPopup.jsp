<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
require(['init'], function () {
	$(document).ready(function () {
		var submitCount = 0;
		
		$("#excelUpload").on("click", function(){
			if(submitCount == 0){
				submitCount++;
				
				if(!checkFile()){
					return false;
				}
				
				$("form").ajaxSubmit({
					 url: '<c:url value="/MM3/MM3_4/MM3_19/excelUpload.do" />'
					,type: "POST"
					,dataType: "html"
					,success: function(data){
						var r = $.parseJSON(data);
						if(r.result == "1"){
		 	 				//alert('정상적으로 입력 되었습니다.');
							$("#thisOrganCode", opener.document).val($("#thisOrganCode").val());
							$("#thisYear", opener.document).val($("#thisYear").val());
							$("#firstOrSecond", opener.document).val($("#firstOrSecond").val());
							opener._search();
							closeWin();
						} else {
							alert(r.result);
							submitCount = 0;
						}
					},
					error:function(request,status,error){
						alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
<form:form id="MM3_19VO" modelAttribute="MM3_19VO">
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
	<form:hidden path="thisOrganCode"/>
	<form:hidden path="thisYear"/>
	<form:hidden path="firstOrSecond"/>
</form:form>
