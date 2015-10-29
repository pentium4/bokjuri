<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#button_save").on("click", function(){
			var params = [];
	
			$(".eventYyyymm").each(function(index){
				var $tr = $(this).closest("tr");
				var event1 = $tr.find(".event1");
				var event2 = $tr.find(".event2");
				var event3 = $tr.find(".event3");
				
				params.push({name: "eventArray[" + index + "].organCode", value: "${MM1_07VO.organCode }"});
				params.push({name: "eventArray[" + index + "].eventYyyymm", value: $(this).val()});
				params.push({name: "eventArray[" + index + "].event1", value: event1.val()});
				params.push({name: "eventArray[" + index + "].event2", value: event2.val()});
				params.push({name: "eventArray[" + index + "].event3", value: event3.val()});
			});
	
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_1/MM1_07/MM1_07_Insert.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"status:"+status+"\n"+"error:"+error);
				}
			});
		});
	});
});
</script>

<form:form id="formInsert" modelAttribute="MM1_07VO">
	<h3 style="width:99%;"><div>행사출석 현황</div></h3>
	
	<div class="popup_bg">
		<table class="tblPopup" style="width:99%;">
			<colgroup>
				<col width="10%" />
				<col width="30%" />
				<col width="30%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>월</th>
					<th>행사(1)</th>
					<th>행사(2)</th>
					<th>행사(3)</th>
				</tr>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<th>
							<fmt:parseDate var="eventYyyymm" value="${list.eventYyyymm }" pattern="yyyyMM" />
							<fmt:formatDate value="${eventYyyymm }" pattern="M" />월
							<input type="hidden" name="eventYyyymm" class="eventYyyymm" value="${list.eventYyyymm }" />
						</th>
						<td class="left"><input type="text" size="25" name="event1" class="event1 input" value="${list.event1 }" /></td>
						<td class="left"><input type="text" size="25" name="event2" class="event2 input" value="${list.event2 }" /></td>
						<td class="left"><input type="text" size="25" name="event3" class="event3 input" value="${list.event3 }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table> 
	</div><!-- tblInner -->
	
	<div class="popupBtn">
		<img id="button_save" src="/images/lionsclubs/btn/btn_save.gif" title="저장" style="width:57px;" class="pointer" />
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" title="닫기" style="width:57px" /></a>
	</div>
	
	<h5 style="width:99%;"><div>해당자료가 조회되었습니다.</div></h5>
</form:form>