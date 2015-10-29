<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM3_49VO.sessionYear}"	// 고정값
		});
		
		// 기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal:"${MM3_49VO.organCode }"
		});
		
		/*
		 * 조회 버튼선택
		 */
		$("#button_search").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
			     lvl: 4
				,organCode: $("#organCode").val()
			});
		
			$("#form_list").submit();
		});	
		
		/*
		 * 일괄입력 창 띄우기
		 */
		$("#btnImposedInsert").click(function() {		 
			openPopup('<c:url value="/MM3/MM3_12/MM3_49/impostPopup.do?organCode=${MM3_49VO.organCode}" />', 800, 600, 'impostPopup');
		});
		
		/*
		 * 일괄수정 버튼
		 */
		$("#btnImposedUpdate").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			if(idnNo.isEmpty()) {
				alert("수정 할 항목을 선택해 주세요.");
				return false;
			}
			
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			openPopup('<c:url value="/MM3/MM3_12/MM3_49/impostPopup.do?organCode=${MM3_49VO.organCode}&idnNo=' + idnNo + '" />', 800, 600, 'impostPopup');
		});
		
		/*
		 * 일괄삭제 버튼
		 */
		$("#btnImposedDelete").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("삭제 할 항목을 선택해 주세요.");
				return false;
			}
			
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			if(!confirm('선택한 항목의 전회원 부과금이 모두 삭제됩니다.\n삭제하시겠습니까?')){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			params.push({name: "organCode", value: "${MM3_49VO.organCode}"});
			
			$.ajax({
				url:  '<c:url value="/MM3/MM3_12/MM3_49/deleteImpost.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
					}else{
						alert(data.result);					
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		$("#btnPayment").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			if(idnNo.isEmpty()) {
				alert("납부처리 할 항목을 선택해 주세요.");
				return false;
			}
			
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			 
			openPopup('<c:url value="/MM3/MM3_12/MM3_49/paymentPopup.do?organCode=${MM3_49VO.organCode}&idnNo=' + idnNo + '" />', 1000, 600, 'paymentPopup');
		});
	
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/
		var tbl = $("#table_list tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".idnNo").prop("checked", true);
		});
	});
});

function _search(){
	$("#pageIndex").val(1);
	$("#form_list").submit();
}

function _pagingFixsearch(){
	$("#form_list").submit();
}
</script>
<style>
#table_list tr{
	cursor: pointer;
}
</style>
<form:form id="form_list" modelAttribute="MM3_49VO" action="/MM3/MM3_12/MM3_49/MM3_49.do">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="전회원부과금 입력/조회">
			<caption>전회원부과금 입력/조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td><form:select path="organCode" /></td>
					<th>항목구분</th>
					<td>
						<form:radiobutton path="order" value="1" label="부과일자순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="수입분류항목순" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="수입세부항목순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td colspan="3">
						<form:select path="sessionYear" cssClass="select" />
					</td>
				</tr>				
			</tbody>
		</table>
	</div>
	<div class="table">
		<h4>전회원 부과금 조회</h4>
	
		<div class="btnBox">
			<img id="button_search" src="/images/lionsclubs/btn/btn_search.gif" alt="조회"  onclick="return false;" class="pointer authorization read" />
			<img id="btnPayment" src="/images/lionsclubs/btn/btn_pay_deal.gif" alt="납부처리" style="width:78px" class="pointer authorization write" />
			<img id="btnImposedInsert" src="/images/lionsclubs/btn/btn_regi.gif" alt="부과 등록" style="width:57px" class="pointer authorization write" />
			<img id="btnImposedUpdate" src="/images/lionsclubs/btn/btn_edit.gif" alt="부과 수정" style="width:57px" class="pointer authorization write" />
			<img id="btnImposedDelete" src="/images/lionsclubs/btn/btn_del.gif" alt="부과 삭제" style="width:57px" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="90px" />
					<col width="120px" />		
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>부과일자</th>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>부과금</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>잔액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="table_list">
				<colgroup>
					<col width="90px" />
					<col width="120px" />		
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.dollarKind eq '$'}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
						</c:choose>
						<tr data-classitemcode="${list.classItemCode }">
							<td style="${fStyle}" class="center">
								<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none" />
							</td>
							<td style="${fStyle}" class="left">${list.classItemName }</td>
							<td style="${fStyle}" class="left">${list.detailItemName }</td>
							<fmt:formatNumber var="impostDollar" value="${list.impostDollar }" pattern="$ #,###"/>
							<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? impostDollar : '' }"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>
							<fmt:formatNumber var="paymentDollar" value="${list.paymentDollar }" pattern="$ #,###"/>
							<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? paymentDollar : '' }"><fmt:formatNumber value="${list.payment }" pattern="#,###" /></td>
							<fmt:formatNumber var="paymentDollarDefect" value="${list.paymentDollarDefect }" pattern="$ #,###"/>
							<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? paymentDollarDefect : '' }"><fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" /></td>
							<fmt:formatNumber var="paymentDollarBal" value="${list.impostDollar - (list.paymentDollar + list.paymentDollarDefect) }" pattern="$ #,###"/>
							<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? paymentDollarBal : '' }"><fmt:formatNumber value="${list.impost - (list.payment + list.paymentDefect) }" pattern="#,###" /></td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="tblTitle Scroll_Title Height_0 mT5">
			<table class="tblType2_1">
				<colgroup>
					<col width="90px" />
					<col width="120px" />		
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3"></th>
						<th class="right"><fmt:formatNumber value="${total.impost }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${total.payment }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${total.paymentDefect }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${total.impost - (total.payment + total.paymentDefect) }" pattern="#,###" /></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
		<!-- //Contents_Table_area -->
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>
	</div>
</form:form>
