<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%-- <script type="text/javascript" src="<c:url value="/js/lionsclubs/ckeditor/ckeditor.js" />"></script> --%>
<script type="text/javascript">
<!--
// var _editor = "";
require(['init'], function () {
	$(document).ready(function () {
		_fileId = fileId;
		$("#save").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			if(!validForm(Editor)){
				return false;	
			}
			
			fileId.startUpload();
		});
		
		Editor.modify({
			"content": $tx('editor_content') /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */ 
		});
	});
});

function _search(){
	$("form").submit();
}

function uploadCompleted(){
	var params = $("form").serializeArray();
	params.push({name: "fileId", value: fileId.fileId});
	params.push({name: "content", value: Editor.getContent()});
	
	$.ajax({
		type: "POST",
		async: false,
		url:  '<c:url value="/MM7/MM7_1/MM7_02/saveDocTemplate.do" />',
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				goUrl("/MM7/MM7_1/MM7_02/detailDocTemplate.do?idnNo=" + data.idnNo);
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
}
//-->
</script>
<form:form id="form" modelAttribute="MM7_02VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /><span class="date">${result.updateDate }</span></div></h3>
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<input id="save" type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" onclick="return false;" />
		</div>
		
		<div class="tblTitle Height_0">
			<form:input path="title" cssClass="input30 mb10 required" cssStyle="width: 99%" placeholder="제목을 입력해 주세요." caption="제목" />
		</div>
		<div class="Height_1">
			<%@ include file="/WEB-INF/jsp/lionsclubs/com/common/daumeditor/editor.jsp" %>
	
			<textarea id="editor_content" style="display: none;"><c:out value="${MM7_02VO.content }" /></textarea>
		</div><!-- tblTitle -->
		<div class="tblTitle Height_0" style="height: 130px;">
			<jwork:fileuploader 
				objectId="fileId"  
				uploadCompletedEvent="uploadCompleted"
				fileType="all" 
				maxFileSize="1000" 
				maxFileCount="0" 
				usePreview="true"
				useSecurity="false"
				uploadMode="db"
				fileId="${MM7_02VO.fileId }"
			/>		
		</div>
	</div><!-- table -->
	<form:hidden path="idnNo" />
	<form:hidden path="organCode" />
	<form:hidden path="sessionYear" />
</form:form>