<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#button_edit").click(function() {
			
			var serveAmount = $("#serveAmount").val().replace(/,/g, '');
			$("#serveAmount").val(serveAmount);
			
			var serveAmountStand = $("#serveAmountStand").val().replace(/,/g, '');
			$("#serveAmountStand").val(serveAmountStand);
			
			var params = $("#form_update").serializeArray();	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_5/MM3_25/MM3_25_Save.do" />',
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
	});
});	
function FormatNumber2(num){
	// 만든이:김인현(jasmint@netsgo.com)
	fl="";
	if(isNaN(num)) { alert("문자는 사용할 수 없습니다.");return 0;}
	if(num==0) return num;

	if(num<0){ 
	num=num*(-1);
	fl="-";
	}else{
	num=num*1; //처음 입력값이 0부터 시작할때 이것을 제거한다.
	}
	num = new String(num);
	temp="";
	co=3;
	num_len=num.length;
	while (num_len>0){
	num_len=num_len-co;
	if(num_len<0){co=num_len+co;num_len=0}
		temp=","+num.substr(num_len,co)+temp;
	}
	return fl+temp.substr(1);
}

function FormatNumber3(num){
	num=new String(num);
	num=num.replace(/,/gi,"");
	return FormatNumber2(num);
}

function num_check() {
	// ie에서만 작동
	var keyCode = event.keyCode;
	if (keyCode < 48 || keyCode > 57){
	alert("문자는 사용할 수 없습니다."+"["+keyCode+"]");
	event.returnValue=false;
	}
}

</script>	

<h3 style="width:98%;"><div>행사참석 입력</div></h3>

<form:form id="form_update" modelAttribute="MM3_25VO" >
<form:hidden path="idnNo"/>
<form:hidden path="organCode"/>
<form:hidden path="scoreIdnNo"/>

<div class="popup_bg">
	<table class="tblType2" style="width:98%">
	<colgroup>
		<col width="140px" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>주관인원</th>
			<td>				
				<form:input path="subjectMember" cssClass="input" size="12" />
			</td>
		</tr>
		<tr>
			<th>주관수정</th>
			<td>
				<form:input path="subjectMod" cssClass="input" size="12"/> 
				
			</td>
		</tr>
		<tr>
			<th>주관기준점수</th>
			<td>
				<form:input path="subjectScore" cssClass="input" size="12"/> 
				
			</td>
		</tr>
		<tr>
			<th>참가인원</th>
			<td>
				<form:input path="entryMember" cssClass="input" size="12"/> 
				
			</td>
		</tr>
		<tr>
			<th>참가수정</th>
			<td>
				<form:input path="entryMod" cssClass="input" size="12"/> 
				
			</td>
		</tr>
		<tr>
			<th>참가기준점수</th>
			<td>
				<form:input path="entryScore" cssClass="input" size="12"/> 
				
			</td>
		</tr>
		<tr>
			<th>봉사금총액</th>
			<td>
				<form:input path="serveAmount" cssClass="input" size="12" onkeypress="num_check()" onkeyup="this.value=FormatNumber3(this.value)" style="TEXT-ALIGN:right "/> 
				
			</td>
		</tr>
		<tr>
			<th>봉사금기준</th>
			<td>
				<form:input path="serveAmountStand" cssClass="input" size="12" onkeypress="num_check()" onkeyup="this.value=FormatNumber3(this.value)" style="TEXT-ALIGN:right "/> 				
			</td>
		</tr>
		<tr>
			<th>봉사금기준점수</th>
			<td>
				<form:input path="serveAmountScore" cssClass="input" size="12"/> 
				
			</td>
		</tr>
	</tbody>
	</table>
</div><!-- popup_bg -->

<div class="popupBtn">
	<input type="image" id="button_edit" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>

<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
</form:form>
