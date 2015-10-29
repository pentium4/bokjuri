<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#eventStartDate").datepicker();
		$("#eventEndDate").datepicker();
		$("input[name=merit][value=N]").attr("checked", true);
		
		$('#eventStartTime').mask("99:99").timepicker();
		$('#eventEndTime').mask("99:99").timepicker();
		
		$("#time").numericOnly();
		$("#score").numericOnly();
		
		/*
		 *	저장
		 */
		$("#button_save").click(function() {
			var aday = $("#eventStartDate").val();
			var bday = $("#eventEndDate").val();
			var kind_code = $("#kindCode").val();
			var event_name_code = $("#eventNameCode").val();		
			
			if(!rangeDateCheck(aday, bday)){
				alert("행사시작일이 행사종료일보다 큽니다.");
				$("#eventStartDate").focus();
				return false;
			}
			
			if(kind_code == ""){
				alert("구분을 선택해 주세요.");
				$("#kindCode").focus();
				return false;
			}	
			
			if(event_name_code == ""){
				alert("행사명을 선택해 주세요.");
				$("#eventNameCode").focus();
				return false;
			}	
			
			if(!$("form").valid()){
				return false;
			}
			
			fileId.startUpload();
		});
	});
});

function uploadCompleted(){
	var url = '<c:url value="/MM1/MM1_1/MM1_05/MM1_05_Insert.do" />';
	if("${MM1_05VO.idnNo}" > 0){
		url = '<c:url value="/MM1/MM1_1/MM1_05/MM1_05_Update.do" />';
	}
	
	var params = $("#form_insert").serializeArray();
	params.push({name: "fileId", value: fileId.fileId});
	
	$.ajax({
		type: "POST",
		async: false,
		url:  url,
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				opener._search();
				closeWin();
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>	

<h3 style="width:98%;">
	<div>행사참석
		<c:choose>
			<c:when test="${MM1_05VO.idnNo eq 0 }">입력</c:when>
			<c:otherwise>수정</c:otherwise>
		</c:choose>		
	</div>
</h3>

<form:form id="form_insert" modelAttribute="MM1_05VO" >
<div class="popup_bg" style="height: 320px;">
	<table class="tblType2" style="width:98%">
		<colgroup>
			<col width="100px" />
			<col width="280px" />
			<col width="100px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>행사일자<span class="require">*</span></th>
				<td>
					<form:input path="eventStartDate" cssClass="input date required" caption="행사시작일자" /> ~ <form:input path="eventEndDate" cssClass="input date required" caption="행사종료일자" />
				</td>
				<th>행사시간<span class="require">*</span></th>
				<td>
					<form:input path="eventStartTime" cssClass="input time required" size="12" caption="행사시작시간" required="true" /> ~ <form:input path="eventEndTime" cssClass="input time required" size="12" caption="행사종료시간" required="true" />
				</td>				
			</tr>
			<tr>
				<th>행사명<span class="require">*</span></th>
				<td><lions:codeselect path="eventNameCode" groupCode="4010" /></td>
				<th>행사장소</th>
				<td>
					<form:input path="eventPlace" cssClass="input" size="38" />
				</td>				
			</tr>
			<tr>
				<th>시간<span class="require">*</span></th>
				<td>
					<form:input path="time" cssClass="input number" size="10" caption="시간" />시간 <em style="font-size:11px;"></em>
				</td>
				<th>점수(M)<span class="require">*</span></th>
				<td>
					<form:input path="score" cssClass="input number" size="10" caption="점수(M)" />점 <em style="font-size:11px;"></em>
				</td>				
			</tr>
			<tr>
				<th>공적</th>
				<td colspan="3">
					<form:radiobutton path="merit" value="Y"/> 적용&nbsp;<form:radiobutton path="merit" value="N"/> 미적용
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<jwork:fileuploader 
						objectId="fileId"  
						uploadCompletedEvent="uploadCompleted"
						fileType="images" 
						maxFileSize="100" 
						maxFileCount="0" 
						usePreview="${MM1_05VO.idnNo eq 0 ? false : true }"
						useSecurity="false"
						uploadMode="db"
						fileId="${MM1_05VO.fileId }"
					/>
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- popup_bg -->
<div class="popupBtn">
	<c:choose>
		<c:when test="${MM1_05VO.idnNo eq 0 }">
			<img id="button_save" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px" class="pointer" />		
		</c:when>
		<c:otherwise>
			<img id="button_save" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px" class="pointer" />	
		</c:otherwise>
	</c:choose>
	
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>
<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
<form:hidden path="memberNo" />
<form:hidden path="idnNo"/>
</form:form>


