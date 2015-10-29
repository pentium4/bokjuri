<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#endDate").datepicker();
		$("#expireAmount").maskMoney({precision:0}).numericOnly();
		
		$("#withdraw").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$.ajax({
				 type: "POST"
				,async: false
				,url: '<c:url value="/MM2/MM2_2/MM2_16/withdraw.do" />'
				,data: params
				,dataType: 'json'
				,success: function(data) {
					if(data.result == "1"){
						//alert('정상적으로 입력 되었습니다.');
						opener._search();
						closeWin();
					} else {
						alert(data.result);
					}
				}
				,error:function(request,status,error){
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});	
	});
});	
</script>	

<form:form modelAttribute="MM2_16VO" >
	<h3 style="width:98%;">
		<div>출금</div>
	</h3>
	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>출금일<span class="require">*</span></th>
					<td>
						<form:input path="endDate" cssClass="input required" caption="예금종료기간" />
					</td>
				</tr>
				<tr>
					<th>출금금액<span class="require">*</span></th>
					<td>
						<form:input path="expireAmount" cssClass="input required" size="35" maxlength="35" caption="만기금액" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="withdraw" src="/images/lionsclubs/btn/btn_withdraw.gif" style="margin-top:2px" onclick="return false;" alt="출금" class="pointer" />
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
	
	<form:hidden path="idnNo" />
	<form:hidden path="organCode" />	
</form:form>
