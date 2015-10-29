<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM3_52VO.sessionYear}"	// 고정값
			,top:false
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,searchable: true
			,fixVal: "${MM3_52VO.organCode}"
		});
		
		/* 
			테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2 tbody tr");
		tbl.on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var data = $(this).data();
			$("#clubCode").val(data.clubcode);
			$(".order").val("4");
			
			$("form").prop("action","/MM3/MM3_12/MM3_46/MM3_46.do?menuId=564");
			$("form").submit();
		});
		
		// 조회 버튼선택
		$("#search").on("click", function(){
			_search();
		});
	});
});

//링크페이지
function _search(){
	$("form").submit();
}
</script>
<style>
.Scroll_Table tr{
	cursor: pointer;
}
</style>
<form:form modelAttribute="MM3_52VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td><form:select path="organCode" cssClass="required" caption="지구코드" /></td>
					<th>조회구분</th>
					<td>
						<form:radiobutton path="order" value="1" label="클럽순" cssClass="order ml10" />
						<form:radiobutton path="order" value="2" label="순위순" cssClass="order ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td colspan="3"><form:select path="sessionYear" cssClass="select required" caption="회기선택" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="search" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="70px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="50px" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>클럽명</th>
						<th>부과수</th>
						<th>부과금</th>
						<th>납부금</th>
						<th>결손금</th>
						<th>미수금</th>
						<th>환차손</th>
						<th>미납율</th>
						<th>순위</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="70px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="50px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr data-clubcode="${list.clubCode }">
							<td class="center">${status.count }</td>
							<td class="left" title="${lions:formatOrganCode(list.clubCode) } ${list.clubName }">${lions:formatOrganCode(list.clubCode) } ${list.clubName }</td>
							<td class="right"><fmt:formatNumber value="${list.impostCnt }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.impost }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.payment }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.paymentDefect }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.paymentBal }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.exchangeLoss }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.paymentRate }" pattern="#,###.#"/>%</td>
							<td class="right"><fmt:formatNumber value="${list.clubRank }" pattern="#,###"/></td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0">
			<table class="tblType2_1">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="70px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="50px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">총계</th>
						<th class="right"><fmt:formatNumber value="${sum.impostCnt }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.impost }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.payment }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.paymentDefect }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.paymentBal }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.exchangeLoss }" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.paymentRate }" pattern="#,###.#%"/></th>
						<th class="right"></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->		
	</div><!-- table -->
	
	<form:hidden path="clubCode" />
</form:form>