<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		// 클럽선택 검색
		$("#clubName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 && !$(this).prop("readonly")) {
				$("#clubCodeSearch").trigger("click");
			}
		});
		
		$("#clubName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			
			if(key == 8 && !$(this).prop("readonly")){
				$(this).val("");
				$("#clubCode").val("");
			}	
		});	
		
		// 클럽선택
		$("#clubCodeSearch").on("click", function(){
			var params = [];
			params.push({name:"koName", value:$("#clubName").val()});
			params.push({name:"returnFunction", value:"clubCodeResult"});	// 팝업에서 리턴할 function
			params.push({name:"lvl", value:4});
			organSearchPopup(params);
		});	
		
		$("#memberList").on("click", function(){
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '/MM2/MM2_5/MM2_29/eventClubMemberList.do',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var eventClubObject = data.eventClubObject;
						if(eventClubObject != null){
							$("#kindCode").val(eventClubObject.kindCode);	
						}
											
						var $table = $("#eventClubMemberList tbody");					
						$table.empty();
	
						var member = "";
						var total = data.eventClubMemberList.length;
						if(total == 0){
							member = "<tr><td colspan='12' class='center'>조회 내용이 없습니다.</td></tr>";						
						}
						$.each(data.eventClubMemberList, function(index, object){
							if(index % 2 == 0){
								member += "<tr>";
								member += "	<td>";
								if(object.eventMemberNo.isEmpty()){
									member += "		<input type='checkbox' class='memberNo lmemberNo' value=" + object.memberNo + " /></td>";	
								} else {
									member += "		<input type='checkbox' class='memberNo lmemberNo' value=" + object.memberNo + " checked='checked' /></td>";
								}
								member += "	</td>";
								member += "	<td>" + object.memberNo + "</td>";
								member += "	<td>" + object.name + "</td>";
								member += "	<td><input type='text' value='" + object.time + "' class='ltime input number' style='text-align:right' size='8' maxlength='2' caption='시간' /></td>";
								member += "	<td><input type='text' value='" + object.score + "' class='lscore input number' style='text-align:right' size='8' maxlength='3' caption='점수' /></td>";
								member += "	<td>";
								if(object.merit == "Y"){
									member += "		<input type='checkbox' value='Y' class='lmerit' checked='checked' /></td>";	
								} else {
									member += "		<input type='checkbox' value='Y' class='lmerit' /></td>";
								}
								member += "	</td>";
							} else {
								member += "	<td>";
								if(object.eventMemberNo.isEmpty()){
									member += "		<input type='checkbox' class='memberNo rmemberNo' value=" + object.memberNo + " /></td>";	
								} else {
									member += "		<input type='checkbox' class='memberNo rmemberNo' value=" + object.memberNo + " checked='checked' /></td>";
								}
								member += "	</td>";
								member += "	<td>" + object.memberNo + "</td>";
								member += "	<td>" + object.name + "</td>";
								member += "	<td><input type='text' value='" + object.time + "' class='rtime input number' style='text-align:right' size='8' maxlength='2' caption='시간' /></td>";
								member += "	<td><input type='text' value='" + object.score + "' class='rscore input number' style='text-align:right' size='8' maxlength='3' caption='점수' /></td>";
								member += "	<td>";
								if(object.merit == "Y"){
									member += "		<input type='checkbox' value='Y' class='rmerit' checked='checked' /></td>";	
								} else {
									member += "		<input type='checkbox' value='Y' class='rmerit' /></td>";
								}
								member += "	</td>";
								member += "</tr>";
							}
						});
						
						if(total % 2 == 1){
							member += "<td></td><td></td><td></td><td></td><td></td><td></td></tr>";
						}
						
						$table.html(member);
						
// 						$(".ltime").numericOnly();
// 						$(".rtime").numericOnly();
// 						$(".lscore").numericOnly();
// 						$(".rscore").numericOnly();
						
						$(".lmemberNo").on("change", function(){
							var total = $(".lmemberNo").length;
							var checkLen = $(".lmemberNo:checked").length;
							if(total == checkLen){
								$("#lmemberNoAll").prop("checked", true);
							} else {
								$("#lmemberNoAll").prop("checked", false);
							}
						}).change();
						
						$(".rmemberNo").on("change", function(){
							var total = $(".rmemberNo").length;
							var checkLen = $(".rmemberNo:checked").length;
							if(total == checkLen){
								$("#rmemberNoAll").prop("checked", true);
							} else {
								$("#rmemberNoAll").prop("checked", false);
							}
						}).change();
						
						$(".lmerit").on("change", function(){
							var total = $(".lmerit").length;
							var checkLen = $(".lmerit:checked").length;
							if(total == checkLen){
								$("#lmeritAll").prop("checked", true);
							} else {
								$("#lmeritAll").prop("checked", false);
							}
						}).change();
						
						$(".rmerit").on("change", function(){
							var total = $(".rmerit").length;
							var checkLen = $(".rmerit:checked").length;
							if(total == checkLen){
								$("#rmeritAll").prop("checked", true);
							} else {
								$("#rmeritAll").prop("checked", false);
							}
						}).change();					
						
						$(".memberNo, #lmemberNoAll, #rmemberNoAll").on("click", function(){
							eventTotal();
						});
						
						$(".ltime, .rtime, .lscore, .rscore").on("keyup", function(){
							eventTotal();
						});
						
						eventTotal();
						
						var Scroll_Area = $('.Scroll_Table').width() - 1;
						$('.Scroll_Title table').width(Scroll_Area);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}		
			});
		}).change();
		
		$("#lmemberNoAll").on("click", function(){
			$(".lmemberNo").prop("checked", $(this).is(":checked"));
		});
		
		$("#rmemberNoAll").on("click", function(){
			$(".rmemberNo").prop("checked", $(this).is(":checked"));
		});
		
		$("#lmeritAll").on("click", function(){
			$(".lmerit").prop("checked", $(this).is(":checked"));
		});
		
		$("#rmeritAll").on("click", function(){
			$(".rmerit").prop("checked", $(this).is(":checked"));
		});
		
		// 점수/시간 일괄부과
		$("#levy").on("click", function(){
			if($(".memberNo:checked").length == 0){
				alert("행사인원을 체크해 주세요.");
				return false;
			}
			
			$(".lmemberNo:checked").each(function(){
				var $tr = $(this).closest("tr");
				$tr.find(".ltime").val($("#levyTime").val());
				$tr.find(".lscore").val($("#levyScore").val());
			});
			
			$(".rmemberNo:checked").each(function(){
				var $tr = $(this).closest("tr");
				$tr.find(".rtime").val($("#levyTime").val());
				$tr.find(".rscore").val($("#levyScore").val());
			});
			
			eventTotal();
		});
		
		$("#levyTime").numericOnly();
		$("#levyScore").numericOnly();
		
		/*
		 *	저장
		 */
		$("#save").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			if($("#clubCode").val().isEmpty()){
				alert("클럽을 입력해 주세요.");
				$("#clubName").focus();
				return false;
			}
			
			var valid = true;
			$(".lmemberNo:checked").each(function(index){
				var $tr = $(this).closest("tr");
				var time = $tr.find(".ltime");
				var score = $tr.find(".lscore");

				if(!time.valid()){
					time.focus();
					valid = false;
					return false;
				}				

				if(!score.valid()){
					score.focus();
					valid = false;
					return false;
				}
				
				if(time.val().isEmpty()){
					alert("시간을 입력해 주세요.");
					time.focus();
					valid = false;
					return false;
				}
				
				if(score.val().isEmpty()){
					alert("점수를 입력해 주세요.");
					score.focus();
					valid = false;
					return false;
				}
			});
			
			if(!valid)	return false;
			
			$(".rmemberNo:checked").each(function(index){
				var $tr = $(this).closest("tr");
				var time = $tr.find(".rtime");
				var score = $tr.find(".rscore");
				
				if(!time.valid()){
					time.focus();
					valid = false;
					return false;
				}				

				if(!score.valid()){
					score.focus();
					valid = false;
					return false;
				}
				
				if(time.val().isEmpty()){
					alert("시간을 입력해 주세요.");
					time.focus();
					valid = false;
					return false;
				}
				
				if(score.val().isEmpty()){
					alert("점수를 입력해 주세요.");
					score.focus();
					valid = false;
					return false;
				}
			});		
			
			if(!valid)	return false;
			
			if(!confirm("주최,주관,참여 및 개인 봉사활동 화면에 기록됩니다.\n저장하시겠습니까?")){
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$(".lmemberNo:checked").each(function(index){
				var $tr = $(this).closest("tr");
				var memberNo = $(this);
				var time = $tr.find(".ltime");
				var score = $tr.find(".lscore");
				var merit = $tr.find(".lmerit:checked");
				
				params.push({name: "eventMemberArray["+index+"].idnNo", value:"${detail.idnNo }"});
				params.push({name: "eventMemberArray["+index+"].kindCode", value:$("#kindCode").val()});
				params.push({name: "eventMemberArray["+index+"].clubCode", value:$("#clubCode").val()});
				params.push({name: "eventMemberArray["+index+"].memberNo", value:memberNo.val()});
				params.push({name: "eventMemberArray["+index+"].time", value:time.val()});
				params.push({name: "eventMemberArray["+index+"].score", value:score.val()});
				params.push({name: "eventMemberArray["+index+"].merit", value:merit.val()});
				params.push({name: "eventMemberArray["+index+"].insertName", value:"${id }"});
				params.push({name: "eventMemberArray["+index+"].updateName", value:"${id }"});
			});
			
			$(".rmemberNo:checked").each(function(index){
				index += $(".lmemberNo:checked").length;
				var $tr = $(this).closest("tr");
				var memberNo = $(this);
				var time = $tr.find(".rtime");
				var score = $tr.find(".rscore");
				var merit = $tr.find(".rmerit:checked");
				
				params.push({name: "eventMemberArray["+index+"].idnNo", value:"${detail.idnNo }"});
				params.push({name: "eventMemberArray["+index+"].kindCode", value:$("#kindCode").val()});
				params.push({name: "eventMemberArray["+index+"].clubCode", value:$("#clubCode").val()});
				params.push({name: "eventMemberArray["+index+"].memberNo", value:memberNo.val()});
				params.push({name: "eventMemberArray["+index+"].time", value:time.val()});
				params.push({name: "eventMemberArray["+index+"].score", value:score.val()});
				params.push({name: "eventMemberArray["+index+"].merit", value:merit.val()});
				params.push({name: "eventMemberArray["+index+"].insertName", value:"${id }"});
				params.push({name: "eventMemberArray["+index+"].updateName", value:"${id }"});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_5/MM2_29/saveEventMemberProcess.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "0"){
						alert("저장 되었습니다.");
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});	
		
		$("#eventClub").on("click", function(){
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM2/MM2_5/MM2_29/eventClubList.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var $table = $("#eventClubList tbody");
						$table.empty();
						
						var club = "";
						var total = data.eventClubList.length;
						if(total == 0){
							club = "<tr><td colspan='3' class='center'>조회 내용이 없습니다.</td></tr>";						
						}
						$.each(data.eventClubList, function(index, object){
							club += "<tr>";
							club += "	<td>" + formatOrganCode(object.clubCode) + "</td>";
							club += "	<td class='left'>" + object.kindName + "</td>";
							club += "	<td class='left'>" + object.clubName + "</td>";
							club += "	<td class='left'><img id='" + object.eventClubIdnNo + "' class='deleteEventClub' src='/images/lionsclubs/btn/btn_del.gif' class='pointer' /></td>";
							club += "	<input type='hidden' class='clubCode' value='" + object.clubCode + "' />";
							club += "	<input type='hidden' class='clubName' value='" + object.clubName + "' />";
							club += "	<input type='hidden' class='kindCode' value='" + object.kindCode + "' />";
							club += "</tr>";
						});
						
						$table.html(club);
						
						$("#eventClubList tbody tr").on("click", function(){
							var kindCode = $(this).find(".kindCode").val();
							var clubCode = $(this).find(".clubCode").val();
							var clubName = $(this).find(".clubName").val();
							
							$("#kindCode").val(kindCode);
							$("#clubCode").val(clubCode);
							$("#clubName").val(clubName);
							
							eventClubMemberListClear();
							$("#memberList").trigger("click");
							
							$("#dialog-form-clubs").dialog('close');
						});
						
						$(".deleteEventClub").on("click", function(){
							var eventClubIdnNo = $(this).prop("id");
							
							if(!confirm("주최,주관,참여 및 개인 봉사활동에 기록된 내용이 삭제됩니다.\n삭제하시겠습니까?")){
								return false;
							}
							
							var params = [];
							params.push({name:"eventClubIdnNo", value:eventClubIdnNo});
							
							$.ajax({
								type: "POST",
								async: false,
								url:  '<c:url value="/MM2/MM2_5/MM2_29/deleteEventClub.do" />',
								data: params,
								dataType: 'json',
								success: function(data) {
									if(data.result){
										alert("행사클럽이 삭제되었습니다.");
									}
								},
								error:function(request,status,error){
									alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
									//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});		
						});						
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});		
					
			
			$("#dialog-form-clubs").dialogPopup({
				 height: 300
				,width: 500
			});
		});
		
		$("#close").on("click", function(){
			opener._search();
			closeWin();
		});
	});
});

function clubCodeResult(value){
	eventClubMemberListClear();
	
	$("#clubName").val($.url(value).param("koName"));
	$("#clubCode").val($.url(value).param("organCode"));
	
	$("#memberList").trigger("click");
}

/**
 * 행사인원 리스트를 초기화 한다.
 */
function eventClubMemberListClear(){
	var $table = $("#eventClubMemberList tbody");					
	$table.empty();
	$table.html("<tr><td colspan='12' class='center'>조회 내용이 없습니다.</td></tr>");
	$("#time").text(0);
	$("#score").text(0);
	$("#memberCnt").text(0);
}

/**
 * 행사이벤트의 총 봉사시간, 봉사점수, 참가인원을 구한다.
 */
function eventTotal(){
	var timeSum = 0;
	var scoreSum = 0;
	$(".lmemberNo:checked").each(function(index){
		var $tr = $(this).closest("tr");
		var time = $tr.find(".ltime");
		var score = $tr.find(".lscore");
		
		timeSum += isNumber(eval(time.val())) ? eval(time.val()) : 0;
		scoreSum += isNumber(eval(score.val())) ? eval(score.val()) : 0;
	});
	
	$(".rmemberNo:checked").each(function(index){
		var $tr = $(this).closest("tr");
		var time = $tr.find(".rtime");
		var score = $tr.find(".rscore");

		timeSum += isNumber(eval(time.val())) ? eval(time.val()) : 0;
		scoreSum += isNumber(eval(score.val())) ? eval(score.val()) : 0;
	});
	
	$("#time").text(comma(timeSum));
	$("#score").text(comma(scoreSum));
	$("#memberCnt").text(comma($(".memberNo:checked").length));
}
</script>

<style>
#eventClubList tbody tr{
	cursor: pointer;
}

ul li{
	margin-left: 20px;
	display: inline;
}
</style>
<form:form id="MM2_29VO" modelAttribute="MM2_29VO">
	<h3><div>클럽 및 지구행사 입력</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="300px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>행사일자</th>
					<td>
						<fmt:parseDate var="eventStartDate" value="${detail.eventStartDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
						-
						<fmt:parseDate var="eventEndDate" value="${detail.eventEndDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
					</td>
					<th>행사시간</th>
					<td>${detail.eventStartTime } - ${detail.eventEndTime }</td>
				</tr>			
				<tr>
					<th>행사명</th>
					<td>${detail.eventName }</td>				
					<th>행사내용</th>
					<td>${detail.eventDesc }</td>
				</tr>
				<tr>
					<th>행사주최</th>
					<td>${detail.organName }</td>
					<th>마감</th>
					<td>${detail.finishYn }</td>
				</tr>
			</tbody>
		</table>

		<h4>행사 인원 입력</h4>

		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="120px" />
				<col width="100px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>참가구분<span class="require">*</span></th>
					<td class="left">
						<lions:codeselect path="kindCode" groupCode="4000" required="true" caption="참가구분" />
					</td>
					<th>클럽<span class="require">*</span></th>
					<td class="left" colspan="2">
						<input name="clubName" id="clubName" class="input" size="30" style="ime-mode:active" />
						<img id="clubCodeSearch" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" />
						<form:hidden path="clubCode" required="true" />
						<img id="eventClub" alt="검색" src="/images/lionsclubs/btn/btn_eventClub.gif" class="pointer" />
					</td>
				</tr>
				<tr>
					<th>참가시간</th>
					<td class="left"><input type="text" id="levyTime" maxlength="2" class="input" size="10" style="text-align: right;" /></td>
					<th>점수</th>
					<td class="left"><input type="text" id="levyScore" maxlength="3" class="input" size="10" style="text-align: right;" /></td>
					<td>
						<img id="memberList" src="/images/lionsclubs/btn/btn_mem_inqury.gif" class="pointer" title="회원리스트 조회" style="width:78px" />
						<img id="levy" src="/images/lionsclubs/btn/btn_imposition.gif" class="pointer" title="점수/시간 일괄부과" style="width:57px" />
					</td>
				</tr>
			</tbody>
		</table>		
				
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup" summary="회원검색표">
				<caption>회원검색</caption>
				<colgroup>
					<col width="30px" />
					<col width="80px" />
					<col width="80px" />
					<col width="70px" />
					<col width="70px" />
					<col width="55px" style="border-right: 2px solid black;" />
					<col width="30px" />
					<col width="80px" />
					<col width="80px" />
					<col width="70px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input id="lmemberNoAll" type="checkbox" /></th>
						<th>회원번호</th>
						<th>이름</th>
						<th>시간</th>
						<th>점수</th>
						<th>공적<input id="lmeritAll" type="checkbox" /></th>
						<th><input id="rmemberNoAll" type="checkbox" /></th>
						<th>회원번호</th>
						<th>이름</th>
						<th>시간</th>
						<th>점수</th>
						<th>공적<input id="rmeritAll" type="checkbox" /></th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="eventClubMemberList" class="tblPopupH2" style="height: 220px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="80px" />
					<col width="80px" />
					<col width="70px" />
					<col width="70px" />
					<col width="55px" style="border-right: 2px solid black;" />
					<col width="30px" />
					<col width="80px" />
					<col width="80px" />
					<col width="70px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<tbody>
				</tbody>
			</table>
		</div><!-- tblInner -->
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup" summary="회원검색표">
				<caption>회원검색</caption>
				<colgroup>
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th>
							<ul>
								<li>
									총 봉사시간 : <span id="time">0</span>
								</li>
								<li>
									봉사점수 : <span id="score">0</span>
								</li>
								<li>
									참가인원 : <span id="memberCnt">0</span>
								</li>
							</ul>
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="save" src="/images/lionsclubs/btn/btn_save.gif" class="pointer" />
		<img id="close" src="/images/lionsclubs/btn/btn_close.gif" class="pointer" />
	</div>
	
	<input type="hidden" name="idnNo" value="${detail.idnNo }" />
	<input type="hidden" name="eventStartDate" value="${detail.eventStartDate }" />
	
	<!-- Modal Popup -->  
	<div id="dialog-form-clubs" class="dialog" style="display: none;">
		<div id="popup">
			<h3><div>행사 클럽</div></h3>
			<div class="popup_bg">
				<div class="tblTitle mT5">
					<table class="tblPopup" summary="행사클럽표" style="width:98%;">
						<caption>행사클럽</caption>
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
							<col width="80px" />
						</colgroup>
						<thead>
							<tr>
								<th>클럽코드</th>
								<th>행사구분</th>
								<th>클럽명</th>
								<th>삭제</th>
							</tr>
						</thead>
					</table>
				</div><!-- tblTitle -->
				<div id="eventClubList" class="tblPopupH2" style="height: 130px;">
					<table class="tblPopup" style="width:98%;">
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
							<col width="80px" />
						</colgroup>
						<tbody>
						</tbody>
					</table>
				</div>
			</div><!-- popup_bg -->
			
			<div class="popupBtn">
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</div>		
</form:form>
