<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="복주리 봉사단" />
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW" />
<meta name="keyword" content="복주리 봉사단" />
<title>복주리 봉사단</title>
<link rel="stylesheet" href="/portal/include/css/style.css" type="text/css" />
<link rel="stylesheet" href="/portal/include/css/content_sub.css" type="text/css" />
<script type="text/javascript" src="/portal/include/js/javascript.js"></script>
<script type="text/javascript" src="/portal/include/js/script.js"></script>
</head>

<body>


<h2>스킵네비게이션</h2>
<jsp:include page="../include/top_skipnavi.jsp" />

<h2>탑메뉴</h2>
<jsp:include page="../include/top_menu.jsp" />

<div id="wrap">

	<div id="content_left">
	    <h2>서브메뉴</h2>
	    <jsp:include page="../include/submenu01.jsp" />
	</div><!-- content_left -->

    <div id="content">
	    <div id="position">
	        <h2>메뉴 경로</h2>
	       <p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>개인기본사항</span></p> 
	    </div>
	    
	    <div id="content_body">
            <h2>본문</h2>
            <jsp:include page="../sub/sub_content.jsp" />          
        </div><!-- content_body -->
              
        <h2>메세지</h2>
        <jsp:include page="../include/message.jsp" />
    </div><!-- content -->
        
<div class="clear"></div>
   </div><!-- wrap -->


</body>
</html>






