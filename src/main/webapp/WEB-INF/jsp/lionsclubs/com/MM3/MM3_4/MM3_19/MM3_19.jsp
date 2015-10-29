<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#thisOrganCode").organCode({
			 lvl:3
			,searchable: true
			,fixVal: "${MM3_19VO.thisOrganCode}"
		});
		
		$("#thisYear").sessionYearCombo({
			 fixVal: "${MM3_19VO.thisYear}"  
			,top:true
			,topLabel:"전체"
		});
		
		$("#excelTemplateDownload").on("click", function(){
			if($("#thisOrganCode").val()=="" || $("#thisOrganCode").val()==null){
				alert("조직을 선택하세요");
				return false;
			}else{
				$(window).unbind();
				$.download("/MM3/MM3_4/MM3_19/excelTemplateDownload.do", $("form").serialize());
			}		
		});
		
		$("#excelUpload").on("click", function(){
			openPopup("/MM3/MM3_4/MM3_19/excelUploadPopup.do?thisOrganCode=${MM3_19VO.thisOrganCode}&thisYear=${MM3_19VO.thisYear}&firstOrSecond=${MM3_19VO.firstOrSecond}", '600', '185', "excelUpload");
		});
		
		$("#btnSearch").on("click", function(){
			$.saveOrganCode({
				 lvl: 3
				,organCode: $("#thisOrganCode").val()
			});
			
			checkFormSubmit();
		});
		
		var checkFormSubmit =  function(){
			if($("#thisOrganCode").val()=="" || $("#thisOrganCode").val()==null){
				alert("조직을 선택하세요");
				return false;
			}else{
				$("#form_list").submit();
			}		
		};
		
		// 스크롤 이동 처리
		$('.Scroll_Title').on( 'scroll', function() {
			$('.Height_1').scrollLeft( $(this).scrollLeft() );
			$('.Scroll_Title').scrollLeft( $(this).scrollLeft() );
		});
	});
});

function _search(){
	$("#form_list").attr("action","/MM3/MM3_4/MM3_19/MM3_19.do");
	$("#form_list").submit();
}
</script>
<form:form id="form_list" modelAttribute="MM3_19VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽제의무금부과표">
			<caption>클럽제의무금부과</caption>
			<colgroup>
				<col width="75px" />
				<col width="*" />
				<col width="75px" />
				<col width="45%" />
			</colgroup>
			<tbody>
				<tr>
					<th>선택조직</th>
					<td><form:select path="thisOrganCode" cssClass="select" /></td>
					<th>조회구분</th>
					<td class="LH">
						<form:radiobutton path="firstOrSecond" value="2000" label="상반기" cssClass="ml10" />
						<form:radiobutton path="firstOrSecond" value="3000" label="하반기" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td colspan="3"><form:select path="thisYear" /></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" class="pointer authorization read"/>
			<img id="excelTemplateDownload" src="/images/lionsclubs/btn/btn_excel3.gif" alt="엑셀폼받기" class="pointer authorization write"/>
			<img id="excelUpload" src="/images/lionsclubs/btn/btn_excel.gif" alt="엑셀올리기" class="pointer authorization write"/>
		</div>	
	
		<div class="tblTitle Height_0 Scroll_Title widthLong" style="overflow-x: hidden;">
			<table class="tblType2" summary="클럽제의무금부과 조회표">
				<caption>클럽 제의무금부과 조회</caption>
				<colgroup>
					<col width="50px" />
					<col width="200px" />
					<col width="100px" />
					<col width="100px" />
					<col width="135px" />
					<c:forEach items="${codeList}" var="list" varStatus="status">
						<col width="130px" />
					</c:forEach>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>클럽명</th>
						<th>6월말</th>
						<th>평생</th>
						<th>합계</th>
						<c:forEach items="${codeList}" var="list" varStatus="status">
							<th title="${list.code}" style="letter-spacing:-1px; line-height:110%">${list.codeName}</th>
						</c:forEach>
					</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="listTable">
				<colgroup>
					<col width="50px" />
					<col width="200px" />
					<col width="100px" />
					<col width="100px" />
					<col width="135px" />
					<c:forEach items="${codeList}" var="list" varStatus="status">
						<col width="130px" />
					</c:forEach>
				</colgroup>
				<tbody>
					<c:set value="0" var="tot1"/> <!-- 6월말합계  -->
					<c:set value="0" var="tot2"/> <!-- 평생합계  -->
					<c:forEach var="list" items="${resultList}" varStatus="listStatus">
						<tr>
							<td class="center">${listStatus.count}</td>
							<td class="left" title="${fn:substring(list.clubCode, 0, 3)}-${fn:substring(list.clubCode, 3, 8)}">${list.clubName}</td>
							<td class="right f11"><fmt:formatNumber value="${list.sixMonth}" /></td>
							<td class="right f11"><fmt:formatNumber value="${list.lifeTime}" /></td>
							<td class="right f11"><fmt:formatNumber value="${rightSumArray[listStatus.count-1]}" /></td> 
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
						
						<c:set value="${tot1 + (empty list.sixMonth ? 0 : list.sixMonth)}" var="tot1"/>
						<c:set value="${tot2 + (empty list.lifeTime ? 0 : list.lifeTime)}" var="tot2"/>
					</c:forEach>	
				</tbody>
			</table>
		</div><!-- Height_1 -->
		<div id="ftScroll" class="Scroll_Title Height_0 widthLong" style="overflow-x: auto;">
			<table class="tblType2_1"> 
				<colgroup>
					<col width="50px" />
					<col width="200px" />
					<col width="100px" />
					<col width="100px" />
					<col width="135px" />
					<c:forEach items="${codeList}" var="list" varStatus="status">
						<col width="130px" />
					</c:forEach>
				</colgroup>
				<tfoot>	
					<tr>
						<th colspan="2">합계</th>
						<th class="right f11"><fmt:formatNumber value="${tot1}" /></th>
						<th class="right f11"><fmt:formatNumber value="${tot2}" /></th>
						<th class="right f11"><fmt:formatNumber value="${rightTotSum}" /></th>
						<c:forEach items="${codeList}" var="list" varStatus="status">
							<th class="right f11"><fmt:formatNumber value="${totSumArray[status.count-1]}" /></th>
						</c:forEach>
					</tr>
				</tfoot>
			</table>
		</div>
	</div><!-- table -->
</form:form>