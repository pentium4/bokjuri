<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#genDate").datepicker();
		$("#paymentDate").datepicker();
		$("input:text[name=impost]").maskMoney({precision:0}).numericOnly();
		$("input:text[name=payment]").maskMoney({precision:0}).numericOnly();
		
		/*
		 *	회기 검색
		 */
		$("#oneYear").sessionYearCombo({
			fixVal: "${MM1_13VO.oneYear}"	// 고정값
		});
		$("#oneYear").on("change", function(){
			$("#form_list").submit();
		});	
		
		/*
		 *	분담금 입력창 띄우기
		 */
		$("#button_insert").click(function() {
			
			$("#genDate").val("");
			$("#detailItemCode").val("");
			$("#impost").val("");
			
			$("#p_save").css("display","inline");
			$("#p_edit").css("display","none");	
			$("#p_pay").css("display","none");
			$("#p_pay_edit").css("display","none");
			
			$("#genDate, #detailItemCode").attr({"disabled":false,"readonly":false}).css("background-color","#FFFFFF");
			
			$("#popup > h3").html("<div>분담금 추가</div>");
			
			$("#popup > div.popup_bg").eq(0).css("display","block");
			$("#popup > div.popup_bg").eq(1).css("display","none");
			
			$("#dialog-commitment").dialogPopup({
				 width: 500
				,height: 260
			}); 
		});
		
		$("#p_save").on("click", function(){
		 	if(!$("#form-insert").valid()){
		 		return false;
		 	}		
			var impost =  $("#impost").val().replace(/,/g, '');
			$("#impost").val(impost);
			$("#payment").val(0);
			
			var params = $("#form-insert").serializeArray();
			
			$.ajax({
				url: '<c:url value="/MM1/MM1_2/MM1_13/Insert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						//alert('정상적으로 입력 되었습니다.');
						_search();
					}else{
						alert(data.result);					
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		/*
			약정금 - 수정창 띄우기
		 */
		$("#button_update").on("click", function(){
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("수정 할 부과일을 선택해 주세요.");
				return false;
			}
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM1/MM1_2/MM1_13/Select.do" />',
		 		data: { memberNo: $("#form_delete input:hidden[name=memberNo]").val()
		 			   ,idnNo: $("#form_delete input:hidden[name=idnNo]").val()
		 			  },
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var sdata = data.sdata;					
						$("#genDate").val(sdata.genDate);
						$("#detailItemCode").val(sdata.detailItemCode);
						//$("#titleCode").val($.trim(sdata.positionCode)).attr("selected", true);
						$("#impost").val(sdata.impost);
						
						$("#genDate, #detailItemCode").attr({"disabled":true,"readonly":true}).css("background-color","#E0FFE0");
						
						$("#p_save").css("display","none");
						$("#p_edit").css("display","inline");
						$("#p_pay").css("display","none");
						$("#p_pay_edit").css("display","none");
						
						$("#popup > h3").html("<div>분담금 수정</div>");
						
						$("#popup > div.popup_bg").eq(0).css("display","block");
						$("#popup > div.popup_bg").eq(1).css("display","none");
						
						$("#dialog-commitment").dialogPopup({
							width: 500, height: 260
						}); 
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});
		
		$("#p_edit").on("click", function(){
			if($("#form-insert #detailItemCode").val() == ""){
				alert("항목을 선택해 주세요.");
				return;
			}
					
			var impost =  $("#impost").val().replace(/,/g, '');
			if(impost == ""){ 
				alert("분담금액을 입력해 주세요.");
				return;
			}
					
			$("#impost").val(impost);		
			var params = $("#form-insert").serializeArray();
			params.push({name: "idnNo", value: $("#form_delete input:hidden[name=idnNo]").val()});
			params.push({name: "caYm", value: $("#form_delete input:hidden[name=caYm]").val()});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_2/MM1_13/Update.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 수정 되었습니다.');
						_search();
					}else{
						alert(data.message);					
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		/*
		 *	삭제 버튼
		 */
		$("#button_delete").click(function() {
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("삭제 할 부과일자를 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')){
				return false;
			}
			
			var params = $("#form_delete").serializeArray();
			$.ajax({
				url:  '<c:url value="/MM1/MM1_2/MM1_13/Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						//alert('정상적으로 삭제 되었습니다.');
						_search();
					}else{
						alert(data.result);					
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		/*
		 	납부금 입력창 띄우기
		 */
		 $("#button_payment").on("click", function(){
				var ano = $("#form_delete input:hidden[name=idnNo]").val();
				if(ano == "") {
					alert("납부 할 부과일자를 선택해 주세요.");
					return false;
				}
				
				$.ajax({
					type: "POST",
					async: false,			
					url: '<c:url value="/MM1/MM1_2/MM1_13/Select.do" />',
			 		data: { memberNo: $("#form_delete input:hidden[name=memberNo]").val()
			 			   ,idnNo: $("#form_delete input:hidden[name=idnNo]").val()
			 			  },
					dataType: 'json',
					success: function(data) {
						if(data.result){
							var sdata = data.sdata;	
							$("#payIdnNo").val(sdata.idnNo);
							$("#genDate").val(sdata.genDate);
							$("#organCode").val(sdata.organCode);
							$("#detailItemCode").val(sdata.detailItemCode);
							$("#impost").val(sdata.impost);
							$("#paymentDate").val("");
							$("#payment").val(0);
							
							$("#p_save").css("display","none");
							$("#p_edit").css("display","none");
							$("#p_pay").css("display","inline");
							$("#p_pay_edit").css("display","none");
							
							$("#popup > h3").html("<div>납부금 입력</div>");
							
							$("#popup > div.popup_bg").eq(0).css("display","none");
							$("#popup > div.popup_bg").eq(1).css("display","block");
							
							$("#dialog-commitment").dialogPopup({
								 width: 500
								,height: 220
							}); 
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"error:"+error);
					}
				});
			});
		
		
		 $("#p_pay").on("click", function(){
			 	var gdate = $("#form_delete input:hidden[name=genDate]").val();
			 	var pdate  = $("#form-insert #paymentDate").val();
			 	
			 	
			 	if(!$("#form-insert").valid()){
			 		return false;
			 	}
			 	
	// 		 	if(pdate == "" || pdate.length != 10 || pdate == "____.__.__"){
	// 				alert("납부일을 선택해 주세요.");
	// 				return;
	// 			}
			 	
			 	if(gdate.replace(/\./g, '') > pdate.replace(/\./g, '')) {
			 		alert("납부일은 부과일 이후로 선택해 주세요.");
					return;
			 	}
							
	// 			if($("#form-insert #payment").val() == ""){
	// 				alert("납부금을 입력해 주세요.");
	// 				return;
	// 			}
				
				var payment =  $("#payment").val().replace(/,/g, '');
				$("#payment").val(payment);
				
				$("#impost").val($("#form_delete input:hidden[name=impost]").val());
				var params = $("#form-insert").serializeArray();
				params.push({name: "idnNo", value: $("#form_delete input:hidden[name=idnNo]").val()});
				params.push({name: "caYm", value: $("#form_delete input:hidden[name=caYm]").val()});
				
				$.ajax({
					type: "POST",
					async: false,
					url: '<c:url value="/MM1/MM1_2/MM1_13/InsertPayment.do" />',
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
							//alert('정상적으로 납부가 되었습니다.');
							_search();
						}else{
							alert(data.message);					
						}
					},
					error:function(request,status,error){
						alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		 
		 /*
		 	납부금 수정창 띄우기
		 */
		 $("#button_payment_update").on("click", function(){
				var ano = $("#form_delete input:hidden[name=idnNo]").val();
				if(ano == "") {
					alert("납부수정 할 납부일을 선택해 주세요.");
					return false;
				}
				
				var pcount = $("#form_delete input:hidden[name=paymentCount]").val();
				if(pcount < 1) {
					alert("수정할 납부금이 없습니다.");
					return false;
				}
				
				$("#idnNo").val($("#form_delete input:hidden[name=idnNo]").val());
				$("#paymentDate").val($("#form_delete input:hidden[name=paymentDate]").val());
				$("#classItemCode").val($("#form_delete input:hidden[name=classItemCode]").val());
				$("#detailItemCode").val($("#form_delete input:hidden[name=detailItemCode]").val());
				$("#payment").val($("#form_delete input:hidden[name=payment]").val());
				
				var edata = $("#form_delete input:hidden[name=paymentDefect]").val();
				$("input:radio[name=paymentDefect][value="+edata+"]").click();
				
				$("#p_save").css("display","none");
				$("#p_edit").css("display","none");
				$("#p_pay").css("display","none");
				$("#p_pay_edit").css("display","inline");
				
				$("#popup > h3").html("<div>납부금 수정</div>");
				
				$("#popup > div.popup_bg").eq(0).css("display","none");
				$("#popup > div.popup_bg").eq(1).css("display","block");
				
				$("#dialog-commitment").dialogPopup({
					width: 500, height: 240
				}); 
			});
		 
		 
		 $("#p_pay_edit").on("click", function(){
			 	var gdate = $("#form_delete input:hidden[name=genDate]").val();
			 	var pdate  = $("#form-insert #paymentDate").val();
			 	if(pdate == "" || pdate.length != 10 || pdate == "____.__.__"){
					alert("납부일을 선택해 주세요.");
					return;
				}
			 	
			 	if(gdate.replace(/\./g, '') > pdate.replace(/\./g, '')) {
			 		alert("납부일은 부과일 이후로 선택해 주세요.");
					return;
			 	}
				
				if($("#form-insert #payment").val() == ""){
					alert("납부금을 입력해 주세요.");
					return;
				}
				
				var payment =  $("#payment").val().replace(/,/g, '');
				$("#payment").val(payment);
				
				$("#impost").val($("#form_delete input:hidden[name=impost]").val());
				var params = $("#form-insert").serializeArray();
				params.push({name: "idnNo", value: $("#form_delete input:hidden[name=idnNo]").val()});
				params.push({name: "paymentCount", value: $("#form_delete input:hidden[name=paymentCount]").val()});
				
				$.ajax({
					type: "POST",
					async: false,
					url: '<c:url value="/MM1/MM1_2/MM1_13/UpdatePayment.do" />',
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
							//alert('정상적으로 납부가 되었습니다.');
							_search();
						}else{
							alert(data.message);					
						}
					},
					error:function(request,status,error){
						//alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		 
		 	/*
			 *	납부금 삭제 버튼
			 */
			$("#button_payment_delete").click(function() {
				var ano = $("#form_delete input:hidden[name=idnNo]").val();
				if(ano == "") {
					alert("삭제 할 납부금을 선택해 주세요.");
					return false;
				}
				
				var pcount = $("#form_delete input:hidden[name=paymentCount]").val();
				if(pcount < 1) {
					alert("삭제할 납부금이 없습니다.");
					return false;
				}
				
				if(!confirm('선택한 납부금이 삭제됩니다.\n삭제하시겠습니까?')){
					return false;
				}
				
				var params = $("#form_delete").serializeArray();
				$.ajax({
					url:  '<c:url value="/MM1/MM1_2/MM1_13/DeletePayment.do" />',
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result){
							//alert('정상적으로 삭제 되었습니다.');
							_search();
						}else{
							alert(data.message);					
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				 
			});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $("#table_list tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			var classitem = $(this).find("input:hidden[name=classitem]").eq(0).val();
			var detailitem = $(this).find("input:hidden[name=detailitem]").eq(0).val();
			var caym = $(this).find("input:hidden[name=caym]").eq(0).val();
			var balance = $(this).find("input:hidden[name=balance]").eq(0).val();
			var impost = $(this).find("input:hidden[name=im]").eq(0).val();
			var payment = $(this).find("input:hidden[name=payment]").eq(0).val();
			var paymentdate = $(this).find("input:hidden[name=paymentdate]").eq(0).val();
			var paymentcount = $(this).find("input:hidden[name=paymentcount]").eq(0).val();
			var paymentdefect = $(this).find("input:hidden[name=paymentdefect]").eq(0).val();
			var gdate = $(this).find("td").eq(0).text();
			
			// 삭제
			$("#form_delete input:hidden[name=idnNo]").val($.trim(idnno));
			$("#form_delete input:hidden[name=genDate]").val($.trim(gdate));
			$("#form_delete input:hidden[name=classItemCode]").val($.trim(classitem));
			$("#form_delete input:hidden[name=detailItemCode]").val($.trim(detailitem));
			$("#form_delete input:hidden[name=caYm]").val($.trim(caym));
			$("#form_delete input:hidden[name=balance]").val($.trim(balance));
			$("#form_delete input:hidden[name=impost]").val($.trim(impost));
			$("#form_delete input:hidden[name=payment]").val($.trim(payment));
			$("#form_delete input:hidden[name=paymentDate]").val($.trim(paymentdate));
			$("#form_delete input:hidden[name=paymentCount]").val($.trim(paymentcount));
			$("#form_delete input:hidden[name=paymentDefect]").val($.trim(paymentdefect));
		});
	});	
});

function _search(){
	$("#form_list").submit();
}
</script>

<form:form id="form_list" modelAttribute="MM1_13VO" action="/MM1/MM1_2/MM1_13/MM1_13.do">
	<h3><div>임원 분담금 납부</div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<form:hidden path="memberNo" />
	<form:hidden path="organCode"/>
	
	<div class="table">
		<h4>임원 분담금 납부
			<em style="position:absolute; top:1px; margin-left: 50px; color:#438FE6;">
				회기선택 : <form:select path="oneYear" cssClass="select" />
			</em>
		</h4>
		
		<div class="btnBox">
			<img id="button_payment" src="/images/lionsclubs/btn/btn_pay_input.gif" alt="납부금 입력" style="width:94px" class="pointer authorization write" />
			<img id="button_payment_update" src="/images/lionsclubs/btn/btn_pay_modi.gif" alt="납부금 수정" style="width:94px" class="pointer authorization write" />
			<img id="button_payment_delete" src="/images/lionsclubs/btn/btn_pay_del.gif" alt="납부금 삭제" style="width:94px" class="pointer authorization write" />&nbsp;&nbsp;
			<img id="button_insert" src="/images/lionsclubs/btn/btn_regi.gif" alt="등록" style="width:57px" class="pointer authorization write" />
			<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write" />
			<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="납부금 안내표">
				<caption>납부금</caption>
				<colgroup>
					<col width="100px" />
					<col width="*" />
					<col width="130px" />
					<col width="120px" />
					<col width="130px" />
					<col width="130px" />
					<col width="130px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">부과일자</th>
						<th rowspan="2">선임/위촉 직책</th>
						<th rowspan="2">분담금액</th>
						<th colspan="3">납부금</th>
						<th rowspan="2">잔액</th>		
					</tr>
					<tr>
						<th>납부일자</th>
						<th>금액</th>
						<th>결손금</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table id="table_list" class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="100px" />		
					<col width="*" />
					<col width="130px" />
					<col width="120px" />
					<col width="130px" />
					<col width="130px" />
					<col width="130px" />
				</colgroup>
				<tbody>
					<c:set var="paymentTotal1" value="0" />
					<c:set var="paymentTotal2" value="0" />
					<c:set var="paymentTotal3" value="0" />
					<c:set var="b_pcount" value="1" />
					<c:set var="b_idnNo" value="" />
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<c:choose>
								<c:when test="${b_idnNo eq list.idnNo }">
									<td></td>
									<td></td>
									<td class="left"></td>
								</c:when>
								<c:otherwise>
									<td>
										<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
										<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
									</td> 
									<td class="left">${list.targetPositionName }</td>
									<td class="right"><fmt:formatNumber value="${list.impost }"/></td>
								</c:otherwise>		
							</c:choose>
							<td>
								<fmt:parseDate var="paymentDate" value="${list.paymentDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${paymentDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="right"><fmt:formatNumber value="${list.payment }"/></td>
							<td class="right"><fmt:formatNumber value="${list.defect }"/></td>
							
							<c:choose>
								<c:when test="${b_pcount eq list.pcount || list.pcount eq 1 || list.pcount eq 0}">
									<td class="right"><fmt:formatNumber value="${list.balance }"/></td>
									<c:set var="b_pcount" value="0" />
								</c:when>
								<c:otherwise>
									<td class="right"></td>
								</c:otherwise>		
							</c:choose>
								
							<input type="hidden" name="idn" value="${list.idnNo }" />  
							<input type="hidden" name="classitem" value="${list.classItemCode }" />  
							<input type="hidden" name="detailitem" value="${list.detailItemCode }" /> 
							<input type="hidden" name="caym" value="${list.caYm }" />   
							<input type="hidden" name="balance" value="${list.balance }" /> 
							<input type="hidden" name="im" value="${list.impost }" />
							
							<input type="hidden" name="paymentdate" value="${list.paymentDate }" />
							<input type="hidden" name="paymentcount" value="${list.paymentCount }" />   
							<input type="hidden" name="paymentdefect" value="${list.paymentDefect }" />
							<c:choose>
								<c:when test="${list.paymentDefect eq 'Y'}">
									<input type="hidden" name="payment" value="${list.defect }" />
								</c:when>
								<c:otherwise>
									<input type="hidden" name="payment" value="${list.payment }" />
								</c:otherwise>		
							</c:choose>
						</tr>
						
						<c:set var="paymentTotal2" value="${paymentTotal2 + list.payment }" />	
						<c:set var="paymentTotal3" value="${paymentTotal3 + list.defect }" />
						<c:if test="${b_idnNo ne list.idnNo }">
							<c:set var="paymentTotal1" value="${paymentTotal1 + list.impost }" />		
						</c:if>
						
						<c:set var="b_pcount" value="${b_pcount+1 }" />
						<c:set var="b_idnNo" value="${list.idnNo}" />	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="납부금 안내표">
				<caption>납부금</caption>
				<colgroup>
					<col width="100px" />
					<col width="*" />
					<col width="130px" />
					<col width="120px" />
					<col width="130px" />
					<col width="130px" />
					<col width="130px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">총계</th>
						<th class="right"><fmt:formatNumber><c:out value="${paymentTotal1}" /></fmt:formatNumber></th>
						<th></th>
						<th class="right"><fmt:formatNumber><c:out value="${paymentTotal2}" /></fmt:formatNumber></th>
						<th class="right"><fmt:formatNumber><c:out value="${paymentTotal3}" /></fmt:formatNumber></th>
						<th class="right"><fmt:formatNumber><c:out value="${paymentTotal1 - paymentTotal2 - paymentTotal3 }" /></fmt:formatNumber></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>

<form name="form_delete" id="form_delete" >
<input type="hidden" name="memberNo" value="${MM1_13VO.memberNo }" /> 
<input type="hidden" name="organCode" value="${MM1_13VO.organCode }" /> 
<input type="hidden" name="idnNo" />  
<input type="hidden" name="genDate" /> 
<input type="hidden" name="classItemCode" /> 
<input type="hidden" name="detailItemCode" /> 
<input type="hidden" name="caYm" />
<input type="hidden" name="balance" />
<input type="hidden" name="impost" />
<input type="hidden" name="payment" />
<input type="hidden" name="paymentDate" />
<input type="hidden" name="paymentCount" />
<input type="hidden" name="paymentDefect" />
</form>	

<!-- 약정금 입력 창 -->
<div id="dialog-commitment" class="dialog" style="display: none;">
	<form:form id="form-insert" modelAttribute="MM1_13VO" action="/MM1/MM1_2/MM1_13/Insert.do">
		<form:hidden path="classItemCode" />
		<form:hidden path="memberNo" />
		<form:hidden path="organCode"/>
	
		<div id="popup">
			<h3><div>분담금 추가</div></h3>
			
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>부과일자<span class="require">*</span></th>
							<td>
								<form:input path="genDate" cssClass="input date required" caption="부과일자" />
							</td>
						</tr>
						<tr>
							<th>항<span style="margin-left: 31px;" />목<span class="require">*</span></th>
							<td>
								<lions:codeselect path="detailItemCode" cssClass="required" groupCode="4600" caption="항목" />
							</td>
						</tr>
						<tr>
							<th>분 담 금<span class="require">*</span></th>
							<td>
								<form:input path="impost" cssClass="input required" size="25" caption="분담금" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg : 분담금 입력 -->
			
			<div class="popup_bg" style="display:none;">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>납부일<span class="require">*</span></th>
							<td>
								<form:input path="paymentDate" cssClass="input date required" caption="납부일" />
							</td>
						</tr>
						<tr>
							<th>납부/결손</th>
							<td>
								<form:radiobutton path="paymentDefect" value="N" checked="checked" /> 납부금
								<form:radiobutton path="paymentDefect" value="Y" /> 결손금
							</td>
						</tr>				
						
						<tr>
							<th>납부금<span class="require">*</span></th>
							<td>
								<form:input path="payment" cssClass="input required" size="25" min="1" caption="납부금" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg : 납부금 입력 -->
			
			<div class="popupBtn">
				<img id="p_save" src="/images/lionsclubs/btn/btn_save.gif" title="저장" style="width:57px" class="pointer" />
				<img id="p_edit" src="/images/lionsclubs/btn/btn_edit.gif" title="수정저장" style="width:57px;display:none;" class="pointer" />
				<img id="p_pay" src="/images/lionsclubs/btn/btn_pay.gif" title="납부" style="width:57px;display:none;" class="pointer" />
				<img id="p_pay_edit" src="/images/lionsclubs/btn/btn_edit.gif" title="납부 수정저장" style="width:57px;display:none;" class="pointer" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" title="닫기" style="width:57px" class="pointer" /></a>
			</div>
		
		</div><!-- popup -->
	</form:form>
</div>