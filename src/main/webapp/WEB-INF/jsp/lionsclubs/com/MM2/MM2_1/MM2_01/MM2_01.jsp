<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM2_01VO.sessionYear}"	// 고정값
			,top: false
		});
	
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
			_search();
		});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $("#table_sis tbody tr");
		tbl.bind("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var idnno = $(this).find("input:hidden[name=idn]").eq(0).val();
			
			// 삭제
			$("#form_delete input:hidden[name=idnNo]").val($.trim(idnno));
			
		});
	});
});

function _search(){
	$("#idnNo").val("");
	$("#form_list").submit();
}

function linkHistory(idnNo){
	$("#idnNo").val(idnNo);
	$("form").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM2_01VO" action="/MM2/MM2_1/MM2_01/MM2_01.do">
<form:hidden path="idnNo"/>	
<h3>
	<div>
		<lions:menutitle menuId="${param.menuId }" kind="title" />
		<span class="date">
			<fmt:parseDate var="upDate" value="${basicInfo.updateDate}" pattern="yyyyMMdd" />
			<fmt:formatDate value="${upDate }" pattern="yyyy.MM.dd" />
		</span>
	</div>
</h3>

<jsp:include page="/WEB-INF/jsp/lionsclubs/include/clubprofile/clubProfile.jsp" />

<div class="table">
	<h4>클럽기본
		<em style="position:absolute;top:1px;">
			회기선택 : <form:select path="sessionYear" cssClass="select" />
			<c:forEach items="${officerChangeHistoryList}" var="list" varStatus="status">
				<span style="margin-left: 20px;">
					<a href="#" onclick="linkHistory('${list.idnNo}')" style="${basicInfo.idnNo eq list.idnNo ? 'color:#009cff;' : '' }">
						<fmt:parseDate var="changeDate" value="${list.changeDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${changeDate }" pattern="yyyy.MM.dd" />					
					</a>
				</span>
			</c:forEach>
		</em>
	</h4>
	<div class="btnBox">
		<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
	</div>
	<div class="Height_1">
		<table class="tblType2" summary="클럽기본사항 안내표">
			<caption>클럽기본사항</caption>
			<colgroup>
				<col width="50px" />
				<col width="30px" />
				<col width="30px" />
				<col width="30px" />
				<col width="30px" />
				<col width="30px" />
				<col width="30px" />
				<col width="30px" />
				<col width="30px" />
				<col width="50px" />
				<col width="90px" />
				<col width="50px" />
				<col width="10%" />
			</colgroup>
			<tbody>
				<tr>
					<th>대표수상</th>
					<td colspan="5">${basicInfo.firstAward }</td>
					<td colspan="5">${basicInfo.secodeAward }</td>
					<th>지구조직</th>
					<td>
						<c:if test="${not empty basicInfo.area}">
							<lions:codetolabel groupCode="2620" code="${basicInfo.area}" /> 
							<lions:codetolabel groupCode="2640" code="${basicInfo.zone}" />
						</c:if>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="3">${basicInfo.tel}</td>
					<th colspan="2">휴대폰</th>
					<td colspan="3">${basicInfo.hp}</td>
					<th>이사회</th>
					<td title="${basicInfo.executiveMeet}">
						${basicInfo.executiveMeet}
					</td>
					<th>월례회</th>
					<td title="${basicInfo.monthlyMeet}">
						${basicInfo.monthlyMeet}
					</td>
				</tr>
				<tr>
					<th>팩스번호</th>
					<td colspan="3">${basicInfo.fax}</td>
					<th colspan="2">메일</th>
					<td colspan="3">${basicInfo.email}</td>
					<th colspan="4">클럽조직 구성</th>
				</tr>
				<tr>
					<th rowspan="2">회장슬로건<br />(영문)</th>
					<td colspan="8">${basicInfo.slogan}</td>
					<td colspan="4" rowspan="5" class="innerTbl">
						<div class="innerTitle" style="border-bottom:1px solid #aaa;">
							<table>
								<colgroup>
									<col width="20%" />
									<col width="40%" />
									<col width="40%" />
								</colgroup>
								<tr>
									<th>성명</th>
									<th>클럽직책</th>
									<th>지구직책</th>
								</tr>
							</table>
						</div><!-- InnerTitle -->
						<div class="Inner">
							<table class="Scroll_Table">
								<colgroup>
									<col width="20%" />
									<col width="40%" />
									<col width="40%" />
								</colgroup>
								<c:forEach items="${clubOrgan}" var="list" varStatus="status">
									<tr>
										<td class="center" title="${list.memberName }">
											<c:choose>
												<c:when test="${not empty list.quitDate }">
													<strong class="Blue">${list.memberName }</strong>
												</c:when>
												<c:otherwise>${list.memberName }</c:otherwise>
											</c:choose>
										</td>
										<td class="left" title="${list.clubTitleName }">${list.clubTitleName }</td>
										<td class="left" title="${list.districtTitleName }">${list.districtTitleName }</td>
									</tr>	
								</c:forEach>
							</table>
						</div><!-- Inner -->
					</td>
				</tr>
				<tr><td colspan="8">${basicInfo.sloganEn}</td></tr>
				<tr>
					<th>회원증감</th>
					<th>취임</th>
					<td class="right" style="background-color:white">${basicInfo.startCnt}</td>
					<th>퇴임</th>
					<td class="right" style="background-color:white">${basicInfo.endCnt}</td>
					<th>증감</th>
					<td class="right" style="background-color:white">${basicInfo.subCnt}</td>
					<th>목표</th>
					<td class="right" style="background-color:white">${basicInfo.targetMember }</td>
				</tr>
				<tr>
					<th colspan="9" class="wMM2">주요 활동내용</th>
				</tr>
				<tr>
					<td colspan="9" class="innerTbl">
						<div class="Inner" style="height: 50px">
							<table class="Scroll_Table">
								<colgroup>
									<col width="*" />
								</colgroup>
								<tbody>
									<c:if test="${not empty basicInfo.mainAction1}">
										<tr>
											<td class="left">${basicInfo.mainAction1}</td>
										</tr>									
									</c:if>
									<c:if test="${not empty basicInfo.mainAction2}">
										<tr>
											<td class="left">${basicInfo.mainAction2}</td>
										</tr>									
									</c:if>
									<c:if test="${not empty basicInfo.mainAction3}">
										<tr>
											<td class="left">${basicInfo.mainAction3}</td>
										</tr>									
									</c:if>
									<c:if test="${not empty basicInfo.mainAction4}">
										<tr>
											<td class="left">${basicInfo.mainAction4}</td>
										</tr>									
									</c:if>
									<c:if test="${not empty basicInfo.mainAction5}">
										<tr>
											<td class="left">${basicInfo.mainAction5}</td>
										</tr>									
									</c:if>
								</tbody>
							</table>
						</div><!-- Inner -->
					</td>
				</tr>
				<tr>
					<th colspan="9">클럽탄생</th>
					<th colspan="4">자매결연</th>
				</tr>
				<tr>
					<td colspan="9" class="innerTbl">
						<div class="innerTitle" style="border-bottom:1px solid #aaa;">
							<table>
								<colgroup>
									<col width="120px" />
									<col width="*" />
									<col width="100px" />
								</colgroup>
								<tr>
									<th>조직총회</th>
									<th>클럽명</th>
									<th>가이딩</th>
								</tr>
							</table>
						</div><!-- InnerTitle -->
						<div class="Inner">
							<table class="Scroll_Table">
								<colgroup>
									<col width="120px" />
									<col width="*" />
									<col width="100px" />
								</colgroup>
										
								<c:forEach items="${clubHistory}" var="list" varStatus="status">
									<tr>
										<td class="center">
											<fmt:parseDate var="guidingOrganMeeting" value="${list.guidingOrganMeeting }" pattern="yyyyMMdd" />
											<fmt:formatDate value="${guidingOrganMeeting }" pattern="yyyy.MM.dd" />										
										</td>
										<td class="left" title="${list.guidingOrgan }">${list.guidingOrganName }</td>
										<td class="center" title="${list.guidingMember }">${list.guidingMemberName }</td>
									</tr>	
								</c:forEach>
							</table>
						</div><!-- Inner -->
					</td>
					<td colspan="4" class="innerTbl">
						<div class="innerTitle" style="border-bottom:1px solid #aaa;">
							<table>
								<colgroup>
									<col width="120px" />
									<col width="150px" />
									<col width="*" />
								</colgroup>
								<tr>
									<th>결연일자</th>
									<th>단체명</th>
									<th>지원내용</th>
								</tr>
							</table>
						</div><!-- InnerTitle -->
						<div class="Inner">
							<table class="Scroll_Table">
								<colgroup>
									<col width="120px" />
									<col width="150px" />
									<col width="*" />
								</colgroup>
								
								<c:forEach items="${clubCross}" var="list" varStatus="status">
									<tr>
										<td class="center">
											<fmt:parseDate var="upDate" value="${list.sisterhoodDate }" pattern="yyyyMMdd" />
											<fmt:formatDate value="${upDate }" pattern="yyyy.MM.dd" />
										</td>
										<td class="left" title="${list.locationArea }">${list.locationArea }</td>
										<td class="left" title="${list.event }">${list.event }</td>
									</tr>	
								</c:forEach>
							</table>
						</div><!-- Inner -->
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- Height_1 -->
</div><!-- table -->

	
</form:form>
