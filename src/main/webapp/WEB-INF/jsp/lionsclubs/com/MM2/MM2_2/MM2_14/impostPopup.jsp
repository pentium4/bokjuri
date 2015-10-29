<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		if("${MM2_14VO.idnNo}".isEmpty()){
			$("#genDate").datepicker();
			$("#genDate").val($.datepicker.formatDate($.datepicker.ATOM, new Date()));		// 오늘날짜 셋팅!	
		}
		
// 		$("#clubPayment").val(Math.round($("#clubPayment").val()));
		$("#clubPayment").maskMoney({precision:0}).numericOnly();
		$("#impost").maskMoney({precision:0}).numericOnly();
	
		if("${MM2_14VO.idnNo}".isEmpty()){
			$("#classItemCode").on("change", function(){
				var code = $(this).val();
				setCombo(code);
				
				if(code == "1060"){
					$(".familyEvent").show();
				} else {
					$(".familyEvent").hide();
				}
			});
		}
		
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
					async: false,
					url: '<c:url value="/MM2/MM2_2/MM2_14/listImpostMember.do" />',
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
		
							var $table = $("#table_mlist tbody");					
							$table.empty();
							var html = "";
							
							$.each(data.resultList, function(index, object){
								if("${MM2_14VO.idnNo}".isEmpty()){
									html += "<tr>";
									html += "	<td><input type='checkbox' class='idnNo' value='' /></td>";
									html += "	<td><input type='hidden' class='memberNo' value=" + object.memberNo + " />" + object.memberNo + "</td>";
									html += "	<td>" + object.name + "</td>";
									if(detailItemData.code1 == "C"){
										html += "	<td><input type='text' class='impost input' value='" + (object.monthDue == null ? '' : object.monthDue) + "' size='23' /></td>";	
									} else {
										html += "	<td><input type='text' class='impost input' size='23' /></td>";
									}
									
									html += "	<td><input type='text' class='reference input' size='37' /></td>";
									html += "</tr>";
								} else {
									var idnNo = object.idnNo == null ? "" : object.idnNo;
									var idnNoChk = idnNo.isEmpty() ? "" : "checked='checked'";
									
									if((eval(object.payment) + eval(object.paymentDefect)) > 0){
										html += "<tr>";
										html += "	<td></td>";
										html += "		<input type='hidden' class='noIdnNo' value='' />";
										html += "		<input type='hidden' class='noImpost' value='" + object.impost + "' />";
										html += "	</td>";
										html += "	<td>" + object.memberNo + "</td>";
										html += "	<td>" + object.name + "</td>";
										html += "	<td class='right'>" + comma(Math.round(object.impost)) + "</td>";	
										html += "	<td class='left'>" + object.reference + "</td>";
										html += "</tr>";
									} else {
										html += "<tr>";
										html += "	<td><input type='checkbox' class='idnNo' value='" + idnNo + "' " + idnNoChk + " /></td>";
										html += "	<td><input type='hidden' class='memberNo' value=" + object.memberNo + " />" + object.memberNo + "</td>";
										html += "	<td>" + object.name + "</td>";
										html += "	<td><input type='text' class='impost input' value='" + Math.round(object.impost) + "' size='26' /></td>";	
										html += "	<td><input type='text' class='reference input' value='" + object.reference + "'  size='40' /></td>";
										html += "</tr>";
									}
								}
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
							
							deliveryMemberDisabled();
	
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
				alert("부과할 회원을 선택해 주세요.");
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
				
				if(idnNo.isEmpty()){
					params.push({name: "insertImpostArray[" + index + "].memberNo", value: tr.find(".memberNo").val()});
					params.push({name: "insertImpostArray[" + index + "].impost", value: tr.find(".impost").val()});
					params.push({name: "insertImpostArray[" + index + "].reference", value: tr.find(".reference").val()});
				} else {
					params.push({name: "updateImpostArray[" + index + "].idnNo", value: idnNo});
					params.push({name: "updateImpostArray[" + index + "].impost", value: tr.find(".impost").val()});
					params.push({name: "updateImpostArray[" + index + "].reference", value: tr.find(".reference").val()});
				}
			});
			
			var deleteIndex = 0;
			$(".idnNo:not(:checked)").each(function(index){
				var idnNo = $(this).val();
				
				if(!idnNo.isEmpty()){
					params.push({name: "deleteImpostArray[" + deleteIndex + "].idnNo", value: idnNo});
					deleteIndex++;
				}
			});
			
			var url = '<c:url value="/MM2/MM2_2/MM2_14/updateImpost.do" />';
			if("${MM2_14VO.idnNo}".isEmpty()){
				url = '<c:url value="/MM2/MM2_2/MM2_14/insertImpost.do" />';
			}
			
			$.ajax({
				type: "POST",
				async: false,
				url: url,
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						opener._search();
						closeWin();
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		$("#btnDeliveryMember").on("click", function(){
			var params = [];
			params.push({name: "name", value: $("#deliveryMemberName").val()});	
			params.push({name:"sectorClubCode", value: "${param.organCode}"}); // sectorClubCode 검색
			
			new lions.popup({
				 url: '/common/member/memberSearchPopup.do'
				,data: params
				,name: "memberSearchPopup"
				,width: "1000"
				,height: "400"		
				,oncomplate: function(r){
					var data = r.data;
					
					$("#deliveryMemberName").val(data.name);
					$("#deliveryMemberNo").val(data.memberno);
					
					deliveryMemberDisabled();
				}
			}).open();
		});
		
		$("#deliveryMemberName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				$("#btnDeliveryMember").trigger("click");		
			}
		});
		
		$("#deliveryMemberName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 8 ) {
				$("#deliveryMemberName").val("");
				$("#deliveryMemberNo").val("");
			}
		});
		
		impostTotal();
	});
});

function setCombo(key) {
	var $detailItemCode = $('#detailItemCode');
	$detailItemCode.empty();
	
	var params = [];
	params.push({name: "code", value: key});
	params.push({name: "groupCode", value: "4100"});
	params.push({name: "gubn", value: "B"});
	
	$.ajax({
		type: "POST",
		async: false,
		url: '<c:url value="/MM1/MM1_2/MM1_09/Code.do" />',
		data: params,
		dataType: 'json',
		success: function(data) {
			if(data.selectList){
				$detailItemCode.append("<option value=''>--선택--</option>");
				
				$.each(data.selectList, function(index, object){
					$detailItemCode.append("<option value=" + object.code + " data-code1=" + object.code1 + " data-code2=" + object.code2 + " data-code3=" + object.code3 + ">"+ object.codeName +"</option>");
				});
				
				if(!"${MM2_14VO.idnNo}".isEmpty()){
					$detailItemCode.val("${MM2_14VO.detailItemCode}");
				}
			}
		},
		error:function(request,status,error){
			alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
// 			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function deliveryMemberDisabled(){
	$(".impost").prop("disabled", false);
	$(".reference").prop("disabled", false);
	$(".idnNo").prop("disabled", false);

	var deliveryMemberNo = $("#deliveryMemberNo").val();
	$(".memberNo").each(function(){
		if($(this).val() == deliveryMemberNo){
			var tr = $(this).closest("tr");
			tr.find(".impost").prop("disabled", true).val("");
			tr.find(".reference").prop("disabled", true).val("");
			tr.find(".idnNo").prop("disabled", true).prop("checked", false);
			return false;
		}
	});
}

/**
 * 전회원 부과금의 총 부과금액, 부과인원을 구한다.
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
	$("#memberCnt").text(comma($(".idnNo:checked").length + $(".noIdnNo").length));
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

<form:form id="MM2_14VO" modelAttribute="MM2_14VO">
	<h3>
		<div>
			전회원 부과금
			<c:choose>
				<c:when test="${empty MM2_14VO.idnNo }">입력</c:when>
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
					<c:when test="${empty MM2_14VO.idnNo }">
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
							<td>
								<form:select path="classItemCode" cssClass="required select" caption="분류항목">
									<form:option value="">--선택--</form:option>
									<c:forEach items="${classList}" var="list" varStatus="status">
										<form:option value="${list.code}" data-code1="${list.code1 }" data-code2="${list.code2 }" data-code3="${list.code3 }">${list.codeName }</form:option>
									</c:forEach>
								</form:select>
							</td>
							<th>세부항목<span class="require">*</span></th>
							<td>
								<form:select path="detailItemCode" cssClass="required select" caption="세부항목">
									<form:option value="">--선택--</form:option>
								</form:select>
							</td>					
						</tr>
						<tr>
							<th>부 과 금</th>
							<td colspan="3">
								<input type="text" id="impost" class="input" size="36" />
								<img id="btnImpost" class="pointer" src="/images/lionsclubs/btn/btn_imposition.gif" alt="부과" />
							</td>
						</tr>
						<tr class="familyEvent" style="display:none">
							<th>클럽부담금</th>
							<td><form:input path="clubPayment" cssClass="input" size="36" caption="클럽부담" /></td>
							<th>금액전달회원<span class="require">*</span></th>
							<td>
								<input type="text" id="deliveryMemberName" class="required input" caption="금액전달" />
								<form:hidden path="deliveryMemberNo"/>
								<img id="btnDeliveryMember" src="/images/lionsclubs/btn/btn_mem_search.gif" class="pointer" title="회원 조회" style="width:78px" />
							</td>
						</tr>
						<tr class="familyEvent" style="display:none">
							<th>방문지역<span class="require">*</span></th>
							<td colspan="3"><form:input path="inexDesc" cssClass="required input" size="36" caption="방문지역" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>부과일자</th>
							<td>
								<fmt:parseDate var="genDate" value="${MM2_14VO.genDate }" pattern="yyyyMMdd" />
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
								${MM2_14VO.classItemCode } ${MM2_14VO.classItemName }
							</td>
							<th>세부항목</th>
							<td>
								<form:hidden path="detailItemCode"/>
								${MM2_14VO.detailItemCode } ${MM2_14VO.detailItemName }
							</td>					
						</tr>
						<tr>
							<th>부 과 금</th>
							<td colspan="3">
								<input type="text" id="impost" class="input" size="36" />
								<img id="btnImpost" class="pointer" src="/images/lionsclubs/btn/btn_imposition.gif" alt="부과" />
							</td>
						</tr>
						<c:if test="${MM2_14VO.classItemCode eq '1060' }">
							<tr>
								<th>클럽부담금</th>
								<td><form:input path="clubPayment" cssClass="input" size="36" caption="클럽부담" /></td>
								<th>금액전달회원</th>
								<td>
									${MM2_14VO.deliveryMemberNo } ${MM2_14VO.deliveryMemberName }
									<form:hidden path="deliveryMemberNo"/>
								</td>
							</tr>
							<tr>
								<th>방문지역<span class="require">*</span></th>
								<td colspan="3"><form:input path="inexDesc" cssClass="required input" size="36" caption="방문지역" /></td>
							</tr>							
						</c:if>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
			
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup">
				<colgroup>
					<col width="30px" />
					<col width="120px" />
					<col width="120px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="idnNoAll" /></th>
						<th>회원번호</th>
						<th>이름</th>
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
					<col width="120px" />
					<col width="120px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tbody>
				</tbody>
			</table>
		</div>
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
									총 부과금액 : <span id="totalImpost">0</span>
								</li>
								<li>
									부과인원 : <span id="memberCnt">0</span>
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
			<c:when test="${empty MM2_14VO.idnNo }">
				<img id="btnSave" title="입력" src="/images/lionsclubs/btn/btn_input.gif" style="width:57px" class="pointer" />
			</c:when>
			<c:otherwise>
				<img id="btnSave" title="수정" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px" class="pointer" />
			</c:otherwise>
		</c:choose>
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
