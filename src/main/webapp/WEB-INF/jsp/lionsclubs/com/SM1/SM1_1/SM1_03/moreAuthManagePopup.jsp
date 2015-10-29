<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#authStartDate").datepicker();
		$("#authEndDate").datepicker();
		
		$("#btnEdit").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var authStartDate = $("#authStartDate").val();
			var authEndDate = $("#authEndDate").val();
			if(!rangeDateCheck(authStartDate, authEndDate)){
				alert("시작날짜가 종료날짜보다 큽니다.");
				return false;
			}
			
			var params = $("form").serializeArray();
			params.push({name: "memberNo", value: "${param.memberNo}"});
			$.ajax({
				 type: "POST"
				,async: true
				,url: '<c:url value="/SM1/SM1_1/SM1_03/saveMoreAuthManage.do" />'
				,data: params
				,dataType: 'json'
				,success: function(data) {
					if(data.result) {
						opener._search();
						closeWin();
					}
				}
				,error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					return false;
				}
			});
		});		
	});
});	
</script>	

<form:form modelAttribute="SM1_03VO" >
	<h3><div>추가권한 수정</div></h3>
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>시작일<span class="require">*</span></th>
					<td><form:input path="authStartDate" cssClass="input date required" caption="시작일" /></td>
				</tr>
				<tr>
					<th>종료일<span class="require">*</span></th>
					<td><form:input path="authEndDate" cssClass="input date required" caption="종료일" /></td>
				</tr>
				<tr>
					<th>내<span style="margin-left: 15px;" />용<span class="require">*</span></th>
					<td><form:textarea path="authDesc" cssClass="textarea required" cols="40" rows="10" maxlangth="2000" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="btnEdit" src="/images/lionsclubs/btn/btn_save.gif" title="저장" class="pointer" />	
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
