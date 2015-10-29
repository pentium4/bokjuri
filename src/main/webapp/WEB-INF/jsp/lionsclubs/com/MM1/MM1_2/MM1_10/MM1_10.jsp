<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	});
});
</script>

<form:form id="form_list" modelAttribute="MM1_10VO" action="/MM1/MM1_2/MM1_10/MM1_10.do">
	<h3><div>경조사 조회 </div></h3>
	<div id="profile"></div>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	
	<div class="table">
		<h4>지급 내역</h4>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="지급 내역표">
				<caption>지급 내역</caption>
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="*" />
					<col width="150px" />
				</colgroup>
				<thead>
					<tr>
						<th>발생일자</th>
						<th>경조사유</th>
						<th>내 용</th>
						<th>금 액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table id="table_day" class="tblType2 Scroll_Table">
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="*" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
							</td>
							<td>${list.detailItemName }</td>
							<td>${list.reference }</td>
							<td class="right"><fmt:formatNumber value="${list.clubImpost }"/></td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>	
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>
