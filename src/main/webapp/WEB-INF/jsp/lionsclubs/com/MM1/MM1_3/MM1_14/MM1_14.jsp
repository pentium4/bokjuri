<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script src="/js/postcode.js"></script>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("데이터를 조회하였습니다.");
		
		if(!'${result.birth }'.isEmpty()){
			var age = getAge(Date.parseExact('${result.birth }', 'yyyyMMdd').toString("yyyy"));
			$("#birthTerm").text(age + "세");
		}
		
		$("#registerNo, #name").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				var id = $(this).prop("id");
				var params = [];
				
				if(id == "registerNo"){
					params.push({name: "registerNo", value: $("#registerNo").val()});	
				} else {
					params.push({name: "name", value: $("#name").val()});	
				}
				
				new lions.popup({
					 url: '/MM1/MM1_3/MM1_14/listRegisterPopup.do'
					,data: params
					,name: "listRegisterPopup"
					,oncomplate: function(r){
						var data = r.data;
						$("#registerNo").val(data.registerno);
						_search();
					}
				}).open();
			}
		});
	
		$("#btn_input").on("click", function(){
			openPopup('/MM1/MM1_3/MM1_14/profilePopup.do', '700', '400', 'profilePopup');
		});
		
		$("#btn_edit").on("click", function(){
			if("${MM1_14VO.registerNo}".isEmpty()){
				alert("등록번호가 없습니다.");
				return false;
			}
			
			openPopup('/MM1/MM1_3/MM1_14/profilePopup.do?registerNo=${MM1_14VO.registerNo}', '700', '400', 'profilePopup');
		});	
		
		$("#btn_delete").on("click", function(){
			if("${MM1_14VO.registerNo}".isEmpty()){
				alert("등록번호가 없습니다.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}
			
			var params = [];
			params.push({name:"registerNo", value:"${MM1_14VO.registerNo}"});
			
			$.ajax({
				url:  '<c:url value="/MM1/MM1_3/MM1_14/delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						goUrl("/MM1/MM1_3/MM1_14/MM1_14.do");
					} else {
						alert(data.result);
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});

function _search(){
	goUrl('/MM1/MM1_3/MM1_14/MM1_14.do?registerNo=' + $("#registerNo").val());
}
</script>

<form:form modelAttribute="MM1_14VO">
	<h3>
		<div>개인기본사항
			<span class="date"></span>
		</div>
	</h3>
	<div class="table">
		<table class="tblType1">
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
					<th>등록번호</th>
					<td>
						<div class="fL">
							<form:input path="registerNo" cssClass="input" size="25" />
						</div>
						<div class="fR mr20">
							<c:choose>
								<c:when test="${not empty registerNo.prevRegisterNo }">
									<img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" style="margin-right: 5px; float: left;" onclick="goUrl('?registerNo=${registerNo.prevRegisterNo }');" class="pointer" />
								</c:when>
								<c:otherwise>
									<img src="/images/lionsclubs/sub/icon_pre3.gif" alt="전" style="margin-right: 5px; float: left;" />
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${not empty registerNo.nextRegisterNo }">
									<img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" style="float: left;" onclick="goUrl('?registerNo=${registerNo.nextRegisterNo }')" class="pointer" />
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
							<img id="btn_input" src="/images/lionsclubs/btn/btn_input.gif" class="pointer authorization write" />
							<img id="btn_edit" src="/images/lionsclubs/btn/btn_edit.gif" class="pointer authorization write" />
							<img id="btn_delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
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
					</td>
					<th>생년월일</th>
					<td>
						<c:if test="${not empty result.birth }">
							<fmt:parseDate var="birth" value="${result.birth }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${birth }" pattern="yyyy.MM.dd" />
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
						<fmt:parseDate var="singDate" value="${result.singDate }" pattern="yyyyMMdd" />
						<fmt:formatDate value="${singDate }" pattern="yyyy.MM.dd" />					
					</td>
				</tr>
				<tr>
					<th>소속클럽</th>
					<td>${result.sectorClubName }</td>
					<th>입회구분</th>
					<td>
						<span class="Blue"></span>
					</td>
				</tr>
				<tr>
					<th>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책</th>
					<td>
						<span class="Blue title"></span>
					</td>
					<th>퇴회일자</th>
					<td>
						<span class="Red"></span>
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	
	<div class="table">
		<h4>회원기본</h4>
		<div class="btnBox">
			<img src="/images/lionsclubs/btn/btn_edit.gif" style="width:57px" class="pointer authorization write" onclick="openPopup('/MM1/MM1_3/MM1_14/hrPopup.do?registerNo=${result.registerNo }', '1000', '350');" />
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
						<td colspan="3"></td>
					</tr>
					<tr>
						<th>자택전화</th>
						<td>${result.homeTel }</td>
						<th>팩스번호</th>
						<td>${result.fax }</td>
						<th>분과소속</th>
						<td></td>
						<th>지구조직</th>
						<td></td>
					</tr>
					<tr>
						<th>메일주소</th>
						<td>${result.mailAddress }</td>
						<th>HP/Gmail</th>
						<td>${result.gmail }</td>
						<th>지구직책</th>
						<td colspan="3"></td>
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
