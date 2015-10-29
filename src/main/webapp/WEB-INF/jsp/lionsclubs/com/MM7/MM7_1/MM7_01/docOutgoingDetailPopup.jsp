<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<link href="<c:url value="/css/lionsclubs/html5/html5reset-1.6.1.css" />" rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
<!--
var isSave = "N";

require(['init'], function () {
	$(document).ready(function () {
		var iBody = $("#docContent").contents().find("body");
		iBody.html($("#content").val());
		
		$("#receptionConfirm").on("click", function(){
			openPopup('<c:url value="/MM7/MM7_1/MM7_01/receivePopup.do?idnNo=${MM7_01VO.idnNo}" />', 800, 500, 'receivePopup');
		});
		
		$("#outgoingCancel").on("click", function(){
			if(!confirm("발신취소하면 작성중문서함으로 이동합니다.\n발신취소 하시겠습니까?")){
				return false;
			}
			
			var params = [];
			params.push({name: "idnNo", value: "${MM7_01VO.idnNo}"});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  "/MM7/MM7_1/MM7_01/outgoingCancel.do",
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result == "1"){
						opener._search();
						closeWin();
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.");
				}
			});				
		});
		
        $('#printPreview').on("click", function(){
    		openPopup('<c:url value="/MM7/MM7_1/MM7_01/previewPrintPopup.do?idnNo=${MM7_01VO.idnNo}" />', 1000, 800, 'printPreviewPopup');
        });
	});
});

function _search(){
	$("form").submit();
}
//-->
</script>
<form:form id="form" modelAttribute="MM7_01VO">
	<h3><div>문서 만들기</div></h3>
	
	<div class="popup_bg" style="padding-top: 0;">
		<div class="btnBox2">
			<img id="printPreview" src="/images/lionsclubs/btn/btn_print_preview.png" class="pointer" alt="프린트미리보기" />
			<img id="receptionConfirm" src="/images/lionsclubs/btn/btn_reception_confirm.png" class="pointer" alt="수신확인" />		
			<c:if test="${id eq MM7_01VO.insertName and MM7_01VO.docCreateDay < outgoingDay }">
				<img id="outgoingCancel" src="/images/lionsclubs/btn/btn_outgoing_cancel.png" class="pointer" alt="발신취소" />
			</c:if>
		</div>
		<table class="tblType2">
			<colgroup>
				<col width="100px" />
				<col width="300px" />
				<col width="100px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>보존년한</th>
					<td>
						<c:choose>
							<c:when test="${not empty MM7_01VO.storageDate }">
								<lions:codetolabel groupCode="9500" code="${MM7_01VO.storageDate }" />
							</c:when>
							<c:otherwise>무제한</c:otherwise>
						</c:choose>
					</td>
					<th>문서번호</th>
					<td>${MM7_01VO.docNo }</td>
				</tr>
				<tr>
					<th>발신일</th>
					<td><fmt:formatDate value="${MM7_01VO.outgoingDate }" pattern="yyyy.MM.dd" /></td>
					<th>수신일</th>
					<td><fmt:formatDate value="${MM7_01VO.receiveDate }" pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr>
					<th>받는조직</th>
					<td colspan="3">
						<c:set var="rIndex" value="1" />
						<c:forEach items="${listReceiveOrganCode }" var="list">
							<c:if test="${rIndex ne '1' }">|</c:if>
							${list.receiveOrganName }
							<c:set var="rIndex" value="${rIndex + 1 }" /> 
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>보낸사람</th>
					<td>${MM7_01VO.name }</td>
					<th>전화번호</th>
					<td>${MM7_01VO.mobile }</td>
				</tr>
				<tr>
					<th>보낸조직</th>
					<td colspan="3">
						${lions:formatOrganCode(MM7_01VO.outgoingOrganCode) } ${MM7_01VO.outgoingOrganName }
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${MM7_01VO.docTitle }</td>
				</tr>
			</tbody>
		</table>
		<div class="tblPopupH2 mT10" style="height: 350px;">
			<iframe id="docContent" width="100%" height="90%"></iframe>
		</div>
		
		<jwork:filedownloader objectId="fileId" fileId="${MM7_01VO.fileId }" />
	</div><!-- popup_bg -->
	
	<div class="popupBtn" style="padding: 0;">
		<a href="javascript:closeWin();"><img src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" style="width:57px" /></a>
	</div>
	
	<textarea id="content" style="display: none;"><c:out value="${MM7_01VO.docContent }" /></textarea>	
</form:form>
