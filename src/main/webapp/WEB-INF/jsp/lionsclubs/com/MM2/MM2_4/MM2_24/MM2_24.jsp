<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#button_update_info").hide();
		$("#button_delete_info").hide();
		$(".dialog").hide();
	
		$("#insertYearCode").sessionYearCombo({
			 fixVal: "${MM2_24VO_PARAM.yearCode}"	// 고정값
			,top:false
		});
	
		$("#insertMonthCode").monthCombo({
			 fixVal : "${MM2_24VO_PARAM.monthCode}"
			,top:false
		});
	
		$("#insertConfDate").datepicker();
		$("#updateConfDate").datepicker();
		
		/*
		 *	회의 기본정보 입력 창 띄우기
		 */
		$("#button_insert_info").click(function() {
			$("#insertYearCode").val($("#yearCode").val());
			$("#insertMonthCode").val($("#monthCode").val());
			$("#insertConfKindCode").val($("#confKindCode").val());
			
			$("#insertConfDate").val("");
			$("#insertConfPlaceCode").val("");
			$("#insertConfTime").val("");
			$("#insertAttendPerson").val("");
			$("#insertConfDesc").val("");
			 
			$("#dialog-form-insert").dialogPopup({
				 height: 360
				,width: 600
			});
	
			//기관 클럽코드 세팅
			$("#insertOrganCode").organCode({
				 lvl:4
				,searchable: true
				,fixVal: "${MM2_24VO_PARAM.organCode}"
			});
		});
		
		/* 회의추가기능 */
		$("#infoInsert").click(function() {
			if(!$("#form_insert").valid()){
				return false;
			}
			
			var params = $("#form_insert").serialize();
			$.ajax({
				type: "POST",
				async: false,
				url: "/MM2/MM2_4/MM2_24/insertConferenceBasicInfo.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						$("#dialog-form-insert").dialog('close');
						$("#confKindCode").trigger("change"); // 회의일자콤보 재조회
					}else{
						alert(data.message);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}		
			});
		});
	
		/*
		 *	회의 기본정보 입력 창 띄우기
		 */
		$("#button_update_info").click(function() {
			$("#updateOrganCode").val($("#organCode").val());
			$("#updateYearCode").val($("#yearCode").val());
			$("#updateMonthCode").val($("#monthCode").val());
			$("#updateConfKindCode").val($("#confKindCode").val());
			$("#updateConfIdnNo").val($("#confIdnNo").val());
			$("#updateConfDate").val($("#confIdnNo option:selected").text());
			$("#updateConfPlaceCode").val($("#confPlaceCode").text());
			$("#updateConfTime").val($("#confTime").text());
			$("#updateAttendPerson").val($("#attendPerson").text());
			$("#updateConfDesc").val($("#confDesc").text());
			
			$("#updateOrganCodeDesc").html($("#organCode option:selected").text());
			$("#updateYearCodeDesc").html($("#yearCode option:selected").text());
			$("#updateMonthCodeDesc").html($("#monthCode option:selected").text());
			$("#updateConfKindCodeDesc").html($("#confKindCode option:selected").text());
					 
			$("#dialog-form-update").dialogPopup({
				 height: 360
				,width: 600
			});
		});
		
		/* 회의수정기능 */
		$("#infoUpdate").click(function() {
			if(!$("#form_update").valid()){
				return false;
			}
					 
			var params = $("#form_update").serialize();
			$.ajax({
				type: "POST",
				async: false,
				url:  "/MM2/MM2_4/MM2_24/updateConferenceBasicInfo.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						$("#dialog-form-update").dialog('close');
						$("#confKindCode").trigger("change",[$("#updateConfDate").val()]); // 회의일자콤보 재조회
					}else{
						alert(data.message);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}		
			});
		 });
			
		/* 회의삭제기능 */
		$("#button_delete_info").click(function() {
			if(!$("#form_list").valid()){
				return false;
			}
	
			if(!confirm("선택하신 회의정보를 삭제하시면 해당 회의의 행사안내, 심의안건, 건의사항 정보가 함께 삭제됩니다.\n계속하시려면 확인버튼을 누르세요.")){
				return;
			}
			
			var params = $("#form_list").serialize();
			$.ajax({
				type: "POST",
				async: false,
				url:  "/MM2/MM2_4/MM2_24/deleteConferenceBasicInfo.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						$("#confKindCode").trigger("change"); // 회의일자콤보 재조회
					}else{
						alert(data.message);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}		
			});
		 });
			
		$("#objCheckAll").click(function(){
			if($(this).prop("checked")) {
				var i = 0;
				$("input[name=inputInOrder]").each(function() {
						$("input:checkbox[name='chkIdx']").eq(i).prop("checked",($("input[name=inputInOrder]").eq(i).val() != "" && $("input[name=inputProcessOrdDesc]").eq(i).val() != ""));								
					i++;
				});
			} else {
				$("input:checkbox[name='chkIdx']").prop("checked", false);								
			}
		});
		
		$("input[name=inputInOrder]").numericOnly();
			
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
			$("#form_list").submit();
		});
	
		//초기화 버튼선택
		$("#initBtn").click(function(){
			if(!confirm("저장된 회의순서를 삭제하고 기본템플릿을 불러오기합니다.\n계속하시려면 확인버튼을 눌러주세요.")){
				return false;
			}
			$("#form_list").attr("action","/MM2/MM2_4/MM2_24/initList.dox");
			$("#form_list").submit();
		});
	
		$("#insertBtn").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			if(!validateChecker()) return false;
			$("#form_list").attr("action","/MM2/MM2_4/MM2_24/insertList.dox");
			$("#form_list").submit();
		});
		
		$("#updateBtn").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}		
			if(!validateChecker()) return false;
			$("#form_list").attr("action","/MM2/MM2_4/MM2_24/updateList.dox");
			$("#form_list").submit();
		});
		
		$("#deleteBtn").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}		
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_24/deleteList.dox");
			$("#form_list").submit();
		});
			
		$("#movePage25").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_25/MM2_25.do?menuId=368");
			$("#form_list").submit();
		});
			
		$("#movePage26").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_26/MM2_26.do?menuId=369");
			$("#form_list").submit();
		});
		
		$("#movePage27").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_27/MM2_27.do?menuId=370");
			$("#form_list").submit();
		});
		
		$("#movePage28").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			$("#form_list").attr("action","/MM2/MM2_4/MM2_28/MM2_28.do?menuId=371");
			$("#form_list").submit();
		});
		
		$("#mediaBtn").click(function(){
			openPopup("/MM2/MM2_4/MM2_24/mediaPopup.do" , "300", "250");
		});
		
		$("#presentaion").on("click", function(){
			var url = "/MM2/MM2_4/MM2_24/presentation.do?organCode=${MM2_24VO_PARAM.organCode}";
			var open = window.open("about:blank");
			open.location.href = url;
		});
	});
});

function validateChecker() {
	if($("input:checkbox[name='chkIdx']:checked").length <1){
		alert("적용할 자료를 체크하세요.");
		return false;
	}
	var rtnValue = true;
	var i = 0;
	$("input:checkbox[name='chkIdx']:checked").each(function() {
		var idx = $("input:checkbox[name='chkIdx']:checked").eq(i).val() - 1;
		
		
		if($("input[name=inputInOrder]").eq(idx).val() == "") {
			alert((idx+1)+"번째 행의 순서를 입력하세요.");
			$("input[name=inputInOrder]").eq(idx).focus();
			rtnValue = false;
			return false;
		}else if($("input[name=inputProcessOrdDesc]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 진행순서 내용을 입력하세요.");
			$("input[name=inputProcessOrdDesc]").eq(idx).focus();
			rtnValue = false;
			return false;
		}
		i++;
	});
	return rtnValue;
}

function openFilePopup(idx) {
	var url = "/MM2/MM2_4/MM2_24/fileInfoPopup.do";
	url += "?fileId=" + $("input[name=inputFileId]").eq(idx-1).val();
	url += "&organCode=" + $("input[name=inputOrganCode]").eq(idx-1).val();
	url += "&inIdnNo=" + $("input[name=inputInIdnNo]").eq(idx-1).val();
	url += "&chkIdx=" + $("input[name=chkIdx]").eq(idx-1).val();

	openPopup(url , "600", "300", "attachfile");
}
</script>

<form:form id="form_list" modelAttribute="MM2_24VO_PARAM" action="/MM2/MM2_4/MM2_24/MM2_24.do">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/com/MM2/MM2_4/MM2_24/baseInfo.jsp" />
	<div class="table">
		<table class="tblType1" summary="회의진행순서">
			<caption>회의진행순서(선택) </caption>
			<colgroup>
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<td>
						<div class="btnBox2" style="text-align:center;">
							<img id="button_insert_info" src="/images/lionsclubs/btn/btn_add.gif" alt="회의 추가"  class="pointer authorization write" />
							<img id="button_update_info" src="/images/lionsclubs/btn/btn_edit.gif" alt="회의 수정" class="pointer authorization write" />
							<img id="button_delete_info" src="/images/lionsclubs/btn/btn_del.gif" alt="회의 삭제" class="pointer authorization write" />
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table mT5">
	    <h4>회의진행 리스트</h4>
		<div class="btnBox">
			<img id="presentaion" src="/images/lionsclubs/btn/btn_presentationmode.png" alt="회의모드" class="pointer authorization read" />
			<img id="mediaBtn" src="/images/lionsclubs/btn/btn_conf_media.gif" alt="총무보고(행사안내)" class="pointer authorization read" />
			<img id="movePage25" src="/images/lionsclubs/btn/btn_event2.gif" alt="총무보고(행사안내)" class="pointer authorization read" />
			<img id="movePage26" src="/images/lionsclubs/btn/btn_case1.gif" alt="총무보고(심의안건)" class="pointer authorization read" />
			<img id="movePage27" src="/images/lionsclubs/btn/btn_case2.gif" alt="총무보고(건의사항)" class="pointer authorization read" />
			<img id="movePage28" src="/images/lionsclubs/btn/btn_go_calc.gif" alt="총무보고(정산현황)" class="pointer authorization read" />
	
			<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" />
			<img id="initBtn" src="/images/lionsclubs/btn/btn_reset.gif" alt="회의순서 초기화" class="pointer authorization write" />
			<img id="insertBtn" src="/images/lionsclubs/btn/btn_input.gif" alt="회의순서 입력" class="pointer authorization write" />
			<img id="updateBtn" src="/images/lionsclubs/btn/btn_edit.gif" alt="회의순서 수정" class="pointer authorization write" />
			<img id="deleteBtn" src="/images/lionsclubs/btn/btn_del.gif" alt="회의순서 삭제" class="pointer authorization write" />
		</div>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="회의진행순서(선택) 안내표">
				<caption>회의진행순서(선택)</caption>
				<colgroup>
					<col width="30px" />
					<col width="50px" />
					<col width="*" />
					<col width="200px" />
					<col width="200px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="objCheckAll" value="1" /></th>
						<th>순서</th>
						<th>진행순서 내용</th>
						<th colspan="2">진행자</th>
						<th>파일</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table id="table_list" class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="50px" />
					<col width="*" />
					<col width="200px" />
					<col width="200px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach items="${MM2_24VO_PARAM.listData}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<input type="checkbox" name="chkIdx" value="${status.count }" />
								<input type="hidden" name="inputOrganCode" value="<c:out value="${list.inputOrganCode }" />" />
								<input type="hidden" name="inputInIdnNo" value="<c:out value="${list.inputInIdnNo }" />" />
								<input type="hidden" name="inputFileId" value="<c:out value="${list.inputFileId }" />" />
							</td>
							<td><input type="text" name="inputInOrder" class="input center" value="<c:out value="${list.inputInOrder }" />" maxlength="3" size="5" /></td>
							<td><input type="text" name="inputProcessOrdDesc" class="input" value="<c:out value="${list.inputProcessOrdDesc }" />" maxlength="200" style="width:95%;" /></td>
							<td><input type="text" name="inputHost1" class="input" value="<c:out value="${list.inputHost1 }" />" maxlength="100" size="25" /></td>
							<td><input type="text" name="inputHost2" class="input" value="<c:out value="${list.inputHost2 }" />" maxlength="100" size="25" /></td>
							<td class="center">
								<c:if test="${list.inputOrganCode > '' }">
									<a href="#" onclick="openFilePopup(${status.count})">
										<img src="/images/lionsclubs/btn/icon_file.gif" alt="첨부파일"  class="pointer authorization write" title="첨부파일" />(${list.fileCnt })
									</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>

<!-- Modal Popup -->  	
<div id="dialog-form-insert" class="dialog">
	<form:form id="form_insert" modelAttribute="MM2_24VO_CONF_INFO_INSERT" action="/MM2/MM2_4/MM2_24/insertConferenceBasicInfo.dox">
		<div id="popup">
			<h3><div>회의정보 추가</div></h3>
			<div class="popup_bg" style="width:100%;height:400px;">
				<table class="tblType2">
					<colgroup>
							<col width="80" />
							<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>클럽코드<span class="require">*</span></th>
							<td>
								<form:select path="insertOrganCode" cssClass="select required" caption="클럽코드" />
							</td>
						</tr>
						<tr>
							<th>회기선택<span class="require">*</span></th>
							<td><form:select path="insertYearCode" cssClass="select required" caption="회기선택" /></td>
						</tr>
						<tr>
							<th>월<span class="require">*</span></th>
							<td>
								<form:select path="insertMonthCode" cssClass="select required" caption="월" />
							</td>
						</tr>
						<tr>
							<th>회의종류<span class="require">*</span></th>
							<td><lions:codeselect path="insertConfKindCode" groupCode="7580" cssClass="select required" caption="회의종류" /></td>
						</tr>
						<tr>
							<th>회의일자<span class="require">*</span></th>
							<td><form:input path="insertConfDate" id="insertConfDate" cssClass="input date required" size="28" caption="회의일자" /></td>
						</tr>
						<tr>
							<th>회의장소<span class="require">*</span></th>
							<td><form:input path="insertConfPlaceCode" cssClass="input required" size="28" caption="회의장소" /></td>
						</tr>
						<tr>
							<th>회의시간</th>
							<td><form:input path="insertConfTime" cssClass="input" size="28" cssStyle="width: 88%;" /></td>
						</tr>
						<tr>
							<th>참석인원</th>
							<td><form:input path="insertAttendPerson" cssClass="input" size="28" cssStyle="width: 88%;" /></td>
						</tr>
						<tr>
							<th>회의회차</th>
							<td><form:input path="insertConfDesc" cssClass="input" size="28" cssStyle="width: 88%;" /></td>
						</tr>
					</tbody>
				</table>
				<div class="popupBtn">
					<img id="infoInsert" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" title="저장" class="pointer" />
					<a class="dialogClose" ><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
				</div>
			</div><!-- popup_bg -->
		</div>
	</form:form>		
</div>

<!-- Modal Popup -->  	
<div id="dialog-form-update" class="dialog">
	<form:form id="form_update" modelAttribute="MM2_24VO_CONF_INFO_UPDATE" action="/MM2/MM2_4/MM2_24/updateConferenceBasicInfo.dox">
		<form:hidden path="updateOrganCode"/>
		<form:hidden path="updateYearCode" />
		<form:hidden path="updateMonthCode" />
		<form:hidden path="updateConfKindCode" />
		<form:hidden path="updateConfIdnNo" />
		<div id="popup">
			<h3><div>회의정보 수정</div></h3>
			<div class="popup_bg" style="width:100%;height:400px;">
				<table class="tblType2">
					<colgroup>
							<col width="80" />
							<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>클럽코드</th>
							<td id="updateOrganCodeDesc"></td>
						</tr>
						<tr>
							<th>회기선택</th>
							<td id="updateYearCodeDesc"></td>
						</tr>
						<tr>
							<th>월</th>
							<td id="updateMonthCodeDesc"></td>
						</tr>
						<tr>
							<th>회의종류</th>
							<td id="updateConfKindCodeDesc"></td>
						</tr>
						<tr>
							<th>회의일자<span class="require">*</span></th>
							<td><form:input path="updateConfDate" id="updateConfDate" cssClass="input date required" size="28" caption="회의일자" />
							</td>
						</tr>
						<tr>
							<th>회의장소<span class="require">*</span></th>
							<td><form:input path="updateConfPlaceCode" cssClass="input required" size="28" cssStyle="width: 88%;" /></td>
						</tr>
						<tr>
							<th>회의시간<span class="require">*</span></th>
							<td><form:input path="updateConfTime" cssClass="input required" size="28" cssStyle="width: 88%;" /></td>
						</tr>
						<tr>
							<th>참석인원</th>
							<td><form:input path="updateAttendPerson" cssClass="input" size="28" cssStyle="width: 88%;" /></td>
						</tr>
						<tr>
							<th>회의회차</th>
							<td><form:input path="updateConfDesc" cssClass="input" size="28" cssStyle="width: 88%;" /></td>
						</tr>
					</tbody>
				</table>
				<div class="popupBtn">
					<img id="infoUpdate" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" title="저장" class="pointer" />
					<a class="dialogClose" ><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
				</div>
			</div><!-- popup_bg -->
		</div>
	</form:form>		
</div>

