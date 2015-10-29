<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		/*
		 *	저장
		 */
		$("#button_save").click(function() {
			var params = $("#form_insert").serializeArray();
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM3/MM3_5/MM3_27/MM3_27_Insert.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						alert('정상적으로 입력 되었습니다.');
						opener.linkPage();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
});	
</script>	

<h3 style="width:97%;"><div>클럽보고 자료점수</div></h3>

<form:form id="form_insert" modelAttribute="MM3_27VO" >
<div class="popup_bg">
	<div class="center mt20 mb20"><h1>보고자료 마감이 맞습니까?</h1></div>
</div><!-- popup_bg -->

<div class="popupBtn2">
	<input type="image" id="button_save" src="/images/lionsclubs/btn/btn_input.gif" alt="확인" style="width:57px" />
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>

</form:form>


