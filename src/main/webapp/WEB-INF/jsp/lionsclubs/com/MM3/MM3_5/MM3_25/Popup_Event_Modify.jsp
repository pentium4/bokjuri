<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#takeDate").datepicker();
		
		$("#districtEcode").option2Code({
		     groupCode: '3600' // 그룹코드
		    ,code: "${MM3_25VO.organCode}" // 코드
		    ,topLabel: "--선택--"
		    ,code1: "A,C"
		    ,fixVal: "${MM3_25VO.districtEcode}" // 고정값
		});		
		
		/*
		 *	저장
		 */
		$("#button_save").click(function() {
			
			var sDate = $("#takeDate").val();
			
			if(sDate == "" || sDate.length != 10){
				alert("실시일자를 입력해주세요");
				$("#takeDate").focus();
				return false;
			}		
			
			var params = $("#form_update").serializeArray();
			
			$.ajax({
				type: "POST",			
				async: false,
				url:  '<c:url value="/MM3/MM3_5/MM3_25/MM3_25_Update.do" />',			
				data: params,
				dataType: 'json',
				success: function(data) {
					
					if(data.result){
						//alert('정상적으로 입력 되었습니다.');
						opener.linkPage();
						closeWin();
					}
				},
				error:function(request,status,error,jqXHR, textStatus, errorThrown){				
	// 				alert(JSON.stringify(params));
	// 				alert(error);alert(jqXHR);alert(textStatus);alert(errorThrown);
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});	
</script>	

<h3 style="width:98%;"><div>클럽/지구 행사 수정</div></h3>

<form:form id="form_update" modelAttribute="MM3_25VO" >
<div class="popup_bg">
	<table class="tblType2" style="width:98%">
	<colgroup>
		<col width="140px" />
		<col />
	</colgroup>
	<tbody>
		
		<tr>
			<th>지구행사</th>
			<td>
				<form:select path="districtEcode" cssClass="select" />
				
			</td>
		</tr>
		<tr>
			<th>주관</th>
			<td>
				<lions:codeselect path="subjectCode" groupCode="3980" /> 
				
			</td>
		</tr>
		<tr>
			<th>실시일자</th>
			<td><form:input path="takeDate" cssClass="input" size="30" /></td>
		</tr>
		<tr>
			<th>장소</th>
			<td><form:input path="location" cssClass="input" size="30" /></td>
		</tr>

	</tbody>
	</table>
</div>

<div class="popupBtn">
	<img id="button_save" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer" />
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>
<form:hidden path="idnNo" />


<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
</form:form>