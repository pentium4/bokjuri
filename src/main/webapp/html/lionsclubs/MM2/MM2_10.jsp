<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원네스 사진조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,0,9)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>회원네스 사진조회</span></p> 
		</div>


<h3><div>회원네스 사진조회 </div></h3>

<div class="table">
	<table class="tblType1" summary="클럽 인원 조회표">
	<caption>클럽 인원 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>클럽코드</th>
		<td><div class="fL">K26-067 울산클럽원</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">성명순</label><input type="checkbox" id="s1" name="" value="" /> 성명순&nbsp;&nbsp;
			<label for="s2">입회일자순</label><input type="checkbox" id="s2" name="" value="" /> 입회일자순&nbsp;&nbsp;
			<label for="s3">퇴직제외</label><input type="checkbox" id="s3" name="" value="" /> 퇴직제외<br />
			<label for="s4">직책순</label><input type="checkbox" id="s4" name="" value="" /> 직책순&nbsp;&nbsp;
			<label for="s5">담당분과</label><input type="checkbox" id="s5" name="" value="" /> 담당분과
		</td>
	</tr>
	<tr>
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
	<table class="tblPhoto">
	<tr>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">1부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />일부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">2부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍일동</p></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">1부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />일부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">2부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍일동</p></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">1부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />일부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">2부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍일동</p></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">1부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />일부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">2부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍일동</p></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">1부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />일부인</p></td>
			</tr>
			</table>
		</td>
		<td>
			<table class="ness">
			<tr>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">2부회장<br />홍길동</p></td>
				<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">네스<br />홍일동</p></td>
			</tr>
			</table>
		</td>
	</tr>
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





