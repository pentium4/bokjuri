<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
var contentBody  = "";
function noPrint(){ 
    contentBody = document.body.innerHTML; 
    document.body.innerHTML = printArea.innerHTML; 
}

function viewPrint(){ 
    document.body.innerHTML = contentBody; 
}

function lionsPrint() { 
    window.print(); 
}

window.onbeforeprint = noPrint; 
window.onafterprint = viewPrint; 	
</script>
<form:form id="form" modelAttribute="MM3_46VO">
	<h3 class="h3"><div>영수증</div></h3>
	<div class="printBtnBox">
		<img id="btnPrint" src="/images/lionsclubs/btn/btn_print.gif" alt="인쇄" style="cursor: pointer;" onclick="lionsPrint();" />
	</div>
			
	<div id="printArea" style="height: 680px; overflow: auto; border: 1px #aaa solid;">
		${result.docContent }
	</div><!-- popup_bg -->
	
	<!-- Modal Popup -->  
	<div class="printPopupBtn">
		<a href="#" onclick="window.close()"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
</form:form>
