<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#saveBtn").click(function(){
			fileId.startUpload();
		});
		
		$("#closeBtn").click(function(){
			top.close();
		});
	});
});	

function uploadCompleted() {
	var url = '<c:url value="/MM2/MM2_4/MM2_27/fileInfoUpload.dox" />';
	var params = {
			 fileId:fileId.fileId
			,inputSessionYyyy:"<c:out value="${MM2_27VO_FILE.inputSessionYyyy}" />"
			,inputSessionMm:"<c:out value="${MM2_27VO_FILE.inputSessionMm}" />"
			,inputOrganCode:"<c:out value="${MM2_27VO_FILE.inputOrganCode}" />"
			,inputConfKindCode:"<c:out value="${MM2_27VO_FILE.inputConfKindCode}" />"
			,inputConfIdnNo:"<c:out value="${MM2_27VO_FILE.inputConfIdnNo}" />"
			,inputIdnNo:"<c:out value="${MM2_27VO_FILE.inputIdnNo}" />"

	};
	
	$.ajax({
		type: "POST",
		async: false,		
		url:  url,
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				opener.$("input[name=inputFileId]").eq(<c:out value="${MM2_27VO_FILE.chkIdx}" />-1).val(fileId.fileId);
				top.close();
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
		}		
	});
}

</script>

<form:form id="form_insert" modelAttribute="MM2_27VO_FILE" >
<h3 style="width:99%;"><div>첨부파일</div></h3>
<div class="popup_bg">
<p style="color:blue;"><strong>※ 최대 10개의 파일을 저장할 수 있습니다.</strong></p>
					<jwork:fileuploader 
						objectId="fileId"  
						uploadCompletedEvent="uploadCompleted"
						fileType="" 
						maxFileSize="100" 
						maxFileCount="10" 
						usePreview="false"
						useSecurity="false"
						uploadMode="db"
						fileId="${MM2_27VO_FILE.fileId }"
					/>
				<div class="popupBtn" style="text-align:center;">
				<img id="saveBtn" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" title="저장" class="pointer" /> 
				<img id="closeBtn" src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" title="닫기" class="pointer" />
				</div>
		
</div><!-- popup_bg -->

<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
</form:form>
