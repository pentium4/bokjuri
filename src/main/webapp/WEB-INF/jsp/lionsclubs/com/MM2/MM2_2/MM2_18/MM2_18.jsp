<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
	
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_18VO.sessionYear}"	// 고정값
			,top:false
		});
		
		$("#month").monthCombo({
			fixVal : "${MM2_18VO.month}"
		});
		
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_18VO.organCode}"
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
		
		$('.Height_1').on('scroll', function() {
			$('.Height_1').scrollTop( $(this).scrollTop());
		});		
	});
});

//링크페이지
function _search(){
	$("#form_list").submit();
}
</script>
<style>
#fix{
	float: left;
	width: 105px;
}

#content{
	margin-left: 105px;
}
</style>
<form:form id="form_list" modelAttribute="MM2_18VO">
	<input type="hidden" id="memberNo" value="${result.memberNo }" />
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="150px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td><form:select path="organCode"/></td>
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
			<img alt="조회"  id="search" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" onclick="return false;" class="pointer authorization read" />
		</div>
	
		<div id="fix">	
			<div class="tblTitle Scroll_Title">
				<table class="tblType2_1">
					<colgroup>
						<col width="100px" />
					</colgroup>
					<thead>
						<tr>
							<th>성 명</th>
						</tr>
					</thead>
				</table>
			</div>
			
			<div class="Height_1" style="overflow: hidden; border: 1px solid #aaa;">
				<table class="tblType2_1 Scroll_Table">
					<colgroup>
						<col width="100px" />
					</colgroup>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr>
								<td class="center">${list.memberName }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		
			<div class="Scroll_Title">
				<table class="tblType2_1">
					<colgroup>
						<col width="100px" />
					</colgroup>
					<tfoot>	
						<tr>
							<th>총계</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<div id="content">
			<div class="tblTitle Height_0 Scroll_Title widthLong" style="overflow-x: hidden;">
				<table class="tblType2_1">
					<colgroup>
						<c:forEach items="${headList}">
							<col width="130px" />
						</c:forEach>
						<col width="130px" />
					</colgroup>
					<thead>
						<tr>
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
						<c:forEach items="${headList}">
							<col width="130px" />
						</c:forEach>
						<col width="130px" />
					</colgroup>
					<tbody>
						<c:forEach items="${resultList}" var="list" varStatus="status">
							<tr>
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
						<c:forEach items="${headList}">
							<col width="130px" />
						</c:forEach>
						<col width="130px" />
					</colgroup>
					<tfoot>	
						<tr>
							<c:set var="colTotSum" value="0" />
							<c:forEach items="${headList}" var="list" varStatus="status">
								<th class="right">
									<fmt:formatNumber value="${paySum[list.plusItemCode] }" pattern="#,###"/>
									<c:set var="colTotSum" value="${colTotSum + paySum[list.plusItemCode] }" />
								</th>
							</c:forEach>
							<th class="right">
								<fmt:formatNumber value="${colTotSum}" pattern="#,###"/>
							</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div><!-- table -->
</form:form>