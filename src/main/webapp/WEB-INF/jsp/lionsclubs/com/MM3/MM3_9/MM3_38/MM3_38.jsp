<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		//기관 클럽코드 세팅
		$("#clubCode").organCode({
			 lvl: 4
			,searchable: true
			,fixVal: "${MM3_38VO.clubCode}"
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_38VO.sessionYear}"  
			,top:false
		});
	
		$("#btnSearch").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#clubCode").val()
			});
			
			_search();
		});
		
		$(".tblType2 tbody tr").on("click", function(){
			var data = $(this).data();
			var districtcode = data.districtcode;
			var eventcode = data.eventcode;
			var eventdate = data.eventdate;
		
			location.href = "/MM3/MM3_9/MM3_37/MM3_37.do?menuId=406&districtCode=" + districtcode + "&eventCode=" + eventcode + "&eventDate=" + eventdate;
		});	
	});
});

function _search(){
	$("form").submit(); 
}
</script>
<style>
<!--
.tblType2 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form modelAttribute="MM3_38VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="400px" />
				<col width="100px" />
				<col width="130px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽명</th>
					<td><form:select path="clubCode" cssClass="select" /></td>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="120px" />
					<col width="200px" />
					<col width="200px" />
					<col width="120px" />
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>행사명</th>
						<th>행사일자</th>
						<th>행사장소</th>
						<th>행사내용</th>
						<th>점수계</th>
					</tr>
				</thead>
			</table>
		</div>
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="120px" />
					<col width="200px" />
					<col width="200px" />
					<col width="120px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList }" var="list" varStatus="status">
						<tr data-districtcode="${list.districtCode }" data-eventcode="${list.eventCode }" data-eventdate="${list.eventDate }">
							<td class="center">${status.count }</td>
							<td title="${list.eventName }">${list.eventName }</td>
							<td class="center">
								<fmt:parseDate var="eventDate" value="${list.eventDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${eventDate }" pattern="yyyy.MM.dd" />										
							</td>
							<td title="${list.eventPlace }">${list.eventPlace }</td>
							<td title="${list.eventDesc }">${list.eventDesc }</td>
							<td class="right"><fmt:formatNumber value="${list.totalScore }" pattern="#,###" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="120px" />
					<col width="200px" />
					<col width="200px" />
					<col width="120px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="5">행사총점</th>
						<th class="right"><fmt:formatNumber value="${sum }" pattern="#,###" /></th>
					</tr>
				</tfoot>
			</table>
		</div>				
	</div><!-- table -->

</form:form>