<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#orgCode").organCode({
			  lvl:3
			, searchable: true     // 검색콤보박스 true/false
			, fixVal:"${LIST_VO.orgCode}"
		});
		
		$("#retrieveBtn").click(function(){
			if($("#orgCode").val().isEmpty()){
				return false;
			}
			
			$.saveOrganCode({
				 lvl:3
				,organCode: $("#orgCode").val()
			});		
			
			$("#form_list").submit();
		});
	});
});

</script>
<form:form id="form_list" modelAttribute="LIST_VO">

<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="총장 역임자 조회표">
	<caption>총장 역임자 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구</th>
		<td><form:select path="orgCode" /></td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
		<h4>
			<lions:menutitle menuId="${param.menuId }" kind="subtitle" />
		</h4>
		<div class="btnBox">
			<img id="retrieveBtn" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read" /> 
		</div>
<div id="Scroll_Area" class="Height_1 mT0">
	<table class="tblPhoto">
	<tbody>
<c:forEach items="${LIST_VO.list}" var="list" varStatus="status">
	<c:if test="${status.count % 6 == 1 }"><tr></c:if>
		<td>
			<c:if test="${list.idnNo > 0 }">
				<p class="photo">
					<c:choose>
						<c:when test="${list.fileId > ''}">
							<img width="100" height="120" src="<c:out value="${list.memPicFile}"/>" onerror="this.src='/images/lionsclubs/noimg.gif'" alt="<c:out value="${list.memberName}"/>" />
						</c:when>
						<c:otherwise>
							<img width="100" height="120" src="/images/lionsclubs/noimg.gif" onerror="this.src='/images/lionsclubs/noimg.gif'" alt="<c:out value="${list.memberName}"/>" />
						</c:otherwise>
					</c:choose>
				</p>
			</c:if>
			<p class="txt"><c:out value="${list.fAgeCode }" /><br /><c:out value="${list.fPos }" /><br /><c:out value="${list.memberName }" /><br /><c:out value="${list.fClubName }" /></p>
		</td>
	<c:if test="${status.count % 6 == 0 }"></tr></c:if>
</c:forEach>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>