<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>지역지대입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(2,5,0)">
	
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
			<p>HOME &gt; 지구관리 &gt; 지역/지대구성 &gt; <span>지역지대입력</span></p>
		</div>


<h3><div>지역지대입력 </div></h3>
<div class="table">
	<table class="tblType1" summary="지역지대입력표">
	<caption>지역지대입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>조직코드</th>
		<td><input class="input" value="K26-067" id="" name="" size="10" /> 355-D지구</td>
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
<h4>클럽 지역지대 연결
	<div class="dateBox">
		<input type="image" src="/images/lionsclubs/btn/btn_club_all.gif" alt="클럽전체조회" style="width:106px" />
		<input type="image" src="/images/lionsclubs/btn/btn_club_num.gif" alt="점수있는클럽조회" style="width:130px" />
	</div>
</h4>
<div class="btnBox">
	<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
</div>

<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="클럽 지역지대 연결표">
	<caption>클럽 지역지대 연결</caption>
	<colgroup>
		<col width="100px" />
		<col width="200px" />
		<col width="100px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th rowspan="2">클럽코드</th>
		<th rowspan="2">클럽명칭</th>
		<th rowspan="2">클럽생성일</th>
		<th colspan="2">전회기</th>
		<th colspan="2">현회기</th>
		<th rowspan="2">특이사항</th>
	</tr>
	<tr>
		<th>지역</th>
		<th>지대</th>
		<th>지역</th>
		<th>지대</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="200px" />
		<col width="100px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>12345678</td>
		<td class="left">울산클럽</td>
		<td>1977.01.02</td>
		<td class="Gbg">1</td>
		<td class="Gbg">1</td>
		<td>1</td>
		<td>1</td>
		<td class="left"></td>
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



