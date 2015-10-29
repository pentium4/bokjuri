<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#paymentDate").datepicker();
		$(".paymentDate").datepicker();
		$(".paymentDate").val($.datepicker.formatDate($.datepicker.ATOM, new Date()));		// 오늘날짜 셋팅!
		$("#payment").maskMoney({precision:0}).numericOnly();
		$(".payment").maskMoney({precision:0}).numericOnly();
		
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
				alert("납부할 회원을 선택해 주세요.");
				return false;
			}		
			
			var params = [];
			params.push({name: "organCode", value: "${MM2_14VO.organCode}"});
			
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
				var paymentDefect = tr.find(".paymentDefect").is(":checked") ? "Y" : "N";
				
				params.push({name: "paymentArray["+index+"].idnNo", value: $(this).val()});
				params.push({name: "paymentArray["+index+"].paymentDate", value: tr.find(".paymentDate").val()});
				params.push({name: "paymentArray["+index+"].payment", value: tr.find(".payment").val()});
				params.push({name: "paymentArray["+index+"].paymentDefect", value: paymentDefect});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM2/MM2_2/MM2_14/payment.do" />',
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
		    					html += "		</tr>";
		    					html += "	</thead>";
		    					html += "	<tbody>";
		    					
		    					$.each(data.resultList, function(index, object){
									var paymentDate = object.paymentDate == null ? '' : Date.parseExact(object.paymentDate, 'yyyyMMdd').toString('yyyy.MM.dd');
									var paymentDefect = object.paymentDefect == "Y" ? "○" : "";
									
		   							html += "	<tr data-paymentcount=" + object.paymentCount + ">";
		   							html += "		<td>" + paymentDate + "</td>";
		   							html += "		<td class='right'>" + comma(Math.round(object.payment)) + "</td>";
		   							html += "		<td>" + paymentDefect + "</td>";
		   							html += "	</tr>";
		    					});
		    					
		    					if(data.resultList.length == 0){
		   							html += "	<tr>";
		   							html += "		<td colspan='3'>납부내역이 없습니다.</td>";
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
	});
});

/**
 * 전회원 납부금의 총 납부금액, 납부인원을 구한다.
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

<form:form id="MM2_14VO" modelAttribute="MM2_14VO">
	<h3><div>전회원 부과금 납부</div></h3>
	
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
						<fmt:parseDate var="genDate" value="${MM2_14VO.genDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
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
				<c:if test="${MM2_14VO.classItemCode eq '1060' }">
					<tr>
						<th>클럽부담금</th>
						<td class="right"><fmt:formatNumber value="${MM2_14VO.clubPayment }" pattern="#,###" /></td>
						<th>금액전달회원</th>
						<td>${MM2_14VO.deliveryMemberNo } ${MM2_14VO.deliveryMemberName }</td>
					</tr>
					<tr>
						<th>방문지역</th>
						<td colspan="3">${MM2_14VO.inexDesc }</td>
					</tr>							
				</c:if>
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
					<col width="80px" />
					<col width="110px" />
					<col width="110px" />
					<col width="110px" />
					<col width="110px" />
					<col width="40px" />
					<col width="110px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="idnNoAll" /></th>
						<th>회원번호</th>
						<th>이름</th>
						<th>부과금</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>잔액</th>
						<th>납부일</th>
						<th>결손</th>
						<th>납부금</th>
						<th>참고사항</th>
						<th>상세</th>
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
					<col width="80px" />
					<col width="110px" />
					<col width="110px" />
					<col width="110px" />
					<col width="110px" />
					<col width="40px" />
					<col width="110px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }">
						<fmt:parseNumber var="balance" type="number" value="${list.balance }" />
						<tr>
							<td>
								<c:if test="${balance > 0}">
									<input type="checkbox" class="idnNo" value="${list.idnNo }" />
								</c:if>
							</td>
							<td>${list.memberNo }</td>
							<td>${list.name }</td>
							<td class="right"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.payment }" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.balance }" pattern="#,###" /></td>
							<c:choose>
								<c:when test="${balance > 0}">
									<td><input type="text" class="paymentDate input date required" caption="납부일" /></td>
									<td><input type="checkbox" class="paymentDefect" /></td>
									<td><input type="text" class="payment input required" size="10" caption="납부금" /></td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td></td>
									<td></td>
								</c:otherwise>
							</c:choose>
							<td class="left" title="${list.reference }">${list.reference }</td>
							<td>
								<a href="#" class="paymentDetail" data-idnno="${list.idnNo }">상세</a>
							</td>
						</tr>
					</c:forEach>
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
									입력납부금 : <span id="totalPayment">0</span>
								</li>
								<li>
									입력결손금 : <span id="totalPaymentDefect">0</span>
								</li>
								<li>
									입력인원 : <span id="memberCnt">0</span>
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
