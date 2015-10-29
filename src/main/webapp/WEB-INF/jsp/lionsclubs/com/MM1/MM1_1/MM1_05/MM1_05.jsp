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
			 
			 var pdata = "?mno=${memberNo}";
			 openPopup('<c:url value="/MM1/MM1_1/MM1_05/MM1_05_Popup1.do" />'+pdata, 800, 420, 'mm05_popup');  
		 });
		
		/*
		 *	수정 버튼
		 */
		$("#button_update").click(function() {
			
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("수정 할 행사를 선택해 주세요.");
				return false;
			}
			
			 var pdata = "?mno=${memberNo}&idn="+ano;
			 openPopup('<c:url value="/MM1/MM1_1/MM1_05/MM1_05_Popup2.do" />'+pdata, 800, 420, 'mm05_popup');
		});
		
		/*
		 *	삭제 버튼
		 */
		$("#button_delete").click(function() {
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("삭제 할 행사를 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}		
			
			var params = $("#form_delete").serializeArray();
			$.ajax({
				url:  '<c:url value="/MM1/MM1_1/MM1_05/MM1_05_Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						_search();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
			
			var index = $(this).index();
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			
			// 삭제
			$("#form_delete input:hidden[name=idnNo]").val($.trim(idnno));
			
			if(idnno == 0){
				$("#button_update").hide();
				$("#button_delete").hide();
			} else {
				$("#button_insert").show();
				$("#button_update").show();
				$("#button_delete").show();
			}
		});
		
		$(".eventPhotoPopup").on("click", function(){
			$.viewThumbnailPopup({
				fileId : $(this).prop("id")
			});
		});			
		
// 		$(".eventPhotoPopup").on("click", function(){
// 			var fileId = $(this).prop("id");
// 			openPopup('<c:url value="/MM2/MM2_5/MM2_29/eventPhotoPopup.do?fileId='+ fileId +'" />', 800, 480, 'eventPhotoPopup');
// 		});
	});
});

function _search(){
	$("#form_list").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM1_05VO" action="/MM1/MM1_1/MM1_05/MM1_05.do">
	<h3><div>개인행사참석</div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<div class="table">
		<h4>개인행사참석</h4>
		<div class="btnBox">
			<img id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" class="pointer authorization write" />
			<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write" />
			<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="개인행사참석 안내표">
				<caption>개인행사참석</caption>
				<colgroup>
					<col width="190px" />
					<col width="130px" />
					<col width="100px" />
					<col width="150px" />
					<col width="*" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th>행사기간</th>
						<th>행사시간</th>
						<th>구분</th>
						<th>행사명</th>
						<th>행사장소</th>
						<th>시간</th>
						<th>점수(M)</th>
						<th>공적</th>
						<th>사진</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table table-fixed" id="table_day">
				<colgroup>
					<col width="190px" />
					<col width="130px" />
					<col width="100px" />
					<col width="150px" />
					<col width="*" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
								~
								<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
							</td>
							<td>
								${list.eventStartTime } ~ ${list.eventEndTime }
							</td>
							<td class="center">${list.kindName }</td>
							<td class="left ellipsis" title="${list.eventName }">${list.eventName }</td>
							<td class="left ellipsis" title="${list.eventPlace }">${list.eventPlace }</td>
							<td class="right">${list.time }</td>
							<td class="right">${list.score }</td>
							<td class="center">${list.merit }</td>
							<td class="center">
								<c:if test="${not empty list.fileId }">
									<a id="${list.fileId }" class="eventPhotoPopup" href="#">
										☞(${list.fileCnt })
									</a>
								</c:if>
							</td>
							<input type="hidden" name="idn" value="${list.idnNo }" />  
							<input type="hidden" name="kcode" value="${list.kindCode }" />  
							<input type="hidden" name="ecode" value="${list.eventNameCode }" />  
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
			
			<form:hidden path="memberNo"/>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="190px" />
					<col width="130px" />
					<col width="100px" />
					<col width="150px" />
					<col width="*" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="5">계</th>
						<th class="right"><fmt:formatNumber value="${total.time }" /></th>
						<th class="right"><fmt:formatNumber value="${total.score }" /></th>
						<th></th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblInner -->		
		
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>	
	</div><!-- table -->
</form:form>

<form name="form_delete" id="form_delete" >
	<input type="hidden" name="memberNo" value="${memberNo }" /> 
	<input type="hidden" name="idnNo" />  
</form>
