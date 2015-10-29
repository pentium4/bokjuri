<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		/*
		코드 추가
		*/
		$("#add").on("click", function() {
			$("#dialog-form-add").dialogPopup({
				 height: 450
				,width: 500
			});
		});
		
		$("#codeAdd").on("click", function(){
			if($("#formInsert #code").val() == ""){
				alert("코드를 입력해 주세요.");
				return;
			}
			
			var params = $("#formInsert").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_2/SM1_07/insert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert('정상적으로 입력 되었습니다.');
						goUrl('<c:url value="/SM1/SM1_2/SM1_07/SM1_07.do?groupCode=${sm106.groupCode}" />');
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		/*
			코드 수정
		*/
		$("#update").on("click", function() {
			var code = $("#formUpdate #code").val();
			
			if(code == ""){
				alert("수정할 코드를 선택해 주세요.");
				return;
			}
			
			$("#dialog-form-update").dialogPopup({
				 height: 450
				,width: 500
			});
		});
		
		$("#codeUpdate").on("click", function(){
			var params = $("#formUpdate").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_2/SM1_07/update.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert('정상적으로 수정 되었습니다.');
						goUrl('<c:url value="/SM1/SM1_2/SM1_07/SM1_07.do?groupCode=${sm106.groupCode}" />');
					}
				}
			});
		});
		
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
			
			var index = $(this).index();
			var code = $(".code").eq(index).val();
			var codeName = $(".codeName").eq(index).val();
			var codeDesc = $(".codeDesc").eq(index).val();
			var ord = $(".ord").eq(index).val();
			var code1 = $(".code1").eq(index).val();
			var code2 = $(".code2").eq(index).val();
			var code3 = $(".code3").eq(index).val();
			var useYn = $(".useYn").eq(index).val();
			var insertDate = $(".insertDate").eq(index).val();
			var updateDate = $(".updateDate").eq(index).val();
			
			// 업데이트
			$("#formUpdate #codeText").text(code);
			$("#formUpdate #code").val(code);
			$("#formUpdate #codeName").val(codeName);
			$("#formUpdate #codeDesc").val(codeDesc);
			$("#formUpdate #ord").val(ord);
			$("#formUpdate #code1").val(code1);
			$("#formUpdate #code2").val(code2);
			$("#formUpdate #code3").val(code3);
			$("#formUpdate #useYn").val(useYn);
			$("#formUpdate #insertDate").text(insertDate);
			$("#formUpdate #updateDate").text(updateDate);
			
			// 삭제
			$("#formDelete #code").val(code);
		});
		
		/*
			코드 삭제
		*/
		$("#delete").on("click", function() {
			var code = $("#formDelete #code").val();
		
			if(code == ""){
				alert("삭제할 그룹코드를 선택해 주세요.");
				return;
			}
			
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			var params = $("#formDelete").serializeArray();
			$.ajax({
				url: '<c:url value="/SM1/SM1_2/SM1_07/delete.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
	// 					alert('정상적으로 삭제 되었습니다.');
						linkPage(1);
					}
				}
			});
		});		
		
		$("#formInsert #code").mask("9999").numericOnly();
		
	    $("input[name=ord]").mask("9999").numericOnly();
	    
		$("#searchGroupCode").change(function(){
			$("#form").submit();
		});
	});
});

function linkPage(index){
	$("#pageIndex").val(index);
	$("#form").submit();
}
</script>

<style>
.tblType2_1 tbody tr{
	cursor: pointer;
}
</style>

<form:form id="form" modelAttribute="SM1_07VO" action="/SM1/SM1_2/SM1_07/SM1_07.do">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="코드 입력표">
	<caption>코드 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>그룹</th>
		<td>
			<form:select id="searchGroupCode" path="groupCode" items="${selectGroupCode}" itemValue="groupCode" itemLabel="groupCodeLabel" cssClass="select chosen-select" />
		</td>
		<th>명칭 설명</th>
		<td>${sm106.groupCodeDesc }</td>
	</tr>
	</tbody>
	</table>
</div>


<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<img id="add" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" class="pointer authorization write"/>
		<img id="update" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" class="pointer authorization write"/>
		<img id="delete" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" class="pointer authorization write"/>
	</div>

	<div class="tblTitle Scroll_Title Height_0">
	<table class="tblType2" summary="코드 입력표">
	<caption>코드 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="50px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th>코드</th>
		<th>코드명칭</th>
		<th>등록일자</th>
		<th>수정일자</th>
		<th>순서</th>
		<th>옵션1</th>
		<th>옵션2</th>
		<th>옵션3</th>
		<th>사용</th>
		<th>코드 내용 설명</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="50px" />
		<col width="*" />
	</colgroup>
	<tbody>
		<c:forEach var="list" items="${resultList }">
			<tr>
				<td class="center">
					${list.code }
					<input type="hidden" class="code" value="${list.code }" />
					<input type="hidden" class="codeName" value="${list.codeName }" />
					<input type="hidden" class="codeDesc" value="${list.codeDesc }" />
					<input type="hidden" class="ord" value="${list.ord }" />
					<input type="hidden" class="code1" value="${list.code1 }" />
					<input type="hidden" class="code2" value="${list.code2 }" />
					<input type="hidden" class="code3" value="${list.code3 }" />
					<input type="hidden" class="useYn" value="${list.useYn }" />						        	
					<input type="hidden" class="insertDate" value="<fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" />" />
					<input type="hidden" class="updateDate" value="<fmt:formatDate value="${list.updateDate }" pattern="yyyy.MM.dd" />" />
				</td>
				<td class="left">${list.codeName }</td>
				<td class="center">
					<fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" />						        
				</td>
				<td class="center">
					<fmt:formatDate value="${list.updateDate }" pattern="yyyy.MM.dd" />						        
				</td>
				<td class="center">${list.ord }</td>
				<td class="center">${list.code1 }</td>
				<td class="center">${list.code2 }</td>
				<td class="center">${list.code3 }</td>
				<td class="center">${list.useYn }</td>
				<td class="left" title="${lions:newline(list.codeDesc) }">${list.codeDesc }</td>
			</tr>
		</c:forEach>	
	</tbody>
	</table>
	</div><!-- Height_1 -->
</div><!-- table -->
</form:form>

<!-- Modal Popup -->  
<div id="dialog-form-add" class="dialog" style="display: none;">
	<form:form id="formInsert" modelAttribute="SM1_07VO" action="/SM1/SM1_2/SM1_07/SM1_07_InputInsert.do">
		<div id="popup">
		<h3><div>코드 추가</div></h3>
		
		<div class="popup_bg">
			<table class="tblType2" style="width:98%;">
				<colgroup>
					<col width="100px" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th>코드<span class="require">*</span></th>
						<td>
							<form:input path="code" cssClass="input" size="4" maxlength="4" />
							<input type="hidden" id="groupCode" name="groupCode" value="${sm106.groupCode }" />
						</td>
					</tr>
					<tr>
						<th>코드 명칭</th>
						<td>
							<form:input path="codeName" cssClass="input" size="25" maxlength="400" />
						</td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
					</tr>
					<tr>
						<th>수정일자</th>
						<td><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></td>
					</tr>
					<tr>
						<th>출력순서</th>
						<td><form:input path="ord" cssClass="input" size="4" maxlength="4" /></td>
					</tr>
					<tr>
						<th>옵션1</th>
						<td><form:input path="code1" cssClass="input" size="25" maxlength="100" /></td>
					</tr>
					<tr>
						<th>옵션2</th>
						<td><form:input path="code2" cssClass="input" size="25" maxlength="100" /></td>
					</tr>
					<tr>
						<th>옵션3</th>
						<td><form:input path="code3" cssClass="input" size="25" maxlength="100" /></td>
					</tr>
					<tr>
						<th>사용여부</th>
						<td>
							<form:select path="useYn">
								<form:option value="Y">Y</form:option>
								<form:option value="N">N</form:option>
							</form:select>
						</td>
					</tr>
					<tr>
						<th>내용설명</th>
						<td style="padding:5px 0 5px 5px;">
							<form:textarea path="codeDesc" cols="40" rows="3" maxlength="400" cssClass="textarea" />
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- popup_bg -->
		
		<div class="popupBtn">
			<input type="image" id="codeAdd" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" onclick="return false;" />
			<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
		</div>
		
		</div><!-- popup -->
	</form:form>
</div>

<div id="dialog-form-update" class="dialog" style="display: none;">
	<form:form id="formUpdate" modelAttribute="SM1_07VO" action="/SM1/SM1_2/SM1_07/SM1_07_EditUpdate.do">
		<div id="popup">
			<h3><div>코드 추가</div></h3>
			
			<div class="popup_bg">
				<table class="tblType2" style="width:98%;">
					<colgroup>
						<col width="100px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>코드</th>
							<td>
								<span id="codeText"></span>
								<input type="hidden" id="groupCode" name="groupCode" value="${sm106.groupCode }" />
								<form:hidden path="code" />
							</td>
						</tr>
						<tr>
							<th>코드 명칭</th>
							<td>
								<form:input path="codeName" cssClass="input" size="25" maxlength="400" />
							</td>
						</tr>
						<tr>
							<th>등록일자</th>
							<td>
								<span id="insertDate"></span>
							</td>
						</tr>
						<tr>
							<th>수정일자</th>
							<td>
								<span id="updateDate"></span>
							</td>
						</tr>
						<tr>
							<th>출력순서</th>
							<td><form:input path="ord" cssClass="input" size="4" maxlength="4" /></td>
						</tr>
						<tr>
							<th>옵션1</th>
							<td><form:input path="code1" cssClass="input" size="25" maxlength="100" /></td>
						</tr>
						<tr>
							<th>옵션2</th>
							<td><form:input path="code2" cssClass="input" size="25" maxlength="100" /></td>
						</tr>
						<tr>
							<th>옵션3</th>
							<td><form:input path="code3" cssClass="input" size="25" maxlength="100" /></td>
						</tr>
						<tr>
							<th>사용여부</th>
							<td>
								<form:select path="useYn">
									<form:option value="Y">Y</form:option>
									<form:option value="N">N</form:option>
								</form:select>
							</td>
						</tr>
						<tr>
							<th>내용설명</th>
							<td style="padding:5px 0 5px 5px;">
								<form:textarea path="codeDesc" cols="40" rows="3" maxlength="400" cssClass="textarea" />
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- popup_bg -->
			
			<div class="popupBtn">
				<input type="image" id="codeUpdate" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" onclick="return false;" />
				<a class="dialogClose"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
			</div>
		
		</div><!-- popup -->
	</form:form>
</div>


<form:form id="formDelete" modelAttribute="SM1_07VO" action="/SM1/SM1_2/SM1_07/SM1_07_Delete.do">
	<input type="hidden" id="groupCode" name="groupCode" value="${sm106.groupCode }" />
	<form:hidden path="code" />
</form:form>	
