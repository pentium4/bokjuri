<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<script type="text/javascript">
$(document).ready(function () {
 	// 스크롤 이동 처리
	$('#1 .Scroll_Title').on('scroll', function() {
		$('#1 .Height_1').scrollLeft( $(this).scrollLeft());
		$('#1 .Scroll_Title').scrollLeft( $(this).scrollLeft());
		resize();
	});
 	
	$('#1 .Height_1').on('scroll', function() {
		$('#1 .Height_1').scrollTop( $(this).scrollTop());
	});
	
	$(window).resize(function(){
		resize();
	});
	
	$(window).load(function(){
		resize();
	});
});

function resize(){
	$('.Height_1').each(function(){
		if($(this).hasVerticalScrollbar()){
			$(this).closest('.table').find('.Scroll_Title').css('margin-right', '17px');
		} else {
			$(this).closest('.table').find('.Scroll_Title').css('margin-right', '0');
		}
	});
}
</script>

<style>
<!--
td, th{
	font-size: 30px;
}

#fix{
	float: left;
}

#content{
	margin-left: 410px;
}
-->
</style>
<div class="deck-container">
	<section class="slide table" id="1">
		<h3 class="Height_0" style="margin-top: 20px;">
			■ 개인별 ${param.title } 합계 ■
			<a cl style="float: right" title="항목별 금액" href="#2">항목별 금액 →</a>
		</h3>
		
		<div id="fix">
			<div style="overflow: hidden;">
				<table style="margin-top: 0">
					<colgroup>
						<col width="200px" />
						<col width="200px" />
					</colgroup>
					<thead>
						<tr>
							<th>성 명</th>
							<th>합계</th>
						</tr>
					</thead>
				</table>
			</div>
			
			<div class="Height_1" style="overflow: hidden;">
				<table>
					<colgroup>
						<col width="200px" />
						<col width="200px" />
					</colgroup>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr>
								<td class="center" title="${list.memberName }">${list.memberName }</td>
								<td class="right">
									<c:set var="colSum" value="0" />
									<c:forEach items="${headList}" var="headList" varStatus="status">
										<c:set var="colSum" value="${colSum + list[headList.plusItemCode] }" />	
									</c:forEach>
									<fmt:formatNumber value="${colSum }" pattern="#,###"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<div style="overflow: hidden;">
				<table>
					<colgroup>
						<col width="200px" />
						<col width="200px" />
					</colgroup>
					<tfoot>	
						<tr>
							<th>총계</th>
							<th class="right">
								<c:set var="colTotSum" value="0" />
								<c:forEach items="${headList}" var="list" varStatus="status">
									<c:set var="colTotSum" value="${colTotSum + paySum[list.plusItemCode] }" />
								</c:forEach>
								<fmt:formatNumber value="${colTotSum}" pattern="#,###"/>
							</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div id="content">
			<div class="Scroll_Title Height_0" style="overflow-x: hidden;">
				<table style="margin-top: 0">
					<colgroup>
						<c:forEach items="${headList}">
							<col width="300px" />
						</c:forEach>
					</colgroup>
					<thead>
						<tr>
							<c:forEach items="${headList}" var="list" varStatus="status">
								<th>${list.detailItemName}</th>
							</c:forEach>
						</tr>
					</thead>
				</table>
			</div><!-- tblTitle -->
			
			<div id="Scroll_Area" class="Height_1" style="overflow-x: hidden; overflow-y: auto;">
				<table class="Scroll_Table">
					<colgroup>
						<c:forEach items="${headList}">
							<col width="300px" />
						</c:forEach>
					</colgroup>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr>
								<c:forEach items="${headList}" var="headList" varStatus="status">
									<td class="right">
										&nbsp;<fmt:formatNumber value="${list[headList.plusItemCode] }" pattern="#,###"/>
									</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- tblTitle -->
		
			<div class="Scroll_Title Height_0" style="overflow-x: auto;">
				<table>
					<colgroup>
						<c:forEach items="${headList}">
							<col width="300px" />
						</c:forEach>
					</colgroup>
					<tfoot>	
						<tr>
							<c:forEach items="${headList}" var="list" varStatus="status">
								<th class="right">
									&nbsp;<fmt:formatNumber value="${paySum[list.plusItemCode] }" pattern="#,###"/>
								</th>
							</c:forEach>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</section>
	
	<section class="slide table" id="2">
		<h3 class="Height_0 center" style="margin-top: 20px;">
			■ 항목별 ${param.title } 합계 ■
			<a style="float: right" title="회원 항목별 금액" href="#1">← 회원 항목별 금액</a>
		</h3>
		<c:choose>
			<c:when test="${itemKind eq 'income' }">
				<div class="Scroll_Title Height_0">
					<table>
						<colgroup>
							<col width="160px" />
							<col width="120px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<thead>
							<tr>
								<th>부과일자</th>
								<th>이름</th>
								<th>수입분류항목</th>
								<th>수입세부항목</th>
								<th>금액</th>
								<th>수입내용(참고사항)</th>
							</tr>
						</thead>
					</table>
				</div><!-- tblTitle -->
				
				<div id="Scroll_Area" class="Height_1" style="overflow-x: hidden;">
					<table class="Scroll_Table">
						<colgroup>
							<col width="160px" />
							<col width="120px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<tbody>
							<c:forEach items="${incomeList}" var="list" varStatus="status">
								<tr>
									<td>
										<fmt:parseDate var="inexDate" value="${list.inexDate}" pattern="yyyyMMdd" />
										<fmt:formatDate value="${inexDate }" pattern="yyyy.MM.dd" />
									</td>
									<td class="left" title="${list.memberName}">${list.memberName}</td>
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
			
				<div class="Scroll_Title Height_0">
					<table>
						<colgroup>
							<col width="160px" />
							<col width="120px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<tfoot>
							<tr>
								<th colspan="4">합계</th>
								<th class="right" title="<fmt:formatNumber value="${incomeSum.incomeSum }" pattern="#,###"/>">
									<fmt:formatNumber value="${incomeSum.incomeSum }" pattern="#,###"/>
								</th>
								<th></th>
							</tr>
						</tfoot>
					</table>
				</div><!-- tblTitle -->					
			</c:when>
			<c:when test="${itemKind eq 'defect' }">
				<div class="Scroll_Title Height_0">
					<table>
						<colgroup>
							<col width="160px" />
							<col width="120px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<thead>
							<tr>
								<th>결손일자</th>
								<th>이름</th>
								<th>분류항목</th>
								<th>세부항목</th>
								<th>금액</th>
								<th>결손내용(참고사항)</th>
							</tr>
						</thead>
					</table>
				</div><!-- tblTitle -->
				
				<div id="Scroll_Area" class="Height_1" style="overflow-x: hidden;">
					<table class="Scroll_Table">
						<colgroup>
							<col width="160px" />
							<col width="120px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<tbody>
							<c:forEach items="${defectList}" var="list" varStatus="status">
								<tr>
									<td>
										<fmt:parseDate var="inexDate" value="${list.inexDate}" pattern="yyyyMMdd" />
										<fmt:formatDate value="${inexDate }" pattern="yyyy.MM.dd" />
									</td>
									<td class="center" title="${list.memberName}">${list.memberName}</td>
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
			
				<div class="Scroll_Title Height_0">
					<table>
						<colgroup>
							<col width="160px" />
							<col width="120px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<tfoot>
							<tr>
								<th colspan="4">합계</th>
								<th class="right">
									<fmt:formatNumber value="${defectSum.deficitSum }" pattern="#,###"/>
								</th>
								<th></th>
							</tr>
						</tfoot>
					</table>
				</div><!-- tblTitle -->
			</c:when>
			<c:when test="${itemKind eq 'debt' }">
				<div class="Scroll_Title Height_0">
					<table>
						<colgroup>
							<col width="120px" />
							<col width="160px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<thead>
							<tr>
								<th>성명</th>
								<th>발생일자</th>
								<th>수입분류항목</th>
								<th>수입세부항목</th>
								<th>금액</th>
								<th>참고사항</th>
							</tr>
						</thead>
					</table>
				</div><!-- tblTitle -->
				
				<div id="Scroll_Area" class="Height_1" style="overflow-x: hidden;">
					<table class="Scroll_Table">
						<colgroup>
							<col width="120px" />
							<col width="160px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<tbody>
							<c:forEach items="${debtList}" var="list" varStatus="status">
								<tr>
									<td title="${list.memberName}">${list.memberName}</td>
									<td>
										<fmt:parseDate var="genDate" value="${list.genDate}" pattern="yyyyMMdd" />
										<fmt:formatDate value="${genDate }" pattern="yyyy.MM.dd" />
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
			
				<div class="Scroll_Title Height_0">
					<table>
						<colgroup>
							<col width="120px" />
							<col width="160px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
							<col width="280px" />
						</colgroup>
						<tfoot>
							<tr>
								<th colspan="4">합계</th>
								<th class="right" colspan=""><fmt:formatNumber value="${debtSum.notGetSum}" /></th>
								<th></th>
							</tr>
						</tfoot>
					</table>
				</div><!-- tblTitle -->			
			</c:when>
		</c:choose>
	</section>
</div>
<!-- Initialize the deck -->
