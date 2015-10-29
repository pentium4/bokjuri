<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");

		var noticeKindCode = "${noticeKindCode}";
		var lvl = 0;
		switch(noticeKindCode){
			case '1020' : lvl = 4; break;
			case '1030' : lvl = 3; break;
			case '1040' : lvl = 3; break;
		}
	
		// 조직코드 세팅
		if(lvl > 0){
			$("#organCode").organCode({
				 lvl: lvl
				,fixVal: "${noticeVO.organCode}"
				,searchable: true
			});
		}
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
			$(this).css("background-color","#E0FFE0");
		});
		
		$("#organCode").on("change", function(){
			if(lvl > 0){
				/**
				 * 검색유지 조직코드를 저장한다.
				 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
				 * organCode: 조직코드
				 */
				$.saveOrganCode({
					 lvl: lvl
					,organCode: $("#organCode").val()
				});	
			}
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
		
		$("#searchContent").on("keypress", function(event){
			if (event.which == 13) {
				_search();
			}
		});		
	});
});
function _search(){
	$("#pageIndex").val(1);
	$("form").submit();
}
</script>

<style>
<!--
.tblType2_1 tbody tr{
	cursor: pointer;
}
-->
</style>
<form:form id="form" modelAttribute="noticeVO" action="/notice/notice.do">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>		
			<tbody>
				<c:if test="${noticeKindCode eq '1020' or noticeKindCode eq '1030' or noticeKindCode eq '1040' }">
					<tr>
						<th>
							<c:choose>
								<c:when test="${noticeKindCode eq '1020' }">클럽코드</c:when>
								<c:when test="${noticeKindCode eq '1030' or noticeKindCode eq '1040' }">지구코드</c:when>
							</c:choose>
						</th>
						<td><form:select path="organCode" /></td>
					</tr>			
				</c:if>
				<tr>
					<th>검색</th>
					<td>
						<form:select path="searchType">
							<form:option value="1" label="제목+내용" />
							<form:option value="2" label="제목" />
							<form:option value="3" label="글쓴이" />
						</form:select>
						<form:input path="searchContent" cssClass="input" size="120" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="table">
		<h4>
			<lions:menutitle menuId="${param.menuId }" kind="subtitle" />
			<c:if test="${noticeKindCode eq '1040' }">
				<span class="Red ml25">※ 게시물은 마지막 업데이트된 날짜로부터 6개월만 보관됩니다.</span>
			</c:if>
		</h4>
		<div class="btnBox">
			<img id="btnSearch" alt="검색" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
			<a href="/notice/noticeWrite.do?noticeCode=${empty param.noticeCode ? param.menuId : param.noticeCode }" onclick="goUrl(this.href); return false;" >
				<img src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px"  class="pointer authorization write"/>
			</a>
		</div>
		
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2" summary="메뉴출력정의 표">
				<caption>메뉴출력정의</caption>
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="130px" />
					<col width="100px" />
					<col width="80px" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table">
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="130px" />
					<col width="100px" />
					<col width="80px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }">
						<tr onclick="goUrl('/notice/noticeDetail.do?noticeCode=${list.noticeCode }&idnNo=${list.idnNo}')">
							<td class="center">${list.rnum }</td>
							<td class="left">
								${list.title }
								<c:if test="${list.replyCnt ne 0 }">
									<span style="color: #ff6c00;">[${list.replyCnt }]</span>
								</c:if>
							</td>
							<td class="center">${list.name }(${list.insertName })</td>
							<td class="center"><fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" /></td>
							<td class="center">${list.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
		
		<div class="pagination">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
		</div>
	</div><!-- table -->
	
	<c:if test="${empty param.noticeCode }">
		<input type="hidden" name="noticeCode" value="${param.menuId }" />
	</c:if>
</form:form>