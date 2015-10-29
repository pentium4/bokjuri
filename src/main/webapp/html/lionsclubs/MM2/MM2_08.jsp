<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회기별임원 사진조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,0,7)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu02.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
			<h2 class="blind">메뉴 경로</h2>
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>회기별임원 사진조회</span></p> 
		</div>


<h3><div>회기별임원 사진조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽 인원 조회표">
	<caption>클럽 인원 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="15%" />
		<col width="100px" />
		<col width="30%" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>클럽코드</th>
		<td>K26-067</td>
		<th>클럽명</th>
		<td><div class="fL">울산원클럽</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th>회기선택</th>
		<td><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">2013 ~ 2014</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
<div id="Scroll_Area" class="Height_1 mT0">
<table class="tbl">
<colgroup>
	<col width="80px" />
	<col width="*" />
</colgroup>
<tbody>
<tr>
	<td class="center LH"><strong>2013<br />2014</strong></td>
	<td>
		<table class="tblPhoto">
		<tr>
			<td><p class="title">회장</p></td>
			<td><p class="title">1부회장</p></td>
			<td><p class="title">2부회장</p></td>
			<td><p class="title">3부회장</p></td>
			<td><p class="title">총무</p></td>
			<td><p class="title">재무</p></td>
		</tr>
		<tr>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td class="center LH"><strong>2012<br />2013</strong></td>
	<td>
		<table class="tblPhoto">
		<tr>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td class="center LH"><strong>2011<br />2012</strong></td>
	<td>
		<table class="tblPhoto">
		<tr>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td class="center LH"><strong>2011<br />2010</strong></td>
	<td>
		<table class="tblPhoto">
		<tr>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
			<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">홍길동</p></td>
		</tr>
		</table>
	</td>
</tr>
</tbody>
</table>
			</div><!-- Height_1 -->
			</div><!-- table -->
			<h5><div>해당자료가 조회되었습니다.</div></h5>
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<!-- Wrap_Area -->
</body>
</html>






