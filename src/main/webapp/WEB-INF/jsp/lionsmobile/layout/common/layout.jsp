<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta content="width=device-width, initial-sscale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><lions:menutitle menuId="${param.menuId }" kind="title" /></title>
<%@ include file="/WEB-INF/jsp/lionsmobile/common/stylesheet.jsp" %>
<%@ include file="/WEB-INF/jsp/lionsmobile/common/javascript.jsp" %>
</head>
<body>
	<div data-role="page" id="page2" data-add-back-btn="true">
		<div data-role="header" data-position="inline">
			<tiles:insertAttribute name="header" />
		</div><!-- /header -->
	
		<div role="main" class="ui-content">
			<!-- 컨테이너 -->
			<div class="container">
				<tiles:insertAttribute name="body" />
			</div>
		</div><!-- /content -->
		
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
