<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>클럽경조사 조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,0,5)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>클럽경조사 조회</span></p> 
		</div>


<h3><div>클럽경조사 조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽포상 입력/조회표">
	<caption>클럽포상 입력/조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>클럽코드</th>
		<td><div class="fL">K26-067</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 성명순&nbsp;&nbsp;
			<label for="s2">직책순</label><input type="checkbox" id="s2" name="" value="" /> 발생일자&nbsp;&nbsp;
			<label for="s3">현회원</label><input type="checkbox" id="s3" name="" value="" /> 경조사유별
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
<h4>경조사 내역</h4>
	<div class="btnBox">
		<a href="../include/mm2_1popup.html" onclick="window.open(this.href,'popup','width=700,height=445'); return false;" title="새창">
		<input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>

<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="클럽 포상 입력/조회 안내표">
	<caption>클럽 포상 입력/조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="150px" />
		<col width="*" />
		<col width="110px" />
		<col width="110px" />
		<col width="110px" />
		<col width="100px" />
	</colgroup>
	<tr>
		<th>성명</th>
		<th>발생일자</th>
		<th>경조사유</th>
		<th>방문지역</th>
		<th>개인부담</th>
		<th>클럽부담</th>
		<th>지급액</th>
		<th>퇴회</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="150px" />
		<col width="*" />
		<col width="110px" />
		<col width="110px" />
		<col width="110px" />
		<col width="100px" />
	</colgroup>
	<tbody>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<td>한성명</td>
		<td>2007.07.01</td>
		<td class="left">자녀결혼</td>
		<td class="left">대구 좋은예식장</td>
		<td class="right">3,500,000</td>
		<td class="right">500,000</td>
		<td class="right">4,500,000</td>
		<td>2010.03.08</td>
	</tr>
	<tr>
		<th colspan="4">총 계</th>
		<th class="right">183,500,000</th>
		<th class="right">2,500,000</th>
		<th class="right">24,500,000</th>
		<th></th>
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






