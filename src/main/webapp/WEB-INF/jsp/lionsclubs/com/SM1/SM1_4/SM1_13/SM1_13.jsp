<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${SM1_13VO.sessionYear}"	// 고정값
		});
	
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${SM1_13VO.organCode}"
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
		
		$(".sessionChange").on("click", function(){
			var data = $(this).data();
			var params = [];
			params.push({name: "memberNo", value: data.memberno});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  "/SM1/SM1_4/SM1_13/sessionChange.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						location.href = "/login/actionLogin.do";
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});			
		});
		
	});
});

// 조회
function _search(){
	$("form").submit();
}

//회원검색
function memberProfilePopup(memberNo){
	openPopup("/MM2/MM2_1/MM2_07/profileBasicPopup.do?memberNo=" + memberNo, '530', '230');	
}
</script>

<form:form id="form_list" modelAttribute="SM1_13VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="클럽인원 조회">
		<caption>클럽인원 조회</caption>
		<colgroup>
			<col width="100px" />
			<col width="380px" />
			<col width="100px" />
			<col width="120px" />
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>클럽코드</th>
				<td><form:select path="organCode" cssClass="select" /></td>
				<th>회기선택</th>
				<td><form:select path="sessionYear" cssClass="select" /></td>
				<th>성명</th>
				<td><form:input path="memberName" cssClass="input" /></td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>

	<div class="btnBox">
		<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" />
	</div>
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2_1" summary="클럽인원 조회 안내표">
			<caption>클럽인원 조회</caption>
			<colgroup>
				<col width="80px" />
				<col width="80px" />
				<col width="100px" />
				<col width="200px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>성 명</th>
					<th>입회일자</th>
					<th>직 책</th>
					<th>퇴회일자</th>
					<th>퇴회사유</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table">
			<colgroup>
				<col width="80px" />
				<col width="80px" />
				<col width="100px" />
				<col width="200px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td class="center pointer sessionChange" data-memberno="${list.memberNo }">${list.memberNo }</td>
						<td class="center">
							<a href="#" onclick="memberProfilePopup('${list.memberNo }')" title="새창">
								<c:choose>
									<c:when test="${not empty list.quitDate }">
										<strong class="Blue">${list.memberName }</strong>
									</c:when>
									<c:otherwise>${list.memberName }</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td class="center">
							<fmt:parseDate var="signDate" value="${list.signDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${signDate }" pattern="yyyy.MM.dd" />
						</td>
						
						<c:set var="sectorTitle" value="" />
						<c:choose>
							<c:when test="${not empty list.sectorTitle }">
								<c:set var="sectorTitle">${list.sectorTitle}</c:set>
							</c:when>
							<c:otherwise>
								<c:set var="sectorTitle" value="회원" />
							</c:otherwise>
						</c:choose>
						<td class="left" title="${sectorTitle }">
							<c:choose>
								<c:when test="${not empty list.sectorTitle }">
									${list.sectorTitle}
								</c:when>
								<c:otherwise>
									<c:set var="sectorTitle" value="회원" />
								</c:otherwise>
							</c:choose>
						</td>
						
						<td class="center">
							<fmt:parseDate var="quitDate" value="${list.quitDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${quitDate }" pattern="yyyy.MM.dd" />
						</td>
						<td class="left">${list.quitCause }</td>
					</tr>	
				</c:forEach>	
			</tbody>
		</table>

	</div>
	<!-- //Contents_Table_area -->
</div>

</form:form>