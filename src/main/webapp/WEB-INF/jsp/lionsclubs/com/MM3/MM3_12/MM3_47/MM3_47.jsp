<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		//$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#btnSearch").click(function() {
			_search();
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_47VO.sessionYear}"
		});
		
		$("#month").monthCombo({
			 fixVal: "${MM3_47VO.month}"
		});
		
		/*
		 * 코드 구하기
		 */
		$("#organCode").organCode({
			 lvl: 3
			,fixVal:"${MM3_47VO.organCode}"
			,searchable: true
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
		
		$("#incomeExpend").treetable({ 
			 expandable: true 
			,onInitialized: function(){
				Scroll_Actrion();
				Scroll_Table1();
			}
		});	
		
		$("#incomeExpend").on("click", function(){
			Scroll_Actrion();
			Scroll_Table1();
		});
	});
});

//링크페이지
function _search(){
	$("form").submit();
}
</script>
<style>
.tblType2_1 > tbody > tr > td {background:#FFFFFF;}
</style>
<form:form id="form_list" modelAttribute="MM3_47VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="수입 항목별 금액조회표">
			<caption>수입 항목별 금액조회</caption>
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
					<th>클럽코드</th>
					<td colspan="3"><form:select path="organCode" cssClass="select" /></td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2">
						<form:checkbox path="fullPayment" value="1" label="완납" cssClass="ml10" />
						<form:checkbox path="defaultPayment" value="1" label="미납" cssStyle="margin-left: 52px;" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
					<th>선택월</th>
					<td><form:select path="month" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read"/>
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1" summary="수입 항목별 금액조회 안내표">
				<caption>수입 항목별 금액조회</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>부과일자</th>
						<th>부과금</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>미납금</th>
						<th>참고사항</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table id="incomeExpend" class="tblType2 Scroll_Table">
				<caption>수입 항목별 금액조회</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>			
		        <tbody>
		        	<c:forEach items="${resultList }" var="list">
						<c:set var="fStyle" value="" />
						<c:choose>
							<c:when test="${list.dollarKind eq '$'}">
								<c:set var="fStyle" value="color:green" />
							</c:when>
						</c:choose>
		        		<tr data-tt-id="${list.id }" data-tt-parent-id="${list.parent }" data-idnno="${list.id }">
		        			<td style="${fStyle}">${list.classItemName }</td>
		        			<td style="${fStyle}" title="${list.detailItemName }">${list.detailItemName }</td>
		        			<td style="${fStyle}" class="center">
		        				<fmt:parseDate var="genDate" value="${list.genDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
		        			</td>
		        			<fmt:formatNumber var="impostDollar" value="${list.impostDollar }" pattern="$ #,###"/>
		        			<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? impostDollar : '' }"><fmt:formatNumber value="${list.impost }" pattern="#,###" /></td>
		        			<fmt:formatNumber var="paymentDollar" value="${list.paymentDollar }" pattern="$ #,###"/>
		        			<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? paymentDollar : '' }"><fmt:formatNumber value="${list.payment }" pattern="#,###" /></td>
		        			<fmt:formatNumber var="paymentDefectDollar" value="${list.paymentDefectDollar }" pattern="$ #,###"/>
		        			<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? paymentDefectDollar : '' }"><fmt:formatNumber value="${list.paymentDefect }" pattern="#,###" /></td>
		        			<fmt:formatNumber var="balanceDollar" value="${list.balanceDollar }" pattern="$ #,###"/>
		        			<td style="${fStyle}" class="right" title="${list.dollarKind eq '$' ? balanceDollar : '' }"><fmt:formatNumber value="${list.balance }" pattern="#,###" /></td>
		        			<td style="${fStyle}" class="left" title="${list.reference }">${list.reference }</td>
		        		</tr>
		        	</c:forEach>
		        </tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1" summary="수입 항목별 금액조회 안내표">
				<caption>수입 항목별 금액조회</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3">선택항목 누계</th>
						<th class="right f11">
							<fmt:formatNumber value="${sum.impost }" pattern="#,###" />
						</th>
						<th class="right f11">
							<fmt:formatNumber value="${sum.payment }" pattern="#,###" />
						</th>
						<th class="right f11">
							<fmt:formatNumber value="${sum.paymentDefect }" pattern="#,###" />
						</th>
						<th class="right f11">
							<fmt:formatNumber value="${sum.balance }" pattern="#,###" />
						</th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
<!-- 본문 내용 끝 -->

</form:form>