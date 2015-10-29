<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_46VO.sessionYear}"	// 고정값
			,top: true
		});
		
		// 지구코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_46VO.organCode}"
		},function(){
			// 지구코드 세팅
			$("#clubCode").organCode({
				 lvl: 4
				,searchable: true
				,top: "--전체--"
				,upperOrganCode: $("#organCode").val()
				,fixVal: "${MM3_46VO.clubCode}"
			});
		});
		
		$("#organCode").on("change", function(){
			// 지구코드 세팅
			$("#clubCode").organCode({
				 lvl: 4
				,searchable: true
				,top: "--전체--"
				,upperOrganCode: $(this).val()
			});
		});		
		
		var idnNo = "";
		var paymentIdnNo = "";
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2 tbody tr");
		tbl.find("td:not(:last)").on("click", function(){
			var $tr = $(this).closest("tr");			
			tbl.css("background-color","#ffffff");
			$tr.css("background-color","#E0FFE0");
			
			var data = $tr.data();
			idnNo = data.idnno;
			paymentIdnNo = data.paymentidnno;
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");
		
		$("#btnPayment").on("click", function(){
			if(idnNo.length == 0) {
				alert("납부할 항목을 선택해 주세요.");
				return false;
			}
			
			openPopup('/MM3/MM3_12/MM3_46/paymentPopup.do?idnNo=' + idnNo, '500', '300', 'paymentPopup');	
		});

		$("#btnPaymentUpdate").on("click", function(){
			if(paymentIdnNo.length == 0) {
				alert("납부수정할 항목을 선택해 주세요.");
				return false;
			}
			
			openPopup('/MM3/MM3_12/MM3_46/paymentPopup.do?idnNo=' + idnNo + '&paymentIdnNo=' + paymentIdnNo, '500', '300', 'paymentPopup');	
		});
		
		$("#btnPaymentDelete").on("click", function(){
			if(paymentIdnNo.length == 0) {
				alert("납부삭제할 항목을 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}
			
			var params = [];
			params.push({name: "paymentIdnNo", value: paymentIdnNo});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_12/MM3_46/deletePayment.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result) {
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					return false;
				}
			});			
		});
		
		$("#excelDownload").on("click", function(){
			$(window).unbind();
			$.download("/MM3/MM3_12/MM3_46/excelDownload.do?sessionYear=${MM3_46VO.sessionYear}&organCode=${MM3_46VO.organCode}&clubCode=${MM3_46VO.clubCode}&order=${MM3_46VO.order}&sessionYearOrder=${MM3_46VO.sessionYearOrder}");
		});
		
		$(".btnPrint").on("click", function(){
			var $tr = $(this).closest("tr");
			var data = $tr.data();
			
			openPopup('/MM3/MM3_12/MM3_46/receiptPrintPopup.do?paymentIdnNo=' + data.paymentidnno + '&organCode=${MM3_46VO.organCode}&sessionYear=${MM3_46VO.sessionYear}', '700', '630', 'receiptPrintPopup');	
		});		
		
		$("#btnSearch").on("click", function(){
			_search();
		});
	});
});

function _search(){
	$("#pageIndex").val(1);
	$("form").submit();
}

function _pagingFixSearch(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM3_46VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="400px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td colspan="3"><form:select path="organCode"/></td>
				</tr>
				<tr>
					<th>클럽코드</th>
					<td><form:select path="clubCode"/></td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2">
						<form:radiobutton path="order" value="1" label="부과일자" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="납부일자" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="수입분류항목별" cssClass="ml10" /><br/>
						<form:radiobutton path="order" value="4" label="수입세부항목별" cssClass="ml10" />
						<form:radiobutton path="order" value="5" label="미수금순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
						<form:radiobutton path="sessionYearOrder" value="1" label="부과회기" cssClass="ml10" />
						<form:radiobutton path="sessionYearOrder" value="2" label="납부회기" cssClass="ml10" /><br/>
					</td>
				</tr>			
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="엑셀받기" id="excelDownload" src="/images/lionsclubs/btn/btn_excel2.gif" class="pointer authorization write" />
			<img alt="조회" id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
			<img alt="납부금 입력" id="btnPayment" src="/images/lionsclubs/btn/btn_pay_input.gif" class="pointer authorization write" />
			<img alt="납부금 수정" id="btnPaymentUpdate" src="/images/lionsclubs/btn/btn_pay_modi.gif" class="pointer authorization write" />
			<img alt="납부금 삭제" id="btnPaymentDelete" src="/images/lionsclubs/btn/btn_pay_del.gif" class="pointer authorization write" />			
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="130px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="70px" />
					<col width="*" />
					<col width="70px" />
				</colgroup>
				<thead>
					<tr>
						<th>클럽명</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>부과일자</th>
						<th>부과금</th>
						<th>납부일자</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>미수금</th>
						<th>환차손</th>
						<th>참고사항</th>
						<th>인쇄</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="130px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="70px" />
					<col width="*" />
					<col width="70px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.dollarKind eq '$'}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
						</c:choose>					
						<tr data-idnno="${list.idnNo }" data-paymentidnno="${list.paymentIdnNo }">
							<c:choose>
								<c:when test="${list.paymentNo eq '1' }">
									<td style="${fStyle}" class="left" title="${lions:formatOrganCode(list.clubCode) } ${list.clubName}">${lions:formatOrganCode(list.clubCode) } ${list.clubName}</td>
									<td style="${fStyle}" class="left" title="${list.classItemName }">${list.classItemName }</td>
									<td style="${fStyle}" class="left" title="${list.detailItemName }">${list.detailItemName }</td>
									<td style="${fStyle}" class="center">
										<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
										<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
									</td>
									<fmt:formatNumber var="impostDollar" value="${list.impostDollar }" pattern="$ #,###.##"/>
									<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? impostDollar : '' }"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>
								</c:when>
								<c:otherwise>
									<td style="${fStyle}"></td>
									<td style="${fStyle}"></td>
									<td style="${fStyle}"></td>
									<td style="${fStyle}"></td>
									<td style="${fStyle}"></td>
								</c:otherwise>
							</c:choose>
							<td style="${fStyle}" class="center">
								<fmt:parseDate var="paymentDate" value="${list.paymentDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${paymentDate }" pattern="yyyy.MM.dd" />
							</td>
							<fmt:formatNumber var="paymentDollar" value="${list.paymentDollar }" pattern="$ #,###.##"/>
							<fmt:formatNumber var="payment" value="${list.payment }" pattern="#,###"/>
							<td style="${fStyle}" class="right" title="${list.paymentDefect ne 'Y' ? (list.dollarKind eq '$' ? paymentDollar : '') : '' }">${list.paymentDefect ne 'Y' ? payment : '' }</td>
							<td style="${fStyle}" class="right" title="${list.paymentDefect eq 'Y' ? (list.dollarKind eq '$' ? paymentDollar : '') : '' }">${list.paymentDefect eq 'Y' ? payment : '' }</td>
							<fmt:formatNumber var="paymentDollarBal" value="${list.paymentDollarBal }" pattern="$ #,###.##"/>
							<c:choose>
								<c:when test="${list.paymentNo eq list.paymentCnt }">
									<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? paymentDollarBal : '' }"><fmt:formatNumber value="${list.paymentBal }" pattern="#,###" /></td>
								</c:when>
								<c:otherwise>
									<td style="${fStyle}"></td>
								</c:otherwise>
							</c:choose>
							<td style="${fStyle}" class="right"><fmt:formatNumber value="${list.exchangeLoss }" pattern="#,###" /></td>
							<c:choose>
								<c:when test="${list.paymentNo eq '1' }">
									<td style="${fStyle}" class="left" title="${lions:newline(list.reference) }">${list.reference }</td>
								</c:when>
								<c:otherwise>
									<td style="${fStyle}"></td>
								</c:otherwise>
							</c:choose>
							<td>
								<c:if test="${not empty list.paymentIdnNo }">
									<img class="btnPrint" src="/images/lionsclubs/btn/btn_print.gif" alt="인쇄" style="cursor: pointer;" />
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="80px" />
					<col width="100px" />
					<col width="130px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="70px" />
					<col width="*" />
					<col width="70px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="4">부과금 총계</th>
						<th class="right f11"><fmt:formatNumber value="${sum.impost }" pattern="#,###" /></th>
						<th>납부금 총계</th>
						<th class="right f11"><fmt:formatNumber value="${sum.payment }" pattern="#,###" /></th>
						<th class="right f11"><fmt:formatNumber value="${sum.paymentDefect }" pattern="#,###" /></th>
						<th class="right f11"><fmt:formatNumber value="${sum.paymentBal }" pattern="#,###" /></th>
						<th class="right f11"><fmt:formatNumber value="${sum.exchangeLoss }" pattern="#,###" /></th>
						<th class="right f11"></th>
						<th class="right f11"></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->
		
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>				
	</div><!-- table -->
</form:form>
