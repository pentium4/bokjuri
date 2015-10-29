<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#button_select").click(function() {
			_search();
		});
		
		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM3_58VO.sessionYear}"
		});
		
		$("#month").monthCombo({
			 top: false
			,fixVal: "${MM3_58VO.month}"
		});
		
		/*
		 * 코드 구하기
		 */
		$("#organCode").organCode({
			 lvl: 3
			,fixVal: "${MM3_58VO.organCode}"
			,searchable: true
		});
		
		$("#excelDownload").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			$(window).unbind();
			$.download("/MM3/MM3_10/MM3_58/excelDownload.do", $("form").serialize());
		});
	});
});

// 조회
function _search(){
	$("form").submit();
}
</script>

<form:form modelAttribute="MM3_58VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="200px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td colspan="3"><form:select path="organCode" cssClass="select required" caption="지구코드" /></td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select required" caption="회기선택" /></td>
					<th>선택월</th>
					<td><form:select path="month" cssClass="required" caption="선택월" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><div><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></div></h4>
		<div class="btnBox">
			<img id="button_select" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read"/>
			<img id="excelDownload" src="/images/lionsclubs/btn/btn_excel2.gif" style="margin-top:2px" alt="엑셀다운로드" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2">
				<colgroup>
					<col width="50px" />
					<col width="200px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2">No.</th>
						<th rowspan="2">Name</th>
						<th rowspan="2">Membership Number</th>
						<th rowspan="2">Club Number</th>
						<th colspan="2">Amounts</th>
						<th rowspan="2">Remarks</th>
					</tr>
					<tr>
						<th>Won</th>
						<th>US$</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->	
		<div class="Height_1">
			<table class="tblType2 Scroll_Table">		
				<colgroup>
					<col width="50px" />
					<col width="200px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList }" var="list" varStatus="status">
						<tr>
							<td class="center">${status.count }</td>
							<td class="center">${list.enName }</td>
							<td class="center"></td>
							<td class="center">${list.registerNo }</td>
							<td class="right"><fmt:formatNumber value="${list.payment}" pattern="#,###" /></td>
							<td class="right"><fmt:formatNumber value="${list.paymentDollar}" pattern="#,###" /></td>
							<td class="center"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2">
				<colgroup>
					<col width="50px" />
					<col width="200px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">Total</th>
						<th></th>
						<th></th>
						<th class="right"><fmt:formatNumber value="${sum.payment }" pattern="\#,###" /></th>
						<th class="right"><fmt:formatNumber value="${sum.paymentDollar }" pattern="US$#,###" /></th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->				
	</div><!-- table -->
</form:form>