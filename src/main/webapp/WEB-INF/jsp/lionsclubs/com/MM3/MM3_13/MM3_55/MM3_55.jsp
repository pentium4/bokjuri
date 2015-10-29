<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		var age = getAge(Date.parseExact('${result.birth }', 'yyyyMMdd').toString("yyyy"));
		$("#birthTerm").text(age + "세");

		$("#memberNo, #name").focus(function(){
			$(this).select();
		});
		
		$("#memberNo, #name").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13 ) {
				var id = $(this).prop("id");
				var districtCode = "${districtCode}";
				
				var params = [];
				
				if(id == "memberNo"){
					params.push({name: "memberNo", value: $("#memberNo").val()});	
				} else {
					params.push({name: "name", value: $("#name").val()});	
				}
				params.push({name: "districtCode", value: "M" + districtCode.substring(1, 6)});
				
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
		
		$("#btnInsert").on("click", function(){
			openPopup("/MM3/MM3_13/MM3_55/repOrganPopup.do?memberNo=${MM3_55VO.memberNo}", '600', '300', "repOrganPopup");
		});

		$("#btnUpdate").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("수정할 항목을 선택해 주세요.");
				return false;
			}
			
			openPopup("/MM3/MM3_13/MM3_55/repOrganPopup.do?idnNo=" + idnNo, '600', '300', "repOrganPopup");
		});

		$("#btnDelete").on("click", function(){
			var idnNo = $(".idnNo:checked").length == 0 ? "" : $(".idnNo:checked").val();
			
			if(idnNo.isEmpty()) {
				alert("삭제할 항목을 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				type: "POST",
				async: false,			
				url:  '<c:url value="/MM3/MM3_13/MM3_55/deleteRepOrgan.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						_search();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				}
			});			
		});
		

		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/
		var tbl = $("#listTable tbody tr");
		tbl.on("click", function(){
			var $this = $(this);
			tbl.css("background-color","#ffffff");
			$this.css("background-color","#E0FFE0");
			
			$this.find(".idnNo").prop("checked", true);
		});
		
		$(".idnNo:checked").closest("tr").trigger("click");
	});
});

function _search(){
	$("form").submit();
// 	goUrl('?memberNo=' + $("#memberNo").val());
}
</script>
<style>
#listTable tbody tr{
	cursor: pointer;
}
</style>
<form:form modelAttribute="MM3_55VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
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
					<th>회원번호</th>
					<td>
						<div class="fL">
							<input type="text" id="memberNo" name="memberNo" value="${result.memberNo }" class="input" onclick="return false;" style="margin-top:1px;" title="회원번호" />
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
					<th>구<span style="margin-left: 30px;" />분</th>
					<td>
						<div class="fL">
							<lions:codetolabel groupCode="1140" code="${result.division }" />
						</div>
					</td>
					<td rowspan="5" class="Profile_img">
						<img alt="배우자 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${result.nessPictureFile}" />
					</td>
				</tr>
				<tr>
					<th>성<span style="margin-left: 30px;" />명</th>
					<td>
						<div class="fL">
							<input type="text" id="name" value="${result.name }" class="input" style="margin-top:2px;" />
						</div>
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
					<th>직<span style="margin-left: 30px;" />책</th>
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
							</c:if>		
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnInsert" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" class="pointer authorization write" />
			<img id="btnUpdate" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" class="pointer authorization write" />
			<img id="btnDelete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Height_0 Scroll_Title">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="220px" />
					<col width="90px" />
					<col width="90px" />
					<col width="200px" />
					<col width="80px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>담당조직</th>
						<th>담당시작일</th>
						<th>담당종료일</th>
						<th>근무지</th>
						<th>조직책임자</th>
						<th>책임자HP</th>
						<th>전화번호</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->		
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="listTable">
				<colgroup>
					<col width="50px" />
					<col width="220px" />
					<col width="90px" />
					<col width="90px" />
					<col width="200px" />
					<col width="80px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">
								${status.count }
								<form:radiobutton path="idnNo" cssClass="idnNo" value="${list.idnNo }" cssStyle="display: none" />
							</td>
							<td class="left" title="${lions:formatOrganCode(list.repOrganCode) } ${list.repOrganName }">
								${lions:formatOrganCode(list.repOrganCode) } ${list.repOrganName }
							</td>
							<td class="center">
								<fmt:parseDate var="repStartDate" value="${list.repStartDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${repStartDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="center">
								<fmt:parseDate var="repEndDate" value="${list.repEndDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${repEndDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left" title="${list.workPlace }">${list.workPlace }</td>
							<td class="center">${list.organOfficerMemberName }</td>
							<td class="center">${list.hp }</td>
							<td class="center">${list.tel }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>		
		</div>
	</div><!-- table -->
</form:form>