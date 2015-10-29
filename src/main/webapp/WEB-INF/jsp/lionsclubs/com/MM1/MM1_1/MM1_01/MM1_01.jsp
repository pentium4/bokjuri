<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		var age = getAge(Date.parseExact('${result.birth }', 'yyyyMMdd').toString("yyyy"));
		$("#birthTerm").text(age + "세");
		
		$("#memberNo, #name").focus(function(){
			$(this).select();
		});

		$("#memberNo, #name").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				var id = $(this).prop("id");
				var params = [];
				
				if(id == "memberNo"){
					params.push({name: "memberNo", value: $("#memberNo").val()});	
				} else {
					params.push({name: "name", value: $("#name").val()});	
				}
				
				new lions.popup({
					 url: '/common/member/memberSearchPopup.do'
					,data: params
					,name: "memberSearchPopup"
					,oncomplate: function(r){
						var data = r.data;
						$("#memberNo").val(data.memberno);
						_search();
					}
					,width: "1000"
					,height: "400"				 
				}).open();
			}
		});
		
		var content = "";
		if(!"${result.associationTitle}".isEmpty()){
			content += "[연합:${result.associationTitle }] ";
		} 
		if(!"${result.complexTitle}".isEmpty()){
			content += "[복합:${result.complexTitle }] ";
		}
		if(!"${result.districtTitle}".isEmpty()){
			content += "[지구:${result.districtTitle }] ";
		}
		if(!"${result.clubTitle}".isEmpty()){
			content += "[클럽:${result.clubTitle }] ";
		}
		if(!"${result.divisionSector}".isEmpty()){
			content += "[담당분과:${result.divisionSector }]";
		}	
		$('.title').tooltipster({
		     content: content
		    ,contentAsHTML: true
		});
	});
});

function _search(url){
	goUrl(url + '?memberNo=' + $("#memberNo").val());
}
</script>

<form:form modelAttribute="MM1_01VO">
	<h3>
		<div>개인기본사항
			<span class="date">
				<fmt:formatDate value="${result.updateDate }" pattern="yyyy.MM.dd" />	
			</span>
		</div>
	</h3>
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
				<img alt="본인 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${result.memberPictureFile}" />
			</td>
			<th>회원번호</th>
			<td>
				<div class="fL">
					<input type="text" id="memberNo" value="${result.memberNo }" class="input" onclick="return false;" style="margin-top:1px;" title="회원번호" />
				</div>
				<div class="fR mr20">
					<c:choose>
						<c:when test="${not empty memberNo.prevMemberNo }">
							<img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" style="margin-right: 5px; float: left;" onclick="goUrl('?memberNo=${memberNo.prevMemberNo }');" class="pointer" />
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_pre3.gif" alt="전" style="margin-right: 5px; float: left;" />
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty memberNo.nextMemberNo }">
							<img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" style="float: left;" onclick="goUrl('?memberNo=${memberNo.nextMemberNo }')" class="pointer" />
						</c:when>
						<c:otherwise>
							<img src="/images/lionsclubs/sub/icon_next3.gif" alt="후" style="float: left;" />
						</c:otherwise>
					</c:choose>
				</div>
			</td>
			<th>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</th>
			<td>
				<div class="fL">
					<lions:codetolabel groupCode="1140" code="${result.division }" />
				</div>
				<div class="fR">
					<!-- 회원관리 업무에서 신입 등록이 되기 때문에 입력을 못하도록 주석처리 
					<img src="/images/lionsclubs/btn/btn_input.gif" style="width:57px;vertical-align:top !important;margin-top:2px;" onclick="openPopup('/MM1/MM1_1/MM1_01/profilePopup.do', '700', '300');" class="pointer authorization write" />
					-->
					<img src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px;vertical-align:top !important;margin-top:2px;" onclick="openPopup('/MM1/MM1_1/MM1_01/profileEditPopup.do?memberNo=${result.memberNo }', '700', '300');" class="pointer authorization write" />
				</div>
			</td>
			<td rowspan="5" class="Profile_img">
				<img alt="배우자 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${result.nessPictureFile}" />
			</td>
		</tr>
		<tr>
			<th>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
			<td>
				<div class="fL">
					<input type="text" id="name" value="${result.name }" class="input" style="margin-top:2px;" />
				</div>
				
				<c:if test="${not empty result.officerSolidCode}">
					<div class="pregident">
						<lions:codetolabel groupCode="7800" code="${result.officerSolidCode }" />
						<lions:codetolabel groupCode="7790" code="${result.organOfficerMemberModelCode }" />
					</div>
				</c:if>
			</td>
			<th>생년월일</th>
			<td>
				<c:if test="${not empty result.birth }">
					<fmt:parseDate var="birth" value="${result.birth }" pattern="yyyyMMdd" />
					
					<a href="/MM1/MM1_1/MM1_01/birthPopup.do?birth=${result.birth }" onclick="openPopup(this.href, '700', '490'); return false;" title="생년월일 동일자">
						<fmt:formatDate value="${birth }" pattern="yyyy.MM.dd" />
					</a>
					( <span id="birthTerm"></span> )		
				</c:if>
			</td>
		</tr>
		<tr>
			<th>한자/영문</th>
			<td title="${result.chinName } / ${result.engName }">
				${result.chinName } / ${result.engName }
			</td>
			<th>입회일자</th>
			<td>
				<c:if test="${not empty result.singDate }">
					<fmt:parseDate var="singDate" value="${result.singDate }" pattern="yyyyMMdd" />
					<fmt:formatDate value="${singDate }" pattern="yyyy.MM.dd" />
					(
						<c:if test="${result.singYearTerm > 0}">
							${result.singYearTerm}년
						</c:if>
						<c:if test="${result.singMonthTerm > 0}">
							${result.singMonthTerm}월
						</c:if>
					)
				</c:if>
			</td>
		</tr>
		<tr>
			<th>소속클럽</th>
			<td>
				${result.sectorClub }
			</td>
			<th>입회구분</th>
			<td>
				<span class="Blue">
					<c:choose>
						<c:when test="${not empty result.singDivisionDate }">
							<fmt:parseDate var="singDivisionDate" value="${result.singDivisionDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${singDivisionDate }" pattern="yyyy.MM.dd" />
							(${result.singDivision })
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${not empty result.singDate }">
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
			<th>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책</th>
			<td>
				<span class="Blue title">
					<c:if test="${not empty result.associationTitle }">
						[연합:${result.associationTitle }]
					</c:if>
					<c:if test="${not empty result.complexTitle }">
						[복합:${result.complexTitle }]
					</c:if>
					<c:if test="${not empty result.districtTitle }">
						[지구:${result.districtTitle }] 
					</c:if>
					<c:if test="${not empty result.clubTitle }">
						[클럽:${result.clubTitle }]
					</c:if>
					<c:if test="${not empty result.divisionSector }">
						[담당분과:${result.divisionSector }]
					</c:if> 				
				</span>
			</td>
			<th>퇴회일자</th>
			<td>
				<span class="Red">
					<c:if test="${not empty result.quitDate }">
						<fmt:parseDate var="quitDate" value="${result.quitDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${quitDate }" pattern="yyyy.MM.dd" />
						(${result.quitDivision })
						<c:if test="${result.expulsionFlag eq 'Y' }">(제명)</c:if>
					</c:if>		
				</span>
			</td>
		</tr>
		</tbody>
		</table>
	</div><!-- table -->

	
	<div class="table">
		<h4>회원기본</h4>
		<div class="btnBox">
			<img src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px" class="pointer authorization write" onclick="openPopup('/MM1/MM1_1/MM1_01/hrPopup.do?memberNo=${result.memberNo }', '1000', '350');" />
		</div>
		<div class="Height_1">
			<table class="tblType2">
				<colgroup>
					<col width="90px" />
					<col width="*" />
					<col width="90px" />
					<col width="*" />
					<col width="90px" />
					<col width="150px" />
					<col width="90px" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<tr>
						<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
						<td colspan="5">${result.address }</td>
						<th>우편번호</th>
						<td>${result.zipCode }</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>${result.mobile }</td>
						<th>직장전화</th>
						<td>${result.workTel }</td>
						<th>클럽직책</th>
						<td colspan="3">
							${result.clubTitle }
						</td>
					</tr>
					<tr>
						<th>자택전화</th>
						<td>${result.homeTel }</td>
						<th>팩스번호</th>
						<td>${result.fax }</td>
						<th>분과소속</th>
						<td>${result.divisionSector }</td>
						<th>지구조직</th>
						<td>
							<lions:codetolabel groupCode="2620" code="${result.area}" /> 
							<lions:codetolabel groupCode="2640" code="${result.zone}" />							
						</td>
					</tr>
					<tr>
						<th>메일주소</th>
						<td>${result.mailAddress }</td>
						<th>HP/Gmail</th>
						<td>${result.gmail }</td>
						<th>지구직책</th>
						<td colspan="3">${result.districtTitle }</td>
					</tr>
					<tr>
						<th>업종분류</th>
						<td colspan="3">
							<lions:codetolabel groupCode="1200" code="${result.businessClass }" />
						</td>
						<th>결혼여부</th>
						<td>
							<lions:codetolabel groupCode="2660" code="${result.marryStatus }" />
						</td>
						<th>배우자성명</th>
						<td>${result.gameteName }</td>
					</tr>
					<tr>
						<th>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</th>
						<td colspan="3">${result.industryName }</td> 
						<th>본인가족</th>
						<td>${result.family }</td>
						<th>자　녀</th>
						<td>${result.children }</td>
					</tr>
					<tr>
						<th>업체직책</th>
						<td>
							<lions:codetolabel groupCode="2500" code="${result.companyTitle }" />
						</td>
						<th>업 체 명</th>
						<td>${result.companyName }</td>
						<td colspan="4" rowspan="7" class="innerTbl">
							<div class="center">추천회원(${fn:length(recommMemberList)}명)</div>
							<div class="tblTitle Scroll_Title">
								<table>
									<colgroup>
										<col width="80px" />
										<col width="70px" />
										<col width="100px" />
										<col width="100px" />
										<col width="70px" />
										<col width="40px" />
									</colgroup>
									<thead>
										<tr>
											<th>회원번호</th>
											<th>성명</th>
											<th>입회일자</th>
											<th>입회클럽</th>
											<th>관계</th>
											<th>활동</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="Inner">
								<table class="Scroll_Table">
									<colgroup>
										<col width="80px" />
										<col width="70px" />
										<col width="100px" />
										<col width="100px" />
										<col width="70px" />
										<col width="40px" />
									</colgroup>
									<tbody>
										<c:forEach items="${recommMemberList }" var="list">
											<tr>
												<td>${list.memberNo }</td>
												<td>${list.name }</td>
												<td>
													<fmt:parseDate var="singDate" value="${list.singDate }" pattern="yyyyMMdd" />
													<fmt:formatDate value="${singDate }" pattern="yyyy.MM.dd" />
												</td>
												<td title="${list.sectorClub }">${list.sectorClub }</td>
												<td>${list.recommRealtionship }</td>
												<td>
													<c:choose>
														<c:when test="${empty list.quitDate }">O</c:when>
														<c:otherwise>X</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>									
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<th>업체주소</th>
						<td colspan="3">${result.companyAddress }</td>
					</tr>
					<tr>
						<th>최종학력</th>
						<td>
							<lions:codetolabel groupCode="2520" code="${result.endEducation }" />
						</td>
						<th>출신학교</th>
						<td>${result.nativeSchool }</td>
					</tr>
					<tr>
						<th>전공과목</th>
						<td colspan="3">${result.majorSubject }</td>
					</tr>
					<tr>
						<th>병력관계</th>
						<td>
							<lions:codetolabel groupCode="2540" code="${result.army }" />
						</td>
						<th>혈액형</th>
						<td>
							<lions:codetolabel groupCode="2560" code="${result.blood }" />
						</td>
					</tr>
					<tr>
					<th>취미활동</th>
					<td>${result.hobby }</td>
					<th>신장</th>
					<td>
						<c:if test="${not empty result.height }">
							${result.height } Cm
						</c:if>
					</td>
					</tr>
					<tr>
						<th>추천자</th>
						<td>
							${result.recommMemberName }
							<c:if test="${not empty result.recommSectorClubName }">
								(${result.recommSectorClubName })
							</c:if>
						</td>
						<th>관계</th>
						<td>
							<lions:codetolabel groupCode="2580" code="${result.recommRealtionship }" />
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>