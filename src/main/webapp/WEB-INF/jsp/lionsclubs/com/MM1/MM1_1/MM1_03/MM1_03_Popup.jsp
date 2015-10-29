<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
var _appSectorLvl;
require(['init'], function () {
	$(document).ready(function () {
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
		$("#appKindCode").on("change", function(){
			$("#appDescCode").option1Code({
				 groupCode: '2700' // 그룹코드
			    ,code: $(this).val() // 코드
			    ,topLabel: '--선택--' // 상단명(상단명을 정하지 않으면 나타나지 않음)
			    ,fixVal: "${MM1_03VO.appDescCode}"
			});
			
			if($(this).val() == "1050"){
				$("#expulsion").show();
			} else {
				$("#expulsionFlag").prop("checked", false);
				$("#expulsion").hide();
			}
			
		}).change();
		
		/*
		 *	저장
		 */
		$("#button_save").click(function() {
			var aday = $("#startDate").val();
			var bday = $("#endDate").val();
	
			if(!$("form").valid()){
				return false;
			}
			
			if($("#organCode").val().isEmpty()){
				alert("소속클럽을 입력해 주세요.");
				$("#organName").focus();
				return false;
			}
	
			if($("#appSectorCode").val().isEmpty()){
				alert("선임소속을 입력해 주세요.");
				$("#appSectorName").focus();
				return false;
			}		
			
			if(!rangeDateCheck(aday, bday)){
				alert("시작날짜가 종료날짜보다 큽니다.");
				return false;
			}
			
			$("#appKindCode").prop("disabled", false);
			$("#appDescCode").prop("disabled", false);
			$("#endDate").datepicker('enable');
	
			
			var url = '<c:url value="/MM1/MM1_1/MM1_03/MM1_03_Update.do" />';
			if("${MM1_03VO.idnNo}".isEmpty()){
				url = '<c:url value="/MM1/MM1_1/MM1_03/MM1_03_Insert.do" />';
			}
			
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,				
				url:  url,
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "singError"){
						alert("입회정보가 존재합니다.\n입회정보는 한번만 입력할 수 있습니다.");
						$("#endDate").datepicker('disable');
						$("#organName").prop("readonly", true);
					} else if(data.result == "singDivisionError"){
						alert("퇴회하지 않은 회원입니다.");
						$("#endDate").datepicker('disable');
						$("#organName").prop("readonly", true);
					} else if(data.result == "organCodeError"){
						alert("마지막 소속클럽과 같습니다.\n다른 클럽을 선택해 주세요.");
						$("#endDate").datepicker('disable');
					} else if(data.result == "quitError"){
						alert("퇴회일자보다 이후 날짜를 선택해 주세요.");
	// 					$("#endDate").datepicker('disable');
						$("#appKindCode").prop("disabled", true);
						$("#appDescCode").prop("disabled", true);
						$("#startDate").focus();
					} else if(data.result){
						//alert('정상적으로 입력 되었습니다.');
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	
		// 소속클럽 검색
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
	
		/*
		선임소속 검색
		 */
		$("#appSectorName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 && !$(this).prop("readonly")) {
				$("#appSectorCodeSearch").trigger("click");
			}
		});	
		
		$("#appSectorName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			
			if(key == 8 && !$(this).prop("readonly")){
				$(this).val("");
				$("#appSectorCode").val("");
			}
		});
		
		// 선임구분 / 선임직책및내용에 따라 조건을 변경한다.
		$("#appKindCode,#appDescCode").on("change", function(){
			kindChange();
		});
		
		if("${MM1_03VO.idnNo}".isEmpty()){
			kindChange();	
		}
		
		if("${memberCount}" == 0){
			$("#appKindCode").val("1040").trigger("change").prop("disabled", true);
			$("#appDescCode").val("1000").trigger("change").prop("disabled", true);
		}
		
		/*
		클럽간사님의 요청으로 2014.09.12 까지 기능주석
		if("${lastStat.appKindCode}" == "1050"){
			$("#appKindCode").val("1040").trigger("change").prop("disabled", true);
			$("#appDescCode").val("1020").trigger("change").prop("disabled", true);
		}
		*/	
		
		// 소속클럽
		$("#organCodeSearch").on("click", function(){
			var params = [];
			params.push({name:"lvl", value:4});
			params.push({name:"returnFunction", value:"organClubResult"});	// 팝업에서 리턴할 function
			params.push({name:"koName", value:$("#organName").val()});
			organSearchPopup(params);
		});
			
		
		// 선임소속
		$("#appSectorCodeSearch").on("click", function(){
			var params = [];
			params.push({name:"lvl", value: _appSectorLvl});
			params.push({name:"returnFunction", value:"appSectorCodeResult"});	// 팝업에서 리턴할 function
			params.push({name:"koName", value:$("#appSectorName").val()});
			organSearchPopup(params);
		});
	});
});

// 선임구분 / 선임직책및내용에 따라 조건을 변경한다.
function kindChange(){
	var appKindCode = $("#appKindCode").val();
	var appDescCode = $("#appDescCode").val();
	
	// 기본으로는 최신클럽코드를 입력한다.
	if(!"${lastStat.organCode}".isEmpty()){
		$("#organName").val("${lastStat.organName}").prop("readonly", true);
		$("#organCode").val("${lastStat.organCode}");
		
		$("#appSectorName").prop("readonly", true);
	}
	
	if(appKindCode == "1000" || appKindCode == "1010" || appKindCode == "1020" || appKindCode == "1030"){
		$("#startDate").on("change", function(){
			var startDateYear = $("#startDate").val().isEmpty() ? '' : Date.parseExact($("#startDate").val(), 'yyyy.MM.dd').add({ years: 1 }).toString('yyyy');
			$("#endDate").val(startDateYear + ".06.30");
		});
	}
	
	if(appKindCode == "1000" || appKindCode == "1050"){
		/*
			클럽임원 선임시 선임소속은 소속클럽과 같다. - 입력시, 수정시 수정불가
		*/
		$("#appSectorName").val($("#organName").val()).prop("readonly", true);
		$("#appSectorCode").val($("#organCode").val());
		
		if(appKindCode == "1050"){
			$("#startDate").on("change", function(){
				$("#endDate").val($(this).val());
			});
			
			$("#endDate").val($("#startDate").val()).datepicker('disable');
		}
	// 선임(지구임원선임)
	} else if(appKindCode == "1010"){
		_appSectorLvl = 3;
		$("#appSectorName").val("").prop("readonly", false);
		$("#appSectorCode").val("");		
	// 선임(복합지구임원선임)
	} else if(appKindCode == "1020"){
		_appSectorLvl = 2;
		$("#appSectorName").val("").prop("readonly", false);
		$("#appSectorCode").val("");		
	// 선임(연합임원선임)
	} else if(appKindCode == "1030"){
		_appSectorLvl = 1;
		$("#appSectorName").val("").prop("readonly", false);
		$("#appSectorCode").val("");		
	// 입회시 또는 재입회시
	} else if(appKindCode == "1040" && (appDescCode == "1000" || appDescCode == "1020" || appDescCode == "1030")){
		/*
			입회시 종료일을 9999.12.31 - 입력시 수정불가, 수정시 수정가능
		*/
		$("#endDate").val("9999.12.31").datepicker('disable');
		
		// 재입회시 또는 클럽변경
		if(appDescCode == "1020" || appDescCode == "1030"){
			$("#organName").prop("readonly", false);
		}
		
		$("#appSectorName").val($("#organName").val()).prop("readonly", true);
		$("#appSectorCode").val($("#organCode").val());
	} else {
		$("#endDate").val("").datepicker('enable');
	}	
	
	if($("#organName").prop("readonly")){
		$("#organCodeSearch").hide();
	} else {
		$("#organCodeSearch").show();
	}
	
	if($("#appSectorName").prop("readonly")){
		$("#appSectorCodeSearch").hide();
	} else {
		$("#appSectorCodeSearch").show();
	}
	
	if(appKindCode == "1000"){
		if($("#appDescCode option:selected").attr('data-code1') == ""){
			$("#appDescDisplay").show();
		} else {
			$("#appDescDisplay").hide();
			$("#appDesc").val("");
		}
	} else {
		$("#appDescDisplay").hide();
		$("#appDesc").val("");
	}
}

function popupChange(){
	var appKindCode = $("#appKindCode").val();
	var appDescCode = $("#appDescCode").val();
	
	if(appKindCode == "1000"){
		/*
			클럽임원 선임시 선임소속은 소속클럽과 같다. - 입력시, 수정시 수정불가
		*/
		$("#appSectorName").val($("#organName").val()).prop("readonly", true);
		$("#appSectorCode").val($("#organCode").val());
		
	// 입회시 또는 재입회시
	} else if(appKindCode == "1040" && (appDescCode == "1000" || appDescCode == "1020" || appDescCode == "1030")){
		$("#appSectorName").val($("#organName").val()).prop("readonly", true);
		$("#appSectorCode").val($("#organCode").val());
	}
}

function organClubResult(value){
	$("#organName").val($.url(value).param("koName"));
	$("#organCode").val($.url(value).param("organCode"));
	popupChange();
}

function appSectorCodeResult(value){
	$("#appSectorName").val($.url(value).param("koName"));
	$("#appSectorCode").val($.url(value).param("organCode"));
	popupChange();
}
</script>

<form:form modelAttribute="MM1_03VO" >
	<h3 style="width:98%;">
		<div>
			경력(선임/위촉)
			<c:choose>
				<c:when test="${empty MM1_03VO.idnNo }">입력</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>			
		</div>
	</h3>

	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
			<colgroup>
				<col width="120px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>선임구분<span class="require">*</span></th>
					<td><lions:codeselect path="appKindCode" groupCode="2700" cssStyle="select" cssClass="required" caption="선임구분" /></td>
				</tr>
				<tr>
					<th>선임직책및내용<span class="require">*</span></th>
					<td>
						<form:select path="appDescCode" cssClass="select required" caption="선임직책및내용" />
						<span id="expulsion" style="display: none;">
							<form:checkbox id="expulsionFlag" path="expulsionFlag" value="Y" label="제명" />
						</span>
					</td>
				</tr>
				<tr id="appDescDisplay" style="display: none;">
					<th>선임직책설명<span class="require">*</span></th>
					<td>
						<form:input path="appDesc" cssClass="input required" caption="선임직책설명" size="40" maxlength="4000" />
					</td>
				</tr>
				<tr>
					<th>시작~종료<span class="require">*</span></th>
					<td>
						<form:input path="startDate" cssClass="input date required" caption="시작" /> ~ <form:input path="endDate" cssClass="input date required" caption="종료" />
					</td>
				</tr>
				<tr>
					<th>소속클럽<span class="require">*</span></th>
					<td>
						<form:input path="organName" cssClass="input" size="40" cssStyle="ime-mode:active" />
						<form:hidden path="organCode" cssClass="required" caption="소속클럽" />
						<input id="organCodeSearch" type="image" src="/images/lionsclubs/btn/btn_post_search.gif" alt="검색" style="margin-top:2px" onclick="return false;" />
					</td>
				</tr>
				<tr>
					<th>선임소속<span class="require">*</span></th>
					<td>
						<form:input path="appSectorName" cssClass="input" size="40" cssStyle="ime-mode:active" />
						<form:hidden path="appSectorCode" cssClass="required" caption="선임소속" />
						<input id="appSectorCodeSearch" type="image" src="/images/lionsclubs/btn/btn_post_search.gif" alt="검색"  style="margin-top:2px" onclick="return false;" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty MM1_03VO.idnNo }">
				<img id="button_save" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px" class="pointer" />		
			</c:when>
			<c:otherwise>
				<img id="button_save" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px" class="pointer" />	
			</c:otherwise>
		</c:choose>
		<img src="/images/lionsclubs/btn/btn_close.gif" style="width:57px" title="닫기" class="pointer" onclick="closeWin();" />
	</div>
	
	<form:hidden path="memberNo" />
	<form:hidden path="idnNo" />    
</form:form>
