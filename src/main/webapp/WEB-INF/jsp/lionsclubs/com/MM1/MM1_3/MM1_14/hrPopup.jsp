<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.js"></script>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#address").focus();
		$("#zipCode").mask("999-999");
		
		$("#businessClass").on("change", function(){
			$("#industry").option1Code({ 
		    	groupCode: '1200',	// 그룹코드
		    	code: $(this).val(),	// 코드
		    	fixVal: "${MM1_14VO.industry}",	// 고정값
		    	topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
			});		
		}).change();
		
		$("#save").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var params = $("form").serialize();
			
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM1/MM1_3/MM1_14/hrUpdate.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	//	 				alert('정상적으로 입력 되었습니다.');
						$("#registerNo", opener.document).val($("#registerNo").val());
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}		
			});			
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
		
		$("#companyAddress").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				$("#companyAddressSearch").trigger("click");		
			}
		});		
		
		$("#companyAddressSearch").on("click", function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
	                $("#companyAddress").val(data.address);
	                $("#companyAddress").focus();
	            }
	        }).open();
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
		
		$("#mobile").tel();
		$("#workTel").tel();
		$("#homeTel").tel();
		$("#fax").tel();
	});
});

function jdTelnumberFormat(str) {
	var tmp = substr(str, 0, 4);
	
	switch(tmp) {
		case '1544': case '1588':
			num = preg_replace("/([0-9]{4})-?([0-9]{4}).*/", "\\1-\\2", str);
			break;
		default:
			num = preg_replace("/(0505|02|0[0-9]{2})-?([0-9]{3,4})-?([0-9]{4}).*/", "\\1-\\2-\\3", str);
			break;
	}
	
	return num;
}
</script>
<form:form id="MM1_14VO" modelAttribute="MM1_14VO" onsubmit="return false;">
	<form:hidden path="registerNo"/>
	<h3><div>개인정보 수정</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
		<colgroup>
			<col width="90px" />
			<col width="*" />
			<col width="90px" />
			<col width="*" />
			<col width="90px" />
			<col width="105px" />
			<col width="45px" />
			<col width="65px" />
		</colgroup>
		<tbody>
			<tr>
				<th>주소</th>
				<td colspan="3">
					<form:input path="address" cssClass="input" size="80" maxlength="100" />
				</td>
				<th>우편번호</th>
				<td colspan="3">
					<form:input path="zipCode" cssClass="input" size="10" maxlength="10" />
					<img id="addressSearch" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" alt="검색" />
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<form:input path="mobile" cssClass="input" size="20" maxlength="13" type="tel" />
				</td>
				<th>직장전화</th>
				<td>
					<form:input path="workTel" cssClass="input" size="20" maxlength="13" type="tel" />
				</td>
				<th>취미활동</th>
				<td colspan="3">
					<form:input path="hobby" cssClass="input" size="20" />
				</td>
			</tr>
			<tr>
				<th>자택전화</th>
				<td>
					<form:input path="homeTel" cssClass="input" size="20" maxlength="13" type="tel" />
				</td>
				<th>팩스번호</th>
				<td>
					<form:input path="fax" cssClass="input" size="20" maxlength="13" type="tel" />
				</td>
				<th>혈액형</th>
				<td>
					<lions:codeselect path="blood" groupCode="2560" />
				</td>
				<th>신장</th>
				<td>
					<form:input path="height" cssClass="input" size="3" maxlength="3" />Cm
				</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td>
					<form:input path="mailAddress" cssClass="input" size="30" type="email" caption="메일주소" cssStyle="ime-mode:inactive;" />
				</td>
				<th>HP/Gmail</th>
				<td>
					<form:input path="gmail" cssClass="input" size="30" type="email" caption="HP/Gmail" cssStyle="ime-mode:inactive;"  />
				</td>
				<th>추 천 자</th>
				<td colspan="3">
					<form:input path="recommMemberName" cssClass="input" size="15" cssStyle="margin-top:2px" />
					<form:hidden path="recommMemberNo"/>
					<img id="recommMember" class="pointer" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" />
				</td>
			</tr>
			<tr>
				<th>업종분류</th>
				<td>
					<lions:codeselect path="businessClass" groupCode="1200" />
				</td>
				<th>업 종</th>
				<td>
					<form:select path="industry" cssClass="select" />
				</td>
				<th>관계</th>
				<td colspan="3">
					<lions:codeselect path="recommRealtionship" groupCode="2580" />
				</td>
			</tr>
			<tr>
				<th>업체직책</th>
				<td>
					<lions:codeselect path="companyTitle" groupCode="2500" />
				</td>
				<th>업 체 명</th>
				<td>
					<form:input path="companyName" cssClass="input" size="30" />
				</td>
				<th>결혼여부</th>
				<td colspan="3">
					<lions:codeselect path="marryStatus" groupCode="2660" />
				</td>
			</tr>
			<tr>
				<th>업체주소</th>
				<td colspan="3">
					<form:input path="companyAddress" cssClass="input" size="70" maxlength="100" />
					<img id="companyAddressSearch" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" alt="검색" />
				</td>
				<th>배우자성명</th>
				<td colspan="3">
					<form:input path="gameteName" cssClass="input" size="20" />
				</td>
			</tr>
			<tr>
				<th>최종학력</th>
				<td>
					<lions:codeselect path="endEducation" groupCode="2520" />
				</td>
				<th>출신학교</th>
				<td>
					<form:input path="nativeSchool" cssClass="input" size="30" />
				</td>
				<th>본인가족</th>
				<td colspan="3">
					<form:input path="family" cssClass="input" size="10" /> <span class="Blue">예) 0남 0녀</span>
				</td>
			</tr>
			<tr>
				<th>전공과목</th>
				<td>
					<form:input path="majorSubject" cssClass="input" size="30" />
				</td>
				<th>병력관계</th>
				<td>
					<lions:codeselect path="army" groupCode="2540" />
				</td>
				<th>자녀가족</th>
				<td colspan="3">
					<form:input path="children" cssClass="input" size="10" /> <span class="Blue">예) 0남 0녀</span>
				</td>
			</tr>
		</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="save" alt="저장" src="/images/lionsclubs/btn/btn_save.gif" class="pointer" />
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
