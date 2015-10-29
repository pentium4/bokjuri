<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#unit").maskMoney({precision:0}).numericOnly();
		$("#atandAmount").maskMoney({precision:0}).numericOnly();
		
		/*
			분류항목코드 - 선택시
		*/
		$("#classItemCode").change(function() {
			var ccode = $(this).val();
			setCombo(ccode);
		});
		
		$("#button_save").on("click", function(){
			if(!$("#form_insert").valid()){
				return false;
			}
			
			var params = $("#form_insert").serializeArray();
			var dupliYn = "";
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_3/MM2_19/duplicateCheck.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "Y") {
						dupliYn = "Y";
						alert('연간수입예산이 이미 존재합니다.');
						return false;
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					return false;
				}
			});
			
			if(dupliYn=="Y") {
				return false;
			}
	
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_3/MM2_19/otherIncomeInsert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "CONFIRM") {
						alert('해당 회기의 월정산이 확정되어 입력할 수 없습니다.');
					}else if(data.result){
						opener._result();
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

<form:form id="form_insert" modelAttribute="MM2_19VO" >
	<h3 style="width:98%;"><div>연간수입예산 추가</div></h3>
	<form:hidden path="thisYear" />
	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
		<colgroup>
			<col width="100px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>분류항목<span class="require">*</span></th>
				<td>
					<form:select path="classItemCode" cssClass="required select" caption="분류항목">
						<form:option value="">--선택--</form:option>
						<c:forEach items="${codeList}" var="list" varStatus="status">
							<c:if test="${list.code3 ne 'D' }">
								<form:option value="${list.code}">${list.codeName }</form:option>
							</c:if>
						</c:forEach>
					</form:select>				
				</td>
			</tr>
			<tr>
				<th>세부항목<span class="require">*</span></th>
				<td>
					<select id="detailItemCode" name="detailItemCode" class="select required" caption="세부항목">
						<option value="" >-- 선택 --</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위<span class="require">*</span></th>
				<td>
					<form:input path="unit" cssClass="input required" size="35" min="1" maxlength="35" caption="단위" />
				</td>
			</tr>
			<tr>
				<th>기준금액<span class="require">*</span></th>
				<td>
					<form:input path="atandAmount" cssClass="input required" size="35" min="1" maxlength="35" caption="기준금액" />
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
		<img title="입력"  id="button_save" src="/images/lionsclubs/btn/btn_input.gif" style="margin-top:2px" onclick="return false;" class="pointer" />
		<img title="닫기"  id="button_close" src="/images/lionsclubs/btn/btn_close.gif" style="margin-top:2px" onclick="javascript:closeWin();" class="pointer" />
	</div>
	<form:hidden path="memberNo" />
	<form:hidden path="organCode" value="${organCode}" />
</form:form>



