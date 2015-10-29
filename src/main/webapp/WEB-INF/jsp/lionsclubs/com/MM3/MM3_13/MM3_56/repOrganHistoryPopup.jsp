<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
	});
});
</script>

<form:form modelAttribute="MM3_56VO" >
	<h3><div>지구 및 클럽 담당자 이력조회</div></h3>
	
	<div class="popup_bg">
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="60px" />
					<col width="100px" />
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>성명</th>
					<th>직책</th>
					<th>담당시작일</th>
					<th>전화번호</th>
					<th>HP번호</th>
					<th>FAX번호</th>
					<th>메일주소</th>
					<th>Gmail주소</th>
					<th>근무지</th>
				</tr>
			</table>
		</div><!-- tblTitle -->
		<div class="tblPopupH2" style="height: 483px;">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="60px" />
					<col width="100px" />
					<col width="100px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>	
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>${list.memberName }</td>
							<td class="left" title="${list.sectorTitle }">${list.sectorTitle }</td>
							<td class="center">
								<fmt:parseDate var="repStartDate" value="${list.repStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${repStartDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="center">${list.workTel }</td>
							<td class="center">${list.mobile }</td>
							<td class="center">${list.fax }</td>
							<td class="left" title="${list.mailAddress }">${list.mailAddress }</td>
							<td class="left" title="${list.gmail }">${list.gmail }</td>
							<td class="left" title="${list.workPlace }">${list.workPlace }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="popupBtn">
		<img src="/images/lionsclubs/btn/btn_close.gif" style="width:57px" title="닫기" class="pointer" onclick="closeWin();" />
	</div>
</form:form>
