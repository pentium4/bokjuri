<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_50VO.sessionYear}"	// 고정값
			,top:false
		});
		
		$("#month").monthCombo({
			fixVal : "${MM3_50VO.month}"
		});		
		
		// 지구코드
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_50VO.organCode}"
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
			openPopup('/MM3/MM3_12/MM3_50/expendPopup.do?sessionYear=${MM3_50VO.sessionYear}&organCode=${MM3_50VO.organCode}', '500', '350', 'expendPopup');	
		});
	
		$("#btnUpdate").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("수정할 항목을 선택해 주세요.");
				return false;
			}
			
			openPopup('/MM3/MM3_12/MM3_50/expendPopup.do?idnNo=' + idnNo, '500', '350', 'expendPopup');	
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
				url:  '<c:url value="/MM3/MM3_12/MM3_50/deleteExpend.do" />',
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

<form:form modelAttribute="MM3_50VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="지출 입력/조회표">
			<caption>지출 입력 및 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="41%" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td colspan="3"><form:select path="organCode"/></td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2" class="LH">
						<form:radiobutton path="order" value="1" label="지출일" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="지출세부항목별" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="입력일" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
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
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif"	style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read"  />
			<img id="btnInsert" src="/images/lionsclubs/btn/btn_input.gif" style="margin-top:2px" onclick="return false;" alt="입력" class="pointer authorization write" />
			<img id="btnUpdate" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" onclick="return false;" alt="수정" class="pointer authorization write" />
			<img id="btnDelete" src="/images/lionsclubs/btn/btn_del.gif" style="margin-top:2px" onclick="return false;" alt="삭제" class="pointer authorization write" />
		</div>
		<div class="tblTitle mT5 Scroll_Title Height_0">
			<table class="tblType2_1 table-fixed" summary="지출 입력 및 조회 안내표">
				<caption>지출 입력</caption>
				<colgroup>
					<col width="100px" />
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
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display:none;" />
								<fmt:parseDate var="expendDate" value="${list.expendDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${expendDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left">${list.classItemName }</td>
							<td class="left" title="${list.detailItemName }">${list.detailItemName }</td>
							<td class="right">
								<fmt:formatNumber value="${list.amount }" pattern="#,###"/>
							</td>
							<td class="left" title="${lions:newline(list.desc) }">${list.desc }</td>
							<td class="center">
								<fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" />
							</td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<tfoot>	
					<tr>
						<th colspan="3">총계</th>
						<th class="right"><fmt:formatNumber value="${sum.amount }" pattern="#,###"/></th>
						<th>정산일자</th>
						<th class="right"></th>
					</tr>	
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>