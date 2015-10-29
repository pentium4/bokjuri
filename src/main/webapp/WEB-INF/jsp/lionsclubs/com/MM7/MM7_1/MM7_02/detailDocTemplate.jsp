<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<link rel="stylesheet" href="/js/lionsclubs/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script type="text/javascript">
<!--
require(['init'], function () {
	$(document).ready(function () {
		$("#btnUpdate").on("click", function(){
			goUrl("/MM7/MM7_1/MM7_02/docTemplate.do?idnNo=${result.idnNo}");
		});
		
		$("#btnDel").on("click", function(){
			if(!confirm("삭제 하시겠습니까?")){
				return false;
			}
			
			var params =[];
			params.push({name: "idnNo", value: "${result.idnNo}"});
			
			$.ajax({
				type: "POST",
				async: false,
				url:  '<c:url value="/MM7/MM7_1/MM7_02/delDocTemplate.do" />',
				data: params,
				dataType: 'json',
				success: function(data) {
					if(data.result){
						goUrl("/MM7/MM7_1/MM7_02/MM7_02.do?organCode=${result.organCode}&sessionYear=${result.sessionYear}");
					}
				},
				error:function(request,status,error){
					alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}		
			});	
		});	
		
		var iBody = $("#iContent").contents().find("body");
		iBody.html($("#content").val());
	});
});

function _search(){
	$("form").submit();
}
//-->
</script>
<style>
<!--
.article_subject {
    padding: 8px 8px 9px 17px;
    word-wrap: break-word;
    clear: both;
    position: relative;
    border-width: 1px;
    border-top-style: solid;
    border-bottom-style: dashed;
}

.article_writer {
    position: relative;
    clear: both;
    padding: 8px 8px 9px 17px;
    margin-bottom: 20px;
    z-index: 11;
}
-->
</style>
<form:form id="form" modelAttribute="MM7_02VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
		<div class="btnBox">
			<input id="btnUpdate" type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" onclick="return false;" />
			<input id="btnDel" type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" onclick="return false;" />
		</div>
		
		<div class="tblTitle Height_0" style="height: 65px;">
			<div class="article_subject">
				${result.title }
			</div>
			<div class="article_writer">
				${result.name }(${result.insertName }) | <fmt:formatDate value="${result.insertDate }" pattern="yyyy.MM.dd hh:mm" />
			</div>
		</div>
		
		<div class="Scroll_Title Height_1" style="overflow: hidden; padding-left: 8px;">
			<iframe id="iContent" width="100%" height="100%"></iframe>
		</div><!-- tblTitle -->
		
		<div class="tblTitle Height_0" style="height: 130px;">
			<jwork:filedownloader objectId="fileId" fileId="${result.fileId }" />
		</div>
	</div><!-- table -->
	<textarea id="content" style="display: none;"><c:out value="${result.content }" /></textarea>
</form:form>