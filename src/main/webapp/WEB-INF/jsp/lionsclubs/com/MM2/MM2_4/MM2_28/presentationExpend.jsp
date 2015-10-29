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
td, th{
	font-size: 30px;
}
</style>
<div class="deck-container">
	<section class="slide table">
		<h3 class="Height_0" style="margin-top: 20px;">■ ${param.title } ■</h3>
		<div class="Scroll_Title Height_0" style="margin-right: 17px;">
			<table>
				<colgroup>
					<col width="180px" />
					<col width="250px" />
					<col width="250px" />
					<col width="*" />
					<col width="280px" />
				</colgroup>
				<thead>
					<tr>
						<th>지출일자</th>
						<th>지출분류항목</th>
						<th>지출세부항목</th>
						<th>금액</th>
						<th>지출내용(참고사항)</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1" style="overflow-x: hidden; overflow-y: auto;">
			<table class="Scroll_Table">
				<colgroup>
					<col width="180px" />
					<col width="250px" />
					<col width="250px" />
					<col width="*" />
					<col width="280px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td>
								<fmt:parseDate var="inexDate" value="${list.inexDate}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${inexDate }" pattern="yyyy.MM.dd" />
							</td>
							<td class="left" title="${list.classItemName}">${list.classItemName}</td>
							<td class="left" title="${list.detailItemName}">${list.detailItemName}</td>
							<td class="right" title="<fmt:formatNumber value="${list.realAmount }" pattern="#,###"/>">
								<fmt:formatNumber value="${list.realAmount }" pattern="#,###"/>
							</td>
							<td class="left" title="${lions:newline(list.inexDesc) }">${list.inexDesc}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- tblTitle -->
	
		<div class="Scroll_Title Height_0" style="margin-right: 17px;">
			<table>
				<colgroup>
					<col width="180px" />
					<col width="250px" />
					<col width="250px" />
					<col width="*" />
					<col width="280px" />
				</colgroup>
				<tfoot>
					<tr>
						<th colspan="3">합계</th>
						<th class="right" title="<fmt:formatNumber value="${sum.expendSum }" pattern="#,###"/>">
							<fmt:formatNumber value="${sum.expendSum }" pattern="#,###"/>
						</th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div><!-- tblTitle -->	
	</section>
</div>
<!-- Initialize the deck -->
