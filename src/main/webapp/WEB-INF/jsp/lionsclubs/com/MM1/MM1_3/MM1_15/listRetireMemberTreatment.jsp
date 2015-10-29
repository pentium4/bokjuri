<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		//기관 지구코드 세팅
		$("#organCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM1_15VO.organCode}"
		});
		
		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM1_15VO.sessionYear}"	// 고정값
		});	
		
		var tbl = $(".Scroll_Table tbody tr");
		
		$(".treatment").on("click", function(){
			var index = $(this).closest("tr").index();
			
			var idnNo = tbl.eq(index).find(".idnNo");
			var memberNo = tbl.eq(index).find(".memberNo");
			var retireDate = tbl.eq(index).find(".retireDate");
			
			var params = [];
			params.push({name: "idnNo", value: idnNo.val()});
			params.push({name: "memberNo", value: memberNo.val()});
			params.push({name: "retireDate", value: retireDate.val()});
			
			$.ajax({
				url:  '<c:url value="/MM1/MM1_3/MM1_15/updateTreatment.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						tbl.eq(index).find(".approveY").hide();
						tbl.eq(index).find(".treatmentN").hide();
						tbl.eq(index).find(".treatmentY").show();
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
		
		$(".treatmentCancel").on("click", function(){
			if(!confirm("처리취소 하면 이전 경력(선임/위촉) 상태로 복구됩니다.\n처리 취소 하시겠습니까?")){
				return false;
			}
			
			var index = $(this).closest("tr").index();
			var idnNo = tbl.eq(index).find(".idnNo");
			var memberNo = tbl.eq(index).find(".memberNo");
			var retireDate = tbl.eq(index).find(".retireDate");
			
			var params = [];
			params.push({name: "idnNo", value: idnNo.val()});
			params.push({name: "memberNo", value: memberNo.val()});
			params.push({name: "retireDate", value: retireDate.val()});
			
			$.ajax({
				url:  '<c:url value="/MM1/MM1_3/MM1_15/updateTreatmentCancel.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						tbl.eq(index).find(".treatmentY").hide();
						tbl.eq(index).find(".treatmentN").show();
						tbl.eq(index).find(".approveY").show();
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
			
		$("#btnSearch").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#organCode").val()
			});
			
			_search();
		});
		
		$('.recommMember').each(function(){
			$(this).tooltipster({
			     content: $(this).html()
			    ,contentAsHTML: true
			});    
		});
	});
});

// 조회
function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM1_15VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="신입회원 입/출 처리">
			<caption>신입회원 입/출 처리</caption>
			<colgroup>
				<col width="80px" />
				<col width="420px" />
				<col width="80px" />
				<col width="310px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td>
						<form:select path="organCode" cssClass="select" />
					</td>
					<th rowspan="2">조회순서</th>
					<td rowspan="2" class="LH">
						<form:radiobutton path="order" value="3" label="미처리순" cssClass="ml10" />
						<form:radiobutton path="order" value="4" label="처리순" cssClass="ml10" />					
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4>
			<lions:menutitle menuId="${param.menuId }" kind="subtitle" />
			<span style="color:#009cff;margin-left: 20px">[회원 퇴회처리]</span>
		</h4>
	
		<div class="btnBox">
			<span class="mr20">
				<a href="#" onclick="goUrlSubmit('/MM1/MM1_3/MM1_14/listNewMemberTreatment.do')">
					[신입 : ${countNotTreatment.newMemberCnt }]
				</a>
				<a href="#" onclick="goUrlSubmit('/MM1/MM1_3/MM1_15/listRetireMemberTreatment.do')" style=color:#009cff;" class="ml20">
					<strong>
						[퇴회 : ${countNotTreatment.retireMemberCnt }]
					</strong>
				</a>
				<a href="#" onclick="goUrlSubmit('/MM1/MM1_3/MM1_16/listMoveinMemberTreatment.do')" class="ml20">
					[전입 : ${countNotTreatment.moveinMemberCnt }]
				</a>
				<a href="#" onclick="goUrlSubmit('/MM1/MM1_3/MM1_17/listReinductMemberTreatment.do')" class="ml20">
					[재입 : ${countNotTreatment.reinductMemberCnt }]
				</a>
			</span>
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read" />
		</div>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="회원 입/출 처리">
				<caption>회원 입/출 처리</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="100px" />
					<col width="180px" />
					<col width="80px" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>클럽명</th>
						<th>회원번호</th>
						<th>이름(영문)</th>
						<th>생년월일</th>
						<th>입회일</th>
						<th>퇴회일</th>
						<th>스폰회원</th>
						<th>처리</th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="100px" />
					<col width="180px" />
					<col width="80px" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>
								${list.rnum }
								<input type="hidden" name="idnNo" class="idnNo" value="${list.idnNo }" />
								<input type="hidden" name="memberNo" class="memberNo" value="${list.memberNo }" />
								<input type="hidden" name="retireDate" class="retireDate" value="${list.retireDate }" />
							</td>
							<td class="left" title="${list.sectorClubName }">${list.sectorClubName }</td>
							<td>${list.memberNo }</td>
							<td class="left" title="${list.name }<c:if test="${not empty list.engName }">(${list.engName })</c:if><c:if test="${list.expulsionFlag eq 'Y' }">(제명)</c:if>">
								${list.name }
								<c:if test="${not empty list.engName }">(${list.engName })</c:if>
								<c:if test="${list.expulsionFlag eq 'Y' }">(제명)</c:if>
							</td>
							<td>
								<fmt:parseDate var="birth" value="${list.birth }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${birth }" pattern="yyyy.MM.dd" />
							</td>
							<td>
								<fmt:parseDate var="singDate" value="${list.singDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${singDate }" pattern="yyyy.MM.dd" />
							</td>
							<td>
								<fmt:parseDate var="retireDate" value="${list.retireDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${retireDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left recommMember">
								<c:if test="${not empty list.recommMemberNo }">
									${list.recommMemberName }(${list.recommMemberNo })
								</c:if>
							</td>
							<td>
								<span class="treatmentY" style="display: none;">○</span>
							</td>							
							<td>
								<span class="treatmentN" style="display: none;">
									<img id="treatment" src="/images/lionsclubs/btn/btn_treatment.png" style="margin-top:2px" onclick="return false;" alt="처리" class="pointer treatment authorization write" />
								</span>
								<c:if test="${list.appointmentCnt eq '0' }">									
									<span class="treatmentY" style="display: none;">
										<img id="treatmentCancel" src="/images/lionsclubs/btn/btn_treatment_cancel.png" style="margin-top:2px" onclick="return false;" alt="처리취소" class="pointer treatmentCancel authorization write" />
									</span>							
								</c:if>
							</td>
							<script>
								require(['init'], function () {
									var tr = $(".Scroll_Table tbody tr").eq("${status.index}");
									if("${list.treatmentYn}" == "Y"){
										tr.find(".treatmentY").show();
										tr.find(".approveN").hide();
										tr.find(".approveY").hide();
										tr.find(".treatmentN").hide();
									} else if("${list.approveYn}" == "Y") {
										tr.find(".approveY").show();
										tr.find(".approveN").hide();
										tr.find(".treatmentY").hide();
										tr.find(".treatmentN").show();
									}
								});
							</script>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- //Contents_Table_area -->
	</div>
</form:form>