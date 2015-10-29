<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#update").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			if($("#currentPassword").val() == $("#newPassword").val()){
				alert("현재 비밀번호와 동일합니다.");
				$("#newPassword").val("");
				$("#confirmPassword").val("");
				$("#newPassword").focus();
				return false;
			}
			
			if($("#newPassword").val() != $("#confirmPassword").val()){
				alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				$("#newPassword").val("");
				$("#confirmPassword").val("");
				$("#newPassword").focus();
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,				
				url:  '<c:url value="/common/password/pwUpdate.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "0"){
						alert("비밀번호가 변경되었습니다.");
						opener.logout();
						closeWin();
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	//					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});	
		});
	});
});
</script>
<h3 style="width:98%;"><div>비밀번호변경</div></h3>
<form:form id="form" modelAttribute="passwordVO">
	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
		<colgroup>
			<col width="140px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>현재 비밀번호<span class="require">*</span></th>
				<td>
					<form:password path="currentPassword" cssClass="input required" caption="현재 비밀번호" />
				</td>
			</tr>
			<tr>
				<th>새 비밀번호<span class="require">*</span></th>
				<td>
					<form:password path="newPassword" cssClass="input required" caption="새 비밀번호" rangelength="4,16" />
				</td>
			</tr>
			<tr>
				<th>새 비밀번호 확인<span class="require">*</span></th>
				<td>
					<form:password path="confirmPassword" cssClass="input required" caption="새 비밀번호 확인" rangelength="4,16" />
				</td>
			</tr>
		</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<input type="image" id="update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" onclick="return false;" />
		<a href="#" onclick="closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" onclick="return false;" /></a>
	</div>
</form:form>
