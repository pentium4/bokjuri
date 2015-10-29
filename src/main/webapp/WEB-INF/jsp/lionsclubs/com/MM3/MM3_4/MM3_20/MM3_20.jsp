<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${fn:length(resultList)}</span>건의 데이터를 조회하였습니다.");
	
		//기관 클럽코드 세팅
		$("#districtCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_20VO.districtCode}"
		});
	
		$("#thisYear").sessionYearCombo({
			 fixVal: "${MM3_20VO.thisYear}"  
			,top:false
		});
	
		$("#thisMonth").monthCombo({
			 fixVal: "${MM3_20VO.thisMonth}"	// 고정값
			,top:false
		});
	
		$("#excelTemplateDownload").on("click", function(){
			if($("#districtCode").val()=="" || $("#districtCode").val()==null){
				alert("조직을 선택하세요");
				return false;
			}		
			
			if($("#thisMonth").val()=="" || $("#thisMonth").val()==null){
				alert("월을 선택하세요");
				return false;
			}
			$(window).unbind();
			$.download("/MM3/MM3_4/MM3_20/excelTemplateDownload.do", $("form").serialize());
		});
		
		$("#excelUpload").on("click", function(){
			if($("#districtCode").val().isEmpty()){
				alert("조직을 선택하세요");
				return;
			}
			if($("#thisMonth").val().isEmpty()){
				alert("월을 선택하세요");
				return false;
			}
			openPopup("/MM3/MM3_4/MM3_20/excelUploadPopup.do?districtCode=${MM3_20VO.districtCode}&thisYear=${MM3_20VO.thisYear}&thisMonth=${MM3_20VO.thisMonth}", '600', '185', "excelUpload");
		});
		
		
		$("#btnSearch").bind("click", function(){
			$.saveOrganCode({
				 lvl:3
				,organCode: $("#orgCode").val()
			});
			
			checkFormSubmit();
		});
		
		var checkFormSubmit =  function(){
			if($("#districtCode").val().isEmpty()){
				alert("조직을 선택하세요");
				return false;
			}
			if($("#thisMonth").val().isEmpty()){
				alert("월을 선택하세요");
				return false;
			}
			
			$("#form_list").submit();
		};

		// 스크롤 이동 처리
		$('.Scroll_Title').on( 'scroll', function() {
			$('.Height_1').scrollLeft( $(this).scrollLeft() );
			$('.Scroll_Title').scrollLeft( $(this).scrollLeft() );
		});		
	});
});

function _search(){
	$("form").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM3_20VO">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="제의무금월추가부과표">
	<caption>제의무금월추가부과</caption>
	<colgroup>
		<col width="75px" />
		<col width="*" />
		<col width="75px" />
		<col width="20%" />
		<col width="75px" />
		<col width="20%" />
	</colgroup>
	<tbody>
	<tr>
		<th>선택조직</th>
		<td>
			<div class="fL">
				<form:select path="districtCode" cssClass="select" />
			</div>
		</td>
		<th>회기선택</th>
		<td>
				<form:select path="thisYear" cssClass="select" />
		
		</td>
		<th>선택월</th>
		<td>
			<strong class="month">
				<form:select path="thisMonth" cssClass="select" style="width:70px;"/>
			</strong> 
		</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->
<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox">
		<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read" />
		<img id="excelTemplateDownload" src="/images/lionsclubs/btn/btn_excel3.gif" alt="엑셀폼받기" class="pointer authorization write" />
		<img id="excelUpload" src="/images/lionsclubs/btn/btn_excel.gif" alt="엑셀올리기" class="pointer authorization write"/>
	</div>	
	
	<div class="tblTitle Height_0 Scroll_Title widthLong" style="overflow-x: hidden;">
		<table class="tblType2" summary="제의무금 월추가조회표">
		<caption>제의무금 월추가 조회</caption>
			<colgroup>
				<col width="50" />
				<col width="150" />
				<col width="70" />
				<col width="160" />
				<c:forEach items="${codeList}" var="list" varStatus="status">
					<col width="160" />
				</c:forEach>
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>클럽명</th>
					<th>신입회원</th>
					<th>합계</th>
					<c:forEach items="${codeList}" var="list" varStatus="status">
						<th title="${list.codeName}" style="letter-spacing:-1px; line-height:110%">${list.codeName}</th>
					</c:forEach>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table" id="listTable">
			<colgroup>
				<col width="50" />
				<col width="150" />
				<col width="70" />
				<col width="160" />
				<c:forEach items="${codeList}" var="list" varStatus="status">
					<col width="160" />
				</c:forEach>
			</colgroup>
			<tbody>
				<c:forEach var="list" items="${resultList}" varStatus="listStatus">
					<tr>
						<td class="center">${listStatus.count}</td>
						<td class="left">${list.clubName}&nbsp;(${fn:substring(list.clubCode, 0, 3)}-${fn:substring(list.clubCode, 3, 8)})</td>
						<td class="right">${list.newComer}</td>
						<td class="right f11"><fmt:formatNumber value="${list.totSum}" /></td> 
						<c:forEach items="${codeList }" var="codeList">
							<td class="right f11">
								<c:set var="tmpCode" value="${codeList.code}" />
								<c:choose>
									<c:when test="${!empty list[tmpCode]}">
										<fmt:formatNumber value="${list[tmpCode]}" />
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>
							</td>
						</c:forEach>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div id="ftScroll" class="Scroll_Title Height_0 widthLong" style="overflow-x: auto;">
		<table class="tblType2_1">
			<colgroup>
				<col width="200" />
				<col width="70" />
				<col width="160" />
				<c:forEach items="${codeList}" var="list" varStatus="status">
					<col width="160" />
				</c:forEach>
			</colgroup>
			<tfoot>	
				<tr>
					<th>합계</th>
					<th class="right f11"><fmt:formatNumber value="${resultSum['newComer'] }" /></th>
					<th class="right f11"><fmt:formatNumber value="${resultSum['totSum'] }" /></th>
					<c:forEach items="${codeList }" var="codeList">
					<th class="right f11">
						<c:set var="tmpCode" value="${codeList.code}" />
						<c:choose>
							<c:when test="${!empty resultSum[tmpCode]}">
								<fmt:formatNumber value="${resultSum[tmpCode]}" />
							</c:when>
							<c:otherwise>
								0
							</c:otherwise>
						</c:choose>
					</th>
					</c:forEach>
				</tr>
			</tfoot>
		</table>
	</div>
</div><!-- table -->
</form:form>