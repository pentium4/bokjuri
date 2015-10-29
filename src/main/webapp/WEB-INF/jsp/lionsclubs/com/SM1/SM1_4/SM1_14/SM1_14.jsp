<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		$(".titleOrd").mask("9999").numericOnly();
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${SM1_14VO.sessionYear}"	// 고정값
		});
	
		var tbl = $("#listTable tbody tr");
		tbl.find("td:not(:first):not(:eq(0))").on("click", function(){
			var $tr = $(this).closest("tr");
			var checked = $tr.find(".idnNo").is(":checked");
			$tr.find(".idnNo").prop("checked", !checked);
			$tr.find(".idnNo").trigger("change");
			
			fillChecked();
		});
		
		$(".idnNo").on("click", function(){
			fillChecked();
		});
		
		$("#idnNoAll").on("click", function(){
			$(".idnNo").prop("checked", $(this).is(":checked"));
			fillChecked();
		});
		
		$(".idnNo").on("change", function(){
			var total = $(".idnNo").length;
			var checkLen = $(".idnNo:checked").length;
			if(total == checkLen){
				$("#idnNoAll").prop("checked", true);
			} else {
				$("#idnNoAll").prop("checked", false);
			}
		}).change();		
		
		$("#addPopup").on("click", function(){		
			openPopup("/SM1/SM1_4/SM1_14/districtTitleMangePopup.do?sessionYear=${SM1_14VO.sessionYear}", '800', '600', "districtTitleMangePopup");
		});		
		
		$("#btnSave").on("click", function(){
			var params = $("form").serializeArray();
			
			$(".idnNo").each(function(index){
				var $tr = $(this).closest("tr");
				var idnNo = $(this).val();
				var titleOrd = $tr.find(".titleOrd").val();
				
				params.push({name: "districtTitleArray[" + index + "].idnNo", value: idnNo});
				params.push({name: "districtTitleArray[" + index + "].titleOrd", value: titleOrd});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/SM1/SM1_4/SM1_14/saveDistrictTitleMangeOrd.do" />',
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
				}
			});
		});
		
		$("#btnDelete").on("click", function(){
			if($(".idnNo:checked").length == 0){
				alert("삭제할 직책 코드를 선택해 주세요.");
				return false;
			}
			
			if(!confirm('삭제하시겠습니까?')) {
				return false;
			}
			
			var params = $("form").serializeArray();
			
			$(".idnNo:checked").each(function(index){
				var idnNo = $(this).val();
				
				params.push({name: "districtTitleArray[" + index + "].idnNo", value: idnNo});
			});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/SM1/SM1_4/SM1_14/deleteDistrictTitleMange.do" />',
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
		
		$("#btnSearch").on("click", function(){
			_search();
		});
	});
});

function fillChecked(){
	$(".idnNo").each(function(){
		var $tr = $(this).closest("tr");
		
		if($(this).is(":checked")){
			$tr.css("background-color","#E0FFE0");	
		} else {
			$tr.css("background-color","#ffffff");
		}
	});
}

// 조회
function _search(){
	$("form").submit();
}
</script>
<style>
#listTable tbody tr{
	cursor: pointer;
}
</style>
<form:form modelAttribute="SM1_14VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" />
			<img id="addPopup" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer authorization write"/>
			<img id="btnSave" src="/images/lionsclubs/btn/btn_save.gif" title="저장" class="pointer authorization write" />
			<img id="btnDelete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" class="pointer authorization write"/>
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input id="idnNoAll" type="checkbox" /></th>
						<th>순서</th>
						<th>직책코드</th>
						<th>직책명</th>
						<th>설명</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="listTable">
				<colgroup>
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td><input type="checkbox" class="idnNo" value="${list.idnNo }" /></td>
							<td class="center"><input type="text" class="input titleOrd" value="${list.titleOrd }" size="6" /></td>
							<td class="center">${list.titleCode }</td>
							<td class="left">${list.titleName }</td>
							<td class="left" title="${list.titleDesc }">${list.titleDesc }</td>
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
		</div>
		<!-- //Contents_Table_area -->
	</div>
</form:form>