<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_31VO.sessionYear}"	// 고정값
			,top: false
		});
		
		$("#button_select").click(function() {
			_search();
		});
		
		//기관 지구코드 세팅
		$("#organCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_31VO.organCode}"
		});
		
		$("#searchBtn").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#organCode").val()
			});
			
			_search();
		});
	});
});

function linkPage(pageNum){
	$("#form_list").submit();
}

function _search(){
	$("#pageIndex").val(1);
	$("#form_list").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM3_31VO">

<h3><div>지역지대구성명단 <span class="date"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></span></div></h3>
<div class="table">
	<table class="tblType1" summary="지구지역  구성 명단">
		<caption><lions:menutitle menuId="${param.menuId }" kind="title" /></caption>
		<colgroup>
			<col width="100px" />
			<col width="*" />
			<col width="100px" />
			<col width="*" />
			<col width="100px" />
			<col width="41%" />
		</colgroup>
		<tbody>
		<tr>
			<th>조직코드</th>
			<td colspan="5">
				<div class="fL">
					<form:select path="organCode" cssClass="select" />
				</div>
			</td>
		</tr>
		<tr>
			<th>회기선택</th>
			<td colspan="5">
				<form:select path="sessionYear" cssClass="select" />
			</td>
			
		</tr>
		</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<h4>지역지대 구성 명단</h4>
	<div class="btnBox">
		<img alt="조회" id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		<button type="submit" name="titleKindCode" id="button_select" style="border:0px;"><img src="/images/lionsclubs/btn/btn_all.gif" alt="전체" class="pointer authorization read"/></button>
		<button type="submit" name="titleKindCode" value="3900" id="button_select" style="border:0px;"><img src="/images/lionsclubs/btn/btn_pre2.gif" alt="지역부총재" class="pointer authorization read"/></button>
		<button type="submit" name="titleKindCode" value="4400" id="button_select" style="border:0px;"><img src="/images/lionsclubs/btn/btn_pre3.gif" alt="지대위원장" class="pointer authorization read"/></button>
		<button type="submit" name="titleKindCode" value="1000" id="button_select" style="border:0px;"><img src="/images/lionsclubs/btn/btn_pre1.gif" alt="회장" class="pointer authorization read"/></button> 
	</div>

	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2" summary="클럽 지역지대 연결표">
			<caption>클럽 지역지대 연결</caption>
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="210px" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
			</colgroup>
			<thead>
			<tr>
				<th>지역</th>
				<th>지대</th>
				<th>직책</th>
				<th>성명</th>
				<th>클럽</th>
				<th>1부 회장</th>
				<th>총무</th>
				<th>재무</th>
			</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="210px" />
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="100px" />
				<col width="100px" />
			</colgroup>
			<tbody>
				<c:forEach var="list" items="${resultList }" varStatus="status">
					<tr>
						<td>${list.area }</td>
						<td>${list.zone }</td>
						<td class="left">${list.titleName }</td>
						<td>${list.areaZoneName }</td>
						<td class="left" title="${list.clubName }(${lions:formatOrganCode(list.organCode) })">
							${fn:substring(list.organCode, 3, 6) }. ${list.clubName }
						</td>
						<td>${list.vName }</td>
						<td>${list.mName }</td>
						<td>${list.fName }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
</div><!-- table -->
<script type="text/javascript">

</script>	
</form:form>