<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
 
		$("#awardDate").datepicker();
		
		
		$("#kindCode").on("change", function(){
			$("#awardKindCode").option1Code({ 
		    	groupCode: '3010',	// 그룹코드
		    	code: $(this).val(),	// 코드
		    	fixVal: "${MM2_05VO.awardKindCode}",	// 고정값
		    	topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
			});
		}).change();	
		
		/*
		 *	
		 */
		$("#save").bind("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var url;
			if("${MM2_05VO.idnNo}".isEmpty()){
				url = '<c:url value="/MM2/MM2_1/MM2_05/awardInsert.do" />';
			} else {
				url = '<c:url value="/MM2/MM2_1/MM2_05/awardUpdate.do" />';
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
					alert("code:"+request.status+"\n"+"\n"+"error:"+error);
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});	
</script>	

<form:form modelAttribute="MM2_05VO" >
	<h3 style="width:99%;">
		<div>
			클럽포상
			<c:choose>
				<c:when test="${empty MM2_05VO.idnNo }">입력</c:when>
				<c:otherwise>수정</c:otherwise>
			</c:choose>			
		</div>
	</h3>
	
	<div class="popup_bg">
		<table class="tblType2" style="width:98%">
			<colgroup>
				<col width="100px" />
				<col />
			</colgroup>
			<tbody>
				<tr>
					<th>포상일자<span class="require">*</span></th>
					<td>
						<form:input path="awardDate" cssClass="input date required" caption="포상일자" />
					</td>
				</tr>
				<tr>
					<th>구 분<span class="require">*</span></th>
					<td>
						<lions:codeselect path="kindCode" groupCode="3010" cssClass="required" caption="구분" />				
					</td>
				</tr>
				<tr>
					<th>포상종류<span class="require">*</span></th>
					<td>
						<form:select path="awardKindCode" cssClass="required" caption="포상종류" />
					</td>
				</tr>
				<tr>
					<th>포상수여자<span class="require">*</span></th>
					<td>
						<lions:codeselect path="awardGrantorCode" groupCode="3000" cssClass="required" caption="포상수여자" />
					</td>
				</tr>				
				<tr>
					<th>포상내용<span class="require">*</span></th>
					<td><form:input path="awardDesc" cssClass="input required" size="35" maxlength="35" caption="포상내용" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty MM2_05VO.idnNo }">
				<img id="save" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px;" class="pointer" />
			</c:when>
			<c:otherwise>
				<img id="save" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px;" class="pointer" />
			</c:otherwise>
		</c:choose>			
		<img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" onclick="closeWin();" class="pointer" />
	</div>
	
	<form:hidden path="organCode" />
	<form:hidden path="idnNo"/>
</form:form>
