<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		// 조직코드 세팅
		$("#organCode").organCode({
			 lvl: 3
			,fixVal: "${MM7_02VO.organCode}"
			,searchable: true
		});
		
		$("#sessionYear").sessionYearCombo({
			 fixVal: "${MM7_02VO.sessionYear}"	// 고정값
			,top: false
		});
		
		/* 
		테이블 클릭시 업데이트 및 삭제 정보를 저장한다. 
		*/	
		var tbl = $(".tblType2_1 tbody tr");
		tbl.on("click", function(){
			tbl.css("background-color","#ffffff");
		
			$(this).css("background-color","#E0FFE0");
			
			var data = $(this).data();
			goUrl("/MM7/MM7_1/MM7_02/detailDocTemplate.do?idnNo=" + data.idnno);
		});
		
		$("#btnAdd").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			var organCode = $("#organCode").val();
			var sessionYear = $("#sessionYear").val();
			goUrl("/MM7/MM7_1/MM7_02/docTemplate.do?organCode=" + organCode + "&sessionYear=" + sessionYear);
		});
		
		$("#btnSearch").on("click", function(){
			_search();
		});
	});
});

function _search(){
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
<form:form id="form" modelAttribute="MM7_02VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="100px" />
				<col width="400px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td>
						<div class="fL"><form:select path="organCode" cssClass="required" caption="지구코드" /></div>
					</td>
					<th>회기선택</th>
					<td>
						<form:select path="sessionYear" cssClass="select required" caption="회기선택" />
					</td>
				</tr>
			</tbody>
		</table>		
	</div>
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" alt="검색" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
			<img id="btnAdd" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" class="pointer authorization write"/>
		</div>
				
		<div class="tblTitle Scroll_Title Height_0">
			<table class="tblType2">
				<colgroup>
					<col width="80px" />
					<col width="*" />
					<col width="130px" />
					<col width="100px" />
				</colgroup>
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
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
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList }">
						<tr data-idnno="${list.idnNo }">
							<td class="center">${list.idnNo }</td>
							<td class="left">${list.title }</td>
							<td class="center">${list.name }(${list.insertName })</td>
							<td class="center"><fmt:formatDate value="${list.insertDate }" pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->
</form:form>