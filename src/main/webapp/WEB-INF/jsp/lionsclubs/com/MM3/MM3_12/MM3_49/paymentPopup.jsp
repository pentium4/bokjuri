<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#paymentDate").datepicker();
		$(".paymentDate").datepicker();
		$(".paymentDate").val($.datepicker.formatDate($.datepicker.ATOM, new Date()));		// 오늘날짜 셋팅!
		
		if("${MM3_49VO.dollarKind }" == "$"){
			$("#payment").maskMoney({precision:2}).numericOnly();
			$(".payment").maskMoney({precision:2}).numericOnly();
		} else {
			$("#payment").maskMoney({precision:0}).numericOnly();
			$(".payment").maskMoney({precision:0}).numericOnly();
		}
		
		$("#idnNoAll").on("click", function(){
			$(".idnNo").prop("checked", $(this).is(":checked"));
			paymentTotal();
		});
		
		$(".idnNo").on("change", function(){
			var total = $(".idnNo:enabled").length;
			var checkLen = $(".idnNo:checked").length;
			if(total == checkLen){
				$("#idnNoAll").prop("checked", true);
			} else {
				$("#idnNoAll").prop("checked", false);
			}
			
			paymentTotal();
		}).change();
		
		$(".payment").on("keyup", function(){
			paymentTotal();
		});
		
		$(".payment").trigger("keyup");
		
		$(".paymentDefect").on("change", function(){
			paymentTotal();	
		});
		
		
		$("#btnPayment").on("click", function(){
			if($(".idnNo:checked").length == 0){
				alert("납부할 클럽을 선택해 주세요.");
				return false;
			}		
			
			var params = [];
			params.push({name: "organCode", value: "${MM3_49VO.organCode}"});
			
			var returnCheck = true;
			
			$(".idnNo:checked").each(function(index){
				var tr = $(this).closest("tr");
				if(!tr.find(".paymentDate").valid()){
					returnCheck = false;
					return false;
				}
				
				if(!tr.find(".payment").valid()){
					returnCheck = false;
					return false;
				}
				
				if(tr.find(".payment").val() == 0){
					alert("납부금을 입력해 주세요.");
					tr.find(".payment").focus();
					returnCheck = false;
					return false;
				}
			});
			
			if(!returnCheck){
				return false;
			}
			
			$(".idnNo:checked").each(function(index){
				var tr = $(this).closest("tr");
				
				params.push({name: "paymentArray[" + index + "].idnNo", value: $(this).val()});
				params.push({name: "paymentArray[" + index + "].paymentDate", value: tr.find(".paymentDate").val()});
				params.push({name: "paymentArray[" + index + "].payment", value: tr.find(".payment").val()});
				params.push({name: "paymentArray[" + index + "].paymentDefect", value: tr.find(".paymentDefect:checked").val()});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM3/MM3_12/MM3_49/payment.do" />',
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
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});		
		});
		
		$("#allPaymentDate").on("click", function(){
			$(".idnNo:checked").each(function(){
				var tr = $(this).closest("tr");
				tr.find(".paymentDate").val($("#paymentDate").val());
			});
		});
		
		$("#allPayment").on("click", function(){
			$(".idnNo:checked").each(function(){
				var tr = $(this).closest("tr");
				tr.find(".payment").val($("#payment").val());
			});
			
			$(".payment").trigger("keyup");
		});
		
		$('.paymentDetail').tooltipster({
		     content: '납부내역 불러오는중...'
		    ,contentAsHTML: true
		    ,trigger: "click"
		    ,position: "right"
		    ,functionBefore: function(origin, continueTooltip) {
		        // we'll make this function asynchronous and allow the tooltip to go ahead and show the loading notification while fetching our data
		        continueTooltip();
		        
		        // next, we want to check if our data has already been cached
		        if (origin.data('ajax') !== 'cached') {
		        	var data = $(this).data();
		        	var idnNo = data.idnno;
		    		var params = [];
		    		params.push({name: "idnNo", value: idnNo});
		    		
		    		$.ajax({
		    			type: "POST",
		    			url: '<c:url value="/MM3/MM3_12/MM3_46/listPayment.do" />',
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
		    					html += "			<th>납부금($)</th>";
		    					html += "			<th>결손</th>";
		    					html += "		</tr>";
		    					html += "	</thead>";
		    					html += "	<tbody>";
		    					
		    					$.each(data.resultList, function(index, object){
									var paymentDate = object.paymentDate == null ? '' : Date.parseExact(object.paymentDate, 'yyyyMMdd').toString('yyyy.MM.dd');
									var paymentDefect = object.paymentDefect == "Y" ? "○" : "";
									
		   							html += "	<tr>";
		   							html += "		<td>" + paymentDate + "</td>";
		   							html += "		<td class='right'>" + comma(Math.round(object.payment)) + "</td>";
		   							html += "		<td class='right'>" + comma(Math.round(object.paymentDollar)) + "</td>";
		   							html += "		<td>" + paymentDefect + "</td>";
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
		    				}
		    			},
		    			error:function(request,status,error){
		    				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    			}
		    		});	        	
		        }
		    }
		});
		
		$("#btnFullPayment").on("click", function(){
			$(".idnNo:checked").each(function(){
				var tr = $(this).closest("tr");
				tr.find(".btnFullPayment").trigger("click");
			});
		});
		
		$(".btnFullPayment").on("click", function(){
			var $tr = $(this).closest("tr");
			var data = $(this).data();
			
			if("${MM3_49VO.dollarKind}" == "$"){
				$tr.find(".payment").val(parseFloat(data.paymentbal).toFixed(2));
				$tr.find(".payment").maskMoney({precision:2}).numericOnly();
			} else {
				$tr.find(".payment").val(data.paymentbal);
				$tr.find(".payment").maskMoney({precision:0}).numericOnly();
			}
		});		
	});
});

/**
 * 전클럽 납부금의 총 납부금액, 납부인원을 구한다.
 */
function paymentTotal(){
	var totalPayment = 0;
	var totalPaymentDefect = 0;
	
	$(".idnNo:checked").each(function(index){
		var $tr = $(this).closest("tr");
		var payment = $tr.find(".payment").val().replaceAll(",", "");
		
		if($tr.find(".paymentDefect").is(":checked")){
			totalPaymentDefect += eval(payment == "" ? 0 : payment);	
		} else {
			totalPayment += eval(payment == "" ? 0 : payment);
		}
	});
	
	$("#totalPayment").text(comma(totalPayment));
	$("#totalPaymentDefect").text(comma(totalPaymentDefect));
	$("#memberCnt").text(comma($(".idnNo:checked").length));
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
	<h3><div>전클럽 부과금 납부</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="300px" />
				<col width="120px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>부과일자</th>
					<td colspan="3">
						<fmt:parseDate var="genDate" value="${MM3_49VO.genDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
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
					<th>납부일자</th>
					<td>
						<input type="text" id="paymentDate" class="input" size="36" />
						<a id="allPaymentDate" href="#">전체적용</a>
					</td>
					<th>납 부 금</th>
					<td>
						<input type="text" id="payment" class="input" size="25" />
						<img id="allPayment" class="pointer" src="/images/lionsclubs/btn/btn_imposition.gif" alt="부과" />
						<img id="btnFullPayment" alt="완납" src="/images/lionsclubs/btn/btnFullPayment.png" class="pointer" />
					</td>
				</tr>
			</tbody>
		</table>
			
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup">
				<colgroup>
					<col width="30px" />
					<col width="80px" />
					<col width="60px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="110px" />
					<col width="40px" />
					<col width="180px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="idnNoAll" /></th>
						<th>클럽코드</th>
						<th>클럽명</th>
						<th>부과금</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>잔액</th>
						<th>납부일</th>
						<th>결손</th>
						<th>납부금</th>
						<th>참고사항</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="table_mlist" class="tblPopupH2" style="height: 320px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="80px" />
					<col width="60px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="110px" />
					<col width="40px" />
					<col width="180px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }">
						<c:choose>
							<c:when test="${list.dollarKind eq '$'}">
								<fmt:parseNumber var="balance" type="number" value="${list.paymentDollarBal }" />
							</c:when>
							<c:otherwise>
								<fmt:parseNumber var="balance" type="number" value="${list.paymentBal }" />
							</c:otherwise>
						</c:choose>
						
						<tr>
							<td>
								<c:if test="${balance > 0}">
									<input type="checkbox" class="idnNo" value="${list.idnNo }" />
								</c:if>
							</td>
							<td>${lions:formatOrganCode(list.clubCode) }</td>
							<td title="${list.clubName }">${list.clubName }</td>
							
							<fmt:formatNumber var="impostDollar" value="${list.impostDollar }" pattern="$ #,###.##"/>
							<td class="right" title="${list.dollarKind eq '$' ? impostDollar : '' }"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>
							<fmt:formatNumber var="paymentDollar" value="${list.paymentDollar }" pattern="$ #,###.##"/>
							<td class="right" data-idnno="${list.idnNo }" title="${list.dollarKind eq '$' ? paymentDollar : '' }">
								<a href="#" class="paymentDetail" data-idnno="${list.idnNo }">
									<fmt:formatNumber value="${list.payment }" pattern="#,###" />
								</a>
							</td>
							<fmt:formatNumber var="paymentDollarDefect" value="${list.paymentDollarDefect }" pattern="$ #,###.##"/>
							<td class="right" data-idnno="${list.idnNo }" title="${list.dollarKind eq '$' ? paymentDollarDefect : '' }">
								<a href="#" class="paymentDetail" data-idnno="${list.idnNo }">
									<fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" />
								</a>
							</td>
							<fmt:formatNumber var="paymentDollarBal" value="${list.paymentDollarBal }" pattern="$ #,###.##"/>
							<td class="right" data-idnno="${list.idnNo }" title="${list.dollarKind eq '$' ? paymentDollarBal : '' }">
								<a href="#" class="paymentDetail" data-idnno="${list.idnNo }">
									<fmt:formatNumber value="${list.paymentBal }" pattern="#,###" />
								</a>
							</td>
							<c:choose>
								<c:when test="${balance > 0}">
									<td><input type="text" class="paymentDate input date required" caption="납부일" /></td>
									<td><input type="checkbox" class="paymentDefect" value="Y" /></td>
									<td>
										<input type="text" class="payment input required" size="12" caption="납부금" />
										<img alt="완납" src="/images/lionsclubs/btn/btnFullPayment.png" class="pointer btnFullPayment" data-paymentbal="${list.dollarKind eq '$' ? list.paymentDollarBal : list.paymentBal }" />
									</td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td></td>
									<td></td>
								</c:otherwise>
							</c:choose>
							<td class="left" title="${list.reference }">${list.reference }</td>
						</tr>
					</c:forEach>
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
									입력납부금 : <span id="totalPayment">0</span>
								</li>
								<li>
									입력결손금 : <span id="totalPaymentDefect">0</span>
								</li>
								<li>
									입력클럽 : <span id="memberCnt">0</span>
								</li>
							</ul>
						</th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->			
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="btnPayment" title="납부" src="/images/lionsclubs/btn/btn_pay.gif" style="width:57px" class="pointer" />
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
