<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>지출입력/조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,1,4)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 수입 및 지출 &gt; <span>지출입력/조회</span></p> 
		</div>


<h3><div>지출입력/조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="지출 입력 및 조회표">
	<caption>지출 입력 및 조회</caption>
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
		<td colspan="3"><div class="fL">K26-067</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 전체조회&nbsp;&nbsp;
			<label for="s3">현회원</label><input type="checkbox" id="s3" name="" value="" /> 지출일&nbsp;&nbsp;
			<label for="s3">현회원</label><input type="checkbox" id="s3" name="" value="" /> 지출분류항목별&nbsp;&nbsp;
			<label for="s4">현회원</label><input type="checkbox" id="s4" name="" value="" /> 입력일
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
<h4>지출 입력 및 조회</h4>
	<div class="btnBox">
		<a href="../include/mm2_15popup.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<a href="../include/mm2_15popup2.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>

<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="지출 입력 및 조회 안내표">
	<caption>지출 입력 및 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="150px" />
		<col width="120px" />
		<col width="*" />
		<col width="100px" />
	</colgroup>
	<tr>
		<th>지출일자</th>
		<th>지출분류항목</th>
		<th>지출세부항목</th>
		<th>금액</th>
		<th>지출내용(참고사항)</th>
		<th>입력일자</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="150px" />
		<col width="120px" />
		<col width="*" />
		<col width="100px" />
	</colgroup>
	<tbody>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<td>2013.10.01</td>
		<td class="left">회의비</td>
		<td class="left">식대</td>
		<td class="right">300,000</td>
		<td class="left">정기회의시</td>
		<td>2013.07.12</td>
	</tr>
	<tr>
		<th colspan="3">지출 분류항목별 누계</th>
		<th class="right">1,500,000</th>
		<th>정산일자</th>
		<th>2013.08.05</th>
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






