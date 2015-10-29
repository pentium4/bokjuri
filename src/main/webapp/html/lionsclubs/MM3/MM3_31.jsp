<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>지역지대구성명단</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(2,5,1)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu03.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
			<h2 class="blind">메뉴 경로</h2>
			<p>HOME &gt; 지구관리 &gt; 지역/지대구성 &gt; <span>지역지대구성명단</span></p>
		</div>


<h3><div>지역지대구성명단 </div></h3>
<div class="table">
	<table class="tblType1" summary="지역지대구성명단표">
	<caption>지역지대구성명단</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="*" />
		<col width="80px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>조직코드</th>
		<td>K26-067&nbsp;&nbsp;&nbsp;&nbsp;355-D지구</td>
		<th>회기선택</th>
		<td><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">2013 ~ 2014</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
		<th>지역</th>
		<td><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">01</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
<h4>지역지대 구성 명단</h4>
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_all.gif" alt="전체" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_pre2.gif" alt="지역부총재" style="width:94px" />
		<input type="image" src="/images/lionsclubs/btn/btn_pre3.gif" alt="지대위원장" style="width:94px" />
		<input type="image" src="/images/lionsclubs/btn/btn_pre1.gif" alt="회장" style="width:57px" />
	</div>

<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="클럽 지역지대 연결표">
	<caption>클럽 지역지대 연결</caption>
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="200px" />
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
	</colgroup>
	<thead>
	<tr>
		<th>지역</th>
		<th>지대</th>
		<th>직책</th>
		<th>성명</th>
		<th>클럽</th>
		<th>1부 회장</th>
		<th>총무</th>
		<th>재무</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="200px" />
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
	</colgroup>
	<tbody>
	<tr>
		<td>1</td>
		<td>0</td>
		<td class="left">지역부총재</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td><span class="Blue">1</span></td>
		<td><span class="Blue">1</span></td>
		<td class="left"><span class="Blue">지대위원장</span></td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td><span class="Blue">1</span></td>
		<td><span class="Blue">2</span></td>
		<td class="left"><span class="Blue">지대위원장</span></td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td><span class="Blue">1</span></td>
		<td><span class="Blue">3</span></td>
		<td class="left"><span class="Blue">지대위원장</span></td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td><span class="Blue">1</span></td>
		<td><span class="Blue">4</span></td>
		<td class="left"><span class="Blue">지대위원장</span></td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
		<td class="left">회장</td>
		<td>홍길동</td>
		<td class="left">울산천자봉클럽</td>
		<td>홍부장</td>
		<td>홍총무</td>
		<td>홍재무</td>
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







