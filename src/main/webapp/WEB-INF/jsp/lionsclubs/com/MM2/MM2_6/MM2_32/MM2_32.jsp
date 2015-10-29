<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<style>
<!--
.button{
	margin: 0 0 5px 0;
}
-->
</style>
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#excelDownload").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			$(window).unbind();
			$.download("/MM2/MM2_6/MM2_32/excelDownload.do", $("form").serialize());
		});
		
		$("#button_select").click(function() {
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl:4
				,organCode:$("#organCode").val()
			});
			
			_search();
		});
		
		$("#sessionYear").sessionYearCombo({
			 top: false
			,fixVal: "${MM2_32VO.sessionYear}"
		});
		
		$("#month").monthCombo({
			 top: false
			,fixVal: "${MM2_32VO.month}"
		});
		
		/*
		 * 코드 구하기
		 */
		$("#organCode").organCode({
			 lvl:4
			,fixVal:"${MM2_32VO.organCode}"
			,searchable: true
		});	
		
		$('.Scroll_Table tr:odd').css('background','');
		$('.Scroll_Table').rowspan(0);
	});
});

// 조회
function _search(){
	$("form").submit();
}
//-->
</script>

<form:form modelAttribute="MM2_32VO">
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
					<td colspan="3">
						<div class="fL">
							<form:select path="organCode" cssClass="select required" caption="클럽코드" />
						</div>
					</td>
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
	
		<div id="Scroll_Area" class="Height_0 mb10">
			<table class="tblType2">
				<caption>수입 항목별 금액조회</caption>
				<colgroup>
					<col width="150px" />
					<col width="300px" />
					<col width="150px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>전월이월금</th>
						<td class="right"><fmt:formatNumber value="${summary.prevMonthTotal }" pattern="#,###" /></td>
						<th>금월수입</th>
						<td class="right"><fmt:formatNumber value="${summary.incomeTotal }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>전월정기예금</th>
						<td class="right"><fmt:formatNumber value="${summary.prevDepositTotal }" pattern="#,###" /></td>
						<th>금월지출</th>
						<td class="right"><fmt:formatNumber value="${summary.expTotal }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>전월이월금계</th>
						<th class="right"><fmt:formatNumber value="${summary.prevMonthTotal + summary.prevDepositTotal }" pattern="#,###" /></th>
						<th>결손처리</th>
						<td class="right"><fmt:formatNumber value="${summary.depTotal }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>회비미수</th>
						<td class="right"><fmt:formatNumber value="${summary.duesAttempt }" pattern="#,###" /></td>
						<th>금월잔액</th>
						<td class="right"><fmt:formatNumber value="${(summary.prevMonthTotal + summary.incomeTotal) - summary.expTotal  }" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>기타미수금</th>
						<td class="right"><fmt:formatNumber value="${summary.notIncomeEtcTotal }" pattern="#,###" /></td>
						<th>미수금합계</th>
						<td class="right"><fmt:formatNumber value="${summary.duesAttempt + summary.notIncomeEtcTotal }" pattern="#,###" /></td>
					</tr>
				</thead>
			</table>		
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
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th colspan="7">수입내역</th>
					</tr>
					<tr>
						<th>수입분류항목</th>
						<th>수입세부항목</th>
						<th>금액</th>
						<th>납부자</th>
						<th>부과일</th>
						<th>납부일</th>
						<th>참고사항</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2 Scroll_Table">
				<caption>수입 항목별 금액조회</caption>
				<colgroup>
					<col width="150px" />
					<col width="150px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
		        <tbody>
		        	<c:forEach items="${resultList }" var="list" varStatus="status">
		        		<c:set var="subtotal" value="0" />
		        		<c:forEach items="${list.list }" var="list2" varStatus="status2">
		        			<tr>
		        				<td class="center">${list2.classItemName }</td>
		        				<td>${list2.detailItemName }</td>
		        				<td class="right"><fmt:formatNumber value="${list2.payment }" pattern="#,###" /></td>
		        				<td class="center">${list2.name }</td>
		        				<td class="center">
									<fmt:formatDate value="${list2.genDate }" pattern="yyyy.MM.dd" />
	        					</td>
		        				<td class="center">
									<fmt:formatDate value="${list2.paymentDate }" pattern="yyyy.MM.dd" />
		        				</td>
		        				<td>${list2.reference }</td>
		        			</tr>
							<c:set var="subtotal" value="${subtotal + list2.payment }" />		        			
		        			<c:if test="${status2.last }">
		        				<tr class="Ybg bold">
		        					<td colspan="2" class="center">소계</td>
		        					<td class="right"><fmt:formatNumber value="${subtotal }" pattern="#,###" /></td>
		        					<td colspan="4"></td>
		        				</tr>
		        			</c:if>
		        		</c:forEach>
		        		<c:set var="total" value="${total + subtotal }" />
		        	</c:forEach>
		        </tbody>
			</table>
		</div><!-- Height_1 -->
		
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
					<col width="*" />
				</colgroup>
				<tfoot>
       				<tr class="Gbg bold">
       					<th colspan="2">총계</th>
       					<th class="right"><fmt:formatNumber value="${total }" pattern="#,###" /></th>
       					<th colspan="4"></th>
       				</tr>		        		
				</tfoot>
			</table>
		</div><!-- tblTitle -->
				
	
		
	</div><!-- table -->	
</form:form>