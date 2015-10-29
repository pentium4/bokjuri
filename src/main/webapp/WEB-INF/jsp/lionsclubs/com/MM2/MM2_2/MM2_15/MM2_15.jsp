<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_15VO.sessionYear}"	// 고정값
			,top:false
		});
		
		$("#month").monthCombo({
			fixVal : "${MM2_15VO.month}"
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_15VO.organCode}"
		});
		
		var tbl = $("#table_sis tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".idnNo").prop("checked", true);
			$(this).find(".classItemCode").prop("checked", true);
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");	
		
		//조회 버튼선택
		$("#search").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
		
			_search();
		});
		
		// 업데이트 버튼선택
		$("#update").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			
			if(idnNo.isEmpty()){
				alert("지출항목을 선택해 주세요.");
				return false;
			}
	
			if(data.classitemcode == "1040" 
					&& data.moneyidnno != ''){
				alert("지구 임원분담금은 개인기록관리 > 개인 납부금 업무 > 지구임원분담금 납부에서 수정 할 수 있습니다.");
				return false;
			}
			
			if(data.classitemcode == "1160" 
					&& data.moneyidnno != ''){
				alert("지구 약정금은 개인기록관리 > 개인 납부금 업무 > 약정금 등록/납부에서 수정 할 수 있습니다.");
				return false;
			}
			
			if(data.classitemcode == "1110" 
					&& data.moneyidnno != ''){
				alert("정기 예탁금은 클럽관리 > 수입 및 지출 > 예금현황에서 수정 할 수 있습니다.");
				return false;
			}
			
			if(data.classitemcode == "1120" 
					&& data.moneyidnno != ''){
				alert("결손금은 수정 할 수 없습니다.");
				return false;
			}		
			
			var url = "/MM2/MM2_2/MM2_15/MM2_15_Popup.do?idnNo=" + idnNo;
			openPopup(url, '500', '300', 'MM2_15_Popup');
		});
		
		//입력 버튼 선택
		$("#insert").on("click", function(){
			var url = "/MM2/MM2_2/MM2_15/MM2_15_Popup.do?organCode=${MM2_15VO.organCode}";
			openPopup(url, '500', '300', 'MM2_15_Popup');
		});
		
		//삭제 버튼 선택
		$("#hdel").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			var tr = $(".idnNo:checked").closest("tr");
			var data = tr.data();
			
			if(idnNo.isEmpty()){
				alert("지출항목을 선택해 주세요.");
				return false;
			}
	
			if(data.classitemcode == "1040" 
					&& data.moneyidnno != ''){
				alert("지구 임원분담금은 개인기록관리 > 개인 납부금 업무 > 지구임원분담금 납부에서 삭제 할 수 있습니다.");
				return false;
			}
			
			if(data.classitemcode == "1160" 
					&& data.moneyidnno != ''){
				alert("지구 약정금은 개인기록관리 > 개인 납부금 업무 > 약정금 등록/납부에서 삭제 할 수 있습니다.");
				return false;
			}
	
			if(data.classitemcode == "1110" 
					&& data.moneyidnno != ''){
				alert("정기 예탁금은 클럽관리 > 수입 및 지출 > 예금현황에서 삭제 할 수 있습니다.");
				return false;
			}
	
			if(data.classitemcode == "1120" 
					&& data.moneyidnno != ''){
				alert("결손금은 삭제 할 수 없습니다.");
				return false;
			}		
			
			if(!confirm("지출항목을 삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM2/MM2_2/MM2_15/otherIncomeDelete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result=="DATANOTFOUND"){
						if(confirm('해당 자료가 존재하지 않아서 삭제할 수 없습니다.\n이미 삭제된 자료일 수 있습니다.\n\n자료를 다시 조회하시겠습니까?\n')){
							_search();	
						}
					}else if(data.result=="CONFIRM") {
						alert('해당 회기의 월정산이 확정되어 삭제할 수 없습니다.');
					}else if(data.result){
						//alert('정상적으로 삭제 되었습니다.');
						_search();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});

//링크페이지
function _search(){
	$("#form_list").submit();
}
</script>

<form:form id="form_list" modelAttribute="MM2_15VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="지출 입력/조회표">
			<caption>지출 입력 및 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="140px" />
				<col width="100px" />
				<col width="140px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td colspan="3">
					<div class="fL">
						<form:select path="organCode"/>
					</div>
					</td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2" class="LH">
						<form:radiobutton path="s1" value="1" label="지출일" cssClass="ml10" />
						<form:radiobutton path="s1" value="2" label="지출세부항목별" cssClass="ml10" />
						<form:radiobutton path="s1" value="3" label="입력일" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
					</td>
					<th>선택월</th>
					<td>
						<form:select path="month" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="search" src="/images/lionsclubs/btn/btn_search.gif"	style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read"  />
			<img id="insert" src="/images/lionsclubs/btn/btn_input.gif"	style="margin-top:2px" onclick="return false;" alt="입력" class="pointer authorization write" />
			<img id="update" src="/images/lionsclubs/btn/btn_edit.gif"	style="margin-top:2px" onclick="return false;" alt="수정" class="pointer authorization write" />
			<img id="hdel" src="/images/lionsclubs/btn/btn_del.gif"	style="margin-top:2px" onclick="return false;" alt="삭제" class="pointer authorization write" />
		</div>
		<div class="tblTitle mT5 Scroll_Title Height_0">
			<table class="tblType2_1 table-fixed" summary="지출 입력 및 조회 안내표">
				<caption>지출 입력</caption>
				<colgroup>
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<thead>
					<tr>
						<th>지출일자</th>
						<th>지출분류항목</th>
						<th>지출세부항목</th>
						<th>봉사실적항목</th>
						<th>금액</th>
						<th>지출내용(참고사항)</th>
						<th>입력일자</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table" id = "table_sis">	
				<colgroup>
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.classItemCode eq '1040' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
							<c:when test="${list.classItemCode eq '1160' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:blue" />
							</c:when>
							<c:when test="${list.classItemCode eq '1110' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:#FF00FF" />
							</c:when>
							<c:when test="${list.classItemCode eq '1120' and not empty list.moneyIdnNo}">
								<c:set var="fStyle" value="color:tomato" />
							</c:when>
						</c:choose>
						<tr data-classitemcode="${list.classItemCode }" data-moneyidnno="${list.moneyIdnNo }">
							<td class="center" style="${fStyle}">
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display:none;" />
								<fmt:parseDate var="inexDate" value="${list.inexDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${inexDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left" style="${fStyle}">${list.classItemName }</td>
							<td class="left" style="${fStyle}" title="${list.detailItemName }">${list.detailItemName }</td>
							<td class="left" style="${fStyle}" title="${list.servicePerformanceName }">${list.servicePerformanceName }</td>
							<td class="right" style="${fStyle}">
								<fmt:formatNumber value="${list.amount }" pattern="#,###"/>
							</td>
							<td class="left" style="${fStyle}" title="${lions:newline(list.inexDesc) }">${list.inexDesc }</td>
							<td class="center" style="${fStyle}">
								<fmt:parseDate var="incomeInsertDate" value="${list.incomeInsertDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${incomeInsertDate }" pattern="yyyy.MM.dd" />
							</td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="460px" />
					<col width="120px" />
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<tfoot>	
					<tr>
						<th>총계</th>
						<th class="right">
							<c:if test="${ not empty sumAmount}">
								<fmt:formatNumber value="${sumAmount }" pattern="#,###"/>
							</c:if>
						</th>
						<th>정산일자</th>
						<th class="right">
							<c:if test="${ not empty sumDate}">
								<fmt:parseDate var="sumDateYmd" value="${sumDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${sumDateYmd }" pattern="yyyy.MM.dd" />
							</c:if>
						</th>
					</tr>	
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>