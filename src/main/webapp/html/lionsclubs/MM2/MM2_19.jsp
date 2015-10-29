<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>연간 수입예산 입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,2,0)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 예산편성 및 실적조회 &gt; <span>연간 수입예산 입력</span></p> 
		</div>


<h3><div>연간 수입예산 입력 </div></h3>
<div class="table">
	<table class="tblType1" summary="연간 수입예산 입력표">
	<caption>연간 수입예산 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>클럽코드</th>
		<td><div class="fL">K26-067 울산원클럽</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">수입분류항목별</label><input type="checkbox" id="s1" name="" value="" /> 수입분류항목별&nbsp;&nbsp;
			<label for="s3">분류항목별 산출근거</label><input type="checkbox" id="s3" name="" value="" /> 분류항목별 산출근거<br />
			<label for="s3">수입세부항목별</label><input type="checkbox" id="s3" name="" value="" /> 수입세부항목별
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
<h4>연간 수입예산 입력</h4>
	<div class="btnBox">
		<a href="../include/mm2_1popup.html" onclick="window.open(this.href,'popup','width=700,height=500'); return false;" title="새창">
		<input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>

<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="수입예산 산출근거 안내표">
	<caption>수입예산 산출근거</caption>
	<colgroup>
		<col width="200px" />
		<col width="200px" />
		<col width="*" />
		<col width="80px" />
		<col width="120px" />
		<col width="120px" />
	</colgroup>
	<tr>
		<th>수입예산 산출근거</th>
		<th>수입세부항목</th>
		<th>산출근거</th>
		<th>단위</th>
		<th>기준금액</th>
		<th>금액</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="200px" />
		<col width="200px" />
		<col width="*" />
		<col width="80px" />
		<col width="120px" />
		<col width="120px" />
	</colgroup>
	<tbody>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="left">전년도이월금</td>
		<td class="right">1</td>
		<td class="right">3,677,300</td>
		<td class="right">3,677,300</td>
	</tr>
	<tr>
		<th>78,800,000</th>
		<th>78,800,000</th>
		<th colspan="3">총 계</th>
		<th class="right">78,800,000</th>
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







