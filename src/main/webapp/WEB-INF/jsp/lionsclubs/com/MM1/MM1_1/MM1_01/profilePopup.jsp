<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
require(['init'], function () {
	$(document).ready(function () {
		if("MM1_01VO.memberNo".isEmpty()){
			$("#memberNo").mask("99999999");	
		} else {
			$("#memberNo").mask("*9999999");
		}
		
		$("#birth").datepicker();
		$("#memberNo").focus();
		
		$("#memberNo, #name, #birth").on("keydown", function(){
			_check = false;
			$("#checkBtn").prop("src", "/images/lionsclubs/btn/btn_check1.gif");
		});
		
		$("#member .remove").on("click", function(){
			$("#memberPictureFile").find(".cen img").trigger( "click" );
			$("#member img").prop("src", "/images/lionsclubs/mobile/photo.gif");
			$(this).remove();
		});
		
		$("#ness .remove").on("click", function(){
			$("#nessPictureFile").find(".cen img").trigger( "click" );
			$("#ness img").prop("src", "/images/lionsclubs/mobile/photo.gif");
			$(this).remove();
		});
		
		// 서버에 파일을 지워야 할 경우 Seq 목록에 추가
	// 	if(seq) {
	// 		this.deletedFileSeqList.push(seq);
	// 	}
		// SwfUpload에서 해당 파일 삭제
		/*
		else {
			var swfFileId = jQuery(tr).prop("id");
			this.swfu.cancelUpload(swfFileId, false);
		}
		*/
	});
});

var _check = false;
function send(){
	var memberNo = $("#memberNo");
	if(memberNo.val().isEmpty()){
		alert("회원번호를 입력해 주세요.");
		$("#memberNo").focus();
		return false;
	}
	
	var engCheck = /[a-zA-Z]$/;
	if(engCheck.test(memberNo.val().substring(0,1))){
		if(memberNo.val().substring(0,6).toUpperCase() != "${clubCode}"){
			alert("앞의6자리 회원번호가 클럽코드와 같아야 입력할 수 있습니\n예)울산라이온스클럽(K26-001)의 경우\n K2600101과 같이 입력");
			return false;
		}
	}
	
	if($("#name").val().isEmpty()){
		alert("성명을 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	if($("#birth").val().isEmpty()){
		alert("생년월일을 입력해 주세요.");
		$("#birth").focus();
		return false;
	}		

	if(!$("form").valid()){
		_check = false;
		$("#checkBtn").prop("src", "/images/lionsclubs/btn/btn_check1.gif");		
		return false;
	}
	
	if(!_check){
		alert("체크를 확인해 주세요.");
		return false;
	}	
	
	memberPictureFile.startUpload();
}

function uploadCompleted1(){
	nessPictureFile.startUpload();
}

function uploadCompleted2(){
	var params = $("form").serializeArray();
	params.push({name: "memberPictureFile", value: memberPictureFile.fileId});
	params.push({name: "nessPictureFile", value: nessPictureFile.fileId});
	
	var url = '<c:url value="/MM1/MM1_1/MM1_01/profileUpdate.do" />';
	if("${MM1_01VO.memberNo}".isEmpty()){
		url = '<c:url value="/MM1/MM1_1/MM1_01/profileInsert.do" />';
	}
	
	$.ajax({
		type: "POST",
		async: false,		
		url:  url,
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.result == "1"){
// 				alert('정상적으로 입력 되었습니다.');
				$("#memberNo", opener.document).val($("#memberNo").val());
				opener._search("/MM1/MM1_1/MM1_01/MM1_01.do");
				closeWin();
			} else {
				alert(data.result);
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});	
}

function duplicationCheck(){
	if($("#memberNo").val().isEmpty()){
		alert("회원번호를 입력해 주세요.");
		$("#memberNo").focus();
		return false;
	}
	
	var params = [];
	var memberNo = $("#memberNo").val();
	params.push({name: "memberNo", value: memberNo});
	
	if("${MM1_01VO.memberNo}".isEmpty()){
		if(duplicateCheck(params) > 0){
			alert("동일한 회원번호가 존재합니다.");
			openPopup("/MM1/MM1_1/MM1_01/birthPopup.do?memberNo=" + memberNo, "700", "490", "birthPopup");
			return false;
		}
	}
	
	if($("#name").val().isEmpty()){
		alert("성명을 입력해 주세요.");
		$("#name").focus();
		return false;
	}
	
	if($("#birth").val().isEmpty()){
		alert("생년월일을 입력해 주세요.");
		$("#birth").focus();
		return false;
	}
	
	params = [];
	var name = $("#name").val();
	var birth = $("#birth").val();
	params.push({name: "name", value: name});
	params.push({name: "birth", value: birth});

	if(name != "${MM1_01VO.name}" && birth != "${MM1_01VO.birth}"){
		if(duplicateCheck(params) > 0){
			alert("동일한 성명 또는 생년월일이 존재합니다.");
			openPopup("/MM1/MM1_1/MM1_01/birthPopup.do?name=" + name + "&birth=" + birth, "700", "490", "birthPopup");
		}
	}
	
	_check = true;
	$("#checkBtn").prop("src", "/images/lionsclubs/btn/btn_check2.gif");
}

function duplicateCheck(params){
	var _result = 0;
	$.ajax({
		type: "POST",
		async: false,		
		url:  '<c:url value="/MM1/MM1_1/MM1_01/duplicateCheck.do" />',
		data: params,
		dataType: 'json',
		success: function(data) {
			_result = data.result;
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
	
	return _result;
}
</script>

<style>
<!--
#member .remove {
    position: absolute;    
    right: 178px;
    top: 215px;
    width: 10px;
    width: 58px;
    height: 30px;
}

#ness .remove {
    position: absolute;    
    right: 20px;
    top: 215px;
    width: 10px;
    width: 58px;
    height: 30px;
}

.photo:hover .remove{ background: url('/images/lionsclubs/btn/btn_del.gif') no-repeat; }

-->
</style>

<form:form id="MM1_01VO" modelAttribute="MM1_01VO" onsubmit="return false;">
	<h3 style="width:99%;">
		<div>
			회원
			<c:choose>
				<c:when test="${empty MM1_01VO.memberNo }">등록</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>			
		</div>
	</h3>
	<div class="popup_bg">
		<div class="fL w50">
			<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>회원번호<span class="require">*</span></th>
					<td>
						<c:choose>
							<c:when test="${empty MM1_01VO.memberNo }">
								<form:input path="memberNo" cssClass="input" size="10" maxlength="8" />
							</c:when>
							<c:otherwise>
								${MM1_01VO.memberNo }
								<form:hidden path="memberNo" />
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명<span class="require">*</span></th>
					<td>
						<form:input path="name" cssClass="input" size="28" cssStyle="width: 88%;" />
					</td>
				</tr>
				<tr>
					<th>생년월일<span class="require">*</span></th>
					<td>
						<form:input path="birth" id="birth" cssClass="input date" size="28" cssStyle="width: 88%;" caption="생년월일" />
					</td>
				</tr>
			</tbody>
			</table>
			
			<div class="popupBtn" style="margin-right: 60px;">
			    <img title="체크" id="checkBtn" src="/images/lionsclubs/btn/btn_check1.gif" onclick="duplicationCheck()" class="pointer" />
			</div>
			
			<table class="tblType2" style="border-top:1px solid #aaa !important;">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>한&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자</th>
					<td>
						<form:input path="chinName" cssClass="input" size="28" cssStyle="width: 88%;" />
					</td>
				</tr>
				<tr>
					<th>영&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</th>
					<td>
						<form:input path="engName" cssClass="input" size="28" cssStyle="width:88%;ime-mode:inactive;" />
					</td>
				</tr>
				<tr>
					<th>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</th>
					<td>
						<lions:codeselect path="division" groupCode="1140" />
					</td>
				</tr>
			</tbody>
			</tbody>
			</table>
			<div class="popupBtn">
				<c:choose>
					<c:when test="${empty MM1_01VO.memberNo }">
						<img title="입력" src="/images/lionsclubs/btn/btn_input.gif" style="width:57px" onclick="send()" class="pointer" />
					</c:when>
					<c:otherwise>
						<img title="수정" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px" onclick="send()" class="pointer" />
					</c:otherwise>
				</c:choose>
				
				<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		</div><!-- fL -->
		<div class="profileBox">
			<div class="fL">
				<p class="title">본인사진</p>
				<p class="photo" id="member">
					<img alt="본인 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${MM1_01VO.memberPictureFile}" />
					<c:if test="${not empty MM1_01VO.memberPictureFile }">
						<span id="${MM1_01VO.memberPictureFile}" class="remove pointer"></span>
					</c:if>
				</p>
				<p class="center">
					<jwork:fileuploader 
						objectId="memberPictureFile"  
						uploadCompletedEvent="uploadCompleted1"
						fileType="image" 
						maxFileSize="100" 
						maxFileCount="0" 
						usePreview="false"
						useSecurity="false"
						uploadMode="db"
						fileId="${MM1_01VO.memberPictureFile }"
					/>
				</p>
			</div>
			<div class="fL pL20">
				<p class="title">배우자 사진</p>
				<p class="photo" id="ness">
					<img alt="배우자 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${MM1_01VO.nessPictureFile} " />
					<c:if test="${not empty MM1_01VO.nessPictureFile }">
						<span class="remove pointer"></span>
					</c:if>
				</p>
				<p class="center">
					<jwork:fileuploader 
						objectId="nessPictureFile"  
						uploadCompletedEvent="uploadCompleted2"
						fileType="image" 
						maxFileSize="100" 
						maxFileCount="0" 
						usePreview="false"
						useSecurity="false"
						uploadMode="db"
						fileId="${MM1_01VO.nessPictureFile }"
					/>					
				</p>
			</div>
		</div>
		

	</div><!-- popup_bg -->
</form:form>
