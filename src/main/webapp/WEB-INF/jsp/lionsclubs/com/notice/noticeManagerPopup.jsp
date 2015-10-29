<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#noticeCode").focus();
		
		$("#add, #update").on("click", function(){
			var url = '<c:url value="/notice/noticeManageUpdate.do" />';
			if("${noticeVO.noticeCode }" == ""){
				url = '<c:url value="/notice/noticeManageInsert.do" />';
			}
			
			var params = $("form").serializeArray();
			$.ajax({
				type: "POST",
				async: false,
				url:  url,
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
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
//-->
</script>

<form:form id="noticeVO" modelAttribute="noticeVO">
	<h3>
		<div>
			게시판
			<c:choose>
				<c:when test="${empty noticeVO.noticeCode }">추가</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>			 
		</div>
	</h3>
	
	<div class="popup_bg">
		<table class="tblType2" style="width:98%;">
		<colgroup>
			<col width="120px" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th>게시판 코드</th>
				<td>
					<c:choose>
						<c:when test="${empty noticeVO.noticeCode }">
							<form:input path="noticeCode" cssClass="input" size="12" maxlength="100" />
						</c:when>
						<c:otherwise>
							${noticeVO.noticeCode }
							<form:hidden path="noticeCode"/>
						</c:otherwise>
					</c:choose>
					
				</td>
			</tr>
			<tr>
				<th>게시판 이름</th>
				<td>
					<form:input path="noticeName" cssClass="input" size="30" maxlength="100" />
				</td>
			</tr>
			<tr>
				<th>게시판 용도설명</th>
				<td>
					<form:textarea path="noticeDesc" cols="40" rows="3" maxlength="4000" cssClass="textarea" />
				</td>
			</tr>
			<tr>
				<th>게시판 사용유무</th>
				<td>
					<select name="noticeYn" id="noticeYn">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</td>
			</tr>
		</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty noticeVO.noticeCode }">
				<input id="add" type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" onclick="return false;" />			
			</c:when>
			<c:otherwise>
				<input id="update" type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" onclick="return false;" />
			</c:otherwise>
		</c:choose>
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
