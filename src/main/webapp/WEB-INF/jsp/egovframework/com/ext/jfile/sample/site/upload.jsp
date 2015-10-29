<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page session="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp" prefix="jwork"%>

<html>
<head>
	<title>JFile</title>
	<style>
		body {margin: 0;padding: 0;width: 100%;	font: 14px/1.4em Verdana, Arial, sans-serif;}
		fieldset {margin: 20px 10px;padding: 10px 10px 10px 10px; }
	</style>
	
	<script type="text/javascript" src="<c:url value="/resource/jfile/sample/site/site.js" />"></script>
	
	<script type="text/javascript">
	var maxTime = 0;
	window.onload=function() {
		maxTime = <%=request.getSession().getMaxInactiveInterval()%>
		updateTime();
	};
	</script>
</head>
<body>
<br/>
<h1>&nbsp;<span style="width:400px;">&nbsp;</span> 세션 만료 시간 : <span id="time"></span> 초 &nbsp;&nbsp; <input type="button" value="세션타임아웃시간 10초로 줄이기" onclick="cutdownSessionLimitTime('<%=request.getContextPath()%>');"></h1>
<div id="simple">
	<fieldset>
		<legend><b>파일 업로드1</b></legend>
		<jwork:fileuploader 
		       objectId="fileUploadObj1"  
		       uploadCompletedEvent="uploadCompleted1"
		       fileType="image" 
		       maxFileSize="100" 
		       maxFileCount="1" 
		       usePreview="true"
		       useSecurity="false"
		       uploadMode="db"
		       fileId="144d46a051113"
		       />
		<input type="button" onclick="send1()" value="전송" style="width: 110px; height: 24px; font-size: 11px"/>       
	</fieldset>
	
	<script type="text/javascript">	
		function send1(){		
			fileUploadObj1.startUpload();
		}
	
		function uploadCompleted1(){
			fileUploadObj1.refresh();
		}
	</script>	
	<fieldset>
</div>
</body>
</html>