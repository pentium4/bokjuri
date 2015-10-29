<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		
		$("#button_search").click(function() {
			_search();
		});
		 
		//기관 클럽코드 세팅
		$("#upperCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_25VO.upperCode}"
		});
		
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM3_25VO.thisYear}"	
		});
	
		$("#button_update").click(function() {
			var acode = $("#form_delete input:hidden[name=organCode]").val();
			var ano = $("#form_delete input:hidden[name=scoreIdnNo]").val();
			if(ano == "") {
				alert("수정 할 항목을 선택해 주세요.");
				return false;
			}
			
			var pdata = "?idn="+$("#idnNo").val()+"&org="+acode+"&sidn="+ano;
			openPopup('<c:url value="/MM3/MM3_5/MM3_25/MM3_25_Popup_Modify.do' + pdata + '" />', '300', '300', "mm25_p_popup");
			
		});
		
		var tbl = $("#table_sis tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var sidn = $(this).find("input:hidden[name=sidn]").eq(0).val();
			var ocode = $(this).find("input:hidden[name=ocode]").eq(0).val();
			
			$("#form_delete input:hidden[name=scoreIdnNo]").val($.trim(sidn));	
			$("#form_delete input:hidden[name=organCode]").val($.trim(ocode));	
		});
		
		//전체조회 기본체크 처리
		if($("input:checkbox[name=s2]").is(":checked")==false && $("input:checkbox[name=s3]").is(":checked")==false) {
			$("input:checkbox[name=s1]").attr("checked", true);  
		}
	});
});

function _search(){
	$("#form_list").submit();
}
</script>

<form:form id="form_list" modelAttribute="MM3_25VO">
<form:hidden path="idnNo"/>
<form:hidden path="eventOrgan"/>

<h3><div>클럽/지구행사점수 입력</div></h3>

<div class="popup_bg">
	<table class="tblType1" summary="클럽/지구행사점수 입력표">
	<caption>클럽/지구행사점수 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="350px" />
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>조직코드</th>
		<td>
			<div class="fL">			
				${resultHead.upperCodeName}
			</div>
		</td>
		<th>실시일자</th>
		<td>
			<fmt:parseDate var="takeDate" value="${resultHead.takeDate}" pattern="yyyyMMdd" />
			<fmt:formatDate value="${takeDate }" pattern="yyyy.MM.dd" />		
		</td>
		<th>장소</th>
		<td>${resultHead.location }</td>
	</tr>
	<tr>
		<th>지구행사</th>
		<td>${resultHead.districtEventCode}</td>
		<th >정렬구분</th>
		<td colspan="3" class="LH">
			<form:radiobutton path="order" value="1" label="클럽차타순" cssClass="ml10" />
			<form:radiobutton path="order" value="2" label="클럽가나다순" cssClass="ml10" />
			<form:radiobutton path="order" value="3" label="점수있는클럽조회" cssClass="ml10" />				
		</td>		
	</tr>
	</tbody>
	</table>
	
	<div class="btnBox2">
		<img title="조회" id="button_search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer" />&nbsp;&nbsp;
		<img title="수정" id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" style="margin-top:2px" class="pointer" />
	</div>

	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2_1" summary="클럽/지구행사 점수표">
		<caption>클럽/지구행사 점수</caption>
		<colgroup>
			<col width="40px" />
			<col width="*" />
			<col width="100px" />
			<col width="70px" />
			<col width="70px" />
			<col width="70px" />
			<col width="70px" />
			<col width="70px" />
			<col width="70px" />
			<col width="120px" />
			<col width="80px" />
			<col width="70px" />
		</colgroup>
		<tr>
			<th rowspan="2">No</th>
			<th rowspan="2">클럽명</th>
			<th rowspan="2">총점</th>
			<th colspan="3">주관</th>
			<th colspan="3">참가</th>
			<th colspan="3">봉사금</th>
		</tr>
		<tr>
			<th>인원</th>
			<th>수정</th>
			<th>기준점수</th>
			<th>인원</th>
			<th>수정</th>
			<th>기준점수</th>
			<th>총액</th>
			<th>기준</th>
			<th>기준점수</th>
		</tr>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" style="height: 483px">
		<table class="tblType2_1 Scroll_Table" id="table_sis">
			<colgroup>
				<col width="40px" />
				<col width="*" />
				<col width="100px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="70px" />
				<col width="120px" />
				<col width="80px" />
				<col width="70px" />
			</colgroup>	
			<tbody>
				<c:forEach var="list" items="${resultList }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td class="left" title="${list.organName }">${list.organName }</td>
						<td class="right">${list.totalScore }</td>
						<td class="right">${list.subjectMember }</td>
						<td class="right">${list.subjectMod }</td>
						<td class="right">${list.subjectScore }</td>
						<td class="right">${list.entryMember }</td>
						<td class="right">${list.entryMod }</td>
						<td class="right">${list.entryScore }</td>
						<td class="right"><fmt:formatNumber value="${list.serveAmount }" pattern="#,###"/></td>
						<td class="right"><fmt:formatNumber value="${list.serveAmountStand }" pattern="#,###"/></td>
						<td class="right">${list.serveAmountScore }</td>
						
					    <input type="hidden" name="ocode" value="${list.organCode}" />
						<input type="hidden" name="sidn" value="${list.scoreIdnNo}" />
						
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div>
	
	<div class="popupBtn">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>	
</div>
</form:form>
<form name="form_delete" id="form_delete" >
<input type="hidden" name="scoreIdnNo" /> 
<input type="hidden" name="organCode" /> 
</form>
