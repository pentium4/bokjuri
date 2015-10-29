<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
	
		$("#inexDate").datepicker();
		$("#incomeInsertDate").datepicker();
		
		$("#button_save").bind("click", function(){
			
			var inexDate = $("#inexDate").val();
			var detailItemCode = $("#detailItemCode").val();
			var amount = $("#amount").val();
			var inexDesc = $("#inexDesc").val();
			
			if(inexDate == "" || inexDate.length != 10){
				alert("수입일자를 입력해 주세요.");
				$("#inexDate").focus();
				return false;
			}
			
			if(detailItemCode == ""){
				alert("세부항목을 입력해 주세요.");
				$("#detailItemCode").focus();
				return false;
			}
			
			if(amount == ""){
				alert("금액을 입력해 주세요.");
				$("#amount").focus();
				return false;
			}
			
			if(inexDesc == ""){
				alert("수입내용을 입력해 주세요.");
				$("#inexDesc").focus();
				return false;
			}
			
			
			var params = $("#form_insert").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_2/MM2_13/otherIncomeInsert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result=="CONFIRM") {
						alert('해당 회기의 월정산이 확정되어 입력할 수 없습니다.');
					}else if(data.result){
						//alert('정상적으로 입력 되었습니다.');
						opener.linkPage2(1);
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

<h3 style="width:98%;"><div>기타 수입 추가</div></h3>

<form:form id="form_insert" modelAttribute="MM2_13VO" >
<div class="popup_bg">
	<table class="tblType2" style="width:98%">
	<colgroup>
		<col width="100px" />
		<col />
	</colgroup>
	<tbody>
		<tr>
			<th>수입일자</th>
			<td>
				<form:input path="inexDate" cssClass="input" />
			</td>
		</tr>
		<tr>
			<th>분류항목</th>
			<td>기타수입
				<input type="hidden" id="classItemCode" name="classItemCode" value="1070" />
			</td>
		</tr>
		<tr>
			<th>세부항목</th>
			<td>
				<lions:codeselect path="detailItemCode" groupCode="4900" />
			</td>
		</tr>
		<tr>
			<th>금&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액</th>
			<td>
				<form:input path="amount" cssClass="input" size="35" maxlength="35" onkeypress="num_check()" onkeyup="this.value=FormatNumber3(this.value)" style="TEXT-ALIGN:right "/>
				<!--  form:formatNumber path="amount"  value="" pattern="#,###"/-->
				
			</td>
		</tr>
		<tr>
			<th>수입내용</th>
			<td><form:input path="inexDesc" cssClass="input" size="35" maxlength="35" /></td>
		</tr>
	</tbody>
	</table>
</div><!-- popup_bg -->

<div class="popupBtn">
	<input type="image" id="button_save" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" />
	<input type="image" id="button_edit" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px;display:none;" />
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>

<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
<form:hidden path="memberNo" />
<form:hidden path="organCode" value="${organCode}" />
</form:form>



