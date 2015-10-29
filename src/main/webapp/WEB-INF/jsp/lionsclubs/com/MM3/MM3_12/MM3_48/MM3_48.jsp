<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_48VO.sessionYear}"	// 고정값
			,top:false
		});
		
		// 지구코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_48VO.organCode}"
		});
		
		$("#organCode").on("change", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $(this).val()
			});
		});
		
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".idnNo").prop("checked", true);
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");
		
		$("#btnInsert").on("click", function(){
			openPopup('/MM3/MM3_12/MM3_48/incomePopup.do?sessionYear=${MM3_48VO.sessionYear}&organCode=${MM3_48VO.organCode}', '500', '350', 'incomePopup');	
		});

		$("#btnUpdate").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("수정할 항목을 선택해 주세요.");
				return false;
			}
			
			openPopup('/MM3/MM3_12/MM3_48/incomePopup.do?idnNo=' + idnNo, '500', '350', 'incomePopup');	
		});

		$("#btnDelete").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("삭제할 항목을 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				type: "POST",
				async: true,			
				url:  '<c:url value="/MM3/MM3_12/MM3_48/deleteIncome.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				}
			});			
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
	});
});

//링크페이지
function _search(){
	$("form").submit();
}
</script>
<style>
.tblType2 tbody tr{
	cursor: pointer;
}
</style>
<form:form modelAttribute="MM3_48VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td><form:select path="organCode"/></td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2" class="LH">
						<form:radiobutton path="order" value="1" label="세부항목별" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="금액순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
			<img alt="입력" id="btnInsert" src="/images/lionsclubs/btn/btn_input.gif" class="pointer authorization write" />
			<img alt="수정" id="btnUpdate" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer authorization write" />
			<img alt="삭제" id="btnDelete" src="/images/lionsclubs/btn/btn_del.gif" class="pointer authorization write" />
		</div>
	 
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="120px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>수입일자</th>
						<th>수입예산 분류항목</th>
						<th>수입예산 세부항목</th>
						<th>수입내용</th>
						<th>금액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="120px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
					<col width="120px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<fmt:parseDate var="incomeDate" value="${list.incomeDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${incomeDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left">
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none" />
								${list.classItemName }
							</td>
							<td class="left">${list.detailItemName }</td>
							<td class="left" title="${lions:newline(list.desc) }">${list.desc }</td>
							<td class="right"><fmt:formatNumber value="${list.amount }" pattern="#,###"/></td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="120px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
					<col width="120px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="4">총계</th>
						<th class="right"><fmt:formatNumber value="${sum.amount }" pattern="#,###"/></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>