<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>개인별 납부금 총액</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,1,7)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 수입 및 지출 &gt; <span>개인별 납부금 총액</span></p> 
		</div>


<h3><div>개인별 납부금 총액 </div></h3>
<div class="table">
	<table class="tblType1" summary="개인별 납부금 총액조회표">
	<caption>개인별 납부금 총액조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>클럽코드</th>
		<td colspan="3"><div class="fL">K26-067 울산원클럽</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 회원번호&nbsp;&nbsp;
			<label for="s3">현회원</label><input type="checkbox" id="s3" name="" value="" /> 총액고액납부자순<br />
			<label for="s3">현회원</label><input type="checkbox" id="s3" name="" value="" /> 성명순&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="s4">현회원</label><input type="checkbox" id="s4" name="" value="" /> 항목고액납부자순
		</td>
	</tr>
	<tr>
		<th>회기선택</th>
		<td><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">2013 ~ 2014</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
		<th>선택월</th>
		<td><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">07</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
<h4>개인별 납부금 총액</h4>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="개인별 납부금 총액조회 안내표">
	<caption>개인별 납부금 총액조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tr>
		<th>성명</th>
		<th>회비</th>
		<th>클럽분담금</th>
		<th>자진봉사금</th>
		<th>특별봉사금</th>
		<th>지구분담금</th>
		<th>LCIF기금</th>
		<th>회관건립</th>
		<th>기타납부금</th>
		<th>계</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right">1,000,000</td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right">1,000,000</td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right">1,000,000</td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right">1,000,000</td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right">1,000,000</td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<td>김회장</td>
		<td class="right">300,000</td>
		<td class="right"></td>
		<td class="right">1,000,000</td>
		<td class="right">780,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
		<td class="right">500,000</td>
		<td class="right"></td>
		<td class="right">500,000</td>
	</tr>
	<tr>
		<th>합 계</th>
		<th class="right">1,500,000</th>
		<th class="right">15,000,000</th>
		<th class="right">1,500,000</th>
		<th class="right">15,000,000</th>
		<th class="right">1,500,000</th>
		<th class="right">15,000,000</th>
		<th class="right">1,500,000</th>
		<th class="right">15,000,000</th>
		<th class="right">15,000,000</th>
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





