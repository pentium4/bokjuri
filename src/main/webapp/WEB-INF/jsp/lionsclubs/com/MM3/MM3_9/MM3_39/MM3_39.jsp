<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		//기관 클럽코드 세팅
		$("#districtCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_39VO.districtCode}"
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_39VO.sessionYear}"  
			,top:false
		});
		
		$("#btnSearch").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#districtCode").val()
			});
			
			_search();
		});
	});
});

function _search(){
	$("form").submit(); 
}
//-->
</script>
<form:form modelAttribute="MM3_39VO">
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
					<th>지구선택</th>
					<td><form:select path="districtCode" cssClass="select" /></td>
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
					<col width="30px" />
					<col width="200px" />
					<col width="130px" />
					<c:forEach items="${eventList}" var="list" varStatus="status">
						<col width="130px" />
					</c:forEach>
				</colgroup>
				<thead>
					<tr>
						<th>NO</th>
						<th>클럽명</th>
						<th>총점</th>
						<c:forEach items="${eventList}" var="list" varStatus="status">
							<th>${list.eventName }</th>
						</c:forEach>
					</tr>
				</thead>
			</table>
		</div>
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="30px" />
					<col width="200px" />
					<col width="130px" />
					<c:forEach items="${eventList}" var="list" varStatus="status">
						<col width="130px" />
					</c:forEach>
				</colgroup>
				<tbody>
					<c:forEach items="${resultList }" var="list" varStatus="status">
						<tr>
							<td class="center">${status.count }</td>
							<td>${list.clubName }</td>
							<c:set var="eventSum" value="0" />
							<c:forEach items="${eventList }" var="eList">
								<c:set var="eventSum" value="${eventSum + list[eList.eventCode] }" />
								<c:set var="eventTotalSum" value="${eventTotalSum + list[eList.eventCode] }" />
							</c:forEach>
							<td class="right"><fmt:formatNumber value="${eventSum }" pattern="#,###" /></td>
							<c:forEach items="${eventList }" var="eList">
								<td class="right"><fmt:formatNumber value="${list[eList.eventCode] }" pattern="#,###" /></td>
							</c:forEach>							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="30px" />
					<col width="200px" />
					<col width="130px" />
					<c:forEach items="${eventList}" var="list" varStatus="status">
						<col width="130px" />
					</c:forEach>
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">합계</th>
						<th class="right"><fmt:formatNumber value="${eventTotalSum }" pattern="#,###" /></th>
						<c:forEach items="${eventList }" var="eList">
							<th class="right"><fmt:formatNumber value="${sum[eList.eventCode] }" pattern="#,###" /></th>
						</c:forEach>
					</tr>
				</tfoot>
			</table>
		</div>				
	</div><!-- table -->

</form:form>