<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		/*
		 *	조직 선택하기 창 띄우기
		 */
		 $("#button_insert").click(function() {
			 openPopup('<c:url value="/MM1/MM1_1/MM1_03/MM1_03_Popup.do?memberNo=${MM1_03VO.memberNo}" />', 500, 250, 'MM1_03_Popup');
		 });
		
		/*
		 *	개인기념일 수정 버튼
		 */
		$("#button_update").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("수정할 항목을 선택해 주세요.");
				return false;
			}
			
			openPopup('<c:url value="/MM1/MM1_1/MM1_03/MM1_03_Popup.do?idnNo=' + idnNo + '&memberNo=${MM1_03VO.memberNo}" />', 500, 250, 'MM1_03_Popup');
		});
		
		/*
		 *	개인기념일 삭제 버튼
		 */
		$("#button_delete").click(function() {
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
			params.push({name: "memberNo", value: "${MM1_03VO.memberNo}"});
			
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM1/MM1_1/MM1_03/MM1_03_Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert('정상적으로 삭제 되었습니다.');
						//goUrl('<c:url value="/MM1/MM1_1/MM1_03/MM1_03.do" />');
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/
		var tbl = $("#table_day tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			$(this).find(".idnNo").prop("checked", true);
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");
	});
});

function _search(){
	$("#form_list").submit();
}
</script>
<style>
<!--
.tblType2 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form id="form_list" modelAttribute="MM1_03VO" action="/MM1/MM1_1/MM1_03/MM1_03.do">
	<h3><div>경력(선임/위촉)</div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	<div class="table">
		<h4>경력 선임 사항</h4>
		<div class="btnBox">
			<img id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" class="pointer authorization write" />
			<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" class="pointer authorization write" />
			<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="경력(선임/위촉) 안내표">
				<caption>경력(선임/위촉)</caption>
				<colgroup>
					<col width="100px" />
					<col width="100px" />
					<col width="200px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>시작일</th>
						<th>종료일</th>
						<th>선임구분</th>
						<th>소속클럽</th>
						<th>선임소속</th>
						<th>선임 직책 및 내용</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<form:hidden path="prevYear"/>
			<form:hidden path="thisYear"/>
			<form:hidden path="memberNo"/>
			<table class="tblType2 Scroll_Table" id="table_day">
				<colgroup>
					<col width="100px" />
					<col width="100px" />
					<col width="200px" />
					<col width="200px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<c:set var="dismissalStyleColor" />
						<c:if test="${list.appKindCode eq '1000' or list.appKindCode eq '1010' or list.appKindCode eq '1020' or list.appKindCode eq '1030' }">
							<c:if test="${fn:substring(list.endDate, 4, 8) ne '0630' }">
								<c:set var="dismissalStyleColor" value="color: #ff6600;" />
							</c:if>
						</c:if>
						<tr>
							<td class="center" style="${dismissalStyleColor}">
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none" />
								<fmt:parseDate var="startDate" value="${list.startDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${startDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="center" style="${dismissalStyleColor}">
								<fmt:parseDate var="endDate" value="${list.endDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${endDate }" pattern="yyyy.MM.dd" />
							</td>
							<td style="${dismissalStyleColor}" title="${list.appKindName }">${list.appKindName }</td>
							<td style="${dismissalStyleColor}" title="${list.organName }">${list.organName }</td>
							<td style="${dismissalStyleColor}" title="${list.appSectorName }">${list.appSectorName }</td>
							<td style="${dismissalStyleColor}" title="${list.appDescName }<c:if test='${not empty list.appDesc }'>(${list.appDesc })</c:if><c:if test="${list.expulsionFlag eq 'Y' }">(제명)</c:if>">
								${list.appDescName }
								<c:if test="${not empty list.appDesc }">
									(${list.appDesc })
								</c:if>
								<c:if test="${list.expulsionFlag eq 'Y' }">
									(제명)
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>
