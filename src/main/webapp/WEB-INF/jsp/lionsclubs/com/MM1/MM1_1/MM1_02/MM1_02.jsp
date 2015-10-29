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
			 //window.open('<c:url value="/MM1/MM1_1/MM1_02/MM1_02_Popup1.do" />'+pdata,'mm02_popup','width=500,height=300,scrollbars=no,resizeable=no');
			 openPopup('<c:url value="/MM1/MM1_1/MM1_02/MM1_02_Popup1.do" />'+pdata, 500, 300, 'mm02_popup');
		 });
		
		/*
		 *	개인기념일 수정 버튼
		 */
		$("#button_update").click(function() {
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("수정 할 기념일자를 선택해 주세요.");
				return false;
			}
			
			var pdata = "?mno=${memberNo}&idn="+ano;
			//window.open('<c:url value="/MM1/MM1_1/MM1_02/MM1_02_Popup2.do" />'+pdata,'mm02_popup','width=500,height=300,scrollbars=no,resizeable=no');
			openPopup('<c:url value="/MM1/MM1_1/MM1_02/MM1_02_Popup2.do" />'+pdata, 500, 300, 'mm02_popup');
			 
		});
		
		/*
		 *	개인기념일 삭제 버튼
		 */
		$("#button_delete").click(function() {
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("삭제 할 기념일자를 선택해 주세요.");
				return false;
			}
			
			var params = $("#form_delete").serializeArray();
			$.ajax({
				url:  '<c:url value="/MM1/MM1_1/MM1_02/MM1_02_Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 삭제 되었습니다.');
						//goUrl('<c:url value="/MM1/MM1_1/MM1_02/MM1_02.do" />');
						linkPage();
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
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			// 삭제
			$("#form_delete input:hidden[name=idnNo]").val($.trim(idnno));
			
		});
	});	
});

function linkPage(){
	//goUrl('<c:url value="/MM1/MM1_1/MM1_02/MM1_02.do" />');
	$("#form_list").attr("action","/MM1/MM1_1/MM1_02/MM1_02.do");
	$("#form_list").submit();
}
</script>	

<form:form id="form_list" modelAttribute="MM1_02VO" action="/MM1/MM1_1/MM1_02/MM1_02.do">
	<h3><div>개인기념일관리</div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<div class="table">
	<h4>개인 기념일 관리</h4>
		<div class="btnBox">
			<img id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" class="pointer authorization write" />
			<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write" />
			<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="개인 기념일 관리 안내표">
				<caption>개인 기념일 관리</caption>
				<colgroup>
					<col width="100px" />
					<col width="70px" />
					<col width="150px" />
					<col width="*" />
					<col width="100px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th>기념일자</th>
						<th>양/음력</th>
						<th>분류코드</th>
						<th>메세지 내용</th>
						<th>시간</th>
						<th>일전</th>
						<th>횟수</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="table_day">
				<colgroup>
					<col width="100px" />
					<col width="70px" />
					<col width="150px" />
					<col width="*" />
					<col width="100px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td>
								<fmt:parseDate var="anniversaryDay" value="${list.anniversaryDay }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${anniversaryDay }" pattern="yyyy.MM.dd" />
							</td>
							<td>${list.pmKindName }</td>
							<td>${list.kindName }</td>
							<td class="left">${list.message }</td>
							<td>${list.time }</td>
							<td>${list.dayAgo }</td>
							<td>${list.number }</td>
							<input type="hidden" name="idn" value="${list.idnNo }" />  
							<input type="hidden" name="kcode" value="${list.kindCode }" />  
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
			
			<form:hidden path="memberNo"/>
		</div><!-- Height_1 -->
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>	
	</div><!-- table -->
</form:form>

<form name="form_delete" id="form_delete" >
<input type="hidden" name="memberNo" value="${memberNo }" /> 
<input type="hidden" name="idnNo" />  
</form>

