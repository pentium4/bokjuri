<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sisterhoodDate").datepicker();
		
		/*
		 *	저장
		 */
		$("#button_save").click(function() {
			
			var sDate = $("#sisterhoodDate").val();
			
			if(sDate == "" || sDate.length != 10){
				alert("자매결연일을 입력해 주세요.");
				$("#sisterhoodDate").focus();
				return false;
			}		
			
			var params = $("#form_insert").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_1/MM2_02/MM2_02_Insert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert(JSON.stringify(params));
	// 					alert('정상적으로 입력 되었습니다.');
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert(JSON.stringify(params));
				
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
		
		$("#score").numericOnly();
	});
});	
</script>	

<h3 style="width:98%;"><div>국내외 자매결연</div></h3>

<form:form id="form_insert" modelAttribute="MM2_02VO" >
<div class="popup_bg">
	<table class="tblType2" style="width:98%">
	<colgroup>
		<col width="140px" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>자매결연일자</th>
			<td>				
				<form:input path="sisterhoodDate" cssClass="input" size="12" />
			</td>
		</tr>
		<tr>
			<th>결연구분</th>
			<td>
				<lions:codeselect path="allianceKind" groupCode="7530" /> 
				
			</td>
		</tr>
		<tr>
			<th>소재지 국명 지역</th>
			<td><form:input path="locationArea"  cssClass="input" size="30" style="width:100%;" /></td>
		</tr>
		<tr>
			<th>주요활동 및 행사</th>
			<td><form:input path="event"  cssClass="input" size="30" style="width:100%;" /></td>
		</tr>
		<tr>
			<th>점수(M)</th>
			<td>
				<form:input path="score" cssClass="input" size="5" cssStyle="text-align: right;" /> 점
			</td>
		</tr>
	</tbody>
	</table>
</div><!-- popup_bg -->

<div class="popupBtn">
	<input type="image" id="button_save" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" />
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>

<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
<form:hidden path="idnNo" />
<%-- <form:hidden path="${result.getOrganCode()}"/> --%>
<form:hidden path="organCode" />
</form:form>


