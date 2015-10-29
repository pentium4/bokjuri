<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<style>
.fc-button {
	margin-top: 5px;
}
</style>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		var events = ${listSchedule2};
		$('#calendar').fullCalendar({
			 events: events
			,eventRender: function(event, element){
				element.tooltipster({
			     	 content: event.title
				    ,contentAsHTML: true
				}); 
			}
		});
		
		$("#clubCode").on("change", function(){
			_search();
		});
	});
});

function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="ScheduleVO">
	<table border="0" cellpadding="0" cellspacing="0" width="640" background="/images/home/common/bbs_box_bg.gif" style="margin-top: 10px;">
		<colgroup>
			<col width="10px" />
			<col width="*" />
			<col width="10px" />
		</colgroup>
	    <tr>
	        <td>
	            <img src="/images/home/common/bbs_box_left.gif" width="10" height="40" border="0">
	        </td>
	        <td>
	            클럽선택 : <form:select path="clubCode" items="${listClubCode }" itemValue="organCode" itemLabel="organName" cssClass="chosen-select" cssStyle="width: 40%;" />
	        </td>
	        <td>
	            <img src="/images/home/common/bbs_box_right.gif" width="10" height="40" border="0">
	        </td>
	    </tr>
	</table>
	
	<div id='calendar' style="margin-top: 10px;"></div>
	
</form:form>	