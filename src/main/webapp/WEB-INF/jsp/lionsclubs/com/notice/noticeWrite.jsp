<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		var noticeKindCode = "${noticeKindCode}";
		var lvl = 0;
		switch(noticeKindCode){
			case '1020' : lvl = 4; break;
			case '1030' : lvl = 3; break;
			case '1040' : lvl = 3; break;
		}
	
		// 조직코드 세팅
		if(lvl > 0){
			$("#organCode").organCode({
				 lvl: lvl
				,fixVal: "${noticeVO.organCode}"
				,searchable: true
			});
		}
		
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
	var url = '<c:url value="/notice/noticeUpdate.do" />';
	if("${noticeVO.idnNo}" == null || "${noticeVO.idnNo}" == ""){
		url = '<c:url value="/notice/noticeInsert.do" />';
	}
	
	var params = $("form").serializeArray();
	params.push({name: "fileId", value: fileId.fileId});
	params.push({name: "content", value: Editor.getContent()});
	
	$.ajax({
		type: "POST",
		async: false,
		url:  url,
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result){
				goUrl("/notice/noticeDetail.do?noticeCode=${noticeVO.noticeCode}&idnNo=" + data.idnNo);
			} else {
				_search();
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
}
</script>
<form:form id="form" modelAttribute="noticeVO" action="/notice/noticeWrite.do">
	<double-submit:preventer tokenKey="notice" />
	
	<form:hidden path="noticeCode"/>
	<form:hidden path="idnNo"/>
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /><span class="date">${result.updateDate }</span></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>		
			<tbody>
				<c:if test="${noticeKindCode eq '1020' or noticeKindCode eq '1030' or noticeKindCode eq '1040' }">
					<tr>
						<th>
							<c:choose>
								<c:when test="${noticeKindCode eq '1020' }">클럽코드</c:when>
								<c:when test="${noticeKindCode eq '1030' or noticeKindCode eq '1040' }">지구코드</c:when>
							</c:choose>
						</th>
						<td><form:select path="organCode" /></td>
					</tr>			
				</c:if>
				<tr>
					<td colspan="2">
						<form:input path="title" cssClass="input30 required" cssStyle="width: 99%; margin: 5px;" placeholder="제목을 입력해 주세요." caption="제목"  />
					</td>
				</tr>
			</tbody>
		</table>
	</div>	
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<input id="save" type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" onclick="return false;" />
		</div>
		
		<div class="Height_1">
			<%@ include file="/WEB-INF/jsp/lionsclubs/com/common/daumeditor/editor.jsp" %>
	
			<textarea id="editor_content" style="display: none;"><c:out value="${noticeVO.content }" /></textarea>
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
				fileId="${noticeVO.fileId }"
			/>		
		</div>
	</div><!-- table -->
</form:form>