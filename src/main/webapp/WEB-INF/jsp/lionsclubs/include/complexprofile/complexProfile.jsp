<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		if(!'${complexProfile.organOffcerMemberBirth }'.isEmpty()){
			var age = getAge(Date.parseExact('${complexProfile.organOffcerMemberBirth }', 'yyyyMMdd').toString("yyyy"));
			$("#birthTerm").text(age + "세");
		}
		
		$("#organCode").mask("a99-999");
		
		$("#organCode, #koName").focus(function(){
			$(this).select();
		});
		
		$("#organCode, #koName").on("keypress", function(e){
			//$("#organCode").unmask("a99-999");
			
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				var searchType = $(this).prop("id");
				if(searchType == "organCode"){
					var params = [];
					params.push({name:"lvlEnd", value:2});
					params.push({name:"organCode", value:$("#organCode").val()});
					organSearchPopup(params);	
				} else if(searchType == "koName"){
					var params = [];
					params.push({name:"lvlEnd", value:2});
					params.push({name:"koName", value:$("#koName").val()});
					organSearchPopup(params);	
				}			
				
				event.preventDefault();
			}
		});
	});
});

function _organResult(value){
	$("#organCode").val($.url(value).param("organCode"));
	_search();
}
//-->
</script>

<div class="table">
	<table class="tblType1" summary="개인 기본사항 안내표">
	<caption>개인 기본사항</caption>
	<colgroup>
		<col width="105px" />
		<col width="90px" />
		<col width="32%" />
		<col width="90px" />
		<col width="*" />
		<col width="105px" />
	</colgroup>
	<tbody>
	<tr>
		<td rowspan="5" class="Profile_img">
			<img src="${ctx}/jfile/thumbPreview.do?fileId=${complexProfile.organOfficerMemberPictureFile}" />
		</td>
		<th>복합/연합</th>
		<td><div class="fL">
				<form:input path="organCode" size="25" cssClass="input" />		
			</div>
			<div class="fR mr20">
				<div class="fR mr20">
					<c:choose>
						<c:when test="${not empty complexProfile.prevOrganCode }">
							<img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" onclick="goUrl('?organCode=${complexProfile.prevOrganCode }')" class="pointer" style="margin-right: 5px;float: left;" />
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_pre3.gif" alt="전" style="margin-right: 5px;float: left;" />
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${not empty complexProfile.nextOrganCode }">
							<img src="/images/lionsclubs/sub/icon_next2.gif" onclick="goUrl('?organCode=${complexProfile.nextOrganCode }')" class="pointer" style="margin-right: 5px;float: left;" />
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_next3.gif" alt="후" style="float: left;" />
						</c:otherwise>
					</c:choose>
				</div>			
			</div>
		</td>
		<th>복합의장</th>
		<td>
			<div class="fL">
				<lions:codetolabel groupCode="7800" code="${complexProfile.officerSolidCode }" />
				<lions:codetolabel groupCode="7790" code="${complexProfile.organOfficerMemberModelCode }" />
			</div>
		</td>
		<td rowspan="5" class="Profile_img">
			<img src="${ctx}/jfile/thumbPreview.do?fileId=${complexProfile.organOfficerNessPictureFile}" />
		</td>
	</tr>
	<tr>
		<th>지구명</th>
		<td>
			<div class="fL">
				<input type="text" id="koName" name="koName" size="25" class="input" value="${complexProfile.koName }" />
<%-- 				<strong>${complexProfile.koName }</strong> --%>
			</div>
		</td>
		<th>총재</th>
		<td>${complexProfile.organOfficerMemberNo }&nbsp;&nbsp;&nbsp;${complexProfile.organOfficerMemberName }</td>
	</tr>
	<tr>
		<th>한자/영문</th>
		<td title="${complexProfile.chinName } / ${complexProfile.enName }">
			${complexProfile.chinName } / ${complexProfile.enName }
		</td>
		<th>생년월일</th>
		<td>
			<c:if test="${not empty complexProfile.organOffcerMemberBirth }">
				<fmt:parseDate var="organOffcerMemberBirth" value="${complexProfile.organOffcerMemberBirth }" pattern="yyyyMMdd" />
				
				<a href="/MM1/MM1_1/MM1_01/birthPopup.do?birth=${complexProfile.organOffcerMemberBirth }" onclick="openPopup(this.href, '700', '490'); return false;" title="회원번호 및 생년월일 동일자">
					<fmt:formatDate value="${organOffcerMemberBirth }" pattern="yyyy.MM.dd" />
				</a>
				(<span id="birthTerm"></span>)
			</c:if>		
		</td>
	</tr>
	<tr>
		<th>총회/헌장</th>
		<td>
			<fmt:parseDate var="organMeeting" value="${complexProfile.organMeeting }" pattern="yyyyMMdd" />
			<fmt:formatDate value="${organMeeting }" pattern="yyyy.MM.dd" />		
			/ 
			<fmt:parseDate var="spotNight" value="${complexProfile.spotNight }" pattern="yyyyMMdd" />
			<fmt:formatDate value="${spotNight }" pattern="yyyy.MM.dd" />
		</td>
		<th>입회일자</th>
		<td>
			<c:if test="${not empty complexProfile.organOffcerMemberSingDate }">
				<fmt:parseDate var="organOffcerMemberSingDate" value="${complexProfile.organOffcerMemberSingDate }" pattern="yyyyMMdd" />
				<fmt:formatDate value="${organOffcerMemberSingDate }" pattern="yyyy.MM.dd" />
				(
					<c:if test="${complexProfile.organOffcerMemberSingYearTerm > 0}">
						${complexProfile.organOffcerMemberSingYearTerm}년
					</c:if>
					<c:if test="${complexProfile.organOffcerMemberSingMonthTerm > 0}">
						${complexProfile.organOffcerMemberSingMonthTerm}월
					</c:if>
				)
			</c:if>		
		</td>
	</tr>
	<tr>
		<th>스폰클럽</th>
		<td>${complexProfile.guidingClubCodeName }</td>
		<th>가이딩</th>
		<td>${complexProfile.guidingMemberName }</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->
	