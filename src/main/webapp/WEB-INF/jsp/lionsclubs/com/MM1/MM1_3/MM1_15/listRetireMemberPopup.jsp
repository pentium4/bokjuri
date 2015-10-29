<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#retireDate").datepicker();
		$("#retireDate").val(Date.today().toString("yyyy.MM.dd"));
		
		$("#lmemberNoAll").on("click", function(){
			$(".lmemberNo").prop("checked", $(this).is(":checked"));
		});
		
		$(".lmemberNo").on("click", function(){
			var idnNoLength = $(".lmemberNo").length;
			var idnNoCheckLength = $(".lmemberNo:checked").length;
			
			if(idnNoLength == idnNoCheckLength){
				$("#lmemberNoAll").prop("checked", true);
			} else {
				$("#lmemberNoAll").prop("checked", false);
			}
		});	
		
		$("#cmemberNoAll").on("click", function(){
			$(".cmemberNo").prop("checked", $(this).is(":checked"));
		});
		
		$(".cmemberNo").on("click", function(){
			var idnNoLength = $(".cmemberNo").length;
			var idnNoCheckLength = $(".cmemberNo:checked").length;
			
			if(idnNoLength == idnNoCheckLength){
				$("#cmemberNoAll").prop("checked", true);
			} else {
				$("#cmemberNoAll").prop("checked", false);
			}
		});		
		
		$("#rmemberNoAll").on("click", function(){
			$(".rmemberNo").prop("checked", $(this).is(":checked"));
		});
		
		$(".rmemberNo").on("click", function(){
			var idnNoLength = $(".rmemberNo").length;
			var idnNoCheckLength = $(".rmemberNo:checked").length;
			
			if(idnNoLength == idnNoCheckLength){
				$("#rmemberNoAll").prop("checked", true);
			} else {
				$("#rmemberNoAll").prop("checked", false);
			}
		});		
		
		$("#btnSave").on("click", function(){
			var returnCheck = true;
			if(!$("form").valid()){
				return false;
			}
			
			if($(".memberNo:checked").length == 0){
				alert("퇴회대상을 선택해 주세요.");
				return false;
			}
			
			$(".memberNo:checked").each(function(index){
				var memberNo = $(this);
				var lastSingDate = memberNo.next().val();
				var retireDate = $("#retireDate").val().replaceAll(".", "");
				
				if(lastSingDate >= retireDate){
					alert("회원번호 " + memberNo.val() + "의 퇴회일자가 입회일자보다 이전 날짜 입니다.\n개인기록관리 > 개인 기본 업무 > 경력(선임/위촉)/입력 메뉴에서 입회일자를 확인해 주세요.");
					returnCheck = false;
					return false;
				}
			});
			
			if(!returnCheck) {
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$(".memberNo:checked").each(function(index){
				var memberNo = $(this);
				var expulsionFlag = $("#expulsionFlag").is(":checked") == true ? "Y" : "N";
				
				params.push({name: "retireMemberArray["+index+"].memberNo", value: memberNo.val()});
				params.push({name: "retireMemberArray["+index+"].organCode", value: "${MM1_15VO.organCode}"});
				params.push({name: "retireMemberArray["+index+"].retireDate", value: $("#retireDate").val()});
				params.push({name: "retireMemberArray["+index+"].retireReasonCode", value: $("#retireReasonCode").val()});
				params.push({name: "retireMemberArray["+index+"].expulsionFlag", value: expulsionFlag});
				params.push({name: "retireMemberArray["+index+"].insertName", value: "${id }"});
				params.push({name: "retireMemberArray["+index+"].updateName", value: "${id }"});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_3/MM1_15/insertRetireMember.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result != "1"){
						alert(data.result);
					} else {
						opener._search();
						closeWin();
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
</script>
<style>
<!--
tbody tr{
	cursor: pointer;
}
-->
</style>

<form:form modelAttribute="MM1_15VO">
	<h3><div>퇴회회원 입력</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="120px" />
				<col width="100px" />
				<col width="250px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>퇴회일자<span class="require">*</span></th>
					<td class="left">
						<form:input path="retireDate" cssClass="input required" caption="퇴회일자" />
					</td>
					<th>퇴회사유<span class="require">*</span></th>
					<td>
						<lions:codeselect path="retireReasonCode" groupCode="2840" cssStyle="select" cssClass="required" caption="퇴회사유" />
						<form:checkbox id="expulsionFlag" path="expulsionFlag" value="Y" label="제명" />						
					</td>
					<td class="right">현 인원 총 ${totalCount }명</td>
				</tr>
			</tbody>
		</table>		
				
		<div class="tblTitle Scroll_Title mT5">
			<table class="tblPopup" summary="회원검색표">
				<caption>회원검색</caption>
				<colgroup>
					<col width="30px" />
					<col width="115px" />
					<col width="115px" style="border-right: 2px solid black;" />
					<col width="30px" />
					<col width="115px" />
					<col width="115px" style="border-right: 2px solid black;" />
					<col width="30px" />
					<col width="115px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input id="lmemberNoAll" type="checkbox" /></th>
						<th>회원번호</th>
						<th>이름</th>
						<th><input id="cmemberNoAll" type="checkbox" /></th>
						<th>회원번호</th>
						<th>이름</th>
						<th><input id="rmemberNoAll" type="checkbox" /></th>
						<th>회원번호</th>
						<th>이름</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div class="tblPopupH2" style="height: 400px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="115px" />
					<col width="115px" style="border-right: 2px solid black;" />
					<col width="30px" />
					<col width="115px" />
					<col width="115px" style="border-right: 2px solid black;" />
					<col width="30px" />
					<col width="115px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }" varStatus="status">
						<c:if test="${status.index % 3 eq 0}">
							<tr>
						</c:if>
								<td>
									<c:choose>
										<c:when test="${status.index % 3 eq 0}">
											<input id="memberNo" class="lmemberNo memberNo" value="${list.memberNo }" type="checkbox" />
											<input value="${list.lastSingDate }" type="hidden" />
										</c:when>
										<c:when test="${status.index % 3 eq 1}">
											<input id="memberNo" class="cmemberNo memberNo" value="${list.memberNo }" type="checkbox" />
											<input value="${list.lastSingDate }" type="hidden" />
										</c:when>
										<c:when test="${status.index % 3 eq 2}">
											<input id="memberNo" class="rmemberNo memberNo" value="${list.memberNo }" type="checkbox" />
											<input value="${list.lastSingDate }" type="hidden" />
										</c:when>
									</c:choose>
								</td>
								<td>${list.memberNo }</td>
								<td>${list.name }</td>
						<c:if test="${status.index % 3 eq 0 and status.last eq true }">
								<td><td><td><td><td><td>
							</tr>
						</c:if>
							
						<c:if test="${status.index % 3 eq 1 and status.last eq true }">
								<td><td><td>
							</tr>
						</c:if>
							
						<c:if test="${status.index % 3 eq 2 or status.last eq true}">
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- tblInner -->
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<img id="btnSave" src="/images/lionsclubs/btn/btn_save.gif" class="pointer" />
		<img id="close" src="/images/lionsclubs/btn/btn_close.gif" onclick="closeWin()" class="pointer" />
	</div>
</form:form>
