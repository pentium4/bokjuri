<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM2_21VO.sessionYear}"	// 고정값
			,top:false
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_21VO.organCode}"
		});
		
		//조회 버튼선택
		$("#search").on("click", function(){
			var sessionYear = $("#sessionYear").val();
			
			if(sessionYear == ""){
				alert("회기별 조회만 가능합니다.");
				$("#sessionYear").focus();
				return false;
			}
			
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
			
			_search();
		});
	});
});

//링크페이지
function _search(){
	$("#form_list").submit();
}
</script>

<form:form id="form_list" modelAttribute="MM2_21VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="년간 수입/지출 실적 조회표">
		<caption>년간 수입/지출 실적 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td>
						<div class="fL">
							<form:select path="organCode"/>
						</div>
					</td>
					<th>회기선택</th>
					<td class="LH">
						<form:select path="sessionYear" cssClass="select" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="수입 예산조회 안내표">
				<caption>수입 예산조회</caption>
				<colgroup>
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th colspan="4">수입예산</th>
						<th colspan="4">지출예산</th>
					</tr>
					<tr>
						<th>수입세부항목</th>
						<th>예산금액</th>
						<th>결산금액</th>
						<th>차액</th>
						<th>지출세부항목</th>
						<th>예산금액</th>
						<th>결산금액</th>
						<th>차액</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
	
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tbody>
					<c:forEach items="${dataList}" var="list" varStatus="status">
						<tr>
							<c:set var="fStyle" value="" />
							<c:choose>
								<c:when test="${list.classItemCodeA eq '1030' }">
									<c:set var="fStyle" value="color:blue" />
								</c:when>
								<c:when test="${list.classItemCodeA eq '1040' }">
									<c:set var="fStyle" value="color:green" />								
								</c:when>
								<c:when test="${list.classItemCodeA eq '1100' and (list.detailItemCodeA eq '1000' or list.detailItemCodeA eq '1010')}">
									<c:set var="fStyle" value="color:#FF00FF" />
								</c:when>
							</c:choose>
							<td class="left" style="${fStyle}" title="${list.detailItemNameA }">${list.detailItemNameA }</td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.budgetAmountA }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.realAmountA }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.subtractAmountA }" pattern="#,###"/></td>
							
							<c:set var="fStyle" value="" />
							<c:choose>
								<c:when test="${list.classItemCodeB eq '1160' and not empty list.moneyIdnNoB}">
									<c:set var="fStyle" value="color:blue" />
								</c:when>
								<c:when test="${list.classItemCodeB eq '1040' and not empty list.moneyIdnNoB}">
									<c:set var="fStyle" value="color:green" />
								</c:when>
								<c:when test="${list.classItemCodeB eq '1110' and not empty list.moneyIdnNoB}">
									<c:set var="fStyle" value="color:#FF00FF" />
								</c:when>
							</c:choose>
							<td class="left" style="${fStyle}" title="${list.detailItemNameB }">${list.detailItemNameB }</td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.budgetAmountB }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.realAmountB }" pattern="#,###"/></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.subtractAmountB }" pattern="#,###"/></td>
						</tr>	
					</c:forEach>	
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="총 계">
				<caption>수입 예산조회</caption>
				<colgroup>
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="150px" />
					<col width="120px" />
					<col width="120px" />
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th>총 계</th>
						<th class="right"><fmt:formatNumber value="${dataListSum.budgetAmountA }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${dataListSum.realAmountA }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${dataListSum.subtractAmountA }" pattern="#,###"/></th>
						<th>총 계</th>
						<th class="right"><fmt:formatNumber value="${dataListSum.budgetAmountB }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${dataListSum.realAmountB }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${dataListSum.subtractAmountB }" pattern="#,###"/></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>