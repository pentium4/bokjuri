<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${PhotoVO.sessionYear}"	// 고정값
			,top: false
		});
		
		$("#sessionYear").on("change", function(){
			_search();
		});		
	});
});

function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="PhotoVO">
	<table border="0" cellpadding="0" cellspacing="0" background="/images/home/common/bbs_box_bg.gif" style="margin-top: 10px; width: 100%;">
		<colgroup>
			<col width="10px" />
			<col width="*" />
			<col width="10px" />
		</colgroup>
	    <tr>
	        <td>
	            <img src="/images/home/common/bbs_box_left.gif" width="10" height="40" border="0">
	        </td>
	        <td>
	        	회기선택 : <form:select path="sessionYear" cssClass="select" />
	        </td>
	        <td>
	            <img src="/images/home/common/bbs_box_right.gif" width="10" height="40" border="0">
	        </td>
	    </tr>
	</table>
	
	<table class="tblType" style="margin-top: 10px;">
		<colgroup>
			<col width="170px" />
			<col width="100px" />
			<col width="150px" />
			<col width="*" />
		</colgroup>
		<thead>
			<tr>
				<th>기간</th>
				<th>행사시간</th>
				<th>행사명</th>
				<th>행사내용 및 장소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${resultList }" var="list">
				<tr>
					<td>
						<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
						~
						<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />
					</td>
					<td>${list.eventStartTime } ~ ${list.eventEndTime }</td>
					<td class="left" title="${list.eventName }">${list.eventName }</td>
					<td class="left" title="${list.eventDesc }">${list.eventDesc }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</form:form>	