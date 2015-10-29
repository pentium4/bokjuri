<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
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
		
		$(".tblType2 tbody tr td").not(".unchecked").bind("click", function(){
			var chk = $(this).closest("tr").find(".chk");
			chk.prop("checked", chk.is(":checked") == true ? false : true);
		});
		
		$("#delete").bind("click", function(){
			if($(".chk:checked").length == 0){
				alert("추가권한자를 선택해 주세요.");
				return false;
			}
			
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			$(".chk:checked").each(function(index){
				params.push({name: "moreAuthArray["+index+"].memberNo"   , value:$(this).val()});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/SM1/SM1_1/SM1_02_A/delete.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert("정상적으로 삭제 되었습니다.");
						linkPage(1);
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"status:"+status+"\n"+"error:"+error);
				}
			});
		});
		
		$("#addPopup").on("click", function(){
			openPopup('/SM1/SM1_1/SM1_02_A/SM1_02_A_Popup.do', 1000, 645, 'popup');
		});
	});
});

function linkPage(pageNum){
	$("#pageIndex").val(pageNum);
	$("#form").submit();
}
</script>

<style>
<!--
.tblType2 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form id="form" modelAttribute="SM1_02_AVO" action="/SM1/SM1_1/SM1_02_A/SM1_02_A.do">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<img id="addPopup" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer authorization write" />
		<img id="delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write" />
	</div>
	
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2_1" summary="추가권한자 관리표">
			<caption>추가권한자 관리</caption>
			<colgroup>
				<col width="30px" />
				<col width="50px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="80px" />
				<col width="120px" />
				<col width="120px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th><input id="chkAll" type="checkbox" /></th>
					<th>NO</th>
					<th>복합지구</th>
					<th>지구</th>
					<th>소속클럽</th>
					<th>현직책</th>
					<th>등록일</th>
					<th>종료일</th>
					<th>성명</th>
					<th>내용</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table">
			<colgroup>
				<col width="30px" />
				<col width="50px" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
				<col width="80px" />
				<col width="120px" />
				<col width="120px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td class="unchecked"><input id="chk" class="chk" name="memberNoArray" type="checkbox" value="${list.memberNo }" /></td>
						<td>${list.rnum }</td>
						<td class="left" title="${list.complexName }">${list.complexName }</td>
						<td class="left" title="${list.districtName }">${list.districtName }</td>
						<td class="left" title="${list.sectorClubName }">${list.sectorClubName }</td>
						<td class="left" title="${list.clubTitle }">${list.clubTitle }</td>
						<td>
							<fmt:parseDate var="authStartDate" value="${list.authStartDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${authStartDate }" pattern="yyyy.MM.dd" />
						</td>
						<td>
							<fmt:parseDate var="authEndDate" value="${list.authEndDate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${authEndDate }" pattern="yyyy.MM.dd" />
						</td>
						<td>${list.name }</td>
						<td class="left" title="${list.authDesc }">${list.authDesc }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>
</div><!-- table -->
<!-- 본문 내용 끝 -->
</form:form>