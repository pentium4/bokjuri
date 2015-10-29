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
		var events = ${listSchedule1};
		$('#calendar').fullCalendar({
			 events: events
			,eventRender: function(event, element){
				element.tooltipster({
			     	 content: event.title
				    ,contentAsHTML: true
				}); 
			}
		});
	});
}); 

function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="ScheduleVO">
	<div id='calendar' style="margin-top: 10px;"></div>
</form:form>
