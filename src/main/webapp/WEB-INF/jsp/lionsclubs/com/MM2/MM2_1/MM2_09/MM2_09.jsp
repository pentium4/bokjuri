<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		
		$("#sessionYear").sessionYearCombo({
			fixVal: "${MM2_09VO.sessionYear}"	// 고정값
		});
		
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
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
			
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl:4
			,searchable: true
			,fixVal: "${MM2_09VO.organCode}"
		});
		
	    $("img").lazyload({
	    	container: $("#Scroll_Area")
	    });
	});
});

// 조회
function _search(){
	$("#form_list").submit();
}
</script>
<style>
<!--
#Scroll_Area{
	height: 400px;
}

.tblPhoto div{
	width: 130px;
	float: left;
	margin-left: 12px;
}
-->
</style>
<form:form id="form_list" modelAttribute="MM2_09VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="클럽 인원 조회표">
			<caption>클럽 인원 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="380px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td >
					<div><form:select path="organCode" cssClass="select" /></div>
					</td>
					<th>조회순서</th>
					<td>
						<form:checkbox path="s1" value="1" onclick="javascript:fn_checkOrder('s1')" label="성명순" cssStyle="margin-left: 10px;" />
						<form:checkbox path="s2" value="1" onclick="javascript:fn_checkOrder('s2')" label="입회일자순" cssStyle="margin-left: 38px;" />
						<form:checkbox path="s4" value="1" onclick="javascript:fn_checkOrder('s4')" label="직책순" cssStyle="margin-left: 10px;" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td ><form:select path="sessionYear" cssClass="select" /></td>
					<th>조회구분</th>
					<td>
						<form:checkbox path="s3" value="1" onclick="javascript:fn_checkOrder('s3')" label="퇴회자제외" cssStyle="margin-left: 10px;" />
						<form:checkbox path="s5" value="1" onclick="javascript:fn_checkOrder('s5')" label="담당분과" cssStyle="margin-left: 10px;" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		
		<div class="btnBox">
			<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" alt="조회" class="pointer authorization read" />
		</div>
		
		<div id="Scroll_Area" class="Height_1 mT0">
			<div class="tblPhoto">
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<div>
						<p class="photo" style="width: 100px; height: 120px;">
							<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.memberPictureFile}" />
						</p>
						<p class="txt ellipsis">
							${list.sectorTitle }
						</p>
						<p class="txt ellipsis">
							<c:choose>
								<c:when test="${not empty list.titleStartDate }">
									<fmt:parseDate var="titleStartDate" value="${list.titleStartDate }" pattern="yyyyMMdd" />
									<fmt:formatDate value="${titleStartDate }" pattern="yyyy.MM.dd" />						
								</c:when>
								<c:otherwise>
									<fmt:parseDate var="startDate" value="${list.startDate }" pattern="yyyyMMdd" />
									<fmt:formatDate value="${startDate }" pattern="yyyy.MM.dd" />						
								</c:otherwise>
							</c:choose>
						</p>
						<p class="txt ellipsis">
							<fmt:parseDate var="startDate" value="${list.startDate }" pattern="yyyyMMdd" />
							<c:choose>
								<c:when test="${not empty list.retireDate }">
									<fmt:parseDate var="retireDate" value="${list.retireDate }" pattern="yyyyMMdd" />
									<strong class="Blue">${list.memberName }(<fmt:formatDate value="${retireDate }" pattern="yyyy.MM.dd" />)</strong>
								</c:when>
								<c:otherwise>${list.memberName }(<fmt:formatDate value="${startDate }" pattern="yyyy.MM.dd" />)</c:otherwise>
							</c:choose>
						</p>
					</div>
				</c:forEach>	
			</div>
		</div>
		<!-- //Contents_Table_area -->
	</div>
</form:form>