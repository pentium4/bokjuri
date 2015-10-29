<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
 	// 스크롤 이동 처리
	$('#Scroll_Area').on( 'scroll', function() {
		resize();
	});
 	
	$(window).resize(function(){
		resize();
	}); 	
 	
	$(window).load(function(){
		resize();
	});
});

function resize(){
	if($('#Scroll_Area').hasVerticalScrollbar()){
		$('.Scroll_Title').css("margin-right", "17px");
	} else {
		$('.Scroll_Title').css("margin-right", "0");
	}
}
</script>

<style>
<!--
td, th{
	font-size: 30px;
}
-->
</style>
<div class="deck-container">
	<section class="slide table">
		<h3 class="Height_0 center" style="margin-top: 20px;">■ ${param.title } ■</h3>
		<div class="Scroll_Title Height_0" style="margin-right: 17px;">
			<table>
				<colgroup>
					<col width="120px" />
					<col width="280px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col />
				</colgroup>
				<thead>
					<tr>
						<th>예금구분</th>
						<th>예금기간</th>
						<th>예금액</th>
						<th>만기금액</th>
						<th>금융기관</th>
						<th>예금주</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1" style="overflow-x: hidden; overflow-y: auto;">
			<table class="Scroll_Table">
				<colgroup>
					<col width="120px" />
					<col width="280px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td title="${list.kindName}">${list.kindName}</td>
							<td>
								<fmt:parseDate var="startDate" value="${list.startDate }" pattern="yyyyMMdd" />
								<fmt:parseDate var="endDate" value="${list.endDate }" pattern="yyyyMMdd" />
								<fmt:formatDate value="${startDate }" pattern="yyyy.MM.dd" />~<fmt:formatDate value="${endDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="right" title="<fmt:formatNumber value="${list.realAmount}" pattern="#,###" />">
								<fmt:formatNumber value="${list.realAmount}" pattern="#,###" />
							</td>
							<td class="right" title="<fmt:formatNumber value="${list.expireAmount}" pattern="#,###" />">
								<fmt:formatNumber value="${list.expireAmount}" pattern="#,###" />
							</td>
							<td class="left">${list.financialIns}</td>
							<td class="left" title="${list.holder}">${list.holder}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- tblTitle -->
	
		<div class="Scroll_Title Height_0" style="margin-right: 17px;">
			<table>
				<colgroup>
					<col width="120px" />
					<col width="280px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col width="150px" />
					<col />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="2">합계</th>
						<th class="right" title="<fmt:formatNumber value="${sum.depositSum }" pattern="#,###"/>">
							<fmt:formatNumber value="${sum.depositSum }" pattern="#,###"/>
						</th>
						<th class="right" title="<fmt:formatNumber value="${sum.expireSum }" pattern="#,###"/>">
							<fmt:formatNumber value="${sum.expireSum }" pattern="#,###"/>
						</th>
						<th></th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->	
	</section>
</div>
<!-- Initialize the deck -->
