<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#jul").datepicker();
		$("#aug").datepicker();
		$("#sep").datepicker();
		$("#oct").datepicker();
		$("#nov").datepicker();
		$("#dec").datepicker();
		$("#jan").datepicker();
		$("#feb").datepicker();
		$("#mar").datepicker();
		$("#apr").datepicker();
		$("#may").datepicker();
		$("#jun").datepicker();	
		
		$("#button_edit").click(function() {
			
			var params = $("#form_report").serializeArray();
			//params.push({name: "idnNo", value: $("#form_delete input:hidden[name=idnNo]").val()});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_1/MM2_02/MM2_02_Update.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						opener._search();
						window.close();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
		
		$("#score").numericOnly();
	});
});	
  
/* function MovePage() {
	
	window.close();
} */
</script>	

<h3 style="width:98%;"><div>클럽보고 자료점수</div></h3>

<form:form id="form_update" modelAttribute="MM3_27VO" >
<div class="popup_bg">
	<table class="tblType2" style="width:98%">
	<colgroup>
		<col width="140px" />
		<col width="140px" />
		<col width="140px" />
		<col width="140px" />
		<col />
	</colgroup>
	<thead>
	<tr>
		<th>월</th>
		<th>날짜</th>
		<th>월</th>
		<th>날짜</th>		
	</tr>
	</thead>
	</table>
	<colgroup>
		<col width="140px" />
		<col width="140px" />
		<col width="140px" />
		<col width="140px" />
		
	</colgroup>
	<tbody>
				<tr>
			<th>7월</th>
			<td>				
				<form:input path="jul" cssClass="input" size="12" />
			</td>
			<th>1월</th>
			<td>				
				<form:input path="jan" cssClass="input" size="12" />
			</td>
		</tr>
		<tr>
			<th>8월</th>
			<td>				
				<form:input path="aug" cssClass="input" size="12" />
			</td>
			<th>2월</th>
			<td>				
				<form:input path="feb" cssClass="input" size="12" />
			</td>
		</tr>
		<tr>
			<th>9월</th>
			<td>				
				<form:input path="sep" cssClass="input" size="12" />
			</td>
			<th>3월</th>
			<td>				
				<form:input path="mar" cssClass="input" size="12" />
			</td>
		</tr>
		<tr>
			<th>10월</th>
			<td>				
				<form:input path="oct" cssClass="input" size="12" />
			</td>
			<th>4월</th>
			<td>				
				<form:input path="apr" cssClass="input" size="12" />
			</td>
		</tr>
		<tr>
			<th>11월</th>
			<td>				
				<form:input path="nov" cssClass="input" size="12" />
			</td>
			<th>5월</th>
			<td>				
				<form:input path="may" cssClass="input" size="12" />
			</td>
		</tr>
		<tr>
			<th>12월</th>
			<td>				
				<form:input path="dec" cssClass="input" size="12" />
			</td>
			<th>6월</th>
			<td>				
				<form:input path="jun" cssClass="input" size="12" />
			</td>
		</tr>

	</tbody>
	</table>
</div><!-- popup_bg -->

<div class="popupBtn">
	<input type="image" id="button_edit" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>

<form:hidden path="clubCode" />
<form:hidden path="sessionYear"/>
</form:form>


