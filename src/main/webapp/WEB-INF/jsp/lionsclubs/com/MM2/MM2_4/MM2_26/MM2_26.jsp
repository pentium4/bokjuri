<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$(".inputAgendaDesc, .inputDeliberationDesc").autosize({
			callback: function(){
				Scroll_Actrion();
				Scroll_Table1();			
			}
		});
		
		$("#objCheckAll").click(function(){
			if($(this).prop("checked")) {
				var i = 0;
				$("input[name=inputAgendaOrder]").each(function() {
						$("input:checkbox[name='chkIdx']").eq(i).prop("checked",($("input[name=inputAgendaOrder]").eq(i).val() != "" && $("input[name=inputAgendaDesc]").eq(i).val() != ""));								
					i++;
				});
			} else {
				$("input:checkbox[name='chkIdx']").prop("checked", false);								
			}
		});
		
		$("input[name=inputAgendaOrder]").numericOnly();
		
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
			if($("#confIdnNo").val() == "") {
				alert("회의일자를 선택하세요.");
				return false;
			}
			
			_search();
		});
		
		$("#insertBtn").click(function(){
			
			if(!validateChecker()) return false;
			
			$("#yearCodeKey").val($("#yearCode").val());
			$("#monthCodeKey").val($("#monthCode").val());
			$("#organCodeKey").val($("#organCode").val());
			$("#confKindCodeKey").val($("#confKindCode").val());
			$("#confIdnNoKey").val($("#confIdnNo").val());
		
			$("#form_data").attr("action","/MM2/MM2_4/MM2_26/insertList.dox");
			$("#form_data").submit();
		});
		
		$("#updateBtn").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			if(!validateChecker()) return false;
			$("#form_data").attr("action","/MM2/MM2_4/MM2_26/updateList.dox");
			$("#form_data").submit();
		});
		
		$("#deleteBtn").click(function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			$("#form_data").attr("action","/MM2/MM2_4/MM2_26/deleteList.dox");
			$("#form_data").submit();
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
		
		$(".presentaion").on("click", function(){
			var page = $(this).prop("id");
			var url = "/MM2/MM2_4/MM2_26/presentation.do"
					+ "?page=" + page 
					+ "&yearCode=${MM2_26VO_PARAM.yearCode}"
					+ "&monthCode=${MM2_26VO_PARAM.monthCode}"
					+ "&organCode=${MM2_26VO_PARAM.organCode}"
					+ "&confKindCode=${MM2_26VO_PARAM.confKindCode}"
					+ "&confIdnNo=${MM2_26VO_PARAM.confIdnNo}";
					
			var open = window.open("about:blank");
			open.location.href = url;
		});	
		
		$("#copy").on("click", function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			var url = "/MM2/MM2_4/MM2_26/copyPopup.do"
					+ "?copyYearCode=${MM2_26VO_PARAM.yearCode}"
					+ "&copyMonthCode=${MM2_26VO_PARAM.monthCode}"
					+ "&copyOrganCode=${MM2_26VO_PARAM.organCode}"
					+ "&copyConfKindCode=${MM2_26VO_PARAM.confKindCode}"
					+ "&copyConfIdnNo=${MM2_26VO_PARAM.confIdnNo}";
					
			openPopup(url , "350", "200", "copyPopup");
		});
		
		$("#excelDownload").on("click", function(){
			if(!$("#form_list").valid()){
				return false;
			}
			
			var params = "yearCode=${MM2_26VO_PARAM.yearCode}"
					   + "&monthCode=${MM2_26VO_PARAM.monthCode}"
					   + "&organCode=${MM2_26VO_PARAM.organCode}"
					   + "&confKindCode=${MM2_26VO_PARAM.confKindCode}"
					   + "&confIdnNo=${MM2_26VO_PARAM.confIdnNo}";		
			
			$(window).unbind();
			$.download("/MM2/MM2_4/MM2_26/excelDownload.do", params);
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
		
		
		if($("input[name=inputAgendaOrder]").eq(idx).val() == "") {
			alert((idx+1)+"번째 행의 순서를 입력하세요.");
			$("input[name=inputAgendaOrder]").eq(idx).focus();
			rtnValue = false;
			return false;
		}else if($("input[name=inputAgendaDesc]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 안건 내용을 입력하세요.");
			$("input[name=inputAgendaDesc]").eq(idx).focus();
			rtnValue = false;
			return false;
		}
		i++;
	});
	return rtnValue;
}

function openFilePopup(idx) {
	var url = "/MM2/MM2_4/MM2_26/fileInfoPopup.do";
	url += "?inputSessionYyyy=" + $("input[name=inputSessionYyyy]").eq(idx-1).val();
	url += "&inputSessionMm=" + $("input[name=inputSessionMm]").eq(idx-1).val();
	url += "&inputOrganCode=" + $("input[name=inputOrganCode]").eq(idx-1).val();
	url += "&inputConfKindCode=" + $("input[name=inputConfKindCode]").eq(idx-1).val();
	url += "&inputConfIdnNo=" + $("input[name=inputConfIdnNo]").eq(idx-1).val();
	url += "&inputAgendaIdnNo=" + $("input[name=inputAgendaIdnNo]").eq(idx-1).val();
	url += "&fileId=" + $("input[name=inputFileId]").eq(idx-1).val();
	url += "&chkIdx=" + $("input[name=chkIdx]").eq(idx-1).val();
	
	openPopup(url , "600", "300", "attachfile");
}

function _search(){
	$("#form_list").submit();
}
//-->
</script>
<form:form id="form_list" modelAttribute="MM2_24VO_PARAM" action="/MM2/MM2_4/MM2_26/MM2_26.do">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/com/MM2/MM2_4/MM2_24/baseInfo.jsp" />
</form:form>
	
<form:form id="form_data" modelAttribute="MM2_26VO_PARAM" action="">
	<div class="table mT5">
		<h4>심의안건 조회</h4>
		<div class="btnBox">
			<img id="movePage24" src="/images/lionsclubs/btn/btn_meeting.gif" alt="회의진행순서(선택)" class="pointer authorization read" />
			<img id="movePage25" src="/images/lionsclubs/btn/btn_event2.gif" alt="총무보고(행사안내)" class="pointer authorization read" />
			<img id="movePage27" src="/images/lionsclubs/btn/btn_case2.gif" alt="총무보고(건의사항)" class="pointer authorization read" />
			<img id="movePage28" src="/images/lionsclubs/btn/btn_go_calc.gif" alt="총무보고(정산현황)" class="pointer authorization read" />
	
			<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read"  />
			<img id="insertBtn" src="/images/lionsclubs/btn/btn_input.gif" alt="심의안건 입력" class="pointer authorization write" />
			<img id="updateBtn" src="/images/lionsclubs/btn/btn_edit.gif" alt="심의안건 수정" class="pointer authorization write" />
			<img id="deleteBtn" src="/images/lionsclubs/btn/btn_del.gif" alt="심의안건 삭제" class="pointer authorization write" />
			<img id="copy" src="/images/lionsclubs/btn/btn_copy.png" alt="복사" class="pointer authorization write" />
			<img id="excelDownload" src="/images/lionsclubs/btn/btn_excel2.gif" style="margin-top:2px" alt="엑셀다운로드" class="pointer authorization read" />
		</div>
	
		<input type="hidden" name="yearCode" id="yearCodeKey" value="${MM2_26VO_PARAM.yearCode }" />
		<input type="hidden" name="monthCode" id="monthCodeKey" value="${MM2_26VO_PARAM.monthCode }" />
		<input type="hidden" name="organCode" id="organCodeKey" value="${MM2_26VO_PARAM.organCode }" />
		<input type="hidden" name="confKindCode" id="confKindCodeKey" value="${MM2_26VO_PARAM.confKindCode }" />
		<input type="hidden" name="confIdnNo" id="confIdnNoKey" value="${MM2_26VO_PARAM.confIdnNo }" />
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="총무보고(심의안건)표">
				<caption>총무보고(심의안건)</caption>
				<colgroup>
					<col width="30px" />
					<col width="80px" />
					<col width="50px" />
					<col width="300px" />
					<col width="100px" />
					<col width="*" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="objCheckAll" value="1" /></th>
						<th>회의모드</th>
						<th>순서</th>
						<th>안건내용</th>
						<th>찬성인원</th>
						<th>심의내용</th>
						<th>파일</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table id="table_list" class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="80px" />
					<col width="50px" />
					<col width="300px" />
					<col width="100px" />
					<col width="*" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach items="${MM2_26VO_PARAM.listData}" var="list" varStatus="status">
						<tr>
							<td class="center" style="vertical-align:top;">
								<input type="checkbox" name="chkIdx" value="${status.count }" />
								<input type="hidden" name="inputSessionYyyy" value="<c:out value="${list.inputSessionYyyy }" />" />
								<input type="hidden" name="inputSessionMm" value="<c:out value="${list.inputSessionMm }" />" />
								<input type="hidden" name="inputOrganCode" value="<c:out value="${list.inputOrganCode }" />" />
								<input type="hidden" name="inputConfKindCode" value="<c:out value="${list.inputConfKindCode }" />" />
								<input type="hidden" name="inputConfIdnNo" value="<c:out value="${list.inputConfIdnNo }" />" />
								<input type="hidden" name="inputAgendaIdnNo" value="<c:out value="${list.inputAgendaIdnNo }" />" />
								<input type="hidden" name="inputFileId" value="<c:out value="${list.inputFileId }" />" />
							</td>
							<td>
								<c:if test="${list.inputOrganCode > '' }">
									<img id="${status.count }" src="/images/lionsclubs/btn/btn_presentation.png" alt="회의모드" class="presentaion pointer authorization read" title="회의모드" />
								</c:if>
							</td>
							<td style="vertical-align:top;">
								<input type="text" name="inputAgendaOrder" class="input center" value="<c:out value="${list.inputAgendaOrder }" />" maxlength="3" size="5" />
							</td>
							<td style="vertical-align:top;padding-bottom:1px;padding-right:2px;">
								<textarea name="inputAgendaDesc" style="width:96%;" class="textarea inputAgendaDesc"><c:out value="${list.inputAgendaDesc }" /></textarea>
							</td>
							<td style="vertical-align:top;">
								<input type="text" name="inputApprovalPerson" class="input" value="<c:out value="${list.inputApprovalPerson }" />" maxlength="100" size="10" />
							</td>
							<td style="vertical-align:top;">
								<textarea name="inputDeliberationDesc" style="width:96%;" class="textarea inputDeliberationDesc"><c:out value="${list.inputDeliberationDesc }" /></textarea>
							</td>
							<td>
								<c:if test="${list.inputOrganCode > '' }">
									<a href="#" onclick="openFilePopup(${status.count})">
										<img src="/images/lionsclubs/btn/icon_file.gif" alt="첨부파일" class="pointer authorization write" title="첨부파일" />(${list.fileCnt })
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