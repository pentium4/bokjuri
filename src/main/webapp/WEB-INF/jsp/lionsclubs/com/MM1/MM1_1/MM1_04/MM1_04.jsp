<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
			openPopup('<c:url value="/MM1/MM1_1/MM1_04/MM1_04_Popup.do?memberNo=${MM1_04VO.memberNo}&kindCode=${param.kindCode}" />', 500, 220, 'MM1_04_Popup');
		});
		
		/*
		 *	수정 버튼
		 */
		$("#button_update").click(function() {
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("수정할 항목을 선택해 주세요.");
				return false;
			}
			
			openPopup('<c:url value="/MM1/MM1_1/MM1_04/MM1_04_Popup.do?idnNo=' + idnNo + '&kindCode=${param.kindCode}" />', 500, 250, 'MM1_04_Popup');  
		});
		
		/*
		 *	삭제 버튼
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
			params.push({name: "idnNo", value: $(".idnNo:checked").val()});
			$.ajax({
				url: '<c:url value="/MM1/MM1_1/MM1_04/MM1_04_Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 삭제 되었습니다.');
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
		tbl.bind("click", function(){
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

<form:form id="form_list" modelAttribute="MM1_04VO" action="/MM1/MM1_1/MM1_04/MM1_04.do">
	<h3><div>경력(<lions:codetolabel groupCode="3110" code="${param.kindCode }" />)</div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<div class="table">
		<h4>경력(<lions:codetolabel groupCode="3110" code="${param.kindCode }" />)</h4>
		<div class="btnBox">
			<img id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" class="pointer authorization write" />
			<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write" />
			<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="경력(교육/상벌) 안내표">
				<caption>경력(교육/상벌)</caption>
				<colgroup>
					<col width="190px" />
					<col width="100px" />
					<col width="220px" />
					<c:if test="${param.kindCode eq '1020' }">
						<col width="120px" />
					</c:if>
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>기간</th>
						<th>주관</th>
						<th>항목</th>
						<c:if test="${param.kindCode eq '1020' }">
							<th>포상수여자</th>	
						</c:if>
						<th>내용</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="table_day">
				<colgroup>
					<col width="190px" />
					<col width="100px" />
					<col width="220px" />
					<c:if test="${param.kindCode eq '1020' }">
						<col width="120px" />
					</c:if>					
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none" />
								<fmt:parseDate var="sanctionStartDate" value="${list.sanctionStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${sanctionStartDate }" pattern="yyyy.MM.dd" />
								~
								<fmt:parseDate var="sanctionEndDate" value="${list.sanctionEndDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${sanctionEndDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="center">${list.educationName }</td>
							<td class="left" title="${list.itemName }">${list.itemName }</td>
							<c:if test="${param.kindCode eq '1020' }">
								<td class="center" title="${list.awardGrantorName }">${list.awardGrantorName }</td>
							</c:if>
							<td class="left" title="${list.desc }">${list.desc }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
	<form:hidden path="kindCode"/>
</form:form>
