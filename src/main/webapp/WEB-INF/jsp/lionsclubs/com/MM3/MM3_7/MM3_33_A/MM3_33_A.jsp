<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		//조회 버튼선택
		$("#btnSearch").click(function(){
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#organCode").val()
			});
			
			_search();
		});
		
		$("#organCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_33_AVO.organCode}"
		});
		
		$("#organCode").on("change", function(){
			$.saveOrganCode({
				 lvl: 3
				,organCode: $(this).val()
			});
		});
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM3_33_AVO.sessionYear}"	
			,top:true
			,topLabel:"전체"
		});
	});
});	

function _search() {
	$("form").submit();
}

</script>
<form:form modelAttribute="MM3_33_AVO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="임원선임/분담금표">
			<caption>임원선임/분담금</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>조직코드</th>
					<td><form:select path="organCode" /></td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2">
						<form:radiobutton path="order" value="1" label="성명" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="클럽코드" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="직책" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->


	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" src="/images/lionsclubs/btn/btn_search.gif" title="조회" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="임원선임 및 분담금 현황">
				<caption>임원선임 및 분담금 현황</caption>
				<colgroup>
					<col width="40px" />
					<col width="60px" />
					<col width="80px" />
					<col width="80px" />
					<col width="*" />
					<col width="200px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>회원명</th>
						<th>회원번호</th>
						<th>클럽코드</th>
						<th>클럽명</th>
						<th>직책</th>
						<th>임원분담금</th>
						<th>납부금</th>
						<th>미납금</th>
						<th>결손금</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table id="table_input" class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="40px" />
					<col width="60px" />
					<col width="80px" />
					<col width="80px" />
					<col width="*" />
					<col width="200px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${list.memberName }</td>
							<td>${list.memberNo }</td>
							<td>${lions:formatOrganCode(list.clubCode) }</td>	
							<td class="left">${list.clubName }</td>	
							<td class="left">${list.positionName}</td>
							<td class="right"><fmt:formatNumber value="${list.impost }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.payment }" pattern="#,###"/></td>
							<td class="right"><fmt:formatNumber value="${list.balance }" pattern="#,###"/></td>
							<td class="right" style="color: #ff2200;"><fmt:formatNumber value="${list.paymentDefect }" pattern="#,###"/></td>
						</tr>
					</c:forEach>
			 
				</tbody>
			</table>
			
		</div><!-- Height_1 -->
		<div class="Scroll_Title Height_0 ">
			<table class="tblType2_1">
				<colgroup>
					<col width="40px" />
					<col width="60px" />
					<col width="80px" />
					<col width="80px" />
					<col width="*" />
					<col width="200px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
				</colgroup>
				<tfoot>	
					<tr>
						<th colspan="6">계</th>
						<th class="right"><fmt:formatNumber value="${sum.impost}" pattern="#,###"/></th>					
						<th class="right"><fmt:formatNumber value="${sum.payment}" pattern="#,###"/></th>
						<th class="right"><fmt:formatNumber value="${sum.balance}" pattern="#,###"/></th>
						<th class="right" style="color: #ff2200;"><fmt:formatNumber value="${sum.paymentDefect}" pattern="#,###"/></th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>
