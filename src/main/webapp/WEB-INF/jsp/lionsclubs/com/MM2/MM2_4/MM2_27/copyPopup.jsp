<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#yearCode").sessionYearCombo({
			 fixVal: "${MM2_27VO_PARAM.yearCode}"	// 고정값
			,top:false
		});
	
		$("#monthCode").monthCombo({
			 fixVal : "${MM2_27VO_PARAM.monthCode}"
			,top:false
		});
		
		$("#yearCode, #monthCode, #confKindCode").on("change", function(event, strText, strValue){
			var obj = $("#confIdnNo");
			obj.empty();
			obj.append("<option value=''>--선택--</option>");
			
			var params = $("form").serializeArray();
			params.push({name: "organCode", value: "${MM2_27VO_PARAM.copyOrganCode}"});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  "/MM2/MM2_4/MM2_24/loadConfIdnNo.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						$.each(data.data, function(index, object){
							obj.append("<option value="+ object.confIdnNo +">"+ object.confDate +"</option>");
						});
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}		
			});
		}).change();
		
		$("#copy").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			if(!confirm("기존의 기타토의는 모두 삭제되고 복사 됩니다.\n복사 하시겠습니까?")){
				return false;
			}		
			
			var params = $("form").serializeArray();
			params.push({name: "organCode", value: "${MM2_27VO_PARAM.copyOrganCode}"});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  "/MM2/MM2_4/MM2_27/copy.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						$("#organCode", opener.document).val("${MM2_27VO_PARAM.copyOrganCode}");
						$("#yearCode", opener.document).val($("#yearCode").val());
						$("#monthCode", opener.document).val($("#monthCode").val());
						$("#confKindCode", opener.document).val($("#confKindCode").val());
						$("#confIdnNo", opener.document).val($("#confIdnNo").val());
						
						opener._search();
						closeWin();
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});
		});
	});
});	
</script>

<form:form modelAttribute="MM2_27VO_PARAM">
	<h3><div>기타토의 복사</div></h3>
	<div class="popup_bg" style="height: 180px;">
		<table class="tblType2">
			<colgroup>
					<col width="80" />
					<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>회기선택<span class="require">*</span></th>
					<td><form:select path="yearCode" cssClass="select required" caption="회기선택" /></td>
				</tr>
				<tr>
					<th>월<span class="require">*</span></th>
					<td><form:select path="monthCode" cssClass="select required" caption="월" /></td>
				</tr>
				<tr>
					<th>회의종류<span class="require">*</span></th>
					<td><lions:codeselect path="confKindCode" cssClass="confKindCode select required" caption="회의종류" groupCode="7580" onlyCodeName="true" /></td>
				</tr>
				<tr>
					<th>회의일자<span class="require">*</span></th>
					<td><form:select path="confIdnNo" cssClass="confIdnNo select required" caption="회의일자" /></td>
				</tr>
			</tbody>
		</table>
		<div class="popupBtn">
			<img id="copy" src="/images/lionsclubs/btn/btn_copy.png" alt="복사" title="복사" class="pointer" />
			<img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" title="닫기" class="pointer" onclick="closeWin()" />
		</div>
	</div><!-- popup_bg -->
	
	<form:input path="copyYearCode" />
	<form:input path="copyMonthCode" />
	<form:input path="copyOrganCode" />
	<form:input path="copyConfKindCode" />
	<form:input path="copyConfIdnNo" />
</form:form>
