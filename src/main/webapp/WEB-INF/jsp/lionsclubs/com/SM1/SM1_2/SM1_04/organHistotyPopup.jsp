<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
require(['init'], function () {
	$(document).ready(function () {
		$('#changeDate').datepicker();
		
		if("${SM1_04VO.idnNo }" == ""){
			$("#changeDate").val(Date.today().toString("yyyyMMdd"));	
		}
		
		$("#printOrd1").numericOnly();
		$("#printOrd2").numericOnly();
		$("#targetMember").numericOnly();
		
		$("#add, #update").on("click", function(){
			if(!$("#SM1_04VO").valid()){
				return false;
			}
			
			var url = '<c:url value="/SM1/SM1_2/SM1_04/organHistoryInsert.do" />';
			if("${param.action }" == "update"){
				url = '<c:url value="/SM1/SM1_2/SM1_04/organHistoryUpdate.do" />';
			}
			
			var params = $("form").serializeArray();
			$.ajax({
				type: "POST",
				async: false,
				url:  url,
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 	 				alert('정상적으로 입력 되었습니다.');
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
		
		// 조직책임자
		$("#organOfficerMemberName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				organOfficerMemberPopup();
			}
		});	
		
		// 조직책임자
		$("#organOfficerMemberName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#organOfficerMemberName").val("");
				$("#organOfficerMemberNo").val("");
			}
		});
	
		// 분기조직
		$("#branchOrganCodeName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				branchOrganSearchPopup();
			}
		});	
		
		// 분기조직
		$("#branchOrganCodeName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#branchOrganCodeName").val("");
				$("#branchOrganCode").val("");
			}
		});	
		
		// 상위조직
		$("#upperOrganCodeName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				organSearchPopup();
	// 			event.preventDefault();
			}
		});
		
		// 상위조직
		$("#upperOrganCodeName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#upperOrganCodeName").val("");
				$("#upperOrganCode").val("");
			}
		});
		
		$("#changeDate").on("change", function(){
		 	var params = $("form").serializeArray();
		 	$.ajax({
		 		type: "POST",
		 		async: false,
		 		url:  '<c:url value="/SM1/SM1_2/SM1_04/organAward.do" />',
		 		data: params,
		 		dataType: 'json',
		 		success: function(data) {
		 			$("#representAward1").find("option").not(":first").remove();
		 			$("#representAward2").find("option").not(":first").remove();
		 			
		 			var total = data.resultList.length;
		 			$.each(data.resultList, function(index, object){
		 				$("#representAward1").append("<option value="+ object.idnNo +">"+ object.awardKindName +"</option>");
		 				$("#representAward2").append("<option value="+ object.idnNo +">"+ object.awardKindName +"</option>");
		 				
		 				if(index == total - 1){
		 					$("#representAward1").val("${SM1_04VO.representAward1}");
		 					$("#representAward2").val("${SM1_04VO.representAward2}");
		 				}
		 			});
		 		},
		 		error:function(request,status,error){
		 			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
		 			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 		}
		 	});
		}).change();
		
		$("#tel").tel();
		$("#hp").tel();
		$("#fax").tel();
		
		$("#organOfficerSlogan").autosize();
		$("#organOfficerSloganEn").autosize();
	});
});

function organOfficerMemberPopup(){
	var organOfficerMemberName = $("#organOfficerMemberName").val();
	var params = [];
	params.push({name: "name", value: organOfficerMemberName});
	  
	new lions.popup({
		 url: '/common/member/memberSearchPopup.do'
		,data: params
		,name: "memberSearchPopup"
		,width: "1000"
		,height: "400"		
		,oncomplate: function(r){
			var data = r.data;
			$("#organOfficerMemberName").val(data.name);
			$("#organOfficerMemberNo").val(data.memberno);
			$("#tel").val(data.hometel);
			$("#hp").val(data.mobile);
			$("#fax").val(data.fax);
			$("#email").val(data.mailaddress);
		}
	}).open();	
}

//조직검색
function organSearchPopup(){
	var upperOrganCodeName = $("#upperOrganCodeName").val();
	openPopup("/SM1/SM1_2/SM1_04/organSearchPopup.do?koName=" + upperOrganCodeName, '700', '400', "organSearchPopup");
}

function _organResult(value){
	$("#upperOrganCodeName").val($.url(value).param("koName"));
	$("#upperOrganCode").val($.url(value).param("organCode"));
}

//분기조직검색
function branchOrganSearchPopup(){
	var branchOrganCodeName = $("#branchOrganCodeName").val();
	var returnFunction = "_branchOrganResult";
	openPopup("/SM1/SM1_2/SM1_04/organSearchPopup.do?koName=" + branchOrganCodeName + "&returnFunction=" + returnFunction, '700', '400', "organSearchPopup");
}

function _branchOrganResult(value){
	$("#branchOrganCodeName").val($.url(value).param("koName"));
	$("#branchOrganCode").val($.url(value).param("organCode"));
}
</script>

<form:form id="SM1_04VO" modelAttribute="SM1_04VO" onsubmit="return false;">
	<form:hidden path="organCode"/>
	<form:hidden path="idnNo"/>
	<h3 style="width:98%;">
		<div>
			조직변동
			<c:choose>
				<c:when test="${param.action eq 'add' }">추가</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>			 
		</div>
	</h3>
	
	<div class="popup_bg" style="height: 320px;">
		<table class="tblType2" style="width:98%;">
			<colgroup>
				<col width="100px" />
				<col width="200px" />
				<col width="140px" />
				<col width="125px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>변동일자</th>
					<td>
						<form:input path="changeDate" cssClass="input date" size="12" caption="변동일자" />
					</td>
					<th>전화번호</th>
					<td>
						<form:input path="tel" cssClass="input" size="15" type="tel" caption="전화번호" />
					</td>
					<th>HP번호</th>
					<td>
						<form:input path="hp" cssClass="input" size="15" type="tel" caption="HP번호" />
					</td>
				</tr>
				<tr>
					<th>변동코드</th>
					<td>
						<lions:codeselect path="changeCode" groupCode="7780" />
					</td>
					<th>팩스번호</th>
					<td>
						<form:input path="fax" cssClass="input" size="15" type="tel" caption="팩스번호" />
					</td>
					<th>E-MAIL</th>
					<td>
						<form:input path="email" cssClass="input" size="15" type="email" caption="E-MAIL" />
					</td>					
				</tr>
				<tr>
					<th>조직책임자</th>
					<td>
						<input type="text" id="organOfficerMemberName" name="organOfficerMemberName" class="input" value="${SM1_04VO.organOfficerMemberName }" size="20" />
						<form:hidden path="organOfficerMemberNo"/>
						<img title="검색" src="/images/lionsclubs/btn/btn_post_search.gif" style="margin-top:2px" onclick="organOfficerMemberPopup();" class="pointer" />
					</td>
					<th>조직책임자슬로건</th>
					<td colspan="3">
<%-- 						<form:input path="organOfficerSlogan" cssClass="input" size="47" /> --%>
						<form:textarea path="organOfficerSlogan" cssClass="textarea" cols="40" />
					</td>
				</tr>
				<tr>
					<th>책임자호칭</th>
					<td>
						<lions:codeselect path="organOfficerMemberModelCode" groupCode="7790" />
					</td>
					<th>조직책임자슬로건(영문)</th>
					<td colspan="3">
<%-- 						<form:input path="organOfficerSloganEn" cssClass="input" size="47" /> --%>
						<form:textarea path="organOfficerSloganEn" cssClass="textarea" cols="40" />
					</td>
				</tr>
				<tr>
					<th>책임자연대</th>
					<td>
						<lions:codeselect path="officerSolidCode" groupCode="7800" />
					</td>
					<th>대표수상1</th>
					<td colspan="3">
						<form:select path="representAward1" cssClass="select">
							<form:option value="">--대표수상을 선택해 주세요--</form:option>
						</form:select>
					</td>
				</tr>
				<tr>
					<th>조직등급</th>
					<td>
						<lions:codeselect path="organRatingCode" groupCode="7810" />
					</td>
					<th>대표수상2</th>
					<td colspan="3">
						<form:select path="representAward2" cssClass="select">
							<form:option value="">--대표수상을 선택해 주세요--</form:option>
						</form:select>
					</td>			
				</tr>			
				<tr>
					<th>조직구분</th>
					<td>
						<lions:codeselect path="organDivisionCode" groupCode="7820" />
					</td>
					<th>주요활동1</th>
					<td colspan="3">
						<form:input path="mainAction1" cssClass="input" size="44" />
					</td>
				</tr>
				<tr>
					<th>분기조직</th>
					<td>
						<input type="text" id="branchOrganCodeName" name="branchOrganCodeName" class="input" value="${SM1_04VO.branchOrganCodeName }" size="20" />
						<form:hidden path="branchOrganCode"/>
						<img title="검색" src="/images/lionsclubs/btn/btn_post_search.gif" style="margin-top:2px" onclick="branchOrganSearchPopup();" class="pointer" />
					</td>
					<th>주요활동2</th>
					<td colspan="3">
						<form:input path="mainAction2" cssClass="input" size="44" />
					</td>
				</tr>
				<tr>
					<th>상위조직</th>
					<td>
						<input type="text" id="upperOrganCodeName" name="upperOrganCodeName" class="input" value="${SM1_04VO.upperOrganCodeName }" size="20" />
						<form:hidden path="upperOrganCode"/>
						<img title="검색" src="/images/lionsclubs/btn/btn_post_search.gif" style="margin-top:2px" onclick="organSearchPopup();" class="pointer" />
					</td>
					<th>주요활동3</th>
					<td colspan="3">
						<form:input path="mainAction3" cssClass="input" size="44" />
					</td>
				</tr>
				<tr>
					<th>출력순서</th>
					<td>
						<form:input path="printOrd1" cssClass="input" size="8" cssStyle="text-align:right;" maxlength="10" />
						<form:input path="printOrd2" cssClass="input" size="8" cssStyle="text-align:right;" maxlength="10" />
					</td>
					<th>주요활동4</th>
					<td colspan="3">
						<form:input path="mainAction4" cssClass="input" size="44" />
					</td>
				</tr>
				<tr>
					<th>목표회원수</th>
					<td>
						<form:input path="targetMember" cssClass="input" size="8" cssStyle="text-align:right;" maxlength="20" />
					</td>
					<th>주요활동5</th>
					<td colspan="3">
						<form:input path="mainAction5" cssClass="input" size="44" />
					</td>
				</tr>				
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${param.action eq 'add' }">
				<img id="add" src="/images/lionsclubs/btn/btn_add.gif" style="width:57px" class="pointer" />
			</c:when>
			<c:otherwise>
				<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px" class="pointer" />
			</c:otherwise>
		</c:choose>
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
