<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		//조회 버튼선택
		$("#button_search").on("click", function(){
			linkPage();
		});
		
		$("#upperCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_25VO.upperCode}"
		});
		
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM3_25VO.thisYear}"	// 고정값
		});
	
		/*
		 *	행사 추가 버튼
		 */
		 $("#button_insert").click(function() {
			 var pdata = "?organCode="+$("#upperCode").val(); 
			 openPopup('<c:url value="/MM3/MM3_5/MM3_25/Popup_Event_Input.do" />'+pdata, 500, 230, 'mm25_popup');
		 });
		
		/*
		 *	행사 수정 버튼
		 */
		$("#button_update").click(function() {
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			var bno = $("#form_delete input:hidden[name=organCode]").val(); 
			if(ano.isEmpty()) {
				alert("수정 할 항목을 선택해 주세요.");
				return false;
			}
			var pdata = "?idn="+ano+"&org="+bno; 
			openPopup('<c:url value="/MM3/MM3_5/MM3_25/Popup_Event_Modify.do" />'+pdata,500,230,'mm25_popup');		 
		});
		
	
		/*
		 *	삭제 버튼
		 */
		$("#button_delete").click(function() {
			var ano = $("#form_delete input:hidden[name=idnNo]").val();
			if(ano.isEmpty()) {
				alert("삭제 할 항목을 선택해 주세요.");
				return false;
			}
			
			if(!confirm('클럽들 점수도 전부 삭제됩니다.\n 삭제하시겠습니까?')){
				return false;
			}
			
			var params = $("#form_delete").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_5/MM3_25/MM3_25_Delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert('정상적으로 삭제 되었습니다.');
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
		var tbl = $("#table_body tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			var idnorg = $(this).find("input:hidden[name=ocode]").eq(0).val();
			
			// 삭제
			$("#form_delete input:hidden[name=idnNo]").val($.trim(idnno));		
			$("#form_delete input:hidden[name=organCode]").val($.trim(idnorg));
		});
	});
});	

//조직코드 클릭시 클럽별 상세 화면
function detailPop(idnNo, organCode){
	var pdata = "?idn=" + idnNo+"&org=" + organCode; 
	openPopup('<c:url value="/MM3/MM3_5/MM3_25/MM3_25_Popup_Detail.do' + pdata + '" />',1000,700,'mm25_dt_popup'); 
}

function linkPage(){
	$("#form_list").attr("action","/MM3/MM3_5/MM3_25/MM3_25_List.do");
	$("#form_list").submit();
}

</script>

 <style>
.tblType2_1 tbody tr{
	cursor: pointer;
}
</style>
<form:form id="form_list" modelAttribute="MM3_25VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="클럽별인원현황">
		<caption>클럽별 인원현황</caption>
		<colgroup>
			<col width="120px" />
			<col width="*" />
			<col width="120px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>선택조직</th>
				<td><form:select path="upperCode" cssClass="select" /></td>
				<th>회기선택</th>
				<td><form:select path="thisYear" cssClass="select" /></td>
			</tr>
		</tbody>
	</table>	
</div>
<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<img alt="조회" id="button_search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />&nbsp;&nbsp;
		<img alt="입력" id="button_insert" src="/images/lionsclubs/btn/btn_input.gif" style="margin-top:2px" class="pointer authorization write" />
		<img alt="수정" id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" class="pointer authorization write" />
		<img alt="삭제" id="button_delete" src="/images/lionsclubs/btn/btn_del.gif" style="margin-top:2px" class="pointer authorization write" />
	</div>
	
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2" summary="클럽 지구 행사 테이블">
			<caption>행사</caption>
			<colgroup>
				<col width="120px" />
				<col width="300px" />
				<col width="*" />
				<col width="120px" />
				<col width="300px" />
			</colgroup>
			<thead>
			<tr>
				<th>실시일자</th>
				<th>조직코드</th>
				<th>지구행사</th>	
				<th>주관</th>	
				<th>장소</th>
			</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table" id="table_body">
			<colgroup>
				<col width="120px" />
				<col width="300px" />
				<col width="*" />
				<col width="120px" />
				<col width="300px" />
			</colgroup>
			<tbody>
				<c:forEach var="list" items="${resultList }" varStatus="status">
					<tr id="detail" ondblclick="detailPop('${list.idnNo }','${list.organCode }')" title="더블클릭시 행사별 클럽조회"> 
						<td class="center">
							<fmt:parseDate var="takeDate" value="${list.takeDate}" pattern="yyyyMMdd" />
							<fmt:formatDate value="${takeDate }" pattern="yyyy.MM.dd" />
						</td>			
						<td class="left">${list.organName}</td>
						<td class="left">${list.districtEventName }</td>
						<td class="left">${list.subjectCodeName}</td>
						<td class="left">${list.location }</td>
						
						<input type="hidden" name="ocode" value="${list.organCode }" />
						<input type="hidden" name="idn" value="${list.idnNo }" />
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	
</div><!-- table -->

</form:form>
<form name="form_delete" id="form_delete" >
<input type="hidden" name="idnNo" /> 
<input type="hidden" name="organCode" /> 
<input type="hidden" name="districtEcode" />
</form>
