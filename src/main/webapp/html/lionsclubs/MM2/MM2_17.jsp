<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>정산현황</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,1,6)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 수입 및 지출 &gt; <span>정산현황</span></p> 
		</div>


<h3><div>정산현황 </div></h3>
<div class="table">
	<table class="tblType1" summary="정산현황표">
	<caption>정산현황</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="80px" />
		<col width="*" />
		<col width="40px" />
		<col width="40px" />
		<col width="*" />
		<col width="80px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>선택조직</th>
		<td colspan="4"><div class="fL">K26-067 울산원클럽</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th>회장</th>
		<td>김회장</td>
		<th>총무</th>
		<td>안총무</td>
		<th>재무</th>
		<td>박재무</td>
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
		<th colspan="2">임시정산</th>
		<td colspan="2">2013.11.10 17:15</td>
		<th class="Rbg">정산확정</th>
		<td colspan="2">2013.11.10 17:30</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<div id="Scroll_Area" class="Height_1 mT0">
<div class="border clfix">
	<div class="fL mr20 w15">
		<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
		<tr>
			<th rowspan="2">이월</th>
			<th><a href="../include/mm2_17popup.html" onclick="window.open(this.href,'popup','width=1000,height=330'); return false;" title="새창">총계</a></th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>잔액</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>정기예금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>회비미수</th>
		</tr>
		<tr>
			<td>326,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>기타미수금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL w15">
		<table class="tblType3">
		<tr>
			<th class="Gbg"><a href="../include/mm2_17popup2.html" onclick="window.open(this.href,'popup','width=400,height=300'); return false;" title="새창">미수금합계</a></th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="borderArrow">&nbsp;</div>
</div><!-- border -->



<div class="border clfix">
	<div class="fL mr20 w15">
		<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
		<tr>
			<th rowspan="2">수입<br />항목</th>
			<th>총계</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>회비</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>분담금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>특별봉사금</th>
		</tr>
		<tr>
			<td>326,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>자진봉사금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL w15">
		<table class="tblType3">
		<tr>
			<th>임원분담금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="borderArrow">
		<p><img src="/images/lionsclubs/icon_squ_pre.gif" alt="이전" /></p>
		<p><img src="/images/lionsclubs/icon_squ_next.gif" alt="다음" /></p>
	</div><!-- borderArrow -->
</div><!-- border -->


<div class="border clfix">
	<div class="fL mr20 w15">
		<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
		<tr>
			<th rowspan="2">지출<br />항목</th>
			<th><a href="../include/mm2_17popup3.html" onclick="window.open(this.href,'popup','width=1000,height=400'); return false;" title="새창">총계</a></th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>회의비</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>봉사사업비</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>교통 및 통신비</th>
		</tr>
		<tr>
			<td>326,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>사무용품비</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL w15">
		<table class="tblType3">
		<tr>
			<th>임원분담금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->


	<div style="padding:20px 0 0 0;width:100%;clear:both;">
		<div class="fL mr20 w15">&nbsp;</div>
		<div class="fL mr20 w15">
			<table class="tblType3">
			<tr>
				<th>지구회비</th>
			</tr>
			<tr>
				<td>25,000,000</td>
			</tr>
			</table>
		</div><!-- fL -->
		<div class="fL mr20 w15">
			<table class="tblType3">
			<tr>
				<th>국제관련</th>
			</tr>
			<tr>
				<td>25,000,000</td>
			</tr>
			</table>
		</div><!-- fL -->
		<div class="fL mr20 w15">
			<table class="tblType3">
			<tr>
				<th>기타지구분담</th>
			</tr>
			<tr>
				<td>25,000,000</td>
			</tr>
			</table>
		</div><!-- fL -->
		<div class="fL mr20 w15">
			<table class="tblType3">
			<tr>
				<th>기타지출(1)</th>
			</tr>
			<tr>
				<td>25,000,000</td>
			</tr>
			</table>
		</div><!-- fL -->
		<div class="fL mr20 w15">
			<table class="tblType3">
			<tr>
				<th>기타지출(2)</th>
			</tr>
			<tr>
				<td>25,000,000</td>
			</tr>
			</table>
		</div><!-- fL -->
	</div><!-- clear -->
	<div class="borderArrow">
		<p class="mt30"><img src="/images/lionsclubs/icon_squ_pre.gif" alt="이전" /></p>
		<p><img src="/images/lionsclubs/icon_squ_next.gif" alt="다음" /></p>
	</div><!-- borderArrow -->
</div><!-- border -->


<div class="border clfix">
	<div class="fL mr20 w15">
		<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
		<tr>
			<th rowspan="2">결손<br />처리</th>
			<th>총계</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>회비</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>기타결손금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>결손처리인원</th>
		</tr>
		<tr>
			<td>326,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">&nbsp;</div>
	<div class="fL w15">
		<table class="tblType3">
		<tr>
			<th class="Rbg">정산횟수</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="borderArrow">&nbsp;</div>
</div><!-- border -->


<div class="border clfix">
	<div class="fL mr20 w15">
		<table class="tblType2" style="border-left:1px solid #aaa;border-top:1px solid #aaa">
		<tr>
			<th rowspan="2">잔액</th>
			<th>총계</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>현금</th>
		</tr>
		<tr>
			<td>36,658,346</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>예금</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th></th>
		</tr>
		<tr>
			<td>326,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL mr20 w15">
		<table class="tblType3">
		<tr>
			<th>기타미수금</th>
		</tr>
		<tr>
			<td>326,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="fL w15">
		<table class="tblType3">
		<tr>
			<th class="Gbg">미수금합계</th>
		</tr>
		<tr>
			<td>25,000,000</td>
		</tr>
		</table>
	</div><!-- fL -->
	<div class="borderArrow">&nbsp;</div>
</div><!-- border -->
				</div><!-- Height_1 -->
			</div><!-- table -->
			<h5><div>해당자료가 조회되었습니다.</div></h5>
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<!-- Wrap_Area -->
</body>
</html>






