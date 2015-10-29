<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		//조회 버튼선택
		$("#button_search").click(function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#thisOrganCode").val()
			});
			
			_search();
		});
		
		$("#thisOrganCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_23VO.thisOrganCode}"
		});
		
		$("#thisYear").sessionYearCombo({
			 fixVal: "${MM3_23VO.thisYear}"	
			,top: true
		});
		
		$("#detailItemCode").option1Code({
		     groupCode: '4100' // 그룹코드
		    ,code: "1030"
		    ,topLabel: "--전체--"
		    ,fixVal: "${MM3_23VO.detailItemCode}" // 고정값
		});		
	});
});	

function _search(){
	$("#form_list").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM3_23VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="약정금납부조회표">
			<caption>약정금납부조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직코드</th>
					<td><form:select path="thisOrganCode" /></td>
					<th>조회구분</th>
					<td>
						<form:radiobutton path="order" value="1" label="클럽별" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="성명" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="약정일" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="thisYear" cssClass="select" /></td>
					<th>항목</th>
					<td><form:select path="detailItemCode" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="button_search" src="/images/lionsclubs/btn/btn_search.gif" title="조회" class="pointer authorization read" />
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="기금약정 납부조회표">
				<caption>기금약정 납부조회</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="80px" />
					<col width="90px" />
					<col width="140px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">No</th>
						<th rowspan="2">클럽명</th>
						<th rowspan="2">성명</th>
						<th rowspan="2">약정일</th>
						<th rowspan="2">항목</th>
						<th colspan="2">약정금</th>
						<th colspan="2">납입금</th>
						<th colspan="2">잔액</th>
					</tr>
					<tr>
						<th>＄</th>
						<th>금액</th>
						<th>＄</th>
						<th>금액</th>
						<th>＄</th>
						<th>금액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="80px" />
					<col width="90px" />
					<col width="140px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<tbody>
					<c:set var="pTotal1" value="0" />
					<c:set var="pTotal2" value="0" />
					<c:set var="pTotal3" value="0" />
					<c:set var="pTotal4" value="0" />
					<c:set var="pTotal5" value="0" />
					<c:set var="pTotal6" value="0" />	
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td class="left" title="${lions:formatOrganCode(list.organCode)} ${list.organName }">${lions:formatOrganCode(list.organCode)} ${list.organName }</td>
							<td>${list.name }</td>
							<td>
								<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
							</td>	
							<td class="left">${list.detailItemName }</td>	
							<td class="right"><fmt:formatNumber value="${list.impostDollar }"/></td>
							<td class="right"><fmt:formatNumber value="${list.impost }"/></td>
							<td class="right"><fmt:formatNumber value="${list.paymentDollar }"/></td>
							<td class="right"><fmt:formatNumber value="${list.paymentSum }"/></td>
							<td class="right"><fmt:formatNumber value="${list.paymentNotDollar }"/></td>
							<td class="right"><fmt:formatNumber value="${list.paymentNotSum }"/></td>
						</tr>
						<c:set var="pTotal1" value="${pTotal1 + list.impostDollar }" />
						<c:set var="pTotal2" value="${pTotal2 + list.impost }" />
						<c:set var="pTotal3" value="${pTotal3 + list.paymentDollar }" />
						<c:set var="pTotal4" value="${pTotal4 + list.paymentSum }" />
						<c:set var="pTotal5" value="${pTotal5 + list.paymentNotDollar }" />
						<c:set var="pTotal6" value="${pTotal6 + list.paymentNotSum }" />
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="100px" />
					<col width="100px" />
					<col width="140px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
					<col width="90px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="5">총 계</th>
						<th class="right f11"><fmt:formatNumber><c:out value="${pTotal1}" /></fmt:formatNumber></th>
						<th class="right f11"><fmt:formatNumber><c:out value="${pTotal2}" /></fmt:formatNumber></th>
						<th class="right f11"><fmt:formatNumber><c:out value="${pTotal3}" /></fmt:formatNumber></th>
						<th class="right f11"><fmt:formatNumber><c:out value="${pTotal4}" /></fmt:formatNumber></th>
						<th class="right f11"><fmt:formatNumber><c:out value="${pTotal5}" /></fmt:formatNumber></th>
						<th class="right f11"><fmt:formatNumber><c:out value="${pTotal6}" /></fmt:formatNumber></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>