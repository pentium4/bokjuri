<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
var _check = false;
require(['init'], function () {
	$(document).ready(function () {
		$("#organCode").mask("a99-999");
		$("#registerNo").mask('999999');
		$("#organCode").focus();
		
	// 	$("#executiveMeeting").datepicker({beforeShowDay: noBefore}).numericOnly();
	// 	$("#monthlyMeeting").datepicker({beforeShowDay: noBefore}).numericOnly();
		$("#organMeeting").datepicker().numericOnly();
		$("#organMeeting").datepicker().numericOnly();
		$("#spotNight").datepicker().numericOnly();
		$("#organAbolishDate").datepicker().numericOnly();
		
		$(".monthDue").maskMoney({
			  precision:0
			 ,showSymbol: true
		}).numericOnly();
		
		$("#organCode").on("keypress", function(){
			_check = false;
			$("#checkBtn").prop("src", "/images/lionsclubs/btn/btn_check1.gif");			
		});
		
		$("#add, #update").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			if(!$("#organAbolishDate").val().isEmpty() && $("#abolishReasonCode").val().isEmpty()){
				alert("폐지사유를 선택해 주세요.");
				$("#abolishReasonCode").focus();
				return false;
			}
			
			if($("#organAbolishDate").val().isEmpty() && !$("#abolishReasonCode").val().isEmpty()){
				alert("조직폐지일을 입력해 주세요.");
				$("#organAbolishDate").focus();
				return false;
			}
			
			var url = '<c:url value="/SM1/SM1_2/SM1_04/organUpdate.do" />';
			if("${SM1_04VO.organCode }" == ""){
				if(!_check){
					alert("체크를 확인해 주세요.");
					return false;
				}
				
				url = '<c:url value="/SM1/SM1_2/SM1_04/organInsert.do" />';
			}
	
			var params = $("form").serializeArray();
			$(".monthDue").each(function(index){
				var divisionCode = $(".divisionCode").eq(index).val();
				var monthDue = $(this).val();
				params.push({name: "monthDueArray["+index+"].divisionCode"   , value: divisionCode});
				params.push({name: "monthDueArray["+index+"].monthDue"   , value: monthDue});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  url,
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	//	 				alert('정상적으로 입력 되었습니다.');
						$("#organCode", opener.document).val($("#organCode").val());
						opener._search("/SM1/SM1_2/SM1_04/SM1_04.do");
						closeWin();
					} else {
						alert('동일한 등록번호가 존재합니다.');
						$("#registerNo").focus();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		$("#guidingMemberName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if(key == 13){
				guidingMemberPopup();
			}
		});
		
		// 가이딩 멤버
		$("#guidingMemberName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#guidingMemberName").val("");
				$("#guidingMemberNo").val("");
			}
		});
		
		$("#addDue").on("click", function(){
			$("#dialog-form-addDue").dialogPopup({
				 height: 300
				,width: 300
			});
		});
		
		$("#guidingClubCodeName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if(key == 13){
				var params = [];
				params.push({name:"koName", value:$("#guidingClubCodeName").val()});
				organSearchPopup(params);
			}
		});
		
		$("#guidingClubCodeName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#guidingClubCodeName").val("");
				$("#guidingClubCode").val("");
			}
		});
		
		$("#guidingClub").on("click", function(){
			var params = [];
			params.push({name:"koName", value:$("#guidingClubCodeName").val()});
			organSearchPopup(params);			
		});
	});
});

function organCheck(){
	if($("#organCode").val() == ""){
		alert("코드명을 입력해 주세요.");
		return false;
	}
	
	$("#koAbbrCheck").val("");
	if(organCheckResult() != null){
		alert("동일한 코드명이 존재합니다.");
		$("#koAbbrCheck").val(organCheckResult());
		return false;
	}
	
	_check = true;
	$("#checkBtn").prop("src", "/images/lionsclubs/btn/btn_check2.gif");	
}

function organCheckResult(){
	var _koAbbr = null;	
	var params = [];
	var organCode = $("#organCode").val();
	params.push({name: "organCode", value: organCode});
	
	$.ajax({
		type: "POST",
		async: false,
		url:  '<c:url value="/SM1/SM1_2/SM1_04/organCodeCheck.do" />',
		data: params,
		dataType: 'json',
		success: function(data) {
			_koAbbr = data.result;
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});	
	
	return _koAbbr;
}

function guidingMemberPopup(){
	var guidingMemberName = $("#guidingMemberName").val();
	var params = [];
	params.push({name: "name", value: guidingMemberName});
	  
	new lions.popup({
		 url: '/common/member/memberSearchPopup.do'
		,data: params
		,name: "memberSearchPopup"
		,width: "1000"
		,height: "400"		
		,oncomplate: function(r){
			var data = r.data;
			$("#guidingMemberNo").val(data.memberno);
			$("#guidingMemberName").val(data.name);
			$("#guidingClubCode").val(data.sectorclubcode);
			$("#guidingClubCodeName").val(data.sectorclubname);
		}
	}).open();
}

//조직검색
function organSearchPopup(settings){
	var params = "";
	if(settings != undefined){
		$.each(settings, function(index, object) {
		    if(index == 0){
		    	params += "?" + object.name + "=" + object.value;
		    } else {
		    	params += "&" + object.name + "=" + object.value;
		    }
		}); 	
	}
	
	openPopup("/SM1/SM1_2/SM1_04/organSearchPopup.do" + params, '700', '400', "organSearchPopup");	
}

function _organResult(value){
	$("#guidingClubCode").val($.url(value).param("organCode"));
	$("#guidingClubCodeName").val($.url(value).param("koName"));
}
</script>

<form:form id="SM1_04VO" modelAttribute="SM1_04VO" onsubmit="return false;">
	<h3>
		<div>
			신규조직
			<c:choose>
				<c:when test="${empty SM1_04VO.organCode }">추가</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>
		</div>
	</h3>
	
	<div class="popup_bg">
	<c:if test="${empty SM1_04VO.organCode }">
		<div class="fL w50">
			<table class="tblType2" style="width:98%;">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th>코드명<span class="require">*</span></th>
				<td>
					<form:input path="organCode" cssClass="input" size="30" cssStyle="width:98%;" required="true" caption="코드명" />					
				</td>
			</tr>
			</tbody>
			</table>
			
			<div class="popupBtn" style="margin-right: 60px;">
				<img id="checkBtn" src="/images/lionsclubs/btn/btn_check1.gif" style="width:57px" onclick="organCheck(); return false;" class="pointer" />
			</div>
		</div>
	
		<div class="fL w50">
			<table class="tblType2" style="width:98%;">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
			<tr>
				<th>조직명</th>
				<td>
					<input type="text" id="koAbbrCheck" class="input" size="30" style="width:98%;" maxlength="100" readonly="readonly" />
				</td>
			</tr>
			</tbody>
			</table>
		</div>
	</c:if>
	
	<div class="mT10">
		<table class="tblType2" style="width:99%;">
		<colgroup>
			<col width="100px" />
			<col />
		</colgroup>
		<tbody>
		<c:if test="${not empty SM1_04VO.organCode }">
			<tr>
				<th>조직코드</th>
				<td>
					${SM1_04VO.organCode }
					<form:hidden path="organCode"/>
				</td>
			</tr>
		</c:if>
		<tr>
			<th>한글명</th>
			<td>
				<form:input path="koName" cssClass="input" size="50" cssStyle="width:99%;" maxlength="100" />
			</td>
		</tr>
		<tr>
			<th>한글약어</th>
			<td>
				<form:input path="koAbbr" cssClass="input" size="30" cssStyle="width:99%;" maxlength="100" />
			</td>
		</tr>
		<tr>
			<th>한글약어(2)</th>
			<td>
				<form:input path="koAbbr2" cssClass="input" size="50" cssStyle="width:99%;" maxlength="100" />
			</td>
		</tr>
		<tr>
			<th>한자명</th>
			<td>
				<form:input path="chinName" cssClass="input" size="50" cssStyle="width:99%;" maxlength="100" />
			</td>
		</tr>
		<tr>
			<th>영문명</th>
			<td>
				<form:input path="enName" cssClass="input" size="50" cssStyle="width:99%;" maxlength="100" />
			</td>
		</tr>
		</tbody>
		</table>
	</div>
	<div class="mT10">
		<table class="tblType2" style="width:99%;">
			<colgroup>
				<col width="135px" />
				<col width="135px" />
				<col width="135px" />
				<col width="135px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>월회비</th>
					<th>이사회</th>
					<th>월례회</th>
					<th>도시/농촌</th>
					<th>조직총회</th>
				</tr>
				<tr>
					<td class="center">
						<img id="addDue" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px;" class="pointer" />
					</td>
					<td>
						<form:input path="executiveMeeting" cssClass="input" size="13" maxlength="100" />
					</td>
					<td>
						<form:input path="monthlyMeeting" cssClass="input" size="13" maxlength="100" />
					</td>
					<td>
						<lions:codeselect path="area" groupCode="7840" />
					</td>
				<td>
					<form:input path="organMeeting" cssClass="input date" size="13" caption="조직총회" />
				</td>
				</tr>
				<tr>
					<th>헌장의밤</th>
					<th>등록번호</th>
					<th>조직폐지일</th>
					<th colspan="2">폐지사유</th>
				</tr>
				<tr>
					<td>
						<form:input path="spotNight" cssClass="input date" size="13" caption="현장의밤" />
					</td>
					<td>
						<form:input path="registerNo" cssClass="input" size="13" />
					</td>
					<td>
						<form:input path="organAbolishDate" cssClass="input date" size="20" caption="조직폐지일" />
					</td>
					<td colspan="2">
						<lions:codeselect path="abolishReasonCode" groupCode="7830" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="mT10">
		<table class="tblType2" style="width:99%;">
		<colgroup>
			<col width="135px" />
			<col width="135px" />
			<col width="135px" />
			<col />
		</colgroup>
		<tbody>
		<tr>
			<th>가이딩 회원</th>
			<td>
				<form:input path="guidingMemberName" cssClass="input" size="10" />
				<form:hidden path="guidingMemberNo"/>
				<img src="/images/lionsclubs/btn/btn_post_search.gif" title="검색" style="margin-top:2px;" class="pointer" onclick="guidingMemberPopup()" />
			</td>
			<th>가이딩클럽</th>
			<td>
				<form:input path="guidingClubCodeName" cssClass="input" size="30" />
				<form:hidden path="guidingClubCode"/>
				<img id="guidingClub" src="/images/lionsclubs/btn/btn_post_search.gif" title="검색" style="margin-top:2px;" class="pointer" />
			</td>
		</tr>
		</tbody>
		</table>
	</div>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty SM1_04VO.organCode }">
				<img id="add" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px;" class="pointer" />
			</c:when>
			<c:otherwise>
				<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px;" class="pointer" />
			</c:otherwise>
		</c:choose>	
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
	
	<!-- Modal Popup -->  
	<div id="dialog-form-addDue" class="dialog" style="display: none;">
		<div id="popup">
			<h3><div>회원구분별 월회비</div></h3>
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<c:forEach var="list" items="${memberDivisionMonthDueList }" varStatus="status">
							<tr>
								<th>${list.codeName }</th>
								<td>
									<input type="text" class="input monthDue" value="${list.monthDue }" maxlength="10" />
									<input type="hidden" id="divisionCode" class="divisionCode" value="${list.divisionCode }" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- popup_bg -->
			
			<div class="popupBtn">
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</div>	
</form:form>

