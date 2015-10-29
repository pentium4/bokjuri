<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		/*
		 *	수정
		 */
		$("#button_save").click(function() {
			var params = [];
	
			$(".attendDate1").each(function(index){
				var $tr = $(this).closest("tr");
				
				var monthMeeting = $tr.find(".monthMeeting1");
				var directorMeeting = $tr.find(".directorMeeting1");
				var event1Check = $tr.find(".event1Check1");
				var event2Check = $tr.find(".event2Check1");
				var event3Check = $tr.find(".event3Check1");
				
				params.push({name: "eventArray[" + index + "].memberNo", value: "${MM1_07VO.memberNo}"});
				params.push({name: "eventArray[" + index + "].attendDate", value: $(this).val()});
				params.push({name: "eventArray[" + index + "].monthMeeting", value: monthMeeting.val()});
				params.push({name: "eventArray[" + index + "].directorMeeting", value: directorMeeting.val()});
				params.push({name: "eventArray[" + index + "].event1Check", value: event1Check.val()});
				params.push({name: "eventArray[" + index + "].event2Check", value: event2Check.val()});
				params.push({name: "eventArray[" + index + "].event3Check", value: event3Check.val()});
			});
			
			$(".attendDate2").each(function(index){
				index = index + $(".attendDate1").size();
				var $tr = $(this).closest("tr");
				
				var monthMeeting = $tr.find(".monthMeeting2");
				var directorMeeting = $tr.find(".directorMeeting2");
				var event1Check = $tr.find(".event1Check2");
				var event2Check = $tr.find(".event2Check2");
				var event3Check = $tr.find(".event3Check2");
				
				params.push({name: "eventArray[" + index + "].memberNo", value: "${MM1_07VO.memberNo}"});
				params.push({name: "eventArray[" + index + "].attendDate", value: $(this).val()});
				params.push({name: "eventArray[" + index + "].monthMeeting", value: monthMeeting.val()});
				params.push({name: "eventArray[" + index + "].directorMeeting", value: directorMeeting.val()});
				params.push({name: "eventArray[" + index + "].event1Check", value: event1Check.val()});
				params.push({name: "eventArray[" + index + "].event2Check", value: event2Check.val()});
				params.push({name: "eventArray[" + index + "].event3Check", value: event3Check.val()});
			});			
			
			$.ajax({
				type: "POST",
				async: false,
				url: '<c:url value="/MM1/MM1_1/MM1_07/MM1_07_Update.do" />',
		 		data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						//alert("정상적으로 저장 되었습니다.");
						$("#formUpdate").attr("action","/MM1/MM1_1/MM1_07/MM1_07.do");
						$("#formUpdate").submit();
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
<style>
<!--
.tblType2_1 tbody tr{
	height: 50px;
}
-->
</style>
<form:form id="formUpdate" modelAttribute="MM1_07VO">
	<h3><div>행사출석현황 </div></h3>
	<div id="profile"></div>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />
	<div class="table">
		<h4>출석현황</h4>
		<div class="btnBox">
			<img id="button_save" src="/images/lionsclubs/btn/btn_save.gif" title="수정 저장" style="width:57px" class="pointer authorization write" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="출석현황 안내표이며 월례회,이사회,행사 정보를 제공">
				<caption>출석현황</caption>
				<colgroup>
					<col width="80px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="100px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>월</th>
						<th>월례회</th>
						<th>이사회</th>
						<th>행사(1)</th>
						<th>행사(2)</th>
						<th>행사(3)</th>
						<th>월</th>
						<th>월례회</th>
						<th>이사회</th>
						<th>행사(1)</th>
						<th>행사(2)</th>
						<th>행사(3)</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<!-- 수정 : 테이블 -->
			<table class="Scroll_Table tblType2_1">
				<colgroup>
					<col width="80px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="100px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="85px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>7월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[0].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[0].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[0].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[0].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[0].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[0].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[0].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[0].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[0].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[0].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate1" value="${resultList[0].attendDate }" />
						<th>1월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[6].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[6].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[6].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[6].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[6].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[6].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[6].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[6].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[6].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[6].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate2" value="${resultList[6].attendDate }" />
					</tr>
					<tr>
						<th>8월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[1].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[1].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[1].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[1].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[1].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[1].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[1].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[1].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[1].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[1].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate1" value="${resultList[1].attendDate }" />
						<th>2월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[7].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[7].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[7].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[7].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[7].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[7].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[7].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[7].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[7].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[7].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate2" value="${resultList[7].attendDate }" />
					</tr>
					<tr>
						<th>9월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[2].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[2].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[2].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[2].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[2].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[2].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[2].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[2].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[2].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[2].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate1" value="${resultList[2].attendDate }" />
						<th>3월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[8].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[8].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[8].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[8].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[8].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[8].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[8].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[8].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[8].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[8].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate2" value="${resultList[8].attendDate }" />
					</tr>
					<tr>
						<th>10월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[3].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[3].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[3].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[3].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[3].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[3].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[3].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[3].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[3].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[3].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate1" value="${resultList[3].attendDate }" />
						<th>4월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[9].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[9].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[9].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[9].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[9].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[9].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[9].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[9].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[9].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[9].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate2" value="${resultList[9].attendDate }" />
					</tr>
					<tr>
						<th>11월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[4].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[4].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[4].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[4].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[4].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[4].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[4].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[4].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[4].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[4].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate1" value="${resultList[4].attendDate }" />
						<th>5월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[10].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[10].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[10].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[10].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[10].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[10].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[10].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[10].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[10].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[10].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate2" value="${resultList[10].attendDate }" />
					</tr>
					<tr>
						<th>12월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[5].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[5].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[5].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[5].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[5].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[5].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[5].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[5].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check1">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[5].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[5].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate1" value="${resultList[5].attendDate }" />
						<th>6월</th>
						<td>
							<select name="monthMeeting" class="monthMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[11].monthMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[11].monthMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="directorMeeting" class="directorMeeting2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[11].directorMeeting eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[11].directorMeeting eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event1Check" class="event1Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[11].event1Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[11].event1Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event2Check" class="event2Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[11].event2Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[11].event2Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<td>
							<select name="event3Check" class="event3Check2">
								<option value="">없음</option>
								<option value="O" <c:if test="${resultList[11].event3Check eq 'O'}">selected="selected"</c:if>>O</option>
								<option value="X" <c:if test="${resultList[11].event3Check eq 'X'}">selected="selected"</c:if>>X</option>
							</select>
						</td>
						<input type="hidden" name="attendDate" class="attendDate2" value="${resultList[11].attendDate }" />
					</tr>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
	<!-- 본문 내용 끝 -->
</form:form>
