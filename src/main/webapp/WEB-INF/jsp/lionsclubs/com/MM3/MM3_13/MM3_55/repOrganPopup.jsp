<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#repStartDate").datepicker();
		$("#repEndDate").datepicker();
		
		$("#repStartDate").on("change", function(){
			$("#repEndDate").val($(this).val());
		});

		/*
		 *	저장
		 */
		$("#btnSave").click(function() {
			var repStartDate = $("#repStartDate").val();
			var repEndDate = $("#repEndDate").val();
			
			if($("#repOrganCode").val().isEmpty()){
				alert("담당조직을 입력해 주세요.");
				$("#repOrganName").focus();
				return false;
			}
			
			if(!rangeDateCheck(repStartDate, repEndDate)){
				alert("담당 시작일이 종료일보다 큽니다.");
				return false;
			}			
			
			if(!$("form").valid()){
				return false;
			}
	
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_13/MM3_55/saveRepOrgan.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						opener._search();
						closeWin();
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				}
			});
		});
		
		// 소속클럽 검색
		$("#repOrganName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 && !$(this).prop("readonly")) {
				$("#repOrganCodeSearch").trigger("click");
			}
		});

		$("#repOrganName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			
			if(key == 8 && !$(this).prop("readonly")){
				$(this).val("");
				$("#repOrganCode").val("");
			}	
		});		
		
		// 담당조직
		$("#repOrganCodeSearch").on("click", function(){
			var params = [];
			params.push({name:"returnFunction", value:"repOrganResult"});	// 팝업에서 리턴할 function
			params.push({name:"koName", value:$("#repOrganName").val()});
			organSearchPopup(params);
		});
	});
});

function repOrganResult(value){
	$("#repOrganName").val($.url(value).param("koName"));
	$("#repOrganCode").val($.url(value).param("organCode"));
}
</script>

<form:form modelAttribute="MM3_55VO" >
	<h3>
		<div>
			담당조직
			<c:choose>
				<c:when test="${empty MM3_55VO.idnNo }">입력</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>			
		</div>
	</h3>

	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="200px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>담당조직<span class="require">*</span></th>
					<td>
						<form:input path="repOrganName" cssClass="input" size="40" cssStyle="ime-mode:active" />
						<form:hidden path="repOrganCode" cssClass="required" caption="담당조직" />
						<img id="repOrganCodeSearch" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" />
					</td>
				</tr>
				<tr>
					<th>담당 시작일<span class="require">*</span></th>
					<td>
						<form:input path="repStartDate" cssClass="input date required" caption="담당 시작일" />
					</td>
				</tr>
				<tr>
					<th>담당 종료일<span class="require">*</span></th>
					<td>
						<form:input path="repEndDate" cssClass="input date required" caption="담당 종료일" />
					</td>
				</tr>
				<tr>
					<th>근무지</th>
					<td><form:input path="workPlace" cssClass="input" size="50" maxlength="400" caption="근무지" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="btnSave" src="/images/lionsclubs/btn/btn_save.gif" title="저장" style="width:57px" class="pointer" />		
		<img src="/images/lionsclubs/btn/btn_close.gif" style="width:57px" title="닫기" class="pointer" onclick="closeWin();" />
	</div>
	
	<form:hidden path="idnNo"/>
	<form:hidden path="memberNo"/>
</form:form>
