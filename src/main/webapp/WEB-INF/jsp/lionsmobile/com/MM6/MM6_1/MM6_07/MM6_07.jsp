<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<script type="text/javascript">
$(document).ready(function(){
	/*
	 *	조직 선택하기 창 띄우기
	 */
	$("#businessClass").on("change", function(){
		$("#industry").option1Code({ 
	    	 groupCode: '1200'	// 그룹코드
	    	,code: $(this).val()	// 코드
	    	,fixVal: "${MM6_07VO.industry}"	// 고정값
	    	,topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
	    	,isMobile: true
		});
	}).change();
	
	$("#industry").change(function(){
		$("#form_list").submit();
	});
});

function _search(){
	$("form").submit();
}
</script>

<style>
<!--
#scroller table{
	width: 1200px;
}
-->
</style>
<!-- 내용 -->
<form:form id="form_list" modelAttribute="MM6_07VO" action="/m/MM6/MM6_1/MM6_07/MM6_07.do" data-ajax="false">
<div id="content">
	<h3><div>회원 업체 조회</div></h3>

	<div class="table">
		<table class="tblType2">
			<colgroup>
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>업종분류</th>
					<td style="padding: 5px;">
						<lions:codeselect path="businessClass" groupCode="1200" />
					</td>
				</tr>
				<tr>
					<th>업종선택</th>
					<td style="padding: 5px;">
						<form:select path="industry" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table component">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="150px" />
				<col width="200px" />
				<col width="120px" />
				<col width="120px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th class="fixed">이름</th>
					<th>소속클럽</th>
					<th>업체명</th>
					<th>업체직책</th>
					<th>업체전화</th>
					<th>업체주소</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="len" value="${fn:length(resultList) }" />
				<c:choose>
					<c:when test="${len > 0 }">
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr>
								<th>${list.name }</th>
								<td>${list.sectorClub }</td>
								<td>${list.companyName }</td>
								<td>${list.companyTitle }</td>
								<td><a href="tel:${list.workTel }">${list.workTel }</a></td>
								<td>${list.companyAddress}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="6" class='center'>조회 내용이 없습니다.</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div><!-- table -->		
</div>
</form:form>
<!-- 내용 -->
