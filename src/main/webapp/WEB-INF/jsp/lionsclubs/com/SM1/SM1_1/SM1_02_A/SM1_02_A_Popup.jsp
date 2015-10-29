<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#message").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$(".authStartDate").datepicker();
		$(".authEndDate").datepicker();
		
		$("#complex").organCode({
			 lvl: 2 // 1:연합회, 2:복합지구, 3:지구, 4:클럽 
			,fixVal: "${SM1_02_AVO.complexCode}"  // 고정값
			,searchable: true
			,top: true
		});
		
		$("#complex").on("change", function(){
// 			if($(this).val() == ""){
// 				$("#district").find("option").not(":first").remove();
// 				$("#district").change();
// 				return;
// 			}
			
			$("#district").organCode({
				 lvl: 3 // 1:연합회, 2:복합지구, 3:지구, 4:클럽 
				,fixVal: "${SM1_02_AVO.districtCode}"  // 고정값
				,upperOrganCode: $("#complex").val()
				,searchable: true
				,top: true
			});
			
			$("#district").change();
		}).change();
		
		$("#district").on("change", function(){
// 			if($(this).val() == ""){
// 				$("#club").find("option").not(":first").remove();
// 				return;
// 			}
	
			$("#club").organCode({
				 lvl: 4 // 1:연합회, 2:복합지구, 3:지구, 4:클럽 
				,fixVal: "${SM1_02_AVO.sectorClubCode}"  // 고정값
				,upperOrganCode: $("#district").val()
				,searchable: true
				,top: true
			});			
		}).change();
		
		$("#add").on("click", function(){
			var validCheck = true;
			
			if($(".chk:checked").length == 0){
				alert("회원을 선택해 주세요.");
				return false;
			}
			
			if(!$("form").valid()){
				return false;
			}
			
			$(".chk:checked").each(function(index){
				var tr = $(this).closest("tr");
				
				if(tr.find(".authStartDate").val() == ""){
					alert("등록일을 입력해 주세요.");
					tr.find(".authStartDate").focus();
					validCheck = false;
					return false;
				}
				
				if(tr.find(".authEndDate").val() == ""){
					alert("종료일을 입력해 주세요.");
					tr.find(".authEndDate").focus();
					validCheck = false;
					return false;
				}
			});
			
			if(!validCheck)	return false;
			
			var params = [];
			$(".chk:checked").each(function(index){
				var tr = $(this).closest("tr");
				
				params.push({name: "moreAuthArray["+index+"].memberNo"   , value:tr.find(".memberNo").val()});
				params.push({name: "moreAuthArray["+index+"].authStartDate"   , value:tr.find(".authStartDate").val()});
				params.push({name: "moreAuthArray["+index+"].authEndDate"   , value:tr.find(".authEndDate").val()});
				params.push({name: "moreAuthArray["+index+"].authDesc"   , value:tr.find(".authDesc").val()});
			});
				
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/SM1/SM1_1/SM1_02_A/insert.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						opener.linkPage(1);
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"status:"+status+"\n"+"error:"+error);
				}
			});	
		});
		
		$("#chkAll").on("click", function(){
			$(".chk").prop("checked", $(this).is(":checked"));
		});	
		
		$(".chk").on("click", function(){
			if($(".chk").length == $(".chk:checked").length){
				$("#chkAll").prop("checked", true);
			} else {
				$("#chkAll").prop("checked", false);
			}
		});
		
		$(".authStartDate").val(Date.today().toString("yyyy.MM.dd"));
		$(".authEndDate").val(Date.today().addYears(1).toString("yyyy.MM.dd"));
		
		$("#name").on("keypress", function(e){
			var key = e.charCode || e.keyCode || 0;
			if ( key == 13) {
				linkPage(1);
			}
		});
	});
});
</script>

<form:form id="SM1_02_AVO" modelAttribute="SM1_02_AVO">
	<h3><div>회원검색</div></h3>
	<div class="popup_bg">
		<table class="tblType2">
			<colgroup>
				<col width="65px" />
				<col width="380px" />
				<col width="60px" />
				<col width="*" />
			</colgroup>		
			<tr>
				<th>복합지구</th>
				<td><select id="complex" name="complexCode" class="select"></select></td>
				<th>지구</th>
				<td>
					<select id="district" name="districtCode" class="select">
						<option value="">--전체--</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>클럽</th>
				<td>
					<select id="club" name="sectorClubCode" class="select">
						<option value="">--전체--</option>
					</select>
				</td>
				<th>성명</th>			
				<td>
					<form:input path="name" title="검색어를 입력하세요." cssClass="input" />
				</td>
			</tr>
		</table>
		<div class="btnBox2">
			<img src="/images/lionsclubs/btn/btn_search.gif" class="pointer" onclick="linkPage(1)" />
		</div>
		<div class="tblTitle Scroll_Title">
			<table class="tblPopup" summary="회원검색표">
				<caption>회원검색</caption>
				<colgroup>
					<col width="30px" />
					<col width="130px" />
					<col width="130px" />
					<col width="130px" />
					<col width="60px" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th><input id="chkAll" type="checkbox" /></th>
						<th>복합지구</th>
						<th>지구</th>
						<th>클럽</th>
						<th>현직책</th>
						<th>등록일</th>
						<th>종료일</th>
						<th>성명</th>
						<th>내용</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div class="tblPopupH2" style="height: 370px;">
			<table class="tblPopup Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="130px" />
					<col width="130px" />
					<col width="130px" />
					<col width="60px" />
					<col width="120px" />
					<col width="120px" />
					<col width="80px" />
					<col />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center unchecked">
								<input id="chk" class="chk" type="checkbox" />
							</td>						
							<td class=""left"" title="${list.complexName }">
								${list.complexName }
								<input type="hidden" name="memberNo" class="memberNo" value="${list.memberNo }" />
							</td>
							<td class="left" title="${list.districtName }">${list.districtName }</td>
							<td class="left" title="${list.sectorClubName }">${list.sectorClubName }</td>
							<td class="left" title="${list.clubTitle }">${list.clubTitle }</td>
							<td>
								<input type="text" name="authStartDate" class="authStartDate input date required" caption="등록일" />
							</td>
							<td>
								<input type="text" name="authEndDate" class="authEndDate input date required" caption="종료일" />
							</td>
							<td>${list.name }</td>
							<td>
								<input type="text" name="authDesc" class="authDesc input" size="20" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table> 
		</div><!-- tblInner -->
		
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>
		
		<div class="popupBtn">
			<img id="add" src="/images/lionsclubs/btn/btn_set.gif" style="width:57px" class="pointer" />
			<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
		</div>
	</div>
	<h5><div id="message">해당자료가 조회되었습니다.</div></h5>
</form:form>
