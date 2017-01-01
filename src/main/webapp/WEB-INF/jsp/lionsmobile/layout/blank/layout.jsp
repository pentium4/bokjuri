<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<meta name="author" content="복주리 봉사단"/>
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
<meta name="keyword" content="복주리 봉사단"/>
<title>복주리 봉사단</title>
<body>

<div data-role="page">
	<tiles:insertAttribute name="body" />
	
	<div data-role="footer" data-position="fixed">
		<div data-role="navbar">
			<ul>
				<li><a style="text-align: center;" href="/" rel="external" data-icon="home">홈</a></li>
				<li><a style="text-align: center;" target="_blank" href="/login/actionMain.do?site_preference=normal" rel="external" data-icon="monitor">PC버전</a></li>
				<li><a style="text-align: center;" href="/login/actionLogout.do" rel="external" data-icon="power">로그아웃</a></li>
			</ul>
		</div>
	</div>
</div><!-- /page -->

</body>
</html>