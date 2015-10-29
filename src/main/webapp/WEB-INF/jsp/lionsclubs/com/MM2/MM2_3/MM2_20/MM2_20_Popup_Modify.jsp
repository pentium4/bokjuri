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
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_3/MM2_20/otherIncomeUpdate.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						opener.linkPage2(1);
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

function setCombo(key) {
	var $detailItemCode = $('#detailItemCode');
	$detailItemCode.empty();
	
	var params = [];
	params.push({name: "code", value: key});
	params.push({name: "groupCode", value: "4100"});
	params.push({name: "gubn", value: "C"});
	
	$.ajax({
		type: "POST",
		async: false,
		url: '<c:url value="/MM1/MM1_2/MM1_09/Code.do" />',
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.selectList){
				$detailItemCode.append("<option value=''>--선택--</option>");
				
				$.each(data.selectList, function(index, object){
					$detailItemCode.append("<option value=" + object.code + " data-code1=" + object.code1 + " data-code2=" + object.code2 + " data-code3=" + object.code3 + ">"+ object.codeName +"</option>");
				});
				
				if(!"${MM2_14VO.idnNo}".isEmpty()){
					$detailItemCode.val("${MM2_14VO.detailItemCode}");
				}
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
// 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>	

<form:form id="form_insert" modelAttribute="MM2_20VO" >
	<h3 style="width:98%;"><div>연간지출예산 수정</div></h3>
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
					${MM2_20VO.classItemCode } ${MM2_20VO.classItemName }
					<form:hidden path="classItemCode"/>
				</td>
			</tr>
			<tr>
				<th>세부항목</th>
				<td>
					${MM2_20VO.detailItemCode } ${MM2_20VO.detailItemName }
					<form:hidden path="detailItemCode"/>
				</td>
			</tr>
			<tr>
				<th>단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위</th>
				<td>
					<form:input path="unit" cssClass="input required" min="1" size="35" maxlength="35" caption="단위" />
					
				</td>
			</tr>
			<tr>
				<th>기준금액</th>
				<td>
					<form:input path="atandAmount" cssClass="input required" min="1" size="35" maxlength="35" caption="기준금액" />
				</td>
			</tr>
			<tr>
				<th>지출내용</th>
				<td>
					<form:textarea path="inexDesc" cssClass="textarea required" cols="43" rows="7" maxlength="4000" caption="지출내용" />
				</td>
			</tr>
		</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img title="수정"  id="button_edit" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" class="pointer" />
		<img title="닫기"  id="button_close" src="/images/lionsclubs/btn/btn_close.gif" style="margin-top:2px" onclick="javascript:closeWin();" class="pointer" />
	</div>
	
	<form:hidden path="organCode" />
	<form:hidden path="idnNo" />
</form:form>



