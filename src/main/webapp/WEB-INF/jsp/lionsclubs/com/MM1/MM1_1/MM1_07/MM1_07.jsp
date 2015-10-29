<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		/*
		 *	회기 검색
		 */
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM1_07VO.sessionYear}"	// 고정값
		});
		
		$("#sessionYear").on("change", function(){
			$("#form_list").submit();
		});	
		
		/*
		 *	행사명입력창 띄우기
		 */
		 $("#button_insert").click(function() {
			 openPopup('<c:url value="/MM1/MM1_1/MM1_07/MM1_07_Popup.do?sessionYear=${MM1_07VO.sessionYear}&organCode=${MM1_07VO.organCode}" />', 700, 475, 'MM1_07_Popup');
		 });
		
		/*
		 *	수정 버튼
		 */
		$("#button_update").on("click", function() {
			$("#form_list").attr("action","/MM1/MM1_1/MM1_07/MM1_07_Modify.do?memberNo=${MM1_07VO.memberNo}");
			$("#form_list").submit();
		});
	});
});

function _search(){
	$("#form_list").submit();
}
</script>
<style>
<!--
.tblType2_1 tbody tr{
	height: 50px;
}
-->
</style>
<form:form id="form_list" modelAttribute="MM1_07VO" action="/MM1/MM1_1/MM1_07/MM1_07.do">
	<h3><div>행사출석현황 </div></h3>
	<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" />

	<div class="table">
		<h4>출석현황
			<em style="position:absolute;top:1px;">
				<table class="tblCal2">
				<tr>
					<td>회기선택 :
						<form:select path="sessionYear" cssClass="select" />
					</td>
				</tr>
				</table>
			</em>
		</h4>
		<div class="btnBox">
			<img id="button_insert" src="/images/lionsclubs/btn/btn_event.gif" alt="행사명 입력" style="width:94px" class="pointer authorization write" />
			<img id="button_update" src="/images/lionsclubs/btn/btn_edit.gif" alt="행사명 수정" style="width:57px" class="pointer authorization write" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="출석현황 안내표이며 월례회,이사회,행사 정보를 제공">
				<caption>출석현황</caption>
				<colgroup>
					<col width="100px" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="100px" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
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
			<table class="Scroll_Table tblType2_1">
				<colgroup>
					<col width="100px" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="100px" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
					<col width="9%" />
				</colgroup>
				<tbody>
					<tr>
						<th>7월</th>
						<td>${resultList[0].monthMeeting}</td>
						<td>${resultList[0].directorMeeting}</td>
						<td>
							${resultList[0].event1Check}
							<c:if test="${not empty resultList[0].event1 }">
								<img title="${resultList[0].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[0].event2Check}
							<c:if test="${not empty resultList[0].event2 }">
								<img title="${resultList[0].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[0].event3Check}
							<c:if test="${not empty resultList[0].event3 }">
								<img title="${resultList[0].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<th>1월</th>
						<td>${resultList[6].monthMeeting}</td>
						<td>${resultList[6].directorMeeting}</td>
						<td>
							${resultList[6].event1Check}
							<c:if test="${not empty resultList[6].event1 }">
								<img title="${resultList[6].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[6].event2Check}
							<c:if test="${not empty resultList[6].event2 }">
								<img title="${resultList[6].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[6].event3Check}
							<c:if test="${not empty resultList[6].event3 }">
								<img title="${resultList[6].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
					</tr>
					<tr>
						<th>8월</th>
						<td>${resultList[1].monthMeeting}</td>
						<td>${resultList[1].directorMeeting }</td>
						<td>
							${resultList[1].event1Check}
							<c:if test="${not empty resultList[1].event1 }">
								<img title="${resultList[1].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[1].event2Check}
							<c:if test="${not empty resultList[1].event2 }">
								<img title="${resultList[1].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[1].event3Check}
							<c:if test="${not empty resultList[1].event3 }">
								<img title="${resultList[1].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<th>2월</th>
						<td>${resultList[7].monthMeeting }</td>
						<td>${resultList[7].directorMeeting}</td>
						<td>
							${resultList[7].event1Check}
							<c:if test="${not empty resultList[7].event1 }">
								<img title="${resultList[7].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[7].event2Check}
							<c:if test="${not empty resultList[7].event2 }">
								<img title="${resultList[7].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[7].event3Check}
							<c:if test="${not empty resultList[7].event3 }">
								<img title="${resultList[7].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
					</tr>
					<tr>
						<th>9월</th>
						<td>${resultList[2].monthMeeting}</td>
						<td>${resultList[2].directorMeeting}</td>
						<td>
							${resultList[2].event1Check}
							<c:if test="${not empty resultList[2].event1 }">
								<img title="${resultList[2].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[2].event2Check}
							<c:if test="${not empty resultList[2].event2 }">
								<img title="${resultList[2].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[2].event3Check}
							<c:if test="${not empty resultList[2].event3 }">
								<img title="${resultList[2].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<th>3월</th>
						<td>${resultList[8].monthMeeting}</td>
						<td>${resultList[8].directorMeeting}</td>
						<td>
							${resultList[8].event1Check}
							<c:if test="${not empty resultList[8].event1 }">
								<img title="${resultList[8].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[8].event2Check}
							<c:if test="${not empty resultList[8].event2 }">
								<img title="${resultList[8].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[8].event3Check}
							<c:if test="${not empty resultList[8].event3 }">
								<img title="${resultList[8].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
					</tr>
					<tr>
						<th>10월</th>
						<td>${resultList[3].monthMeeting}</td>
						<td>${resultList[3].directorMeeting}</td>
						<td>
							${resultList[3].event1Check}
							<c:if test="${not empty resultList[3].event1 }">
								<img title="${resultList[3].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[3].event2Check}
							<c:if test="${not empty resultList[3].event2 }">
								<img title="${resultList[3].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[3].event3Check}
							<c:if test="${not empty resultList[3].event3 }">
								<img title="${resultList[3].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<th>4월</th>
						<td>${resultList[9].monthMeeting}</td>
						<td>${resultList[9].directorMeeting}</td>
						<td>
							${resultList[9].event1Check}
							<c:if test="${not empty resultList[9].event1 }">
								<img title="${resultList[9].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[9].event2Check}
							<c:if test="${not empty resultList[9].event2 }">
								<img title="${resultList[9].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[9].event3Check}
							<c:if test="${not empty resultList[9].event3 }">
								<img title="${resultList[9].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
					</tr>
					<tr>
						<th>11월</th>
						<td>${resultList[4].monthMeeting}</td>
						<td>${resultList[4].directorMeeting}</td>
						<td>
							${resultList[4].event1Check}
							<c:if test="${not empty resultList[4].event1 }">
								<img title="${resultList[4].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[4].event2Check}
							<c:if test="${not empty resultList[4].event2 }">
								<img title="${resultList[4].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[4].event3Check}
							<c:if test="${not empty resultList[4].event3 }">
								<img title="${resultList[4].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<th>5월</th>
						<td>${resultList[10].monthMeeting }</td>
						<td>${resultList[10].directorMeeting}</td>
						<td>
							${resultList[10].event1Check}
							<c:if test="${not empty resultList[10].event1 }">
								<img title="${resultList[10].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[10].event2Check}
							<c:if test="${not empty resultList[10].event2 }">
								<img title="${resultList[10].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[10].event3Check}
							<c:if test="${not empty resultList[10].event3 }">
								<img title="${resultList[10].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
					</tr>
					<tr>
						<th>12월</th>
						<td>${resultList[5].monthMeeting}</td>
						<td>${resultList[5].directorMeeting}</td>
						<td>
							${resultList[5].event1Check}
							<c:if test="${not empty resultList[5].event1 }">
								<img title="${resultList[5].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[5].event2Check}
							<c:if test="${not empty resultList[5].event2 }">
								<img title="${resultList[5].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[5].event3Check}
							<c:if test="${not empty resultList[5].event3 }">
								<img title="${resultList[5].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<th>6월</th>
						<td>${resultList[11].monthMeeting}</td>
						<td>${resultList[11].directorMeeting}</td>
						<td>
							${resultList[11].event1Check}
							<c:if test="${not empty resultList[11].event1 }">
								<img title="${resultList[11].event1 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[11].event2Check}
							<c:if test="${not empty resultList[11].event2 }">
								<img title="${resultList[11].event2 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
						<td>
							${resultList[11].event3Check}
							<c:if test="${not empty resultList[11].event3 }">
								<img title="${resultList[11].event3 }" src="/css/lionsmobile/images/icons-png/search-black.png" class="pointer" />
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
	<!-- 본문 내용 끝 -->
</form:form>
