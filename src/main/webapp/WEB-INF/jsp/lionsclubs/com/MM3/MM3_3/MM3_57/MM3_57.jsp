<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_57VO.organCode}"
		});	
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM3_57VO.sessionYear}"	// 고정값
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
	});
});

//링크페이지
function _search(){
	$("#form_list").submit();
}
</script>
<form:form id="form_list"  modelAttribute="MM3_57VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>선택조직</th>
					<td><form:select path="organCode" /></td>
					<th>조회구분</th>
					<td>
						<form:radiobutton path="order" value="1" label="클럽코드순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="정산년월순" cssClass="ml10" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="table">
		<h4>클럽별인원현황</h4>
		<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		</div>
		<div class="tblTitle mT5 Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="*" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
				</colgroup>
				<thead>
					<th>클럽명</th>
					<th>정산년월</th>
					<th>정산일자</th>
					<th>정산카운트</th>
					<th>정산확정일자</th>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="*" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="left" title="${lions:formatOrganCode(list.organCode)} ${list.organName }">${lions:formatOrganCode(list.organCode)} ${list.organName }</td>
							<td class="center">
								<fmt:parseDate var="caYm" value="${list.caYm}" pattern="yyyyMM" />
								<fmt:formatDate value="${caYm}" pattern="yyyy.MM" />
							</td>
							<td class="center">
								<fmt:parseDate var="confirmDate" value="${list.confirmDate}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${confirmDate}" pattern="yyyy.MM.dd" />
							</td>
							<td class="right"><fmt:formatNumber value="${list.confirmCount }" pattern="#,###" /></td>
							<td class="center">
								<fmt:parseDate var="confirmLockDate" value="${list.confirmLockDate}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${confirmLockDate}" pattern="yyyy.MM.dd" />
							</td>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>