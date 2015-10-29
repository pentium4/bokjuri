<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#anniversaryDay").datepicker();
		$('#time').timepicker();
		$("#dayAgo, #number").spinner({min: 0}).numericOnly();
		
		/*
		 *	개인기념일 저장
		 */
		$("#button_save").on("click", function(){
			
			var aday = $("#anniversaryDay").val();
			var acode = $("#kindCode").val();
			var message = $("#message").val();
			var time = $("#time").val();
			
			if(aday == "" || aday.length != 10){
				alert("기념일을 입력해 주세요.");
				$("#anniversaryDay").focus();
				return false;
			}
			
			if(acode == ""){
				alert("분류코드를 입력해 주세요.");
				$("#kindCode").focus();
				return false;
			}
			
			if(message == ""){
				alert("메세지를 입력해 주세요.");
				$("#message").focus();
				return false;
			}
			
			if(time == ""){
				alert("시간을 입력해 주세요.");
				$("#time").focus();
				return false;
			}
			
			
			var params = $("#form_insert").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_1/MM1_02/MM1_02_Insert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 입력 되었습니다.');
						opener.linkPage();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
	});	
});	

</script>	

<h3 style="width:98%;"><div>기념일 추가</div></h3>

<form:form id="form_insert" modelAttribute="MM1_02VO" >
<div class="popup_bg">
	<table class="tblType2" style="width:98%">
	<colgroup>
		<col width="100px" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>기념일자</th>
			<td>
				<form:input path="anniversaryDay" cssClass="input" />
				&nbsp;
				<form:select path="pmKind">
					<form:option value="P">양력</form:option>
					<form:option value="M">음력</form:option>
				</form:select>
			</td>
		</tr>
		<tr>
			<th>분류코드</th>
			<td>
				<lions:codeselect path="kindCode" groupCode="2680" />
			</td>
		</tr>
		<tr>
			<th>메세지내용</th>
			<td style="padding:5px 0 5px 5px;">
				<form:textarea path="message"  cols="40" rows="3" style="border:1px solid #aaa;width:98%"  />
			</td>
		</tr>
		<tr>
			<th>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간</th>
			<td>
				<form:input path="time" cssClass="input" size="12" /> (24시간 표기 입력)
			</td>
		</tr>
		<tr>
			<th>일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전</th>
			<td><form:input path="dayAgo" cssClass="input" size="5" maxlength="5" /></td>
		</tr>
		<tr>
			<th>횟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수</th>
			<td><form:input path="number" cssClass="input" size="5" maxlength="5" /></td>
		</tr>
	</tbody>
	</table>
</div><!-- popup_bg -->

<div class="popupBtn">
	<img id="button_save" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px" class="pointer" />
	<img id="button_edit" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px;display:none;" class="pointer" />
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" title="닫기" style="width:57px" /></a>
</div>

<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
<form:hidden path="memberNo" />     
</form:form>



