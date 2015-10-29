<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
</script>

<h3 style="width:99%;"><div>파일다운로드</div></h3>
<div class="popup_bg" style="height: 200px;">
	<jwork:filedownloader objectId="fileId" fileId="${param.fileId }" />
</div><!-- popup_bg -->
<div class="popupBtn">
	<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
</div>