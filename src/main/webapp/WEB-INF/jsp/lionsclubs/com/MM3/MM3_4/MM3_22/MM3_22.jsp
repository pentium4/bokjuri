<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$(".paymentDate").datepicker();
		$(".paymentDollar").maskMoney({precision:0}).numericOnly();
		$(".payment").maskMoney({precision:0}).numericOnly();
		
		//기관 클럽코드 세팅
		$("#clubCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM3_22VO.clubCode}"
		});
		
		$("#sessionYear").sessionYearCombo({
			   fixVal: "${MM3_22VO.sessionYear}"  
			  ,top:false
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
		
		$("#btnPayment").on("click", function(){
			var check = false;
			$(".tblType2 tbody tr").each(function(index){
				var $this = $(this);
				var data = $this.data();
				if($this.find(".paymentDate").val() != undefined){
					var payment = "";
					if(data.dollaryn == "Y"){
						payment = $this.find(".paymentDollar").val();
					} else {
						payment = $this.find(".payment").val();
					}
					
					if(!$this.find(".paymentDate").val().isEmpty() && !payment.isEmpty()){
						check = true;
						return false;
					}
				}
			});
			
			if(!check){
				alert("납부일자와 금액을 입력해 주세요.");
				$(".paymentDate").eq(0).focus();
				return false;
			}
			
			var params = $("form").serializeArray();
			var i = 0;
			$(".tblType2 tbody tr").each(function(index){
				var $this = $(this);
				var data = $this.data();
				if($this.find(".paymentDate").val() != undefined){
					
					var payment = "";
					if(data.dollaryn == "Y"){
						payment = $this.find(".paymentDollar").val();
					} else {
						payment = $this.find(".payment").val();
					}
					
					if(!$this.find(".paymentDate").val().isEmpty() && !payment.isEmpty()){					
						params.push({name: "clubPaymentArray[" + i + "].clubCode", value: "${MM3_22VO.clubCode}"});
						params.push({name: "clubPaymentArray[" + i + "].sessionYear", value: "${MM3_22VO.sessionYear}"});
						params.push({name: "clubPaymentArray[" + i + "].districtCode", value: data.districtcode});
						params.push({name: "clubPaymentArray[" + i + "].firstSecKind", value: data.firstseckind});
						params.push({name: "clubPaymentArray[" + i + "].itemKindCode", value: data.itemkindcode});
						params.push({name: "clubPaymentArray[" + i + "].itemCode", value: data.itemcode});
						params.push({name: "clubPaymentArray[" + i + "].dollarYN", value: data.dollaryn});
						params.push({name: "clubPaymentArray[" + i + "].paymentDate", value: $this.find(".paymentDate").val()});
						if(data.dollaryn == "Y"){
							params.push({name: "clubPaymentArray[" + i + "].paymentDollar", value: $this.find(".paymentDollar").val()});	
						} else {
							params.push({name: "clubPaymentArray[" + i + "].payment", value: $this.find(".payment").val()});	
						}
						
						i++;
					}
				}
			});
			
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM3/MM3_4/MM3_22/payment.do" />',
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
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});		
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
		        	var tr = $(this).closest("tr");
		        	var data = tr.data();
		    		var params = [];
		    		
		    		params.push({name: "sessionYear", value: "${MM3_22VO.sessionYear}"});
		    		params.push({name: "clubCode", value: "${MM3_22VO.clubCode}"});
		    		params.push({name: "firstSecKind", value: data.firstseckind});
		    		params.push({name: "itemKindCode", value: data.itemkindcode});
		    		params.push({name: "itemCode", value: data.itemcode});
		    		
		    		$.ajax({
		    			type: "POST",
		    			url: '<c:url value="/MM3/MM3_4/MM3_22/listClubPayment.do" />',
		    			data: params,
		    			dataType: 'json',
		    			success: function(data) {
		    				var html = "";
		    				if(data.result){
		    					html += "<table class='tblType2'>";
		    					html += "	<thead>";
		    					html += "		<tr>";
		    					html += "			<th rowspan='2'>납부일자</th>";
		    					html += "			<th colspan='2'>납부금액</th>";
		    					html += "		</tr>";
		    					html += "		<tr>";
		    					html += "			<th>$</th>";
		    					html += "			<th>금액</th>";
		    					html += "		</tr>";
		    					html += "	</thead>";
		    					html += "	<tbody>";
		    					
		    					$.each(data.resultList, function(index, object){
									var paymentDate = object.paymentDate == null ? '' : Date.parseExact(object.paymentDate, 'yyyyMMdd').toString('yyyy.MM.dd');
									
		   							html += "	<tr>";
		   							html += "		<td>" + paymentDate + "</td>";
		   							html += "		<td class='right'>" + comma(object.paymentDollar) + "</td>";
		   							html += "		<td class='right'>" + comma(Math.round(object.payment)) + "</td>";
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

function _search(){
	$("form").submit(); 
}
</script>
<form:form modelAttribute="MM3_22VO" action="/MM3/MM3_4/MM3_22/MM3_22.do">
	<double-submit:preventer tokenKey="mm322" />
	
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

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
			<img id="btnPayment" alt="납부금입력" src="/images/lionsclubs/btn/btn_pay_input.gif" style="margin-top:2px" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="클럽별 납부금 일괄입력 조회">
				<caption>클럽별 납부금 일괄입력 조회</caption>		
				<colgroup>
					<col width="30px" />
					<col width="60px" />
					<col width="*" />
					<col width="70px" />
					<col width="90px" />
					<col width="70px" />
					<col width="90px" />
					<col width="70px" />
					<col width="90px" />
					<col width="130px" />
					<col width="130px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">No</th>
						<th rowspan="2">분기</th>
						<th rowspan="2">부과금항목</th>
						<th colspan="2">부과금</th>
						<th colspan="2">납부금누계</th>
						<th colspan="2">잔액</th>
						<th colspan="2">납부금</th>
					</tr>
					<tr>
						<th>＄</th>
						<th>금액</th>
						<th>＄</th>
						<th>금액</th>
						<th>＄</th>
						<th>금액</th>
						<th>납부일자</th>
						<th>금액</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="60px" />
					<col width="*" />
					<col width="70px" />
					<col width="90px" />
					<col width="70px" />
					<col width="90px" />
					<col width="70px" />
					<col width="90px" />
					<col width="130px" />
					<col width="130px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList }" var="list" varStatus="status">				
						<tr data-districtcode=${list.districtCode } data-firstseckind="${list.firstSecKind }" data-itemkindcode="${list.itemKindCode }" data-itemcode=${list.itemCode } data-dollaryn=${list.dollarYN }>
							<td class="center">${status.count }</td>
							<td class="center">${list.firstSecKindName }</td>
							<td title="${list.itemName }">${list.itemName }</td>
							<td class="right paymentDetail pointer">
								<c:set var="sumDueDollar" value="${sumDueDollar + list.dueDollar }" />
								<fmt:formatNumber value="${list.dueDollar }" />
							</td>
							<td class="right paymentDetail pointer">
								<c:set var="sumDue" value="${sumDue + list.due }" />
								<fmt:formatNumber value="${list.due }" />
							</td>
							<td class="right paymentDetail pointer">
								<c:set var="sumPaymentDollar" value="${sumPaymentDollar + list.paymentDollar }" />
								<fmt:formatNumber value="${list.paymentDollar }" />
							</td>
							<td class="right paymentDetail pointer">
								<c:set var="sumPayment" value="${sumPayment + list.payment }" />
								<fmt:formatNumber value="${list.payment }" />
							</td>
							<td class="right paymentDetail pointer">
								<c:set var="sumPaymentDollarBal" value="${sumPaymentDollarBal + list.paymentDollarBal }" />
								<fmt:formatNumber value="${list.paymentDollarBal }" />
							</td>
							<td class="right paymentDetail pointer">
								<c:set var="sumPaymentBal" value="${sumPaymentBal + list.paymentBal }" />
								<fmt:formatNumber value="${list.paymentBal }" />
							</td>
							<td class="right">
								<c:if test="${list.paymentDollarBal + list.paymentBal > 0 }">
									<input type="text" class="paymentDate input" />
								</c:if>
							</td>
							<td>
								<c:if test="${list.paymentDollarBal + list.paymentBal > 0 }">
									<c:choose>
										<c:when test="${list.dollarYN eq 'Y' }"><input type="text" class="paymentDollar input" size="14" /></c:when>
										<c:otherwise><input type="text" class="payment input" size="14" /></c:otherwise>
									</c:choose>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="30px" />
					<col width="60px" />
					<col width="*" />
					<col width="70px" />
					<col width="90px" />
					<col width="70px" />
					<col width="90px" />
					<col width="70px" />
					<col width="90px" />
					<col width="130px" />
					<col width="130px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3">총 계</th>
						<th class="right"><fmt:formatNumber value="${sumDueDollar }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sumDue }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sumPaymentDollar }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sumPayment }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sumPaymentDollarBal }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sumPaymentBal }" pattern="#,###" /></th>
						<th colspan="2"></th>
					</tr>
				</tfoot>
			</table>
		</div>				
	</div><!-- table -->

</form:form>