<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#paymentDate").datepicker();
		
		//기관 클럽코드 세팅
		$("#clubCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM3_22_AVO.clubCode}"
		});
		
		$("#sessionYear").sessionYearCombo({
			   fixVal: "${MM3_22_AVO.sessionYear}"  
			  ,top:false
		});
		
		/* 
			테이블 클릭시
		*/	
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".paymentIdnNo").prop("checked", true);
		});
		
		$("#btnPayment").on("click", function(){
			if(!$(".paymentIdnNo").is(":checked")){
				alert("납부금입력할 부과항목을 선택해 주세요.");
				return false;
			}
			
			var tr = $(".paymentIdnNo:checked").closest("tr");
			var dollarYN = tr.find(".dollarYN").val();
			
			if(dollarYN == "Y"){
				$("#paymentTxt").text("납부금은 달러($)로 금액을 적어주세요.");
				$("#payment").hide();
				$("#paymentDollar").show();
			} else {
				$("#paymentTxt").text("납부금은 원(won)으로 금액을 적어주세요.");
				$("#payment").show();
				$("#paymentDollar").hide();
			}
			
			paymentClaer();
			paymentMaskMoney();
			$("#p_pay").show();
			$("#p_pay_edit").hide();
			
			$("#dialog-payment").dialogPopup({
				 width: 350
				,height: 200
			});
		});
		
		$("#btnPaymentUpdate").on("click", function(){
			if(!$(".paymentIdnNo").is(":checked")){
				alert("납부금수정할 부과항목을 선택해 주세요.");
				return false;
			}
			
			if($(".paymentIdnNo:checked").val().isEmpty()){
				alert("수정할 납부금이 없습니다.");
				return false;
			}
	
			paymentClaer();
			var params = [];
			params.push({name: "paymentIdnNo", value: $(".paymentIdnNo:checked").val()});
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_4/MM3_22_A/objectClubPayment.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var objectClubPayment = data.objectClubPayment;
						
						$("#form_payment h3 div").text("납부금 수정");
						$("#form_payment #paymentDate").val(objectClubPayment.paymentDate);
						
						var tr = $(".paymentIdnNo:checked").closest("tr");
						var dollarYN = tr.find(".dollarYN").val();
						if(dollarYN == "Y"){
							$("#paymentTxt").text("납부금은 달러($)로 금액을 적어주세요.");
							$("#payment").hide();
							$("#paymentDollar").show();						
							$("#paymentDollar").val(objectClubPayment.paymentDollar);
						} else {
							$("#paymentTxt").text("납부금은 원(won)으로 금액을 적어주세요.");
							$("#payment").show();
							$("#paymentDollar").hide();						
							$("#payment").val(objectClubPayment.payment);
						}
						
						paymentMaskMoney();
						$("#p_pay").hide();
						$("#p_pay_edit").show();
	
						$("#dialog-payment").dialogPopup({
							 width: 350
							,height: 200
						});
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});
		
		$("#p_pay").on("click", function(){
			if(!$("#form_payment").valid()){
				return false;
			}
			
			var tr = $(".paymentIdnNo:checked").closest("tr");
			
			var dollarYN = tr.find(".dollarYN").val();
			
			var paymentCheck = true;
			if(dollarYN == "Y"){
				if($("#paymentDollar").val() == 0){
					alert("납부금(달러)을 입력해 주세요.");
					$("#paymentDollar").focus();
					paymentCheck = false;
				}
			} else {
				if($("#payment").val() == 0){
					alert("납부금(원)을 입력해 주세요.");
					$("#payment").focus();
					paymentCheck = false;
				}
			}
			
			if(!paymentCheck){
				return false;
			}		
			
			var params = $("#form_payment").serializeArray();
			params.push({name: "clubCode", value: "${MM3_22_AVO.clubCode}"});
			params.push({name: "sessionYear", value: "${MM3_22_AVO.sessionYear}"});
			params.push({name: "districtCode", value: tr.find(".districtCode").val()});
			params.push({name: "firstSecKind", value: tr.find(".firstSecKind").val()});
			params.push({name: "itemKindCode", value: tr.find(".itemKindCode").val()});
			params.push({name: "itemCode", value: tr.find(".itemCode").val()});
			params.push({name: "dollarYN", value: dollarYN});
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_4/MM3_22_A/insertClubPayment.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
					} else {
						alert(data.result);
						_search();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});
		
		$("#p_pay_edit").on("click", function(){
			if(!$("#form_payment").valid()){
				return false;
			}
			
			var tr = $(".paymentIdnNo:checked").closest("tr");
			
			var dollarYN = tr.find(".dollarYN").val();
			var paymentCheck = true;
			if(dollarYN == "Y"){
				if($("#paymentDollar").val() == 0){
					alert("납부금을 입력해 주세요.");
					$("#paymentDollar").focus();
					paymentCheck = false;
				}
			} else {
				if($("#payment").val() == 0){
					alert("납부금을 입력해 주세요.");
					$("#payment").focus();
					paymentCheck = false;
				}
			}
			
			if(!paymentCheck){
				return false;
			}
			
			var params = $("#form_payment").serializeArray();
			params.push({name: "paymentIdnNo", value: $(".paymentIdnNo:checked").val()});
			params.push({name: "clubCode", value: "${MM3_22_AVO.clubCode}"});
			params.push({name: "sessionYear", value: "${MM3_22_AVO.sessionYear}"});
			params.push({name: "districtCode", value: tr.find(".districtCode").val()});
			params.push({name: "firstSecKind", value: tr.find(".firstSecKind").val()});
			params.push({name: "itemKindCode", value: tr.find(".itemKindCode").val()});
			params.push({name: "itemCode", value: tr.find(".itemCode").val()});
			params.push({name: "dollarYN", value: dollarYN});
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM3/MM3_4/MM3_22_A/updateClubPayment.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
					} else {
						alert(data.result);	
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});	
		
		$("#btnPaymentDelete").click(function() {
			if(!$(".paymentIdnNo").is(":checked")){
				alert("삭제 할 납부금을 선택해 주세요.");
				return false;
			}
			
			if($(".paymentIdnNo:checked").val().isEmpty()){
				alert("삭제할 납부금이 없습니다.");
				return false;
			}
			
			if(!confirm('납부금을 삭제하시겠습니까?')) {
				return false;
			}
			
			var params = [];
			var tr = $(".paymentIdnNo:checked").closest("tr");
			params.push({name: "paymentIdnNo", value: $(".paymentIdnNo:checked").val()});
			params.push({name: "clubCode", value: "${MM3_22_AVO.clubCode}"});
			params.push({name: "sessionYear", value: "${MM3_22_AVO.sessionYear}"});
			params.push({name: "districtCode", value: tr.find(".districtCode").val()});
			params.push({name: "firstSecKind", value: tr.find(".firstSecKind").val()});
			params.push({name: "itemKindCode", value: tr.find(".itemKindCode").val()});
			params.push({name: "itemCode", value: tr.find(".itemCode").val()});
			
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM3/MM3_4/MM3_22_A/deleteClubPayment.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
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
		
		$("#btnSearch").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#clubCode").val()
			});
			
			_search();
		});
	});
});

function paymentMaskMoney(){
	$("#payment").maskMoney({precision:0}).numericOnly();	
	$("#paymentDollar").maskMoney({precision:0});
}

function paymentClaer(){
	$("#paymentDate").val(Date.today().toString("yyyy.MM.dd"));
	$("#payment").val("");
	$("#paymentDollar").val("");
}

function _search(){
	$("#form_list").submit(); 
}
</script>

<form:form id="form_list" modelAttribute="MM3_22_AVO" action="/MM3/MM3_4/MM3_22_A/MM3_22_A.do">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽 납부금 입력조회표">
			<caption>클럽 납부금 입력조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="41%" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td>
						<form:select path="clubCode" cssClass="select" />
					</td>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table" style="margin-bottom:15px !important;">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		
		<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
			<img id="btnPayment" src="/images/lionsclubs/btn/btn_pay_input.gif" alt="납부금 입력" style="width:94px" class="pointer authorization write" />
			<img id="btnPaymentUpdate" src="/images/lionsclubs/btn/btn_pay_modi.gif" alt="납부금 수정" style="width:94px" class="pointer authorization write" />
			<img id="btnPaymentDelete" src="/images/lionsclubs/btn/btn_pay_del.gif" alt="납부금 삭제" style="width:94px" class="pointer authorization write" />			
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="클럽별 납부금 조회표">
				<caption>클럽별 납부금 조회</caption>
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="90px" />
					<col width="100px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">분기</th>
						<th rowspan="2">부과항목</th>
						<th rowspan="2">납부일자</th>
						<th colspan="2">부과금액</th>
						<th colspan="2">납부금액</th>
						<th colspan="2">잔액</th>
					</tr>
					<tr>
						<th>＄</th>
						<th>금액</th>
						<th>＄</th>
						<th>금액</th>
						<th>＄</th>
						<th>금액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="90px" />
					<col width="100px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<tbody>
					<c:set var="dueDollarTot" value="0" />
					<c:set var="dueTot" value="0" />
					<c:set var="paymentDollarTot" value="0" />
					<c:set var="paymentTot" value="0" />
					<c:set var="paymentDollarBalTot" value="0" />
					<c:set var="paymentBalTot" value="0" />
					
					<c:forEach items="${resultList }" var="list">
						<c:set var="key" value="${list.firstSecKind + list.itemCode }" />
						<tr>
							<td class="center">
								<input type="radio" name="paymentIdnNo" class="paymentIdnNo" value="${list.paymentIdnNo }" style="display: none;" />
								<input type="hidden" class="districtCode" value="${list.districtCode }" />
								<input type="hidden" class="firstSecKind" value="${list.firstSecKind }" />
								<input type="hidden" class="itemKindCode" value="${list.itemKindCode }" />
								<input type="hidden" class="itemCode" value="${list.itemCode }" />
								<input type="hidden" class="dollarYN" value="${list.dollarYN }" />
								
								<c:if test="${key ne compareKey}">
									${list.firstSecKindName }
								</c:if>
							</td>
							<td class="left">
								<c:if test="${key ne compareKey}">
									${list.itemName }
								</c:if>
							</td>
							<td class="center">
								<fmt:parseDate var="paymentDate" value="${list.paymentDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${paymentDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="right">
								<fmt:formatNumber value="${list.dueDollar }" />
							</td>
							<td class="right">
								<fmt:formatNumber value="${list.due }" />
							</td>
							<td class="right">
								<fmt:formatNumber value="${list.paymentDollar }" />
							</td>
							<td class="right">
								<fmt:formatNumber value="${list.payment }" />
							</td>
							<td class="right">
								<fmt:formatNumber value="${list.paymentDollarBal }" />
							</td>
							<td class="right">
								<fmt:formatNumber value="${list.paymentBal }" />
							</td>
						</tr>
						
						<c:if test="${list.rnum eq '1' }">
							<c:set var="dueDollarTot" value="${dueDollarTot + list.dueDollar }" />
							<c:set var="dueTot" value="${dueTot + list.due }" />
							<c:set var="paymentDollarBalTot" value="${paymentDollarBalTot + list.paymentDollarBal }" />
							<c:set var="paymentBalTot" value="${paymentBalTot + list.paymentBal }" />
						</c:if>
						<c:set var="paymentDollarTot" value="${paymentDollarTot + list.paymentDollar }" />
						<c:set var="paymentTot" value="${paymentTot + list.payment }" />
						<c:set var="compareKey" value="${list.firstSecKind + list.itemCode }" />
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0" style="margin-bottom: 6px;">
			<table class="tblType2_1">
				<caption>클럽별 납부금 총계</caption>
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="90px" />
					<col width="100px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3">총 계</th>
						<th class="right"><fmt:formatNumber value="${dueDollarTot }" /></th>
						<th class="right"><fmt:formatNumber value="${dueTot }" /></th>
						<th class="right"><fmt:formatNumber value="${paymentDollarTot }" /></th>
						<th class="right"><fmt:formatNumber value="${paymentTot }" /></th>
						<th class="right"><fmt:formatNumber value="${paymentDollarBalTot }" /></th>
						<th class="right"><fmt:formatNumber value="${paymentBalTot }" /></th>
					</tr>
				</tfoot>
			</table>
		</div>		
	</div><!-- table -->
</form:form>

<!-- 약정금 입력 창 -->
<div id="dialog-payment" class="dialog" style="display: none;">
	<form:form id="form_payment" modelAttribute="MM3_22_AVO">
		<double-submit:preventer tokenKey="mm322a" />
	
		<div id="popup">
			<h3><div>납부금 추가</div></h3>
			
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>납부일<span class="require">*</span></th>
							<td>
								<form:input path="paymentDate" cssClass="input required" caption="납부일" />
							</td>
						</tr>
						<tr>
							<th>납부금<span class="require">*</span></th>
							<td>
								<div id="paymentTxt" style="font-size:11px;">납부금은 원(won)으로 금액을 적어주세요.</div>
								<form:input path="payment" cssClass="input required" caption="납부금(원)" size="25" />
								<form:input path="paymentDollar" cssClass="input required" caption="납부금(달러)" size="25" cssStyle="display:none" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg : 납부금 입력 -->
			
			<div class="popupBtn">
				<img id="p_pay" src="/images/lionsclubs/btn/btn_pay.gif" title="납부" class="pointer" />
				<img id="p_pay_edit" src="/images/lionsclubs/btn/btn_edit.gif" style="display: none;" title="납부 수정저장" class="pointer" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" title="닫기" style="width:57px" /></a>
			</div>
		</div>
	</form:form>
</div>