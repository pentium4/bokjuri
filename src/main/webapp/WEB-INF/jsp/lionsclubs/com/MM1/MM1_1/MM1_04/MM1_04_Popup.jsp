<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sanctionStartDate").datepicker();
		$("#sanctionEndDate").datepicker();
		
		/**
			개인(교육/징계/포상)구분
			1000	개인→교육	code1 : 3120
			1010	개인→징계	code1 : 3210
			1020	개인→포상	code1 : 3010
		*/
		$("#educationCode").on("change", function(){
			$("#itemCode").option1Code({ 
		    	groupCode: '${code1}',	// 그룹코드
		    	code: $(this).val(),	// 코드
		    	fixVal: "${MM1_04VO.itemCode}",	// 고정값
		    	topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
			});
		}).change();
			
		$("#sanctionStartDate").on("change", function(){
			$("#sanctionEndDate").val($(this).val());
		});
			
		/*
		 *	저장
		 */
		$("#button_save").click(function() {
			var aday = $("#sanctionStartDate").val();
			var bday = $("#sanctionEndDate").val();
	
			if(!$("form").valid()){
				return false;
			}
			
			if(!rangeDateCheck(aday, bday)){
				alert("시작날짜가 종료날짜보다 큽니다.");
				return false;
			}		
			
			var url = '<c:url value="/MM1/MM1_1/MM1_04/MM1_04_Update.do" />';
			if("${MM1_04VO.idnNo}".isEmpty()){
				url = '<c:url value="/MM1/MM1_1/MM1_04/MM1_04_Insert.do" />';
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
						//alert('정상적으로 입력 되었습니다.');
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
	// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});
</script>

<form:form modelAttribute="MM1_04VO">
	<h3 style="width:98%;">
		<div>
			경력(<lions:codetolabel groupCode="3110" code="${param.kindCode }" />)
			<c:choose>
				<c:when test="${empty MM1_04VO.idnNo }">입력</c:when>
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
					<th>기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간<span class="require">*</span></th>
					<td>
						<form:input path="sanctionStartDate" cssClass="input date required" caption="시작기간" /> ~ <form:input path="sanctionEndDate" cssClass="input date required" caption="종료기간" />
					</td>
				</tr>
				<tr>
					<th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관<span class="require">*</span></th>
					<td><lions:codeselect path="educationCode" groupCode="${code1}" cssClass="required" caption="교육주관" /></td>
				</tr>
				<tr>
					<th>항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목<span class="require">*</span></th>
					<td><form:select path="itemCode" cssClass="required" caption="항목" /></td>
				</tr>
				<c:if test="${param.kindCode eq '1020' }">
					<tr>
						<th>포상수여자<span class="require">*</span></th>
						<td><lions:codeselect path="awardGrantorCode" groupCode="3000" cssClass="required" caption="포상수여자" /></td>
					</tr>
				</c:if>
				<tr>
					<th>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용<span class="require">*</span></th>
					<td><form:input path="desc" cssClass="input required" size="50" caption="내용" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- popup_bg -->
	
	<div class="popupBtn">
		<c:choose>
			<c:when test="${empty MM1_04VO.idnNo }">
				<img id="button_save" src="/images/lionsclubs/btn/btn_input.gif" title="입력" style="width:57px" class="pointer" />		
			</c:when>
			<c:otherwise>
				<img id="button_save" src="/images/lionsclubs/btn/btn_edit.gif" title="수정" style="width:57px" class="pointer" />	
			</c:otherwise>
		</c:choose>
		
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
	
	<form:hidden path="kindCode" />	<!-- 구분 -->
	<form:hidden path="memberNo" />
	<form:hidden path="idnNo" />
</form:form>
