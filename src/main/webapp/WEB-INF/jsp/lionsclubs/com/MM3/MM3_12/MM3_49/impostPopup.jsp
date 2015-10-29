<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		if("${MM3_49VO.idnNo}".isEmpty()){
			$("#genDate").datepicker();
			$("#genDate").val($.datepicker.formatDate($.datepicker.ATOM, new Date()));		// 오늘날짜 셋팅!	
		}
		
		$("#impost").maskMoney({precision:0}).numericOnly();
		
		$("#classItemCode").on("change", function(){
			$("#detailItemCode").option1Code({ 
		    	 groupCode: "7000"	// 그룹코드
		    	,code: $(this).val()	// 코드
		    	,fixVal: "${MM3_49VO.detailItemCode}"	// 고정값
		    	,topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
			});
		});
		
		$("#genDate, #classItemCode, #detailItemCode").on("change", function(){
			if(!$("#genDate").val().isEmpty()
					&& !$("#classItemCode").val().isEmpty()
					&& !$("#detailItemCode").val().isEmpty()){
				
				var detailItemData = $("#detailItemCode option:selected").data();
				
				var params = [];
				params.push({name: "organCode", value: "${param.organCode}"});
				params.push({name: "genDate", value: $("#genDate").val()});
				params.push({name: "classItemCode", value: $("#classItemCode").val()});
				params.push({name: "detailItemCode", value: $("#detailItemCode").val()});
				
				$.ajax({
					type: "POST",
					async: true,
					url: '<c:url value="/MM3/MM3_12/MM3_49/listDistrictMoney.do" />',
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
							var $table = $("#table_mlist tbody");					
							$table.empty();
							var html = "";
							
							$.each(data.resultList, function(index, object){
								var idnNo = "";
								var checked = "";
								if(object.idnNo != null){
									idnNo = object.idnNo;
									checked = "checked='checked'";
								}
								
								html += "<tr>";
								html += "	<td><input type='checkbox' class='idnNo' value='" + idnNo + "' " + checked + " /></td>";
								html += "	<td><input type='hidden' class='clubCode' value='" + object.clubCode + "' />" + formatOrganCode(object.clubCode) + "</td>";
								html += "	<td class='left' title='" + object.clubName + "'>" + object.clubName + "</td>";
								html += "	<td><input type='text' class='impost input' value='" + comma(Math.round(object.impost)) + "' size='20' /></td>";	
								html += "	<td><input type='text' class='reference input' size='37' /></td>";
								html += "</tr>";
							});
							
							$table.html(html);
							
							$(".impost").maskMoney({precision:0}).numericOnly();
							
							$(".idnNo").on("change", function(){
								var total = $(".idnNo:enabled").length;
								var checkLen = $(".idnNo:checked").length;
								if(total == checkLen){
									$("#idnNoAll").prop("checked", true);
								} else {
									$("#idnNoAll").prop("checked", false);
								}
								
								impostTotal();
							}).change();						
							
							$(".impost").on("keyup", function(){
								impostTotal();
							});
							
							var Scroll_Area = $('.Scroll_Table').width() - 1;
							$('.Scroll_Title table').width(Scroll_Area);
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		}).change();
		
		$("#idnNoAll").on("click", function(){
			$(".idnNo:enabled").prop("checked", $(this).is(":checked"));
			impostTotal();
		});
		
		$("#allReference").on("click", function(){
			$(".idnNo:checked").each(function(){
				var tr = $(this).closest("tr");
				tr.find(".reference").val($("#reference").val());
			});
		});
	
		$("#btnImpost").on("click", function(){
			$(".idnNo:checked").each(function(){
				var tr = $(this).closest("tr");
				tr.find(".impost").val($("#impost").val());
			});
			
			impostTotal();
		});
		
		$("#btnSave").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			if($(".idnNo:checked").length == 0){
				alert("부과할 클럽을 선택해 주세요.");
				return false;
			}
			
			var returnChk = true;
			
			$(".idnNo:checked").each(function(index){
				var tr = $(this).closest("tr");
				if(tr.find(".impost").val().isEmpty() 
						|| tr.find(".impost").val() == 0){
					alert("부과금을 입력해 주세요.");
					tr.find(".impost").focus();
					returnChk = false;
					return false;
				}
			});
			
			if(!returnChk){
				return false;
			}
			
			var params = $("form").serializeArray();
			params.push({name: "organCode", value: "${param.organCode}"});
			$(".idnNo:checked").each(function(index){
				var idnNo = $(this).val();
				var tr = $(this).closest("tr");
				
				params.push({name: "saveImpostArray[" + index + "].idnNo", value: idnNo});
				params.push({name: "saveImpostArray[" + index + "].clubCode", value: tr.find(".clubCode").val()});
				params.push({name: "saveImpostArray[" + index + "].impost", value: tr.find(".impost").val()});
				params.push({name: "saveImpostArray[" + index + "].reference", value: tr.find(".reference").val()});
			});
			
			var deleteIndex = 0;
			$(".idnNo:not(:checked)").each(function(index){
				var idnNo = $(this).val();
				
				if(!idnNo.isEmpty()){
					params.push({name: "deleteImpostArray[" + deleteIndex + "].idnNo", value: idnNo});
					deleteIndex++;
				}
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM3/MM3_12/MM3_49/saveImpost.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						opener._pagingFixsearch();
						closeWin();
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				}
			});
		});
		
		impostTotal();
	});
});

/**
 * 전클럽 부과금의 총 부과금액, 부과인원을 구한다.
 */
function impostTotal(){
	var totalImpost = 0;
	
	$(".idnNo:checked").each(function(index){
		var $tr = $(this).closest("tr");
		var impost = $tr.find(".impost").val().replaceAll(",", "");
		
		totalImpost += eval(impost);
	});
	
	$(".noIdnNo").each(function(index){
		var $tr = $(this).closest("tr");
		var impost = $tr.find(".noImpost").val().replaceAll(",", "");
		
		totalImpost += eval(impost);		
	});
	
	$("#totalImpost").text(comma(totalImpost));
	$("#clubCnt").text(comma($(".idnNo:checked").length + $(".noIdnNo").length));
}
</script>
<style>
<!--
ul li{
	margin-left: 20px;
	display: inline;
}
-->
</style>

<form:form id="MM3_49VO" modelAttribute="MM3_49VO">
	<h3>
		<div>
			전클럽 부과금
			<c:choose>
				<c:when test="${empty MM3_49VO.idnNo }">입력</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>
		</div>
	</h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="300px" />
				<col width="120px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:choose>
					<c:when test="${empty MM3_49VO.idnNo }">
						<tr>
							<th>부과일자<span class="require">*</span></th>
							<td><form:input path="genDate" cssClass="required date input" caption="부과일자" /></td>
							<th>참고사항</th>
							<td>
								<input type="text" id="reference" class="input" size="25" caption="참고사항" />
								<a id="allReference" href="#">전체적용</a>
							</td>
						</tr>
						<tr>
							<th>분류항목<span class="require">*</span></th>
							<td><lions:codeselect groupCode="7000" path="classItemCode" cssClass="required select" caption="분류항목" /></td>
							<th>세부항목<span class="require">*</span></th>
							<td><form:select path="detailItemCode" cssClass="required select" caption="세부항목" /></td>
						</tr>
						<tr>
							<th>부 과 금</th>
							<td colspan="3">
								<input type="text" id="impost" class="input" size="36" />
								<img id="btnImpost" class="pointer" src="/images/lionsclubs/btn/btn_imposition.gif" alt="부과" />
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>부과일자</th>
							<td>
								<fmt:parseDate var="genDate" value="${MM3_49VO.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
								<form:hidden path="genDate"/>							
							</td>
							<th>참고사항</th>
							<td>
								<input type="text" id="reference" class="input" size="25" caption="참고사항" />
								<a id="allReference" href="#">전체적용</a>
							</td>
						</tr>
						<tr>
							<th>분류항목</th>
							<td>
								<form:hidden path="classItemCode"/>
								${MM3_49VO.classItemCode } ${MM3_49VO.classItemName }
							</td>
							<th>세부항목</th>
							<td>
								<form:hidden path="detailItemCode"/>
								${MM3_49VO.detailItemCode } ${MM3_49VO.detailItemName }
							</td>					
						</tr>
						<tr>
							<th>부 과 금</th>
							<td colspan="3">
								<input type="text" id="impost" class="input" size="36" />
								<img id="btnImpost" class="pointer" src="/images/lionsclubs/btn/btn_imposition.gif" alt="부과" />
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
			
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup">
				<colgroup>
					<col width="30px" />
					<col width="100px" />
					<col width="140px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="idnNoAll" /></th>
						<th>클럽코드</th>
						<th>클럽명</th>
						<th>부과금</th>
						<th>참고사항</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="table_mlist" class="tblPopupH2" style="height: 320px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="100px" />
					<col width="140px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup">
				<colgroup>
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th>
							<ul>
								<li>
									총 부과금액 : <span id="totalImpost">0</span>
								</li>
								<li>
									부과클럽 : <span id="clubCnt">0</span>
								</li>
							</ul>
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->			
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty MM3_49VO.idnNo }">
				<img id="btnSave" title="입력" src="/images/lionsclubs/btn/btn_input.gif" style="width:57px" class="pointer" />
			</c:when>
			<c:otherwise>
				<img id="btnSave" title="수정" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px" class="pointer" />
			</c:otherwise>
		</c:choose>
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
