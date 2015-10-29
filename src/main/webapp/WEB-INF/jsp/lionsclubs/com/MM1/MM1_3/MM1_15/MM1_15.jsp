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
			,fixVal: "${MM1_15VO.organCode}"
		});
	
		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM1_15VO.sessionYear}"	// 고정값
		});
		
		$("#btnInput").on("click", function(){
			openPopup('<c:url value="/MM1/MM1_3/MM1_15/listRetireMemberPopup.do?organCode=${MM1_15VO.organCode}" />', 800, 550, 'listRetireMemberPopup');
		});
		
		$("#idnNoAll").on("click", function(){
			if($(this).is(":checked")){
				$(".Scroll_Table tbody tr").css("background-color","#E0FFE0");
			} else {
				$(".Scroll_Table tbody tr").css("background-color","#ffffff");
			}
			$(".idnNo").prop("checked", $(this).is(":checked"));
		});	
		
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/
		var tbl = $(".Scroll_Table tbody tr");
		
		tbl.find("td:not(:first):not(:last)").on("click", function(){
			var tr = $(this).closest("tr");
			tr.find(".idnNo").trigger("click");
		});
		
		$(".idnNo").on("click", function(){
			var tr = $(this).closest("tr");
			if($(this).is(":checked")){
				tr.css("background-color","#E0FFE0");
			} else {
				tr.css("background-color","#ffffff");
			}
			
			var idnNoLength = $(".idnNo").length;
			var idnNoCheckLength = $(".idnNo:checked").length;
			
			if(idnNoLength == idnNoCheckLength){
				$("#idnNoAll").prop("checked", true);
			} else {
				$("#idnNoAll").prop("checked", false);
			}
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
		
		$("#btnDelete").on("click", function(){
			var returnCheck = true;
			
			if($(".idnNo:checked").length == 0){
				alert("삭제회원을 선택해 주세요.");
				return false;
			}
			
			$(".idnNo:checked").each(function(index){
				var tr = $(this).closest("tr");
				var approveYn = tr.find(".approveYn").val();
				if(approveYn == "Y"){
					var no = tr.find("td:eq(1)").text();
					alert(no + "번 NO가 승인이 되어 삭제할 수 없습니다.\n"+ no + "번 NO를 체크 해제하시고 다시 시도해 주세요.");
					returnCheck = false;
					return false;
				}
			});
			
			if(!returnCheck){
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}		
			
			var params = $("form").serializeArray();
			
			$(".idnNo:checked").each(function(index){
				var idnNo = $(this);
				params.push({name: "retireMemberArray["+index+"].idnNo", value:idnNo.val()});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_3/MM1_15/deleteRetireMember.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						_search();
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
		
		$(".approve").on("click", function(){
			var index = $(this).closest("tr").index();
			
			var idnNo = tbl.eq(index).find(".idnNo").val();
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				url:  '<c:url value="/MM1/MM1_3/MM1_15/updateApprove.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						tbl.eq(index).find(".approveN").hide();
						tbl.eq(index).find(".approveY").show();
						tbl.eq(index).find(".treatmentN").show();
						
						tbl.eq(index).find(".approveYn").val("Y");
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
			
			var idnNo = tbl.eq(index).find(".idnNo").val();
			var params = [];
			params.push({name: "idnNo", value: idnNo});
			
			$.ajax({
				url:  '<c:url value="/MM1/MM1_3/MM1_15/updateApproveCancel.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						tbl.eq(index).find(".approveN").show();
						tbl.eq(index).find(".approveY").hide();
						tbl.eq(index).find(".treatmentN").hide();
						
						tbl.eq(index).find(".approveYn").val("N");
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
	
		$('.insertMember').each(function(){
			$(this).tooltipster({
			     content: $(this).html()
			    ,contentAsHTML: true
			});    
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
<style>
tbody tr{
	cursor: pointer;
}
</style>
<form:form modelAttribute="MM1_15VO">
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
					<td rowspan="2" class="LH">
						<form:radiobutton path="order" value="1" label="미승인순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="승인순" cssClass="ml10" /><br/>
						<form:radiobutton path="order" value="3" label="미처리순" cssClass="ml10" />
						<form:radiobutton path="order" value="4" label="처리순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" alt="조회" class="pointer authorization read" />
			<img id="btnInput" src="/images/lionsclubs/btn/btn_input.gif" style="margin-top:2px" alt="입력" class="pointer authorization write" />
			<img id="btnDelete" src="/images/lionsclubs/btn/btn_del.gif" style="margin-top:2px" alt="삭제" class="pointer authorization write" />
		</div>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="퇴회회원 입력">
				<caption>퇴회회원 입력</caption>
				<colgroup>
					<col width="30px" />
					<col width="30px" />
					<col width="*" />
					<col width="80px" />
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="60px" />
					<col width="50px" />
					<col width="50px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="idnNoAll" />
						</th>
						<th>NO</th>
						<th>클럽명</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>생년월일</th>
						<th>입회일</th>
						<th>스폰회원</th>
						<th>퇴회일</th>
						<th>퇴회사유</th>
						<th>입력일</th>
						<th>입력자</th>
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
					<col width="30px" />
					<col width="30px" />
					<col width="*" />
					<col width="80px" />
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="80px" />
					<col width="60px" />
					<col width="50px" />
					<col width="50px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="idnNo" class="idnNo" value="${list.idnNo }" />
								<input type="hidden" class="approveYn" value="${list.approveYn }" />
							</td>
							<td>${list.rnum }</td>
							<td class="left" title="${list.sectorClubName }">${list.sectorClubName }</td>
							<td>${list.memberNo }</td>
							<td>${list.name }</td>
							<td>
								<fmt:parseDate var="birth" value="${list.birth }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${birth }" pattern="yyyy.MM.dd" />
							</td>
							<td>
								<fmt:parseDate var="singDate" value="${list.singDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${singDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left recommMember">
								${list.recommMemberName }
								<c:if test="${not empty list.recommMemberNo }">
									(${list.recommMemberNo })
								</c:if>
							</td>
							<td>
								<fmt:parseDate var="retireDate" value="${list.retireDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${retireDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left" title="${list.retireReasonName }<c:if test="${list.expulsionFlag eq 'Y' }">(제명)</c:if>">
								${list.retireReasonName }
								<c:if test="${list.expulsionFlag eq 'Y' }">(제명)</c:if>
							</td>
							<td>
								<fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left insertMember">
								${list.insertName }
								<c:if test="${not empty list.insertMemberNo }">
									(${list.insertMemberNo })
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