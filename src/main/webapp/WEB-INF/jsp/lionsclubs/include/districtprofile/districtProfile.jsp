<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		if(!'${districtProfile.organOffcerMemberBirth }'.isEmpty()){
			var age = getAge(Date.parseExact('${districtProfile.organOffcerMemberBirth }', 'yyyyMMdd').toString("yyyy"));
			$("#birthTerm").text(age + "세");
		}
		
		$("#organCode").mask("a99-999");
		
		$("#organCode, #koName").focus(function(){
			$(this).select();
		});
		
		$("#organCode, #koName").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				var searchType = $(this).prop("id");
				if(searchType == "organCode"){
					var params = [];
					params.push({name:"lvl", value:3});
					params.push({name:"organCode", value:$("#organCode").val()});
					organSearchPopup(params);	
				} else if(searchType == "koName"){
					var params = [];
					params.push({name:"lvl", value:3});
					params.push({name:"koName", value:$("#koName").val()});
					organSearchPopup(params);	
				}
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
			<img src="${ctx}/jfile/thumbPreview.do?fileId=${districtProfile.organOfficerMemberPictureFile}" />
		</td>
		<th>지구코드</th>
		<td><div class="fL">
<%-- 				<input type="text" id="organCode" name="organCode" size="25" class="input" value="${districtProfile.organCode }" /> --%>
				<form:input path="organCode" size="25" cssClass="input" />		
			</div>
			<div class="fR mr20">
				<div class="fR mr20">
					<c:choose>
						<c:when test="${not empty districtProfile.prevOrganCode }">
							<img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" onclick="goUrl('?organCode=${districtProfile.prevOrganCode }')" class="pointer" style="margin-right: 5px;float: left;" />
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_pre3.gif" alt="전" style="margin-right: 5px;float: left;" />
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${not empty districtProfile.nextOrganCode }">
							<img src="/images/lionsclubs/sub/icon_next2.gif" onclick="goUrl('?organCode=${districtProfile.nextOrganCode }')" class="pointer" style="margin-right: 5px;float: left;" />
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_next3.gif" alt="후" style="float: left;" />
						</c:otherwise>
					</c:choose>
				</div>			
			</div>
		</td>
		<th>지구총재</th>
		<td>
			<div class="fL">
				<lions:codetolabel groupCode="7800" code="${districtProfile.officerSolidCode }" />
				<lions:codetolabel groupCode="7790" code="${districtProfile.organOfficerMemberModelCode }" />
			</div>
		</td>
		<td rowspan="5" class="Profile_img">
			<img src="${ctx}/jfile/thumbPreview.do?fileId=${districtProfile.organOfficerNessPictureFile}" />
		</td>
	</tr>
	<tr>
		<th>지구명</th>
		<td>
			<div class="fL">
				<input type="text" id="koName" name="koName" size="25" class="input" value="${districtProfile.koName }" />
			</div>
		</td>
		<th>총재</th>
		<td>${districtProfile.organOfficerMemberNo }&nbsp;&nbsp;&nbsp;${districtProfile.organOfficerMemberName }</td>
	</tr>
	<tr>
		<th>한자/영문</th>
		<td title="${districtProfile.chinName } / ${districtProfile.enName }">
			${districtProfile.chinName } / ${districtProfile.enName }
		</td>
		<th>생년월일</th>
		<td>
			<c:if test="${not empty districtProfile.organOffcerMemberBirth }">
				<fmt:parseDate var="organOffcerMemberBirth" value="${districtProfile.organOffcerMemberBirth }" pattern="yyyyMMdd" />
				
				<a href="/MM1/MM1_1/MM1_01/birthPopup.do?birth=${districtProfile.organOffcerMemberBirth }" onclick="openPopup(this.href, '700', '490'); return false;" title="회원번호 및 생년월일 동일자">
					<fmt:formatDate value="${organOffcerMemberBirth }" pattern="yyyy.MM.dd" />
				</a>
				(<span id="birthTerm"></span>)
			</c:if>		
		</td>
	</tr>
	<tr>
		<th>총회/헌장</th>
		<td>
			<fmt:parseDate var="organMeeting" value="${districtProfile.organMeeting }" pattern="yyyyMMdd" />
			<fmt:formatDate value="${organMeeting }" pattern="yyyy.MM.dd" />		
			/ 
			<fmt:parseDate var="spotNight" value="${districtProfile.spotNight }" pattern="yyyyMMdd" />
			<fmt:formatDate value="${spotNight }" pattern="yyyy.MM.dd" />
		</td>
		<th>입회일자</th>
		<td>
			<c:if test="${not empty districtProfile.organOffcerMemberSingDate }">
				<fmt:parseDate var="organOffcerMemberSingDate" value="${districtProfile.organOffcerMemberSingDate }" pattern="yyyyMMdd" />
				<fmt:formatDate value="${organOffcerMemberSingDate }" pattern="yyyy.MM.dd" />
				(
					<c:if test="${districtProfile.organOffcerMemberSingYearTerm > 0}">
						${districtProfile.organOffcerMemberSingYearTerm}년
					</c:if>
					<c:if test="${districtProfile.organOffcerMemberSingMonthTerm > 0}">
						${districtProfile.organOffcerMemberSingMonthTerm}월
					</c:if>
				)
			</c:if>		
		</td>
	</tr>
	<tr>
		<th>스폰클럽</th>
		<td>${districtProfile.guidingClubCodeName }</td>
		<th>가이딩</th>
		<td>${districtProfile.guidingMemberName }</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->
	