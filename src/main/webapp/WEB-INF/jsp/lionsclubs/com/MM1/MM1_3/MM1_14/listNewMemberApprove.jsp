<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 4
			,searchable: true
			,fixVal: "${MM1_14VO.organCode}"
		});

		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM1_14VO.sessionYear}"	// 고정값
		});
		
		var tbl = $(".Scroll_Table tbody tr");
		
		$(".approve").on("click", function(){
			var index = $(this).closest("tr").index();
			
			var registerNo = tbl.eq(index).find(".registerNo").val();
			var params = [];
			params.push({name:"registerNo", value:registerNo});
			
			$.ajax({
				url:  '<c:url value="/MM1/MM1_3/MM1_14/updateApprove.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						tbl.eq(index).find(".approveN").hide();
						tbl.eq(index).find(".approveY").show();
						tbl.eq(index).find(".treatmentN").show();					
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
	
		$(".approveCancel").on("click", function(){
			var index = $(this).closest("tr").index();
			
			var registerNo = tbl.eq(index).find(".registerNo").val();
			var params = [];
			params.push({name:"registerNo", value:registerNo});
			
			$.ajax({
				url:  '<c:url value="/MM1/MM1_3/MM1_14/updateApproveCancel.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						tbl.eq(index).find(".approveN").show();
						tbl.eq(index).find(".approveY").hide();
						tbl.eq(index).find(".treatmentN").hide();
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
				 lvl: 4
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

<form:form modelAttribute="MM1_14VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="80px" />
				<col width="380px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td>
						<form:select path="organCode" cssClass="select" />
					</td>
					<th rowspan="2">조회순서</th>
					<td rowspan="2">
						<form:radiobutton path="order" value="1" label="미승인순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="승인순" cssClass="ml10" /><br/>
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
		</h4>
		
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" alt="조회" class="pointer authorization read" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="회원 입/출 처리">
				<caption>회원 입/출 처리</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="100px" />
					<col width="100px" />
					<col width="200px" />
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
					<col width="50px" />
					<col width="50px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>클럽명</th>
						<th>등록번호</th>
						<th>회원번호</th>
						<th>이름(영문)</th>
						<th>생년월일</th>
						<th>입회일</th>
						<th>스폰회원</th>
						<th>승인</th>
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
					<col width="100px" />
					<col width="200px" />
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
					<col width="50px" />
					<col width="50px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>
								${list.rnum }
								<input type="hidden" name="registerNo" class="registerNo" value="${list.registerNo }" />
								<input type="hidden" name="birth" class="birth" value="${list.birth }" />
							</td>
							<td class="left" title="${list.sectorClubName }">${list.sectorClubName }</td>
							<td class="left" title="${list.registerNo }">${list.registerNo }</td>
							<td>${list.memberNo }</td>
							<td class="left">${list.name }(${list.engName })</td>
							<td>
								<fmt:parseDate var="birth" value="${list.birth }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${birth }" pattern="yyyy.MM.dd" />
							</td>
							<td>
								<fmt:parseDate var="singDate" value="${list.singDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${singDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left recommMember">
								<c:if test="${not empty list.recommMemberNo }">
									${list.recommMemberName }(${list.recommMemberNo })
								</c:if>
							</td>
							<td>
								<span class="approveY" style="display: none;">○</span>
								<span class="treatmentY" style="display: none;">○</span>
							</td>
							<td>
								<c:if test="${list.treatmentYn eq 'Y' }">○</c:if>
							</td>
							<td>
								<span class="approveN">
									<img id="approve" src="/images/lionsclubs/btn/btn_approve.png" style="margin-top:2px" onclick="return false;" alt="승인" class="pointer approve authorization write" />
								</span>
								<span class="approveY" style="display: none;">
									<img id="approveCancel" src="/images/lionsclubs/btn/btn_approve_cancel.png" style="margin-top:2px" onclick="return false;" alt="승인취소" class="pointer approveCancel authorization write" />
								</span>
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