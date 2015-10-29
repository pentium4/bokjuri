<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#reinductDate").datepicker();
		$("#reinductDate").val(Date.today().toString("yyyy.MM.dd"));
		
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
				alert("재입회 대상을 선택해 주세요.");
				return false;
			}
			
			$(".memberNo:checked").each(function(index){
				var memberNo = $(this);
				var lastQuitDate = memberNo.next().val();
				var reinductDate = $("#reinductDate").val().replaceAll(".", "");
				
				if(lastQuitDate >= reinductDate){
					alert("회원번호 " + memberNo.val() + "의 재입회일자가 퇴회일자보다 이전 날짜 입니다.\n개인기록관리 > 개인 기본 업무 > 경력(선임/위촉)/입력 메뉴에서 퇴회일자를 확인해 주세요.");
					returnCheck = false;
					return false;
				}
			});
			
			if(!returnCheck){
				return false;
			}		
			
			var params = $("form").serializeArray();
			
			$(".memberNo:checked").each(function(index){
				var memberNo = $(this);
				
				params.push({name: "reinductMemberArray["+index+"].memberNo", value:memberNo.val()});
				params.push({name: "reinductMemberArray["+index+"].organCode", value:"${MM1_17VO.organCode}"});
				params.push({name: "reinductMemberArray["+index+"].reinductDate", value:$("#reinductDate").val()});
				params.push({name: "reinductMemberArray["+index+"].insertName", value:"${id }"});
				params.push({name: "reinductMemberArray["+index+"].updateName", value:"${id }"});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM1/MM1_3/MM1_17/insertReinductMember.do" />',
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
tbody tr{
	cursor: pointer;
}
</style>
<form:form modelAttribute="MM1_17VO">
	<h3><div>재입회 회원 입력</div></h3>
	
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="120px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>재입회일자<span class="require">*</span></th>
					<td class="left">
						<form:input path="reinductDate" cssClass="input" />
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
											<input value="${list.lastQuitDate }" type="hidden" />
										</c:when>
										<c:when test="${status.index % 3 eq 1}">
											<input id="memberNo" class="cmemberNo memberNo" value="${list.memberNo }" type="checkbox" />
											<input value="${list.lastQuitDate }" type="hidden" />
										</c:when>
										<c:when test="${status.index % 3 eq 2}">
											<input id="memberNo" class="rmemberNo memberNo" value="${list.memberNo }" type="checkbox" />
											<input value="${list.lastQuitDate }" type="hidden" />
										</c:when>
									</c:choose>
								</td>
								<td>${list.memberNo }</td>
								<td>
									${list.name }
									<c:if test="${list.expulsionFlag eq 'Y' }">(제명)</c:if>
								</td>
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
		<img id="btnClose" src="/images/lionsclubs/btn/btn_close.gif" onclick="closeWin()" class="pointer" />
	</div>
</form:form>
