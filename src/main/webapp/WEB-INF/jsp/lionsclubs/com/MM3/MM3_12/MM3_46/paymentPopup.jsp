<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#paymentDate").datepicker();
		
		if("${MM3_46VO.paymentIdnNo}".isEmpty()){
			$("#paymentDate").val(Date.today().toString("yyyy.MM.dd"));	
		}
		
		$("#payment").maskMoney({precision:0}).numericOnly();
		
		var dollarKind = "${MM3_46VO.dollarKind}";
		if(dollarKind == "$"){
			$("#dollarKind").text("달러(USD)로 입력해 주세요.");
			$("#payment").val(parseFloat("${MM3_46VO.paymentDollar}").toFixed(2));
			$("#payment").maskMoney({precision:2}).numericOnly();
		}
		
		$("#btnSave").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_12/MM3_46/savePayment.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1") {
						opener._pagingFixSearch();
						closeWin();
					} else {
						alert(data.result);
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					return false;
				}
			});			
		});
		
		$("#btnFullPayment").on("click", function(){
			var impost = "${MM3_46VO.impost }";
			var impostDollar = "${MM3_46VO.impostDollar }";
			var totalPayment = "${MM3_46VO.totalPayment }";
			var totalPaymentDollar = "${MM3_46VO.totalPaymentDollar }";
			
			if("${MM3_46VO.dollarKind}" == "$"){
				$("#payment").val(parseFloat(impostDollar - totalPaymentDollar).toFixed(2));
				$("#payment").maskMoney({precision:2}).numericOnly();
			} else {
				$("#payment").val(impost - totalPayment);
				$("#payment").maskMoney({precision:0}).numericOnly();
			}
		});
	});
});

function _search(){
	$("form").submit();
}
</script>	

<form:form modelAttribute="MM3_46VO" >
	<double-submit:preventer tokenKey="payment" />
	
	<h3><div>연간수입예산 추가</div></h3>
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>납부일자<span class="require">*</span></th>
					<td>
						<form:input path="paymentDate" cssClass="input date required" caption="납부일자" />
					</td>
				</tr>			
				<tr>
					<th>분류항목</th>
					<td>
						${MM3_46VO.classItemCode } ${MM3_46VO.classItemName }
					</td>
				</tr>
				<tr>
					<th>세부항목</th>
					<td>
						${MM3_46VO.detailItemCode } ${MM3_46VO.detailItemName }
					</td>
				</tr>
				<tr>
					<th>부과금액</th>
					<td>
						<c:choose>
							<c:when test="${MM3_46VO.dollarKind eq '$'}">
								<fmt:formatNumber value="${MM3_46VO.impostDollar }" pattern="$ #,###.##"/>
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${MM3_46VO.impost }" pattern="\ #,###"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>총납부금</th>
					<td>
						<c:choose>
							<c:when test="${MM3_46VO.dollarKind eq '$'}">
								<fmt:formatNumber value="${MM3_46VO.totalPaymentDollar }" pattern="$ #,###.##"/>
							</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${MM3_46VO.totalPayment }" pattern="\ #,###"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>납부금액<span class="require">*</span></th>
					<td style="padding: 5px;">
						<div id="dollarKind">원화(KRW)로 입력해 주세요.</div>
						<form:input path="payment" cssClass="input required" caption="납부금액" />
						<img id="btnFullPayment" alt="완납" src="/images/lionsclubs/btn/btnFullPayment.png" class="pointer" />
					</td>
				</tr>
				<tr>
					<th>결손여부</th>
					<td>
						<form:checkbox path="paymentDefect" value="Y" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<form:hidden path="idnNo" />
	<form:hidden path="paymentIdnNo" />
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${not empty MM3_46VO.paymentIdnNo }">
				<img title="수정" id="btnSave" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer" />
			</c:when>
			<c:otherwise>
				<img title="입력" id="btnSave" src="/images/lionsclubs/btn/btn_input.gif" class="pointer" />
			</c:otherwise>
		</c:choose>
		<img title="닫기" id="btnClose" src="/images/lionsclubs/btn/btn_close.gif" onclick="closeWin();" class="pointer" />
	</div>
</form:form>
