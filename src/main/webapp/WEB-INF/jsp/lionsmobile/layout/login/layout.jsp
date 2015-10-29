<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="author" content="국제라이온스협회 업무통합관리시스템" />
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW" />
<meta name="keyword" content="국제라이온스협회 업무통합관리시스템" />
<title>국제라이온스협회 업무통합관리시스템</title>
<body>

<div data-role="page">
	<tiles:insertAttribute name="body" />
	<div data-role="footer" data-position="fixed" class="footer">
		업무통합 시스템 적용 문의 TEL. 010-8131-8330 <a class="ui-btn ui-shadow ui-corner-all" href="/login/actionMain.do?site_preference=normal" rel="external" style="margin: 0; padding: 5px;">PC버전</a>
	</div>
</div><!-- /page -->

</body>
</html>