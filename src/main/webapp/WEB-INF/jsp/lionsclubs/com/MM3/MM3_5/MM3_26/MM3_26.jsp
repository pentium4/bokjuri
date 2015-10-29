<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
			linkPage();
		});
		
		$("#thisYear").sessionYearCombo({
			fixVal: "${MM3_26VO.thisYear}"	// 고정값
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM3_26VO.organCode}"
		});
	});
});
//링크페이지
function linkPage(){
	$("#form_list").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM3_26VO">

<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>

<div class="table">
	<table class="tblType1" summary="클럽행사점수조회표">
	<caption>클럽행사점수조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>조직코드</th>
		<td colspan="3">
		<div class="fL">
			<form:select path="organCode"/>
		</div>
		</td>
		<th>회기선택</th>
		<td colspan="2">
			<form:select path="thisYear" cssClass="select" />
		</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<img id="searchBtn" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
	</div>
	<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2_1" summary="클럽별 부과금액 조회표">
	<caption>클럽별 부과금액 조회</caption>
	<colgroup>
		<col width="110px" />
		<col width="*" />
		<col width="80px" />		
		<col width="150px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<tr>
		<th>행사일자</th>
		<th>행사명</th>
		<th>행사주관</th>		
		<th>행사장소</th>
		<th>점수</th>
		<th>주관</th>
		<th>참가</th>
		<th>봉사금</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table" id="table_body">
	<colgroup>
		<col width="110px" />
		<col width="*" />
		<col width="80px" />		
		<col width="150px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<tbody>
	<c:forEach var = "list" items ="${resultList}" varStatus="status">
	<tr>
		<td>
		<fmt:parseDate var="takeDate" value="${list.takeDate }" pattern="yyyyMMdd" />
		<fmt:formatDate value="${takeDate }" pattern="yyyy.MM.dd" /></td>
		<td class="left" title="${list.districtEventName }">${list.districtEventName }</td>
		<td>${list.subjectCodeName }</td>
		
		<td class="left">${list.location }</td>
		<td class="right">${list.totalScore }</td>
		<td class="right">${list.subjectScore }</td>
		<td class="right">${list.entryScore }</td>
		<td class="right">${list.amountScore }</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>