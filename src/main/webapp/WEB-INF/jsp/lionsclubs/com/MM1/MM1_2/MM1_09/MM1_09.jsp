<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
var pageCheck = "${param.pageIndex == null ? 1 : param.pageIndex}";
var impost = 0;
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		$("#genDate").datepicker();
	// 	$(".paymentDate").datepicker();
		$(".impost").maskMoney({precision:0}).numericOnly();
		$(".payment").maskMoney({precision:0}).numericOnly();
		
		/*
		 *	회기 검색
		 */
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM1_09VO.sessionYear}"	// 고정값
		});
		
		$("#sessionYear").on("change", function(){
			_result();
		});	
		
		/*
		 * 등록 창 띄우기
		 */
		$("#btnImposedInsert").click(function() {	
			$("#dialog-imposedInsert").dialogPopup({
				 width: 500 
				,height: 280
			});
		});
		
		$("#btnIsave").on("click", function(){
			if(!$("#form_imposedInsert").valid()){
				return false;
			}
	
			var params = $("#form_imposedInsert").serializeArray();
			params.push({name: "memberNo", value: "${MM1_09VO.memberNo }"});
			params.push({name: "organCode", value: "${MM1_09VO.organCode }"});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_2/MM1_09/insert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_result();
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
		 *	수정 버튼
		 */
		$("#btnImposedUpdate").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("수정할 항목을 선택해 주세요.");
				return false;
			}
			
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			/*
				약정금, 분담금 은 여기서 수정하지 않는다.
			*/
			if(data.classitemcode == "1030"){
				alert("지구 약정금은 개인기록관리 > 개인 납부금 업무 > 약정금 등록/납부에서 수정 할 수 있습니다.");
				return false;
			}
			
			if(data.classitemcode == "1040"){
				alert("지구 임원분담금은 개인기록관리 > 개인 납부금 업무 > 지구임원분담금 납부에서 수정 할 수 있습니다.");
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				type: "POST",
				async: false,			
				url: '<c:url value="/MM1/MM1_2/MM1_09/Select.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						var sdata = data.sdata;
						var genDate = Date.parseExact(sdata.genDate, 'yyyyMMdd').toString("yyyy.MM.dd");
						
						$("#genDateText").text(genDate);
						$("#classItemNameText").text(sdata.classItemName);
						$("#detailItemNameText").text(sdata.detailItemName);
						$("#form_imposedUpdate #impost").val(sdata.impost);
						$("#form_imposedUpdate #reference").val(sdata.reference);
						
						$("#dialog-imposedUpdate").dialogPopup({
							 width: 500 
							,height: 280
						}); 
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"error:"+error);
				}
			});
		});
		
		$("#btnIEdit").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			
			if(!$("#form_imposedUpdate").valid()){
				return false;
			}
	
			var params = $("#form_imposedUpdate").serializeArray();
			params.push({name: "idnNo", value: idnNo});
					
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_2/MM1_09/update.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_result();
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
		 *	삭제 버튼
		 */
		$("#btnImposedDelete").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("삭제할 항목을 선택해 주세요.");
				return false;
			}
			
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			/*
				약정금, 분담금 은 여기서 삭제하지 않는다.
			*/
			if(data.classitemcode == "1030"){
				alert("지구 약정금은 개인기록관리 > 개인 납부금 업무 > 약정금 등록/납부에서 삭제하실수 있습니다.");
				return false;
			}
			
			if(data.classitemcode == "1040"){
				alert("지구 임원분담금은 개인기록관리 > 개인 납부금 업무 > 지구임원분담금 납부에서 삭제하실수 있습니다.");
				return false;
			}
			
			if(!confirm('선택한 항목이 삭제됩니다.\n삭제하시겠습니까?')){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			params.push({name: "organCode", value: "${MM1_09VO.organCode }"});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_2/MM1_09/delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_result();
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
		 *	납부처리
		 */
		$("#btnPsave").click(function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();		
			
			if(!$("#form_payment").valid()){
				return false;
			}
			
			var params = $("#form_payment").serializeArray();
			params.push({name: "idnNo", value: idnNo});
			params.push({name: "organCode", value: "${MM1_09VO.organCode }"});
			params.push({name: "memberNo", value: "${MM1_09VO.memberNo }"});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_2/MM1_09/UpdateFinish.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_result();
					}else{
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});		
		});
		
		var deletePayment = [];
		/*
		 *	납부금처리 버튼
		 */
		$("#btnPayment").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("납부금수정할 항목을 선택해 주세요.");
				return false;
			}
			
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			/*
				경조금, 약정금, 분담금 은 여기서 납부하지 않는다.
			*/
			if(data.classitemcode == "1030"){
				alert("지구 약정금은 개인기록관리 > 개인 납부금 업무 > 약정금 등록/납부에서 납부금수정을 할 수 있습니다.");
				return false;
			}
			
			if(data.classitemcode == "1040"){
				alert("지구 임원분담금은 개인기록관리 > 개인 납부금 업무 > 지구임원분담금 납부에서 납부금수정을 할 수 있습니다.");
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_2/MM1_09/listPayment.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						impost = data.sdata.impost;
						var html = "";
	// 					$("#form_paymentEdit tbody").empty();
						$.each(data.resultList, function(index, object){
							if(object.confirmYn == "Y"){
								var paymentDate = object.paymentDate == null ? '' : Date.parseExact(object.paymentDate, 'yyyyMMdd').toString('yyyy.MM.dd');
								var paymentDefect = object.paymentDefect == "Y" ? "○" : "";
								html += "<tr data-paymentcount=" + object.paymentCount + ">";
								html += "	<td>" + paymentDate + "</td>";
								html += "	<td class='right'><input type='hidden' name='payment' class='input payment' size='60' value='" + object.payment + "' />" + comma(object.payment) + "</td>";
								html += "	<td><input type='hidden' class='paymentDefect' value=" + object.paymentDefect + " />" + paymentDefect + "</td>";
								html += "	<td></td>";
								html += "</tr>";
							} else {
								var paymentDefect = object.paymentDefect == "Y" ? "checked=\"checked\"" : "";
								html += "<tr data-paymentcount=" + object.paymentCount + ">";
								html += "	<td><input type='text' name='paymentDate' class='input paymentDate date required' size='10' value='" + object.paymentDate + "' caption='납부일' /></td>";
								html += "	<td><input type='text' name='payment' class='input payment required' min='1' size='60' value='" + object.payment + "' caption='납부금' /></td>";
								html += "	<td><input type='checkbox' class='paymentDefect' " + paymentDefect + " /></td>";
								html += "	<td><img src='/images/lionsclubs/btn/btn_del.gif' alt='삭제' style='width:57px' class='pointer btnImposedDelete authorization write' /></td>";
								html += "</tr>";
							}
							
							totalText();
						});
						
						$("#form_paymentEdit tbody").html(html).promise().done(function(){
							if(data.resultList.length == 0){
								$("#addrow").trigger("click");
							}
							
							$(".paymentDate").mask("9999.99.99").datepicker();
							$(".payment").maskMoney({precision:0}).numericOnly();
							
							$(".btnImposedDelete").on("click", function(){
								var tr = $(this).closest("tr");
								var data = tr.data();
								deletePayment.push(data.paymentcount);	// 삭제 납부카운트 저장
								tr.remove();
								totalText();
							});
							
							totalText();
							paymentKey();
						});
						
						$("#dialog-paymentEdit").dialogPopup({
							 width: 800 
							,height: 420
						}); 
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		var btnPEdit = 0;
		$("#btnPEdit").on("click", function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(!$("#form_paymentEdit").valid()){
				return false;
			}
			
			var params = [];
			
			params.push({name: "idnNo", value:idnNo});
			params.push({name: "organCode", value:"${MM1_09VO.organCode}"});
			
			$.each(deletePayment, function(index, paymentCount){
				params.push({name: "deletePaymentArray["+index+"].idnNo", value:idnNo});
				params.push({name: "deletePaymentArray["+index+"].paymentCount", value:paymentCount});
			});
			
			var ipIndex = 0;
			var upIndex = 0;
			$(".paymentDate").each(function(index){
				var tr = $(this).closest("tr");
				var data = tr.data();
				var paymentDefect = tr.find(".paymentDefect").is(":checked") ? "Y" : "N";
				if(data.paymentcount == undefined){
					params.push({name: "insertPaymentArray[" + ipIndex + "].paymentDate", value: $(this).val()});
					params.push({name: "insertPaymentArray[" + ipIndex + "].payment", value: tr.find(".payment").val()});
					params.push({name: "insertPaymentArray[" + ipIndex + "].paymentDefect", value: paymentDefect});
					ipIndex++;
				} else {
					params.push({name: "updatePaymentArray[" + upIndex + "].paymentCount", value: data.paymentcount});
					params.push({name: "updatePaymentArray[" + upIndex + "].paymentDate", value: $(this).val()});
					params.push({name: "updatePaymentArray[" + upIndex + "].payment", value: tr.find(".payment").val()});
					params.push({name: "updatePaymentArray[" + upIndex + "].paymentDefect", value: paymentDefect});
					upIndex++;
				}
			});
			
			$(".payment").each(function(index){
				params.push({name: "paymentArray[" + index + "].payment", value: $(this).val()});	
			});
			
			if(btnPEdit == 0){
				$.ajax({
					type: "POST",
					async: false,
					url: '<c:url value="/MM1/MM1_2/MM1_09/payment.do" />',
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.result == "1"){
							_result();
						} else {
							alert(data.result);
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
			btnPEdit++;
		});
		
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/
		var tbl = $("#table_day tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".idnNo").prop("checked", true);
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");	
		
		/*
			분류항목코드 - 선택시
		*/
		$("#classItemCode").change(function() {
			var ccode = $(this).val();
			setCombo(ccode);
		});
		
		/*
		 *	세부항복코드 - 선택시
		 */
		$("#detailItemCode").change(function(){
			var vdata = $("#classItemCode").val();
			var idata = $(this).val();
			
			if(vdata == "1010" && idata == "1010") {
				var params = [];
				params.push({name: "memberNo", value: "${MM1_09VO.memberNo }"});
				params.push({name: "organCode", value: "${MM1_09VO.organCode }"});			
				
				$.ajax({
					type: "POST",
					async: false,
					url:  '<c:url value="/MM1/MM1_2/MM1_14/MM1_09_MPay.do" />',
					data: params,
					dataType: 'json',
					success: function(data) {
						if(data.selectData > 0){
							$("#form_imposedInsert .impost").val(data.selectData);
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"\n"+"error:"+error);
					}
				});	
			
			} else {
				$("#payment").val("").prop({"readonly":false}).css("background-color","#FFFFFF");
			}
		});
		
		$("#addrow").on("click", function(){
			var html = "";
			html += "<tr>";
			html += "	<td><input type='text' name='paymentDate' class='input paymentDate date required' size='10' caption='납부일' /></td>";
			html += "	<td><input type='text' name='payment' class='input payment required' min='1' size='60' caption='납부금' /></td>";
			html += "	<td><input type='checkbox' class='paymentDefect' /></td>";
			html += "	<td><img src='/images/lionsclubs/btn/btn_del.gif' alt='삭제' style='width:57px' class='pointer btnImposedDelete authorization write' /></td>";
			html += "</tr>";
			
			$("#addPayment").addrow({
				html: html
			}, function(){
				$(".paymentDate:last").mask("9999.99.99").datepicker();
				$(".paymentDate:last").val(Date.today().toString("yyyy.MM.dd"));
				$(".payment:last").maskMoney({precision:0}).numericOnly();
				$(".btnImposedDelete:last").on("click", function(){
					$(this).closest("tr").remove();
					totalText();
				});
				
				paymentKey();
			});
		});
		
		$('.paymentDetail').tooltipster({
		     content: '납부내역 불러오는중...'
		    ,contentAsHTML: true
			,interactive: true
		    ,trigger: "click"
		    ,position: "right"
		    ,functionBefore: function(origin, continueTooltip) {
		        // we'll make this function asynchronous and allow the tooltip to go ahead and show the loading notification while fetching our data
		        continueTooltip();
		        
		        // next, we want to check if our data has already been cached
		        if (origin.data('ajax') !== 'cached') {
		        	var tr = $(this).closest("tr");
		        	var idnNo = tr.find(".idnNo").val();
		        	var data = tr.data();
		    		var params = [];
		    		params.push({name: "idnNo", value: idnNo});
		    		params.push({name: "paymentCount", value: data.paymentcount});
		    		
		    		$.ajax({
		    			type: "POST",
		    			url: '<c:url value="/MM1/MM1_2/MM1_09/listPayment.do" />',
		    			data: params,
		    			dataType: 'json',
		    			success: function(data) {
		    				var html = "";
		    				if(data.result){
		    					html += "<table class='tblType2'>";
		    					html += "	<thead>";
		    					html += "		<tr>";
		    					html += "			<th>납부일자</th>";
		    					html += "			<th>납부금</th>";
		    					html += "			<th>결손</th>";
		    					html += "			<th>인쇄</th>";
		    					html += "		</tr>";
		    					html += "	</thead>";
		    					html += "	<tbody>";
		    					
		    					$.each(data.resultList, function(index, object){
									var paymentDate = object.paymentDate == null ? '' : Date.parseExact(object.paymentDate, 'yyyyMMdd').toString('yyyy.MM.dd');
									var paymentDefect = object.paymentDefect == "Y" ? "○" : "";
									
		   							html += "	<tr data-idnno='" + object.idnNo + "' data-paymentcount=" + object.paymentCount + ">";
		   							html += "		<td>" + paymentDate + "</td>";
		   							html += "		<td class='right'>" + comma(Math.round(object.payment)) + "</td>";
		   							html += "		<td>" + paymentDefect + "</td>";
		   							html += "		<td>";
		   							if(object.paymentDefect != "Y"){
		   								html += "<img class='btnPrint' src='/images/lionsclubs/btn/btn_print.gif' alt='인쇄' style='cursor: pointer; z-index: 99999;' />";	
		   							}
		   							html += "		</td>";
		   							html += "	</tr>";
		    					});
		    					
		    					if(data.resultList.length == 0){
		   							html += "	<tr>";
		   							html += "		<td colspan='4'>납부내역이 없습니다.</td>";
		   							html += "	</tr>";
		    					}
		    					
		    					html += "	</tbody>";
		    					html += "</table>";
		    					// update our tooltip content with our returned data and cache it
		    					
			                    origin.tooltipster('content', html).data('ajax', 'cached');
		    					
			            		$(".btnPrint").on("click", function(){
			            			var $tr = $(this).closest("tr");
			            			var data = $tr.data();
			            			
			            			openPopup('/MM1/MM1_2/MM1_09/receiptPrintPopup.do?sessionYear=${MM1_09VO.sessionYear}&idnNo=' + data.idnno + '&paymentCount=' + data.paymentcount, '700', '630', 'receiptPrintPopup');	
			            		});
		    				}
		    			},
		    			error:function(request,status,error){
		    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    			}
		    		});	        	
		        }
		    }
		});
	});
});

function _result(){
	$("#form_list").submit();
}

function setCombo(key) {
	var $detailItemCode = $('.detailItemCode');
	$detailItemCode.empty();
	
	var gubn = $("input:hidden[name=gubn]").val();
	
	if(key.length > 0) {
		var params = [];
		params.push({name: "code", value: key});
		params.push({name: "groupCode", value: "4100"});
		params.push({name: "gubn", value: gubn});
		
		$.ajax({
			type: "POST",
			async: false,
			url:  '<c:url value="/MM1/MM1_2/MM1_09/Code.do" />',
			data: params,
			dataType: 'json',
			success: function(data) {
				if(data.selectList){
					$detailItemCode.append("<option value=''>--선택--</option>");
					
					$.each(data.selectList, function(index, object){
						$detailItemCode.append("<option value="+ object.code +">"+ object.codeName +"</option>");
					});
				}
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}else{
		$detailItemCode.append("<option value=''>--선택--</option>");
	}
}

function totalText(){
	var payment = 0;
	var defect = 0;
	
	$("#form_paymentEdit .payment").each(function(){
		var tr = $(this).closest("tr");
		var paymentDefect;
		if(tr.find(".paymentDefect").is(":hidden")){
			paymentDefect = tr.find(".paymentDefect").val();
		} else {
			paymentDefect = tr.find(".paymentDefect").is(":checked") ? "Y" : "N";
		}
		
		if(paymentDefect == "Y"){
			defect += eval(tr.find(".payment").val().replaceAll(",", ''));
		} else {
			payment += eval(tr.find(".payment").val().replaceAll(",", ''));
		}
	});
	
	$("#totalImpost").text(comma(Math.round(impost)));
	$("#totalPayment").text(comma(payment));
	$("#totalDefect").text(comma(defect));
	$("#balance").text(comma(impost - (payment + defect)));
}

function paymentKey(){
	$(".payment").on("keyup", function(){
		totalText();
	});
	
	$(".paymentDefect").on("change", function(){
		totalText();
	});
}
</script>
<style>
.tooltipster-content {
    opacity: 1;
}
</style>
<form:form id="form_list" modelAttribute="MM1_09VO" action="/MM1/MM1_2/MM1_09/MM1_09.do">
	<form:hidden path="memberNo"/>
	<h3><div>납부금입력</div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<div class="table">
		<h4>납부금
			<em style="position:absolute; top:1px; margin-left: 50px; color:#438FE6;">
				회기선택 : <form:select path="sessionYear" cssClass="select" />
			</em>
		</h4>
		
		<div class="btnBox">	 
			<img id="btnPayment" src="/images/lionsclubs/btn/btn_pay_deal.gif" alt="납부처리" style="width:78px" class="pointer authorization write" />
			
			<img id="btnImposedInsert" src="/images/lionsclubs/btn/btn_regi.gif" alt="부과 등록" style="width:57px" class="pointer authorization write" />
			<img id="btnImposedUpdate" src="/images/lionsclubs/btn/btn_edit.gif" alt="부과 수정" style="width:57px" class="pointer authorization write" />
			<img id="btnImposedDelete" src="/images/lionsclubs/btn/btn_del.gif" alt="부과 삭제" style="width:57px" class="pointer authorization write" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="납부금 안내표">
				<caption>납부금</caption>
				<colgroup>
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>부과일자</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>부과금</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>미수금</th>
						<th colspan="2">참고사항</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table id="table_day" class="tblType2 Scroll_Table">
				<colgroup>
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.classItemCode eq '1030'}">
								<c:set var="fStyle" value="color:blue" />
							</c:when>
							<c:when test="${list.classItemCode eq '1040'}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
						</c:choose>
						<tr data-paymentcount="${list.paymentCount }" data-classitemcode="${list.classItemCode }">
							<td class="center" style="${fStyle}">
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none" />
								<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
							</td>
							<td title="${list.classItemName }" style="${fStyle}">${list.classItemName }</td>
							<td title="${list.detailItemName }" style="${fStyle}">${list.detailItemName }</td>
							<td class="right paymentDetail pointer" style="${fStyle}"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>
							<td class="right paymentDetail pointer" style="${fStyle}"><fmt:formatNumber value="${list.payment }" pattern="#,###" /></td>
							<td class="right paymentDetail pointer" style="${fStyle}"><fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" /></td>
							<td class="right paymentDetail pointer" style="${fStyle}">
								<fmt:formatNumber value="${list.impost - (list.payment + list.paymentDefect) }" pattern="#,###" />
							</td>
							<td colspan="2" style="${fStyle}">${list.reference }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="납부금 안내표">
				<caption>납부금</caption>
				<colgroup>
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="70px" />
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3">회기 누계</th>
						<th class="right">
							<fmt:formatNumber value="${paymentSum.impost}" pattern="#,###" />
						</th>
						<th class="right">
							<fmt:formatNumber value="${paymentSum.payment}" pattern="#,###" />
						</th>
						<th class="right">
							<fmt:formatNumber value="${paymentSum.paymentDefect}" pattern="#,###" />
						</th>
						<th class="right">
							<fmt:formatNumber value="${paymentSum.impost - (paymentSum.payment + paymentSum.paymentDefect)}" pattern="#,###" />
						</th>
						<th>정산일자</th>
						<th>
							<fmt:parseDate var="cdate" value="${cdate}" pattern="yyyyMMdd" />
							<fmt:formatDate value="${cdate }" pattern="yyyy.MM.dd" />
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->
	</div><!-- table -->
	<!-- 본문 내용 끝 -->
</form:form>

<!-- 약정금 입력 창 -->
<div id="dialog-imposedInsert" class="dialog" style="display: none;">
	<form:form name="form_imposedInsert" id="form_imposedInsert" modelAttribute="MM1_09VO" action="/MM1/MM1_2/MM1_09/Insert.do">
		<div id="popup">
			<h3><div>개인 부과금 등록</div></h3>
	
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>부과일자<span class="require">*</span></th>
							<td><form:input path="genDate" cssClass="input genDate date required" caption="부과일자" /></td>
						</tr>
						<tr>
							<th>분류항목<span class="require">*</span></th>
							<td>
								<select name="classItemCode" id="classItemCode" class="select required" caption="분류항목">
									<option value="">--선택--</option>
									<c:forEach items="${classList}" var="clist" varStatus="status">
										<option value="${clist.code}">${clist.codeName }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>세부항목<span class="require">*</span></th>
							<td>
								<select id="detailItemCode" name="detailItemCode" class="select detailItemCode required" caption="세부항목">
									<option value="" >--선택--</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>부 과 금<span class="require">*</span></th>
							<td><form:input path="impost" cssClass="input impost required" size="45" caption="부과금" /></td>
						</tr>
						<tr>
							<th>참고사항</th>
							<td><form:input path="reference" cssClass="input reference" size="45" /></td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg : 납부금 입력 -->
			
			<div class="popupBtn">
				<img id="btnIsave" src="/images/lionsclubs/btn/btn_save.gif" title="저장" class="pointer" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" title="닫기" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</form:form>
</div>

<div id="dialog-imposedUpdate" class="dialog" style="display: none;">
	<form:form name="form_imposedUpdate" id="form_imposedUpdate" modelAttribute="MM1_09VO" action="/MM1/MM1_2/MM1_09/Update.do">
		<div id="popup">
			<h3><div>개인 부과금 수정</div></h3>
	
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>부과일자</th>
							<td id="genDateText"></td>
						</tr>
						<tr>
							<th>분류항목</th>
							<td id="classItemNameText"></td>
						</tr>
						<tr>
							<th>세부항목</th>
							<td id="detailItemNameText"></td>
						</tr>					
						<tr>
							<th>부과금<span class="require">*</span></th>
							<td><form:input path="impost" cssClass="input impost required" size="45" caption="부과금" /></td>
						</tr>
						<tr>
							<th>참고사항</th>
							<td><form:input path="reference" cssClass="input reference" size="45" /></td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg : 납부금 입력 -->
			
			<div class="popupBtn">
				<img id="btnIEdit" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" class="pointer" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" title="닫기" style="width:57px" /></a>
			</div>
		</div><!-- popup -->
	</form:form>
</div>

<div id="dialog-paymentEdit" class="dialog" style="display: none;">
	<form:form name="form_paymentEdit" id="form_paymentEdit" modelAttribute="MM1_09VO" action="/MM1/MM1_2/MM1_09/payment.do">
		<div id="popup">
			<h3><div>개인 납부금 수정</div></h3>
			
			<div class="popup_bg">
				<div class="tblTitle" style="width:98%;border:1px solid #aaa">
					<table class="tblType2" summary="납부 리스트" style="width:98%;border: 0;">
						<colgroup>
							<col width="120px" />
							<col width="*" />
							<col width="50px" />
							<col width="80px" />
						</colgroup>
						<thead>
							<tr>
								<th>납부일</th>
								<th>납부금</th>
								<th>결손</th>
								<th>삭제</th>
							</tr>
						</thead>
					</table>
				</div>
				
				<div id="Scroll_Area" style="width:98%;overflow-y:scroll;height:200px">
					<table class="tblType2_1" id="addPayment">
						<colgroup>
							<col width="120px" />
							<col width="*" />
							<col width="50px" />
							<col width="80px" />
						</colgroup>
						<tbody>
						</tbody>									
					</table>
				</div>
				
				<div class="tblTitle" style="width:98%;border:1px solid #aaa;margin-top: 2px;">
					<table class="tblType2" summary="납부 리스트" style="width:98%;border: 0;">
						<colgroup>
							<col width="80px" />
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
							<col width="80px" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th>부과금</th>
								<th id="totalImpost"></th>
								<th>총납부금</th>
								<th id="totalPayment"></th>
								<th>총결손금</th>
								<th id="totalDefect"></th>
								<th>미수금</th>
								<th id="balance"></th>
							</tr>
						</thead>
					</table>
				</div>
				
				<div class="popupBtn">
					<img id="addrow" src="/images/lionsclubs/btn/btn_add.gif" title="추가" class="pointer" />
					<img id="btnPEdit" src="/images/lionsclubs/btn/btn_pay.gif" title="납부" class="pointer" />
					<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" title="닫기" style="width:57px" /></a>
				</div>
			</div><!-- popup_bg -->
		</div>
	</form:form>
</div>
