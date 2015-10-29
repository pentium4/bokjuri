<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_43VO.sessionYear}"	// 고정값
			,top:false
		});
		
		// 지구코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_43VO.organCode}"
		});
		
		$("#organCode").on("change", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 3
				,organCode: $(this).val()
			});
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});		
	});
});

//링크페이지
function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM3_43VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="180px" />
				<col width="100px" />
				<col width="150px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td colspan="3"><form:select path="organCode" /></td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2">
						<form:radiobutton path="order" value="1" label="지출세부항목별" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="증감순" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
					<th>회계구분</th>
					<td><lions:codeselect groupCode="6760" path="accountKind" topLabel="--전체--" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="지출예산실적 조회 안내표">
				<caption>지출예산 및 결산현황</caption>
				<colgroup>
					<col width="150px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<thead>
					<tr>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>예산금액</th>
						<th>결산금액</th>
						<th>증감</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table" id = "table_sis">
				<colgroup>
					<col width="150px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<c:set var="fStyle" value="" />
							<c:choose>
								<c:when test="${list.type eq 'B' and list.classItemCode eq '1030' }">
									<c:set var="fStyle" value="color:blue" />
								</c:when>
								<c:when test="${list.type eq 'B' and list.classItemCode eq '1040' }">
									<c:set var="fStyle" value="color:green" />								
								</c:when>
								<c:when test="${list.type eq 'B' and list.classItemCode eq '1100' }">
									<c:set var="fStyle" value="color:#FF00FF" />
								</c:when>
							</c:choose>
							<td class="left" style="${fStyle}" title="${list.classItemName }">${list.classItemName }</td>
							<td class="left" style="${fStyle}" title="${list.detailItemName }">${list.detailItemName }</td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.budgetAmount }" pattern="#,###" /></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.realAmount }" pattern="#,###" /></td>
							<td class="right" style="${fStyle}"><fmt:formatNumber value="${list.balance }" pattern="#,###" /></td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="150px" />
					<col width="*" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">총계</th>
						<th class="right"><fmt:formatNumber value="${sum.budgetAmount }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sum.realAmount }" pattern="#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sum.balance }" pattern="#,###" /></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
</form:form>