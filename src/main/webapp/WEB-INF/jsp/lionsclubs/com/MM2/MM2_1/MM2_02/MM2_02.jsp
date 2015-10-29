<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
	
		$("#button_select").click(function() {
			_search();
		}); 
		/*
		 *	자매결연 입력 버튼
		 */
		 $("#button_insert").click(function() {
	// 		 var ino = $("#form_delete input:hidden[name=organCode]").val();
			 openPopup('<c:url value="/MM2/MM2_1/MM2_02/MM2_02_Popup1.do?organCode=${MM2_02VO.organCode}" />', '500', '220', "mm02_popup");
		 });
		
		/*
		 *	자매결연 수정 버튼
		 */
		$("#button_update").click(function() {
			
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("수정 할 항목을 선택해 주세요.");
				return false;
			}
			var pdata = "?idn="+ano;
			openPopup('<c:url value="/MM2/MM2_1/MM2_02/MM2_02_Popup2.do' + pdata + '" />', '500', '220', "mm02_popup");
		});
		
		/*
		 *	삭제 버튼
		 */
		$("#button_delete").click(function() {
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano == "") {
				alert("삭제 할 항목을 선택해 주세요.");
				return false;
			}
			
			if(!confirm("현재 선택된 항목을 삭제 하시겠습니까?")){
				return false;
			}		
			
			var params = $("#form_delete").serializeArray();
			$.ajax({
				url:  '<c:url value="/MM2/MM2_1/MM2_02/MM2_02_Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						goUrl('<c:url value="/MM2/MM2_1/MM2_02/MM2_02.do" />');
	
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
		var tbl = $("#table_sis tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			
			// 삭제
			$("#form_delete input:hidden[name=idnNo]").val($.trim(idnno));
			
		});
	});
});	

function _search(){
	$("#pageIndex").val(1);
	$("#form_list").submit();
}

function linkPage(){
	$("form").submit();
// 	 goUrl('<c:url value="/MM2/MM2_1/MM2_02/MM2_02.do"/>');
} 

</script>
</head>


<body onload = "GLNB_Select(1,0,1)">
<div>
<form:form id="form_list" modelAttribute="MM2_02VO" action="/MM2/MM2_1/MM2_02/MM2_02.do">	
<h3><div>국내외 자매결연 <span class="date"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></span></div></h3>
<jsp:include page="/WEB-INF/jsp/lionsclubs/include/clubprofile/clubProfile.jsp" />

<div class="table">
<h4>국내외 자매결연</h4> 
	<div class="btnBox">
		<form:radiobutton path="order" value="1" label="자매결연역순" />
		<form:radiobutton path="order" value="2" cssClass="ml10" label="자매결연순" />
		<img id="button_select" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer ml10 authorization read"/>
		<img id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" style="width:57px" alt="입력" class="pointer authorization write" />
		<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px" alt="수정" class="pointer authorization write" />
		<img id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" style="width:57px" alt="삭제" class="pointer authorization write" />
	</div>
	<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2_1" summary="국내외 자매결연 안내표">
	<caption>국내외 자매결연</caption>
	<colgroup>
		<col width="160px" />
		<col width="100px" />
		<col width="120px" />
		<col width="200px" />
		<col width="*" />
		<col width="100px" />
	</colgroup>
	<tr>
		<th>회기</th>
		<th>결연일자</th>
		<th>결연구분</th>
		<th>소재지 국명 지역</th>
		<th>주요 봉사활동 및 행사내용</th>
		<th>점수</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	
	<table class="tblType2_1 Scroll_Table" id = "table_sis">
	<colgroup>
		<col width="160px" />
		<col width="100px" />
		<col width="120px" />
		<col width="200px" />
		<col width="*" />
		<col width="100px" />
	</colgroup>
	<tbody>
	<c:forEach items="${resultList}" var="list" varStatus="status">
	<tr>
		<td class="center">${list.termYear }</td>
		<td class="center">
		<fmt:parseDate var="sisterhoodDate" value="${list.sisterhoodDate }" pattern="yyyyMMdd" />
		<fmt:formatDate value="${sisterhoodDate }" pattern="yyyy.MM.dd" />
		</td>
		<td class="left">${list.allianceKind }</td>
		<td class="left">${list.locationArea }</td>
		<td class="left">${list.event }</td>
		<td class="right">${list.score }</td>		
		<input type="hidden" name="idn" value="${list.idnNo }" /> 
		<input type="hidden" name="org" value="${list.organCode }" /> 
		<input type="hidden" name="insertName" value="${list.insertName }" /> 
		<input type="hidden" name="updateName" value="${list.updateName}" /> 
		<input type="hidden" name="insertDate" value="${list.insertDate}" />
		<input type="hidden" name="updateDate" value="${list.updateDate}" /> 
		
	</tr>	
	</c:forEach>
	
	</tbody>
	</table>
	</div><!-- Height_1 -->
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</form:form>
</div><!-- table -->

		</div>
<form name="form_delete" id="form_delete" >
<input type="hidden" name="idnNo" />  
<input type="hidden" name="organCode"/>
</form>

