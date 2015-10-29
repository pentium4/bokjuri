<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.js"></script>
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#birth").datepicker();
		$("#singDate").datepicker();
		$("#sectorClubName").focus();
		
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
		
		// 소속클럽 검색
		$("#sectorClubName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 && !$(this).prop("readonly")) {
				$("#organSearch").trigger("click");
			}
		});
		
		$("#sectorClubName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			
			if(key == 8 && !$(this).prop("readonly")){
				$(this).val("");
				$("#organCode").val("");
			}	
		});
		
		// 소속클럽
		$("#organSearch").on("click", function(){
			var params = [];
			params.push({name:"lvl", value:4});
			params.push({name:"returnFunction", value:"organResult"});	// 팝업에서 리턴할 function
			params.push({name:"koName", value:$("#sectorClubName").val()});
			organSearchPopup(params);
		});	
		
		$("#recommMemberName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				$("#recommMember").trigger("click");		
			}
		});
		
		$("#recommMemberName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#recommMemberName").val("");
				$("#recommMemberNo").val("");
			}
		});	
		
		$("#recommMember").on("click", function(){
			var params = [];
			
			params.push({name: "name", value: $("#recommMemberName").val()});	
			params.push({name: "authYn", value: "N"});
			params.push({name: "quitYn", value: "N"});
			
			new lions.popup({
				 url: '/common/member/memberSearchPopup.do'
				,data: params
				,name: "memberSearchPopup"
				,oncomplate: function(r){
					var data = r.data;
					$("#recommMemberName").val(data.name);
					$("#recommMemberNo").val(data.memberno);
				}
				,width: "1000"
				,height: "400"
			}).open();
		});
		
		$("#zipCode").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				$("#addressSearch").trigger("click");		
			}
		});
		
		$("#addressSearch").on("click", function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
	                $("#zipCode").val(data.postcode);
	                $("#address").val(data.address);
	                $("#address").focus();
	            }
	        }).open();
		});
		
		$("#mobile").tel();
	});
});

function send(){
	if($("#sectorClubCode").val().isEmpty()){
		alert("소속클럽을 입력해 주세요.");
		$("#sectorClubName").focus();
		return false;
	}

	if($("#recommMemberNo").val().isEmpty()){
		alert("스폰회원을 입력해 주세요.");
		$("#recommMemberName").focus();
		return false;
	}
	
	if(!$("form").valid()){
		return false;
	}

	if($("#memberPictureFile .fileItem").length == 0){
		alert("본인사진은 필수 입니다.");
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
	
	var url = '<c:url value="/MM1/MM1_3/MM1_14/updateProfile.do" />';
	if("${MM1_14VO.registerNo}".isEmpty()){
		url = '<c:url value="/MM1/MM1_3/MM1_14/insertProfile.do" />';
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
				if("${MM1_14VO.registerNo}".isEmpty()){
					$("#registerNo", opener.document).val(data.registerNo);
				}
				opener._search();
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

function organResult(value){
	$("#sectorClubName").val($.url(value).param("koName"));
	$("#sectorClubCode").val($.url(value).param("organCode"));
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

<form:form id="MM1_14VO" modelAttribute="MM1_14VO">
	<h3 style="width:99%;">
		<div>
			신입회원
			<c:choose>
				<c:when test="${empty MM1_14VO.registerNo }">등록</c:when>
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
					<c:if test="${not empty MM1_14VO.registerNo }">
						<tr>
							<th>등록번호</th>
							<td>${MM1_14VO.registerNo }</td>
						</tr>
					</c:if>
					<tr>
						<th>소속클럽<span class="require">*</span></th>
						<td>
							<form:input path="sectorClubName" cssClass="input required" size="25" cssStyle="ime-mode:active" caption="소속클럽" />
							<form:hidden path="sectorClubCode" cssClass="required" caption="소속클럽" />
							<img id="organSearch" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" />
						</td>
					</tr>
					<tr>
						<th>성<span style="margin-left: 30px;" />명<span class="require">*</span></th>
						<td>
							<form:input path="name" cssClass="input required" size="28" caption="성명" />
						</td>
					</tr>
					<tr>
						<th>생년월일<span class="require">*</span></th>
						<td>
							<form:input path="birth" id="birth" cssClass="input date required" size="28" caption="생년월일" />
						</td>
					</tr>
					<tr>
						<th>입회일자<span class="require">*</span></th>
						<td>
							<form:input path="singDate" id="singDate" cssClass="input date required" size="28" caption="입회일자" />
						</td>
					</tr>
					<tr>
						<th>스폰회원<span class="require">*</span></th>
						<td>
							<form:input path="recommMemberName" cssClass="input required" size="15" cssStyle="margin-top:2px" caption="스폰회원" />
							<form:hidden path="recommMemberNo"/>
							<img id="recommMember" class="pointer" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" />					
						</td>
					</tr>
					<tr>
						<th>한<span style="margin-left: 30px;" />자<span style="margin-left: 10px;" /></th>
						<td>
							<form:input path="chinName" cssClass="input" size="28" cssStyle="width: 88%;" />
						</td>
					</tr>
					<tr>
						<th>영<span style="margin-left: 30px;" />문<span class="require">*</span></th>
						<td>
							<form:input path="engName" cssClass="input required" size="28" cssStyle="width:88%;ime-mode:inactive;" caption="영문" />
						</td>
					</tr>
					<tr>
						<th>우편번호<span class="require">*</span></th>
						<td>
							<form:input path="zipCode" cssClass="input required" size="10" maxlength="10" caption="우편번호" />
							<img id="addressSearch" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" alt="검색" />
						</td>
					</tr>
					<tr>
						<th>주<span style="margin-left: 30px;" />소<span class="require">*</span></th>
						<td>
							<form:input path="address" cssClass="input required" size="28" maxlength="100" caption="주소" />
						</td>
					</tr>
					<th>휴대전화<span class="require">*</span></th>
					<td>
						<form:input path="mobile" cssClass="input tel required" size="20" maxlength="13" caption="휴대전화" />
					</td>
					<tr>
						<th>구<span style="margin-left: 30px;" />분<span class="require">*</span></th>
						<td>
							<lions:codeselect path="division" cssClass="required" groupCode="1140" caption="구분" />
						</td>
					</tr>
				</tbody>
			</table>
			<div class="popupBtn">
				<c:choose>
					<c:when test="${empty MM1_14VO.registerNo }">
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
					<img alt="본인 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${MM1_14VO.memberPictureFile}" />
					<c:if test="${not empty MM1_14VO.memberPictureFile }">
						<span id="${MM1_14VO.memberPictureFile}" class="remove pointer"></span>
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
						fileId="${MM1_14VO.memberPictureFile }"
					/>
				</p>
			</div>
			<div class="fL pL20">
				<p class="title">배우자 사진</p>
				<p class="photo" id="ness">
					<img alt="배우자 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${MM1_14VO.nessPictureFile} " />
					<c:if test="${not empty MM1_14VO.nessPictureFile }">
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
						fileId="${MM1_14VO.nessPictureFile }"
					/>					
				</p>
			</div>
		</div>
	</div><!-- popup_bg -->
	
	<form:hidden path="registerNo"/>
</form:form>
