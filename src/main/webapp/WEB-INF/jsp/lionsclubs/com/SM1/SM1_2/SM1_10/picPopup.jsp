<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#closeBtn").click(function(){
			top.close();
		});
		
		$("#saveBtn").click(function(){
			memberPictureFile.startUpload();
		});
		<c:if test="${SM1_10VO_FILE.fileIdForUpload > ''}">
			$("#picFrame").attr("src","${ctx}/jfile/preview.do?fileId=${SM1_10VO_FILE.fileIdForUpload}" + "&tmp="+ Math.random())
		</c:if>
	});
});

function uploadCompleted() {
	var url = '<c:url value="/SM1/SM1_2/SM1_10/fileInfoUpload.dox" />';
	var params = {fileIdForUpload:memberPictureFile.fileId,idnNoForUpload:<c:out value="${SM1_10VO_FILE.idnNoForUpload}" />};
	$.ajax({
		type: "POST",
		async: false,		
		url:  url,
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				opener.$("input[name=fileId]").eq(<c:out value="${SM1_10VO_FILE.idxForUpload}" /> -1).val(memberPictureFile.fileId);
				opener.$("#memPict_"+"<c:out value="${SM1_10VO_FILE.idxForUpload}" />").attr("src","${ctx}/jfile/preview.do?fileId=" + memberPictureFile.fileId + "&tmp="+ Math.random());
				top.close();
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
		}		
	});
}

</script>
<style type="text/css">
div.picBox{margin:0 5px 0 0;padding:0;float:none;text-align:center;}
div.picBox p.title{margin:0;padding:10px 0 7px 0;color:#fff;font-weight:bold;text-align:center;background:url("/images/lionsclubs/sub/profile_bg.gif") 0 0 no-repeat}
div.picBox p.photo img{width:130px;height:150px;margin:5px 0 10px 0;padding:2px;border:1px solid #ccc;text-align:center;align:ceneter;}
</style>
	
		<div class="picBox">
				<p class="photo">
					<img id="picFrame" alt="본인 사진" src="/images/lionsclubs/noimg.gif"  onerror="this.src='/images/lionsclubs/noimg.gif'" />
				</p>
				<p class="center">
					<jwork:fileuploader 
						objectId="memberPictureFile"  
						uploadCompletedEvent="uploadCompleted"
						fileType="image" 
						maxFileSize="100" 
						maxFileCount="0" 
						usePreview="false"
						useSecurity="false"
						uploadMode="db"
						fileId="${SM1_10VO_FILE.fileIdForUpload}"
					/>
					
				</p>
			<div class="popupBtn" style="text-align:center;">
				<img id="saveBtn" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" title="저장" class="pointer" /> 
				<img id="closeBtn" src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" title="닫기" class="pointer" />
			</div>
			
		</div>
