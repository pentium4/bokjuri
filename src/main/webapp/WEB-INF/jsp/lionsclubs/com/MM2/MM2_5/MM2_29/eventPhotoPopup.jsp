<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<style>
<!--
.popupPhoto div{
	float: left;
 	margin: 10px 0 0 0;
}
-->
</style>

<form:form id="MM1_01VO" modelAttribute="MM1_01VO">
	<h3 style="width:99%;"><div>행사사진 조회</div></h3>
	<div id="Scroll_Area" class="popupPhoto Height_1" style="width:97%; height: 200px;">
		<c:forEach var="list" items="${resultList }" varStatus="status">
			<div>
				<p class="photo">
					<img alt="행사 사진" src="${ctx}/jfile/thumbPreview.do?fileId=${list.fileId}&fileSeq=${list.fileSeq}" height="120px" width="100px" />
				</p>
			</div>
		</c:forEach>
	</div><!-- popupPhoto -->
	
	<div class="popupBtn">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
