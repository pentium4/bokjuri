<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		$("#amount").maskMoney({precision:0}).numericOnly();
		$("#expireAmount").maskMoney({precision:0}).numericOnly();
		
		$("#button_save").on("click", function(){
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var amount = $("#amount").val().replaceAll(',', '');
			var expireAmount = $("#expireAmount").val().replaceAll(',', '');
			
			if(!$("form").valid()){
				return false;
			}
			
			if(!rangeDateCheck(startDate, endDate)){
				alert("시작날짜가 종료날짜보다 큽니다.");
				return false;
			}
			
			if(amount > expireAmount){
				alert("만기금액이 예금액보다 작습니다.");
				return false;
			}
			
			var url = '<c:url value="/MM2/MM2_2/MM2_16/otherIncomeUpdate.do" />';
			if("${MM2_16VO.idnNo}".isEmpty()){
				url = '<c:url value="/MM2/MM2_2/MM2_16/otherIncomeInsert.do" />';
			}
			
			var params = $("#form_insert").serializeArray();
			
			$.ajax({
				 type: "POST"
				,async: false
				,url:  url
				,data: params
				,dataType: 'json'
				,success: function(data) {
					if(data.result == "CONFIRM") {
						alert('예금기간중 월정산이 확정된 기간이 있어 입력할 수 없습니다.');
					}else if(data.result){
						//alert('정상적으로 입력 되었습니다.');
						opener._search();
						closeWin();
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

<form:form id="form_insert" modelAttribute="MM2_16VO" >
	<h3 style="width:98%;">
		<div>
			예금내용
			<c:choose>
				<c:when test="${empty MM2_16VO.idnNo }">입력</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>					
		</div>
	</h3>
	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>예금구분<span class="require">*</span></th>
					<td>
						<lions:codeselect path="kindCode" groupCode="7570" cssClass="select required" caption="예금구분" />
					</td>
				</tr>
				<tr>
					<th>예금기간<span class="require">*</span></th>
					<td>
						<form:input path="startDate" cssClass="input required" caption="예금시작기간" /> ~
						<form:input path="endDate" cssClass="input required" caption="예금종료기간" /> 
					</td>
				</tr>
				<tr>
					<th>예금액<span class="require">*</span></th>
					<td>
						<form:input path="amount" cssClass="input required" size="35" maxlength="35" caption="예금액" />
					</td>
				</tr>
				<tr>
					<th>만기금액<span class="require">*</span></th>
					<td>
						<form:input path="expireAmount" cssClass="input required" size="35" maxlength="35" caption="만기금액" />
					</td>
				</tr>
				<tr>
					<th>금융기관<span class="require">*</span></th>
					<td><form:input path="financialIns" cssClass="input required" size="35" maxlength="35" caption="금융기관" /></td>
				</tr>
				<tr>
					<th>예금주<span class="require">*</span></th>
					<td><form:input path="holder" cssClass="input required" size="35" maxlength="35" caption="예금주" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty MM2_16VO.idnNo }">
				<img id="button_save" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px" class="pointer" />		
			</c:when>
			<c:otherwise>
				<img id="button_save" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px" class="pointer" />	
			</c:otherwise>
		</c:choose>	
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
	
	<form:hidden path="idnNo" />
	<form:hidden path="organCode" />
</form:form>
