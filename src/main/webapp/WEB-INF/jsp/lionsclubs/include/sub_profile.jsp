<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		if(!'${profile.birth }'.isEmpty()){
			var age = getAge(Date.parseExact('${profile.birth }', 'yyyyMMdd').toString("yyyy"));
			$("#birthTerm").text(age + "세");
		}
		
		$("#searchMemberNo, #name").focus(function(){
			$(this).select();
		});
		
		$("#searchMemberNo, #name").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				memberPopup($(this).prop("id"));
			}
		});
			
		var content = "";
		if(!"${profile.associationTitle}".isEmpty()){
			content += "[연합:${profile.associationTitle }] ";
		} 
		if(!"${profile.complexTitle}".isEmpty()){
			content += "[복합:${profile.complexTitle }] ";
		}
		if(!"${profile.districtTitle}".isEmpty()){
			content += "[지구:${profile.districtTitle }] ";
		}
		if(!"${profile.clubTitle}".isEmpty()){
			content += "[클럽:${profile.clubTitle }]";
		}
		if(!"${profile.divisionSector}".isEmpty()){
			content += "[담당분과:${profile.divisionSector }] ";
		}
		
		$('.title').tooltipster({
		     content: content
		    ,contentAsHTML: true
		});
	});
});

//회원검색
function memberPopup(searchType){
	var guidingMemberName = $("#guidingMemberName").val();
	var params = [];
	
	if(searchType == "searchMemberNo"){
		var memberNo = $("#searchMemberNo").val();
		params.push({name: "memberNo", value: memberNo});
	} else if(searchType == "name"){
		var name = $("#name").val();
		params.push({name: "name", value: name});
	}
	  
	new lions.popup({
		 url: '/common/member/memberSearchPopup.do'
		,data: params
		,name: "memberSearchPopup"
		,width: "1000"
		,height: "400"		
		,oncomplate: function(r){
			var data = r.data;
			$("#searchMemberNo").val(data.memberno);
			$("form").eq(0).submit();
		}
	}).open();	
}
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
					<img src="${ctx}/jfile/thumbPreview.do?fileId=${profile.memberPictureFile}" />
				</td>
				<th>회원번호</th>
				<td><div class="fL">
					<input type="text" id="searchMemberNo" name="searchMemberNo" value="${profile.memberNo }" class="input" onclick="return false;" />
				</div>
					<div class="fR mr20">
						<c:choose>
							<c:when test="${not empty profile.prevMemberNo }">
								<a href="#" onclick="goUrl('?searchMemberNo=${profile.prevMemberNo }');" style="float: left;">
									<img src="/images/lionsclubs/sub/icon_pre2.gif" style="margin-right: 5px" alt="이전 페이지" />
								</a>
							</c:when>
							<c:otherwise>
								<img src="/images/lionsclubs/sub/icon_pre3.gif" style="margin-right: 5px;float: left;" />
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${not empty profile.nextMemberNo }">
								<a href="#" onclick="goUrl('?searchMemberNo=${profile.nextMemberNo }');" style="float: left;">
									<img src="/images/lionsclubs/sub/icon_next2.gif" alt="다음 페이지" />
								</a>
							</c:when>
							<c:otherwise>
								<img src="/images/lionsclubs/sub/icon_next3.gif" style="float: left;" />
							</c:otherwise>
						</c:choose>
				</td>
				<th>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</th>
				<td>
					<div class="fL">
						<lions:codetolabel groupCode="1140" code="${profile.division }" />
					</div>
				</td>
				<td rowspan="5" class="Profile_img">
					<img src="${ctx}/jfile/thumbPreview.do?fileId=${profile.nessPictureFile}" />
				</td>
			</tr>
			<tr>
				<th>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
				<td>
					<div class="fL" style="margin-top: 2px;">
						<input type="text" id="name" value="${profile.name }" class="input" onclick="return false;" />
					</div>
					
					<c:if test="${not empty profile.officerSolidCode}">
						<div class="pregident">
							<lions:codetolabel groupCode="7800" code="${profile.officerSolidCode }" />
							<lions:codetolabel groupCode="7790" code="${profile.organOfficerMemberModelCode }" />
						</div>
					</c:if>				
				</td>
				<th>생년월일</th>
				<td>
					<c:if test="${not empty profile.birth }">
						<fmt:parseDate var="birth" value="${profile.birth }" pattern="yyyyMMdd" />
						
						<a href="/MM1/MM1_1/MM1_01/birthPopup.do?birth=${profile.birth }" onclick="openPopup(this.href, '700', '490', 'birthPopup'); return false;" title="회원번호 및 생년월일 동일자">
							<fmt:formatDate value="${birth }" pattern="yyyy.MM.dd" />
						</a>
						( <span id="birthTerm"></span> )		
					</c:if>
				</td>
			</tr>
			<tr>
				<th>한자/영문</th>
				<td title="${profile.chinName } / ${profile.engName }">
					${profile.chinName } / ${profile.engName }
				</td>
				<th>입회일자</th>
				<td>
					<c:if test="${not empty profile.singDate }">
						<fmt:parseDate var="singDate" value="${profile.singDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${singDate }" pattern="yyyy.MM.dd" />
						(
							<c:if test="${profile.singYearTerm > 0}">
								${profile.singYearTerm}년
							</c:if>
							<c:if test="${profile.singMonthTerm > 0}">
								${profile.singMonthTerm}월
							</c:if>
						)
					</c:if>
				</td>
			</tr>
			<tr>
				<th>소속클럽</th>
				<td>${profile.sectorClub }</td>
				<th>입회구분</th>
				<td>
					<span class="Blue">
						<c:choose>
							<c:when test="${not empty profile.singDivisionDate }">
								<fmt:parseDate var="singDivisionDate" value="${profile.singDivisionDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${singDivisionDate }" pattern="yyyy.MM.dd" />
								(${profile.singDivision })
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${not empty profile.singDate }">
										입회
									</c:when>
									<c:otherwise>
										입회일을 입력하세요.
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>				
					</span>
				</td>
			</tr>
			<tr>
				<th>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책</th>
				<td>
					<span class="Blue title">
						<c:if test="${not empty profile.associationTitle }">
							[연합:${profile.associationTitle }]
						</c:if>
						<c:if test="${not empty profile.complexTitle }">
							[복합:${profile.complexTitle }]
						</c:if>
						<c:if test="${not empty profile.districtTitle }">
							[지구:${profile.districtTitle }] 
						</c:if>
						<c:if test="${not empty profile.clubTitle }">
							[클럽:${profile.clubTitle }]
						</c:if>
						<c:if test="${not empty profile.divisionSector }">
							[담당분과:${profile.divisionSector }]
						</c:if> 				
					</span>
				</td>
				<th>퇴회일자</th>
				<td>
					<span class="Red">
						<c:if test="${not empty profile.quitDate }">
							<fmt:parseDate var="quitDate" value="${profile.quitDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${quitDate }" pattern="yyyy.MM.dd" />
							(${profile.quitDivision })
							<c:if test="${profile.expulsionFlag eq 'Y' }">(제명)</c:if>
						</c:if>		
					</span>
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->
