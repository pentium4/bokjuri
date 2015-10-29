<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#eventStartDate").datepicker();
		$("#eventEndDate").datepicker();
		
		if("${MM2_29VO.idnNo}".isEmpty()){
			$("#eventStartDate").val(Date.today().toString("yyyy.MM.dd"));
			$("#eventEndDate").val(Date.today().toString("yyyy.MM.dd"));
		}
		
		$("#eventStartTime").mask("99:99").timepicker();
		$("#eventEndTime").mask("99:99").timepicker();
	
		$("#eventStartDate").on("change", function(){
			$("#eventEndDate").val($(this).val());
		});	
		
		$("#eventNameCode").option2Code({
		     groupCode: '3600' // 그룹코드
		    ,code: "${MM2_29VO.organCode}".substring(0, 3) + "000" // 코드
		    ,topLabel: "--선택--"
		    ,code1: "A,B"
		    ,fixVal: "${MM2_29VO.eventNameCode}" // 고정값
		});
		
		// 행사주최 검색
		$("#organName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 && !$(this).prop("readonly")) {
				$("#organCodeSearch").trigger("click");
			}
		});
		
		$("#organName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			
			if(key == 8 && !$(this).prop("readonly")){
				$(this).val("");
				$("#organCode").val("");
			}	
		});		
		
		// 행사주최
		$("#organCodeSearch").on("click", function(){
			var params = [];
			params.push({name:"koName", value:$("#organName").val()});
			organSearchPopup(params);
		});
			
		/*
		 *	저장
		 */
		$("#add, #update").click(function() {
			if($("#organCode").val().isEmpty()){
				alert("행사주최를 입력해 주세요.");
				$("#organName").focus();
				return false;
			}
			
			if(!$("form").valid()){
				return false;
			}
			
			if(!rangeDateCheck($("#eventStartDate").val(), $("#eventEndDate").val())){
				alert("행사시작일자가 행사종료일자보다 큽니다.");
				return false;
			}
			
			fileId.startUpload();
		});
	});
});


function uploadCompleted(){
	var params = $("form").serializeArray();
	params.push({name: "fileId", value: fileId.fileId});
	
	var url;
	if("${MM2_29VO.idnNo}".isEmpty()){
		url = '<c:url value="/MM2/MM2_5/MM2_29/insertEventSponsor.do" />';
	} else {
		url = '<c:url value="/MM2/MM2_5/MM2_29/updateEventSponsor.do" />';
	}
	
	$.ajax({
		type: "POST",
		async: false,
		url:  url,
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				if("${MM2_29VO.idnNo}".isEmpty()){
					$("#organCode", opener.document).val($("#organCode").val());
					$("#sessionYear", opener.document).val(dateToSessionYear($("#eventStartDate").val()));	
				}
				opener._search();
				closeWin();
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function _organResult(value){
	$("#organName").val($.url(value).param("koName"));
	$("#organCode").val($.url(value).param("organCode"));
}
</script>
<form:form id="MM2_29VO" modelAttribute="MM2_29VO">
	<form:hidden path="idnNo"/>
	<h3 style="width:99%;">
		<div>
			클럽 및 지구행사
			<c:choose>
				<c:when test="${empty MM2_29VO.idnNo }">입력</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>			
		</div>
	</h3>
	
	<div class="popup_bg" style="height: 450px;">
		<table class="tblType2" style="width:99%">
			<colgroup>
				<col width="100px" />
				<col width="300px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>행사일자<span class="require">*</span></th>
					<td>
						<form:input path="eventStartDate" cssClass="input required" /> ~ <form:input path="eventEndDate" cssClass="input date required" />
					</td>
					<th>행사시간<span class="require">*</span></th>
					<td>
						<form:input path="eventStartTime" cssClass="input time required" size="10" caption="행사시작시간" required="true" /> ~ <form:input path="eventEndTime" cssClass="input time required" size="10" caption="행사종료시간" required="true" />
					</td>
				</tr>			
				<tr>
					<th>행사명<span class="require">*</span></th>
					<td>
						<form:select path="eventNameCode" cssClass="select required" caption="행사명" />
					</td>				
					<th>마감</th>
					<td>
						<form:checkbox path="finishYn" value="Y" />
					</td>
				</tr>
				<tr>
					<th>행사주최<span class="require">*</span></th>
					<td colspan="3">
						<form:input path="organName" cssClass="input" size="30" cssStyle="ime-mode:active" />
						<form:hidden path="organCode" required="true" />
						<img id="organCodeSearch" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" />
					</td>
				</tr>
				<tr>
					<th>행사내용</th>
					<td colspan="3">
						<form:textarea path="eventDesc" cssClass="textarea" cols="80" rows="12" maxlangth="2000" />
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
							usePreview="${empty MM2_29VO.idnNo ? false : true }"
							useSecurity="false"
							uploadMode="db"
							fileId="${MM2_29VO.fileId }"
						/>
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty MM2_29VO.idnNo }">
				<img id="add" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px;" class="pointer" />
			</c:when>
			<c:otherwise>
				<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px;" class="pointer" />
			</c:otherwise>
		</c:choose>		
		<img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" onclick="closeWin();" class="pointer" />
	</div>
</form:form>
