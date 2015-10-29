<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$('.tblPhoto .eventMemberPopup').each(function(){
			$(this).tooltipster({
			     content: $(this).html()
			    ,contentAsHTML: true
			});    
		});
		
		$(".photoView").on("click", function(){
			var data = $(this).data();
			
			$.viewThumbnailPopup({
				fileId : data.fileid
			});
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${PhotoVO.sessionYear}"	// 고정값
			,top: false
		});
		
		$("#sessionYear, #clubCode").on("change", function(){
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
	            클럽선택 : <form:select path="clubCode" items="${listClubCode }" itemValue="organCode" itemLabel="organName" cssClass="chosen-select" cssStyle="width: 40%;" />
	        </td>
	        <td>
	            <img src="/images/home/common/bbs_box_right.gif" width="10" height="40" border="0">
	        </td>
	    </tr>
	</table>

	<div class="tblPhoto" style="margin-top: 10px;">
	<c:forEach var="list" items="${resultList }">
		<div>
			<p class="photo mb10">
				<c:choose>
					<c:when test="${not empty list.fileId }">
						<img class="pointer photoView" alt="행사 사진" data-fileid="${list.fileId }" data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="77px" width="115px" />
					</c:when>
					<c:otherwise>
						<img alt="행사 사진" data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="77px" width="115px" />	
					</c:otherwise>
				</c:choose>
			</p>
			
			<span id="${list.idnNo }" class="center txt eventMemberPopup pointer">
				<p class="txt ellipsis">${list.organName }</p>
				<p class="txt ellipsis">${list.eventName }</p>
				<p class="txt ellipsis">${list.eventDesc }</p>
				<p class="txt ellipsis">
					<fmt:parseDate var="eventStartDate" value="${list.eventStartDate }" pattern="yyyyMMdd" />
					<fmt:formatDate value="${eventStartDate }" pattern="yyyy.MM.dd" />
					~
					<fmt:parseDate var="eventEndDate" value="${list.eventEndDate }" pattern="yyyyMMdd" />
					<fmt:formatDate value="${eventEndDate }" pattern="yyyy.MM.dd" />						
				</p>
			</span>
		</div>
	</c:forEach>
	</div>
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>	
</form:form>	