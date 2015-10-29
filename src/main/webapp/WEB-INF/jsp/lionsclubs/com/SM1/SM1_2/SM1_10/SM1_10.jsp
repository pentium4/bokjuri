<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("input[name=organCode]").mask("a99-999");
		$("input[name=ord]").numericOnly();
		
		$("#paramOrgCode").organCode({
			  top:true
			, lvlEnd:3
			, searchable: true     // 검색콤보박스 true/false
			, fixVal:"${SM1_10VO.paramOrgCode}"
		});
		
		$("#objCheckAll").click(function(){
	
			if($(this).prop("checked")) {
				var i = 0;
				$("input[name=organCode]").each(function() {
						$("input:checkbox[name='chkIdx']").eq(i).prop("checked",($("input[name=organCode]").eq(i).val() != ""));								
					i++;
				});
			} else {
				$("input:checkbox[name='chkIdx']").prop("checked", false);								
			}
			
		});
		
		$("#retrieveBtn").click(function(){
			$("#form_list").attr("action","/SM1/SM1_2/SM1_10/selectList.do");
			$("#form_list").submit();
		});
		
		$("#initBtn").click(function(){
			$("#form_list").attr("action","/SM1/SM1_2/SM1_10/SM1_10.do");
			$("#form_list").submit();
		});
		
		$("#insertBtn").click(function(){
			if(!validateChecker()) return;
			$("#form_list").attr("action","/SM1/SM1_2/SM1_10/insertList.dox");
			$("#form_list").submit();
		});
		
		$("#updateBtn").click(function(){
			if(!validateChecker()) return;
			$("#form_list").attr("action","/SM1/SM1_2/SM1_10/updateList.dox");
			$("#form_list").submit();
		});
		
		$("#deleteBtn").click(function(){
			$("#form_list").attr("action","/SM1/SM1_2/SM1_10/deleteList.dox");
			$("#form_list").submit();
		});
		
		$("#reorderBtn").click(function(){
			if($("#paramOrgCode").val() == null || $("#paramOrgCode").val() == ""){
				alert("조직을 선택하세요.");
				return;
			}
			
			if($("#paramAppDescCode").val() == null || $("#paramAppDescCode").val() == ""){
				alert("구분을 선택하세요.");
				return;
			}
			$("#form_list").attr("action","/SM1/SM1_2/SM1_10/reorderList.dox");
			$("#form_list").submit();
		});
	});
});

function validateChecker() {
	if($("input:checkbox[name='chkIdx']:checked").length <1){
		alert("적용할 자료를 체크하세요.");
		return false;
	}
	var i = 0;
	var rtnValue = true;
	
	$("input:checkbox[name='chkIdx']:checked").each(function() {
		var idx = $("input:checkbox[name='chkIdx']:checked").eq(i).val() - 1;

		if($("input[name=organCode]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 조직코드를 입력하세요.");
			$("input[name=organCode]").eq(idx).focus();
			rtnValue = false;
			return false;
		}
		if($("input[name=appDescCode]").eq(idx).val() == ""){
			alert((idx+1)+"번째 행의 구분을 입력하세요.");
			$("input[name=appDescCode]").eq(idx).focus();
			rtnValue = false;
			return false;
		}
		i++;
	});
	
	return rtnValue;
}


function openPicPopup(idx) {
	var url = "/SM1/SM1_2/SM1_10/fileInfoPopup.do";
	url += "?idnNoForUpload=" + $("input[name=idnNo]").eq(idx-1).val();
	url += "&idxForUpload=" + idx;
	url += "&fileIdForUpload=" + $("input[name=fileId]").eq(idx-1).val();
	openPopup(url , "200", "300");
}
</script>

	<h3>
		<div>
			<lions:menutitle menuId="${param.menuId }" kind="title" />
		</div>
	</h3>
	<div class="table">
<form:form id="form_list"  modelAttribute="SM1_10VO">
		<table class="tblType1" summary="직접조회자료(사진)">
		<caption>직접조회자료(사진)조회조건</caption>
		<colgroup>
			<col width="100px" />
			<col width="400px" />
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
		<tr>
			<th>조직</th>
			<td>
				<form:select path="paramOrgCode" />
			</td>
			<th>구분</th>
			<td>
				<lions:LionsSelectTagByList id="paramAppDescCode" name="paramAppDescCode" selValue="${SM1_10VO.paramAppDescCode}" list="${SM1_10VO.codeList}" />
			</td>
		</tr>
		</tbody>
		</table>
	</div>

	<div class="table">
		<h4>
			<lions:menutitle menuId="${param.menuId }" kind="subtitle" />
		</h4>
		<div class="btnBox">
				<img id="retrieveBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" /> 
				<img id="initBtn"   src="/images/lionsclubs/btn/btn_reset.gif" alt="초기화"  class="pointer authorization write" title="초기화" /> 
				<img id="insertBtn" src="/images/lionsclubs/btn/btn_input.gif" alt="입력"  class="pointer authorization write" title="입력" /> 
				<img id="updateBtn" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정"  class="pointer authorization write" title="수정" /> 
				<img id="deleteBtn" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제"  class="pointer authorization write" title="삭제" />
				<img id="reorderBtn" src="/images/lionsclubs/btn/btn_reorder.gif" alt="재정렬"  class="pointer authorization write" title="재정렬" />
		</div>
		<div class="tblTitle Height_0 Scroll_Title">
			<table class="tblType2" summary="직접조회자료입력 조회표">
				<caption>직접조회자료입력</caption>
				<colgroup>
					<col width="30px" />
					<col width="40px" />
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
					<col width="70px" />
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="90px" />
					<col width="100px" />
					<col width="50px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="objCheckAll" value="1" /></th>
						<th>NO</th>
						<th>조직코드</th>
						<th>구분</th>
						<th>라이온번호</th>
						<th>성명</th>
						<th>정렬</th>
						<th>회기</th>
						<th>조직코드</th>
						<th>직책</th>
						<th>클럽명</th>
						<th>사진</th>
						<th>사진저장</th>
						<th></th>
					</tr>
				</thead>
			</table>
		</div>

		<!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="40px" />
					<col width="80px" />
					<col width="120px" />
					<col width="80px" />
					<col width="70px" />
					<col width="50px" />
					<col width="80px" />
					<col width="80px" />
					<col width="90px" />
					<col width="100px" />
					<col width="50px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<tbody>
<c:forEach items="${SM1_10VO.listData}" var="list" varStatus="status">
					<tr>
						<td><input type="checkbox" name="chkIdx" value="${status.count }" />
							<input type="hidden" name="idnNo" value="<c:out value="${list.idnNo }" />" />
							<input type="hidden" name="fileId" value="<c:out value="${list.fileId }" />" />
						</td>
						<td>${status.count }</td>
						<td><input type="text" name="organCode" class="input" value="<c:out value="${list.organCode }" />" maxlength="6" style="width:100%;" /></td>
						<td>
							<lions:LionsSelectTagByList id="" name="appDescCode" selValue="${list.appDescCode}" list="${SM1_10VO.codeList}" />
						</td>
						<td><input type="text" name="memberNo" class="input" value="<c:out value="${list.memberNo }" />" maxlength="8" style="width:100%;" /></td>
						<td><input type="text" name="memberName" class="input" value="<c:out value="${list.memberName }" />" maxlength="10" style="width:100%;" /></td>
						<td><input type="text" name="ord" class="input center" value="<c:out value="${list.ord }" />" maxlength="6" style="width:100%;" /></td>
						<td><input type="text" name="fAgeCode" class="input" value="<c:out value="${list.fAgeCode }" />" maxlength="50" style="width:100%;" /></td>
						<td><input type="text" name="fOrganCodeText" class="input" value="<c:out value="${list.fOrganCodeText }" />" maxlength="50" style="width:100%;" /></td>
						<td><input type="text" name="fPos" class="input" value="<c:out value="${list.fPos }" />" maxlength="50" style="width:100%;" /></td>
						<td><input type="text" name="fClubName" class="input" value="<c:out value="${list.fClubName }" />" maxlength="50" style="width:100%;" /></td>
						<td>
							<c:if test="${list.fileYn == 'Y'}">
								<img id="memPict_${status.count }" alt="회원 사진" src="<c:if test="${list.fileId != ''}">${list.fileId}</c:if>" height="15" onerror="this.src='/images/lionsclubs/noimg.gif'" />
							</c:if>
							<c:if test="${list.fileYn != 'Y' && list.idnNo > ''}">
								<img id="memPict_${status.count }" alt="회원 사진" src="/images/lionsclubs/noimg.gif" height="15" onerror="this.src='/images/lionsclubs/noimg.gif'" />
							</c:if>&nbsp;
						</td>
						<td class="center">
						<c:if test="${list.orgFileYn != 'Y' && list.idnNo > '' }">
								<img src="/images/lionsclubs/btn/btn_save.gif" alt="사진저장"  class="pointer authorization write" onclick="openPicPopup(${status.count})" /> 
						</c:if>
						<c:if test="${list.orgFileYn == 'Y'}">
							회원정보
						</c:if>
						</td>
						<td></td>
					</tr>
</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Height_1 -->
	</div>
	<!-- table -->

</form:form>