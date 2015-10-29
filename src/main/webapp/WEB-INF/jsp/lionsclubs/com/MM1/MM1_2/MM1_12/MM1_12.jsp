<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#genDate").datepicker();
		$("#paymentDate").datepicker();
		maskMoney();
		
		/*
		 *	약정금 입력창 띄우기
		 */
		$("#button_insert").click(function() {
			$("#genDate").val("");
			$("#detailItemCode").val("");
			$("#kindCode").val("");
			$("#kindName").val("");
			$("#impost").val("");
			
			$("#paymentDate").val("");
			$("#payment").val("");
			
			$("#detailItemCode").attr({"disabled":false,"readonly":false}).css("background-color","#FFFFFF");
			$("#genDate").datepicker( "option", "disabled", false ).css("background-color","#FFFFFF");
			
			$("#p_save").css("display","inline");
			$("#p_edit").css("display","none");	
			$("#p_pay").css("display","none");	
			$("#p_pay_edit").css("display","none");
			
			$("#popup > h3").html("<div>약정금 추가</div>");
			
			$("#popup > div.popup_bg").eq(0).css("display","block");
			$("#popup > div.popup_bg").eq(1).css("display","none");
			
			$("#dialog-commitment").dialogPopup({
				width: 500, height: 260
			}); 
		});
		
		$("#p_save").on("click", function(){
			var aday = $("#form-insert #genDate").val();
	 		if(aday == "" || aday == "____.__.__"){
				alert("약정일을 선택해 주세요.");
				return;
			}
			
			if($("#form-insert #detailItemCode").val() == ""){
				alert("항목을 선택해 주세요.");
				return;
			}
			
			if($("#form-insert #kindCode").val() == ""){
				alert("구분을 선택해 주세요.");
				return;
			}
			
			if($("#form-insert #impost").val() == ""){
				alert("약정금을 입력해 주세요.");
				return;
			}
			
			var impost =  $("#impost").val().replace(/,/g, '');
			$("#impost").val(impost);
			$("#payment").val(0);
			var params = $("#form-insert").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,	
				url: '<c:url value="/MM1/MM1_2/MM1_12/Insert.do" />',
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
					//alert("code:"+request.status+"\n"+"\n"+"error:"+request.statusText);  //+"message:"+request.responseText
				} 
			});
		});
		
		/*
			약정금 - 수정창 띄우기
		 */
		$("#button_update").on("click", function(){
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("수정 할 약정일을 선택해 주세요.");
				return false;
			}
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM1/MM1_2/MM1_12/Select.do" />',
		 		data: { memberNo: $("#form_delete input:hidden[name=memberNo]").val()
		 			   ,idnNo: $("#form_delete input:hidden[name=idnNo]").val()
		 			  },
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var sdata = data.sdata;	
						$("#genDate").val($("#form_delete input:hidden[name=genDate]").val());
						$("#detailItemCode").val(sdata.detailItemCode);
						$("#kindCode").val(sdata.kindCode);
						$("#kindName").val(sdata.kindName);
						
						var xcheck = $("#xdata").val();
						if(sdata.detailItemCode == "1000" && xcheck == "Y"){
							$("#impost").val(sdata.personalImpost);
							$("#exText").html("약정금은 ($)로 금액을 적어주세요.");
						}else{
							$("#impost").val(sdata.impost);
							$("#exText").html("약정금은 (won)로 금액을 적어주세요.");
						}
						
						$("#detailItemCode").attr({"disabled":true,"readonly":true}).css("background-color","#E0FFE0");
						$("#genDate").datepicker( "option", "disabled", true ).css("background-color","#E0FFE0");
						
						$("#p_save").css("display","none");
						$("#p_edit").css("display","inline");
						$("#p_pay").css("display","none");
						$("#p_pay_edit").css("display","none");
						
						$("#popup > h3").html("<div>약정금 수정</div>");
						
						$("#popup > div.popup_bg").eq(0).css("display","block");
						$("#popup > div.popup_bg").eq(1).css("display","none");
						
						$("#dialog-commitment").dialogPopup({
							width: 500, height: 260
						});
						
						maskMoney();
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
				return false;
			}
			
			if($("#form-insert #kindCode").val() == ""){
				alert("구분을 선택해 주세요.");
				return false;
			}
			
			var impost =  $("#impost").val().replace(/,/g, '');
			if(impost == ""){
				alert("약정금을 입력해 주세요.");
				return false;
			}
					
			$("#detailItemCode").attr({"disabled":false});
			$("#impost").val(impost);
			var params = $("#form-insert").serializeArray();
			params.push({name: "idnNo", value: $("#form_delete input:hidden[name=idnNo]").val()});
			params.push({name: "caYm", value: $("#form_delete input:hidden[name=caYm]").val()});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_2/MM1_12/Update.do" />',
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
				alert("삭제 할 약정금을 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')){
				return false;
			}
			
			var params = $("#form_delete").serializeArray();
			$.ajax({
				url:  '<c:url value="/MM1/MM1_2/MM1_12/Delete.do" />',
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
					alert("납부 할 약정일을 선택해 주세요.");
					return false;
				}
				
				$.ajax({
					type: "POST",
					async: false,			
					url: '<c:url value="/MM1/MM1_2/MM1_12/Select.do" />',
			 		data: { memberNo: $("#form_delete input:hidden[name=memberNo]").val()
			 			   ,idnNo: $("#form_delete input:hidden[name=idnNo]").val()
			 			  },
					dataType: 'json',
					success: function(data) {
						if(data.result){
							var sdata = data.sdata;	
							$("#genDate").val(sdata.genDate);
							$("#organCode").val(sdata.organCode);
							$("#detailItemCode").val(sdata.detailItemCode);
							$("#impost").val(sdata.impost);
							$("#paymentDate").val("");
							$("#payment").val("");
							
							$("#p_save").css("display","none");
							$("#p_edit").css("display","none");
							$("#p_pay").css("display","inline");
							$("#p_pay_edit").css("display","none");
							
							$("#popup > h3").html("<div>납부금 추가</div>");
							
							$("#popup > div.popup_bg").eq(0).css("display","none");
							$("#popup > div.popup_bg").eq(1).css("display","block");
							
							$("#genDate").datepicker( "option", "disabled", false ).css("background-color","#FFFFFF");
							
							var xcheck = $("#xdata").val();
							if(sdata.detailItemCode == "1000" && xcheck == "Y"){
								$("#exText2").html("납부금은 ($)로 금액을 적어주세요.");
							}else{
								$("#exText2").html("납부금은 (won)로 금액을 적어주세요.");
							}
							
							$("#dialog-commitment").dialogPopup({
								width: 500, height: 240
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
			 	if(pdate == "" || pdate.length != 10 || pdate == "____.__.__"){
					alert("납부일을 선택해 주세요.");
					return;
				}
			 	
			 	if(gdate.replace(/\./g, '') > pdate.replace(/\./g, '')) {
			 		alert("납부일은 부과일(약정일) 이후로 선택해 주세요.");
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
				params.push({name: "personalImpost", value: $("#form_delete input:hidden[name=personalImpost]").val()});
				
				$.ajax({
					type: "POST",
					async: false,
					url: '<c:url value="/MM1/MM1_2/MM1_12/InsertPayment.do" />',
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
				
			var dcode = $("#form_delete input:hidden[name=detailItemCode]").val();
			$("#idnNo").val($("#form_delete input:hidden[name=idnNo]").val());
			$("#paymentDate").val($("#form_delete input:hidden[name=paymentDate]").val());
			$("#classItemCode").val($("#form_delete input:hidden[name=classItemCode]").val());
			$("#detailItemCode").val(dcode);
			
			var xcheck = $("#xdata").val();
			if(dcode=="1000" && xcheck == "Y") {
				$("#payment").val($("#form_delete input:hidden[name=dollar]").val());
				$("#exText2").html("납부금은 ($)로 금액을 적어주세요.");
			}else{
				$("#payment").val($("#form_delete input:hidden[name=payment]").val());
				$("#exText2").html("납부금은 (won)로 금액을 적어주세요.");
			}
			
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
			
			maskMoney();
		});
		 
		$("#p_pay_edit").on("click", function(){
			var gdate = $("#form_delete input:hidden[name=genDate]").val();
		 	var pdate  = $("#form-insert #paymentDate").val();
		 	if(pdate == "" || pdate.length != 10 || pdate == "____.__.__"){
				alert("납부일을 선택해 주세요.");
				return;
			}
		 	
		 	if(gdate.replace(/\./g, '') > pdate.replace(/\./g, '')) {
		 		alert("납부일은 부과일(약정일) 이후로 선택해 주세요.");
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
			params.push({name: "personalImpost", value: $("#form_delete input:hidden[name=personalImpost]").val()});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_2/MM1_12/UpdatePayment.do" />',
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
				url:  '<c:url value="/MM1/MM1_2/MM1_12/DeletePayment.do" />',
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
			var personalimpost = $(this).find("input:hidden[name=pim]").eq(0).val();
			var payment = $(this).find("input:hidden[name=payment]").eq(0).val();
			var paymentcount = $(this).find("input:hidden[name=paymentcount]").eq(0).val();
			var paymentdefect = $(this).find("input:hidden[name=paymentdefect]").eq(0).val();
			var dollar = $(this).find("input:hidden[name=dollar]").eq(0).val();
			var xcheck = $(this).find("input:hidden[name=xcheck]").eq(0).val();
			var gdate = $(this).find("td").eq(0).text();
			var pdate = $(this).find("td").eq(5).text();
			
			// 삭제
			$("#form_delete input:hidden[name=idnNo]").val($.trim(idnno));
			$("#form_delete input:hidden[name=genDate]").val($.trim(gdate));
			$("#form_delete input:hidden[name=classItemCode]").val($.trim(classitem));
			$("#form_delete input:hidden[name=detailItemCode]").val($.trim(detailitem));
			$("#form_delete input:hidden[name=caYm]").val($.trim(caym));
			$("#form_delete input:hidden[name=balance]").val($.trim(balance));
			$("#form_delete input:hidden[name=impost]").val($.trim(impost));
			$("#form_delete input:hidden[name=personalImpost]").val($.trim(personalimpost));
			$("#form_delete input:hidden[name=payment]").val($.trim(payment));
			$("#form_delete input:hidden[name=dollar]").val($.trim(dollar));
			$("#form_delete input:hidden[name=paymentDate]").val($.trim(pdate));
			$("#form_delete input:hidden[name=paymentCount]").val($.trim(paymentcount));
			$("#form_delete input:hidden[name=paymentDefect]").val($.trim(paymentdefect));
			$("#xdata").val(xcheck);				
		});
		
		/*
			세부항목코드 - 선택시
		*/
		$("#detailItemCode").change(function() {
			var vdata = $("#classItemCode").val();
			var idata = $(this).val();
			var xdata = "";
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_2/MM1_09/CodeType.do" />',
				data: {code : vdata, groupCode : '4100', detailcode : idata, returnCode : "CODE3"},
				dataType: 'json',
				success: function(data) {
					xdata = data.selectData;
					
					if(xdata == "$"){
						$("#exText").html("약정금은 ($)로 금액을 적어주세요.");
						$("#xdata").val("Y");
					}else{
						$("#exText").html("약정금은 (won)로 금액을 적어주세요.");
						$("#xdata").val("N");
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
				}
			});			
		});
		
		/*
			구분
		 */
		$("#organCodeSearch").on("click", function(){
			var params = [];
			params.push({name:"lvl", value:3});
			params.push({name:"koName", value:$("#kindName").val()});
			params.push({name:"returnFunction", value:"kindCodeResult"}); // 팝업에서 리턴할 function
			organSearchPopup(params);
		});
		
		$("#kindName").on("keyup", function(e){
			var key = e.charCode || e.keyCode || 0;
			
			if(key == 8 && !$(this).prop("readonly")){
				$(this).val("");
				$("#kindCode").val("");
			}	
		});
		
		// 소속클럽 검색
		$("#kindName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 && !$(this).prop("readonly")) {
				$("#organCodeSearch").trigger("click");
			}
		});
	});
});

function kindCodeResult(value){
	 $("#kindName").val($.url(value).param("koName"));
	 $("#kindCode").val($.url(value).param("organCode"));
}

function _search(){
	$("#form_list").submit();
}

function maskMoney(){
	$("input:text[name=impost]").comma();
	$("input:text[name=payment]").comma();	
}
</script>

<form:form id="form_list" modelAttribute="MM1_12VO" action="/MM1/MM1_2/MM1_12/MM1_12.do">

	<h3><div>약정금 등록/납입</div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<div class="table">
		<h4>약정금 등록/납입</h4>
		<div class="btnBox">
			<img id="button_payment" src="/images/lionsclubs/btn/btn_pay_input.gif" alt="납부금 입력" style="width:94px" class="pointer authorization write" />
			<img id="button_payment_update" src="/images/lionsclubs/btn/btn_pay_modi.gif" alt="납부금 수정" style="width:94px" class="pointer authorization write" />
			<img id="button_payment_delete" src="/images/lionsclubs/btn/btn_pay_del.gif" alt="납부금 삭제" style="width:94px" class="pointer authorization write" />&nbsp;&nbsp;
			<img id="button_insert" src="/images/lionsclubs/btn/btn_regi.gif" alt="등록" style="width:57px" class="pointer authorization write" />
			<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write" />
			<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="약정금 등록/납입표">
				<caption>약정금 등록/납입</caption>
				<colgroup>
					<col width="80px" />
					<col width="90px" />
					<col width="*" />
					<col width="90px" />
					<col width="90px" />
					<col width="80px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">약정일</th>
						<th rowspan="2">구분</th>
						<th rowspan="2">항목</th>
						<th colspan="2">약정금</th>
						<th colspan="3">납부금</th>
						<th colspan="2">결손금</th>
						<th colspan="2">잔액</th>
					</tr>
					<tr>
						<th>＄</th>
						<th>금액</th>
						<th>납부일</th>
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
			<table id="table_list" class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="90px" />
					<col width="*" />
					<col width="90px" />
					<col width="90px" />
					<col width="80px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<tbody>
					<c:set var="paymentTotal1" value="0" />
					<c:set var="paymentTotal2" value="0" />
					<c:set var="paymentTotal3" value="0" />
					<c:set var="paymentTotal4" value="0" />
					<c:set var="paymentDefectDollar" value="0" />
					<c:set var="paymentDefect" value="0" />
					<c:set var="paymentTotal5" value="0" />
					<c:set var="paymentTotal6" value="0" />	
					<c:set var="b_pcount" value="1" />
					<c:set var="b_idnNo" value="" />	
					<c:forEach items="${resultList}" var="list" varStatus="status">	
						<tr>
							<c:choose>
								<c:when test="${b_idnNo eq list.idnNo }">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</c:when>
								<c:otherwise>
									<td>
										<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
										<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
									</td>
									<td class="left" title="${list.kindName }">${list.kindName }</td>
									<td class="left" title="${list.detailItemName }">${list.detailItemName }</td>					
									<td class="right"><fmt:formatNumber value="${list.dollar }" pattern="#,###.##" /></td>
									<td class="right"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>
								</c:otherwise>		
							</c:choose>
							
							<td>
								<fmt:parseDate var="paymentDate" value="${list.paymentDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${paymentDate }" pattern="yyyy.MM.dd" />
							</td>
							
							<td class="right">
								<c:if test="${list.paymentDefect ne 'Y'}">
									<fmt:formatNumber value="${list.paymentDollar }" pattern="#,###.##" />
								</c:if>
							</td>
							<td class="right">
								<c:if test="${list.paymentDefect ne 'Y'}">
									<fmt:formatNumber value="${list.payment }" pattern="#,###" />
								</c:if>
							</td>
							
							<td class="right">
								<c:if test="${list.paymentDefect eq 'Y'}">
									<fmt:formatNumber value="${list.paymentDollar }" pattern="#,###.##" />
								</c:if>
							</td>
							<td class="right">
								<c:if test="${list.paymentDefect eq 'Y'}">
									<fmt:formatNumber value="${list.payment }" pattern="#,###" />
								</c:if>
							</td>
													
							<c:choose>
								<c:when test="${b_pcount eq list.pcount || list.pcount eq 1 || list.pcount eq 0}">
									<td class="right"><fmt:formatNumber value="${list.balanceDollar }" pattern="#,###.##" /></td>
									<td class="right"><fmt:formatNumber value="${list.balance }" pattern="#,###" /></td>
									<c:set var="b_pcount" value="0" />
								</c:when>
								<c:otherwise>
									<td class="right"></td>
									<td class="right"></td>
								</c:otherwise>		
							</c:choose>
							
							<input type="hidden" name="idn" value="${list.idnNo }" />  
							<input type="hidden" name="classitem" value="${list.classItemCode }" />  
							<input type="hidden" name="detailitem" value="${list.detailItemCode }" />  
							<input type="hidden" name="payment" value="${list.payment }" />  
							<input type="hidden" name="paymentcount" value="${list.paymentCount }" />  
							<input type="hidden" name="paymentdefect" value="${list.paymentDefect }" />  
							<input type="hidden" name="dollar" value="${list.paymentDollar }" />  
							<input type="hidden" name="caym" value="${list.caYm }" />  
							<input type="hidden" name="balance" value="${list.balance }" /> 
							<input type="hidden" name="im" value="${list.impost }" />  
							<input type="hidden" name="pim" value="${list.personalImpost }" /> 
							<input type="hidden" name="xcheck" value="${list.xdata }" />  
						</tr>
						
						<c:if test="${list.paymentDefect ne 'Y'}">
							<c:set var="paymentTotal3" value="${paymentTotal3 + list.paymentDollar }" />
							<c:set var="paymentTotal4" value="${paymentTotal4 + list.payment }" />
						</c:if>
						
						<c:if test="${list.paymentDefect eq 'Y'}">
							<c:set var="paymentDefectDollar" value="${paymentDefectDollar + list.paymentDollar }" />
							<c:set var="paymentDefect" value="${paymentDefect + list.payment }" />
						</c:if>
						
						<c:if test="${b_idnNo ne list.idnNo }">
							<c:set var="paymentTotal1" value="${paymentTotal1 + list.dollar }" />	
							<c:set var="paymentTotal2" value="${paymentTotal2 + list.impost }" />
							<c:set var="paymentTotal5" value="${paymentTotal5 + list.balanceDollar }" />		
							<c:set var="paymentTotal6" value="${paymentTotal6 + list.balance }" />
						</c:if>
						
						<c:set var="b_pcount" value="${b_pcount+1 }" />
						<c:set var="b_idnNo" value="${list.idnNo}" />	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="약정금 등록/납입표">
				<caption>약정금 등록/납입</caption>
				<colgroup>
					<col width="80px" />
					<col width="90px" />
					<col width="*" />
					<col width="90px" />
					<col width="90px" />
					<col width="80px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3">총계</th>
						<th class="right"><fmt:formatNumber value="${paymentTotal1}" pattern="#,###.##" /></th>
						<th class="right"><fmt:formatNumber value="${paymentTotal2}" pattern="#,###" /></th>
						<th></th>
						<th class="right"><fmt:formatNumber value="${paymentTotal3}" pattern="#,###.##" /></th>
						<th class="right"><fmt:formatNumber value="${paymentTotal4}" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${paymentDefectDollar}" pattern="#,###.##" /></th>
						<th class="right"><fmt:formatNumber value="${paymentDefect}" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${paymentTotal5}" pattern="#,###.##" /></th>
						<th class="right"><fmt:formatNumber value="${paymentTotal6}" pattern="#,###" /></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->
	</div><!-- table -->
	
	<form:hidden path="memberNo" />
	<form:hidden path="organCode"/>
</form:form>

<form name="form_delete" id="form_delete" >
<input type="hidden" name="memberNo" value="${MM1_12VO.memberNo }" /> 
<input type="hidden" name="organCode" value="${MM1_12VO.organCode }" /> 
<input type="hidden" name="idnNo" />  
<input type="hidden" name="genDate" /> 
<input type="hidden" name="paymentDate" />
<input type="hidden" name="paymentCount" />
<input type="hidden" name="paymentDefect" />
<input type="hidden" name="classItemCode" /> 
<input type="hidden" name="detailItemCode" /> 
<input type="hidden" name="caYm" />
<input type="hidden" name="balance" />
<input type="hidden" name="impost" />
<input type="hidden" name="personalImpost" />
<input type="hidden" name="payment" />
<input type="hidden" name="dollar" />
</form>	

<!-- 약정금 입력 창 -->
<div id="dialog-commitment" class="dialog" style="display: none;">
	<form:form id="form-insert" modelAttribute="MM1_12VO" action="/MM1/MM1_2/MM1_12/Insert.do">
		<form:hidden path="classItemCode" />
		<form:hidden path="memberNo" />
		<form:hidden path="organCode"/>
		<form:hidden path="xdata" /> <!-- $로 계산할건지 체크 --> 
	
		<div id="popup">
			<h3><div>약정금 추가</div></h3>
			
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>약정일</th>
							<td>
								<form:input path="genDate" cssClass="input" />
							</td>
						</tr>
						<tr>
							<th>항목</th>
							<td>
								<lions:codeselect path="detailItemCode" groupCode="4500" />
							</td>
						</tr>
						<tr>
							<th>지구구분</th>
							<td>
								<form:input path="kindName" cssClass="input" size="40" cssStyle="ime-mode:active" />
								<form:hidden path="kindCode" required="true" />
								<img id="organCodeSearch" alt="검색" src="/images/lionsclubs/btn/btn_post_search.gif" class="pointer" />
							</td>
						</tr>
						<tr>
							<th>약정금</th>
							<td>
								<span id="exText" style="font-size:11px;">약정금은 (won)로 금액을 적어주세요.</span><br/>
								<form:input path="impost" cssClass="input" size="25" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg : 약정금 입력 -->
			
			<div class="popup_bg" style="display:none;">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>납부일</th>
							<td>
								<form:input path="paymentDate" cssClass="input" />
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
							<th>납부금</th>
							<td>
								<span id="exText2" style="font-size:11px;">납부금은 (won)로 금액을 적어주세요.</span><br/>
								<form:input path="payment" cssClass="input" size="25" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg : 납부금 입력 -->
			
			<div class="popupBtn">
				<img id="p_save" src="/images/lionsclubs/btn/btn_save.gif" style="width:57px" class="pointer" />
				<img id="p_edit" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px;display:none;" class="pointer" />
				<img id="p_pay" src="/images/lionsclubs/btn/btn_pay.gif" style="width:57px;display:none;" class="pointer" />
				<img id="p_pay_edit" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px;display:none;" class="pointer" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" style="width:57px" /></a>
			</div>
		
		</div><!-- popup -->
	</form:form>
</div>
