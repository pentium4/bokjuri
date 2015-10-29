<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#unit").maskMoney({precision:0}).numericOnly();
		$("#atandAmount").maskMoney({precision:0}).numericOnly();
		
		/*
		 *	수정
		 */
		$("#button_edit").click(function() {
			if(!$("#form_insert").valid()){
				return false;
			}
	
			var params = $("#form_insert").serializeArray();
			//params.push({name: "idnNo", value: $("#form_delete input:hidden[name=idnNo]").val()});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_3/MM2_19/otherIncomeUpdate.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						opener._result();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});
</script>	
<form:form id="form_insert" modelAttribute="MM2_19VO" >
	<h3 style="width:98%;"><div>연간수입예산 수정</div></h3>
	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
		<colgroup>
			<col width="100px" />
			<col />
		</colgroup>
		
		<tbody>
			<tr>
				<th>분류항목</th>
				<td>
					${MM2_19VO.classItemCode } ${MM2_19VO.classItemName }
					<form:hidden path="classItemCode"/>
				</td>
			</tr>
			<tr>
				<th>세부항목</th>
				<td>
					${MM2_19VO.detailItemCode } ${MM2_19VO.detailItemName }
					<form:hidden path="detailItemCode"/>
				</td>
			</tr>
			<tr>
				<th>단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위<span class="require">*</span></th>
				<td>
					<form:input path="unit" cssClass="input required" min="1" size="35" maxlength="35" caption="단위" />
					
				</td>
			</tr>
			<tr>
				<th>기준금액<span class="require">*</span></th>
				<td>
					<form:input path="atandAmount" cssClass="input required" min="1" size="35" maxlength="35" caption="기준금액" />
				</td>
			</tr>
			<tr>
				<th>산출근거<span class="require">*</span></th>
				<td>
					<form:textarea path="inexDesc" cssClass="textarea required" cols="43" rows="7" maxlength="4000" caption="산출근거" />
				</td>
			</tr>
		</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img title="수정"  id="button_edit" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" class="pointer" />
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
	<form:hidden path="organCode" />
	<form:hidden path="idnNo" />
</form:form>



