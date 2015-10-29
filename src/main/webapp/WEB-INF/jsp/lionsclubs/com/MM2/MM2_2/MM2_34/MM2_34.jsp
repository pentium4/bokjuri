<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_34VO.sessionYear}"	// 고정값
			,top:false
		});
		
		$("#month").monthCombo({
			fixVal : "${MM2_34VO.month}"
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_34VO.organCode}"
		});
		
		//조회 버튼선택
		$("#search").on("click", function(){
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
		
		// 스크롤 이동 처리
		$('.Scroll_Title').on( 'scroll', function() {
			$('.Height_1').scrollLeft( $(this).scrollLeft() );
			$('.Scroll_Title').scrollLeft( $(this).scrollLeft() );
		});
	});
});

//링크페이지
function _search(){
	$("form").submit();
}
</script>

<form:form id="form_list" modelAttribute="MM2_34VO">
	<input type="hidden" id="memberNo" value="${result.memberNo }" />
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="개인별 미납금 조회표">
			<caption>개인별 미납금 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="20%" />
				<col width="100px" />
				<col width="21%" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td><form:select path="organCode" /></td>
					<th>회기선택</th>
					<td><form:select path="sessionYear" cssClass="select" /></td>
					<th>선택월</th>
					<td><form:select path="month" cssClass="select" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img alt="조회" id="search" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Height_0 Scroll_Title widthLong" style="overflow-x: hidden;">
			<table class="tblType2_1" summary="개인별 미납금 조회 안내표">
				<caption>개인별 미납금</caption>
				<colgroup>
					<col width="100px" />
					<c:forEach items="${headList}">
						<col width="180px" />
					</c:forEach>
					<col width="180px" />
				</colgroup>
				<thead>
					<tr>
						<th>성 명</th>
						<c:forEach items="${headList}" var="list" varStatus="status">
							<th>${list.detailItemName}</th>
						</c:forEach>
						<th>합계</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="listTable">
				<colgroup>
					<col width="100px" />
					<c:forEach items="${headList}">
						<col width="180px" />
					</c:forEach>
					<col width="180px" />
				</colgroup>
				<tbody>
					<c:forEach items="${resultList}" var="list" varStatus="status">
						<tr>
							<td class="center">${list.memberName }</td>
							<c:set var="colSum" value="0" />
							<c:forEach items="${headList}" var="headList" varStatus="status">
								<c:set var="colSum" value="${colSum + list[headList.plusItemCode] }" />	
								<td class="right">
									<fmt:formatNumber value="${list[headList.plusItemCode] }" pattern="#,###"/>
								</td>
							</c:forEach>
							<td class="right">
								<fmt:formatNumber value="${colSum }" pattern="#,###"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div id="ftScroll" class="Scroll_Title Height_0 widthLong" style="overflow-x: auto;">
			<table class="tblType2_1">
				<colgroup>
					<col width="100px" />
					<c:forEach items="${headList}">
						<col width="180px" />
					</c:forEach>
					<col width="180px" />
				</colgroup>
				<tfoot>	
					<tr>
						<th>총계</th>
						<c:set var="colTotSum" value="0" />
						<c:forEach items="${headList}" var="list" varStatus="status">
							<th class="right">
								<fmt:formatNumber value="${balanceSum[list.plusItemCode] }" pattern="#,###"/>
								<c:set var="colTotSum" value="${colTotSum + balanceSum[list.plusItemCode] }" />
							</th>
						</c:forEach>
						<th class="right">
							<fmt:formatNumber value="${colTotSum}" pattern="#,###"/>
						</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>