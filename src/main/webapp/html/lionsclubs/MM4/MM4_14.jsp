<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>입회경력퇴회현황</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(3,1,9)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu04.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
			<h2 class="blind">메뉴 경로</h2>
			<p>HOME &gt; 복합/연합회 &gt; 현황조회 &gt; <span>입회경력퇴회현황</span></p>
		</div>


<h3><div>입회경력퇴회현황 </div></h3>
<div class="table">
	<table class="tblType1" summary="입회경력퇴회현황표">
	<caption>입회경력퇴회현황</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>선택조직</th>
		<td>K00-000&nbsp;&nbsp;&nbsp;&nbsp;355복합지구</td>
		<th>조회선택</th>
		<td>
			<label for="s1">지구조회</label><input type="checkbox" id="s1" name="" value="" /> 지구조회&nbsp;&nbsp;
			<label for="s2">클럽조회</label><input type="checkbox" id="s2" name="" value="" /> 클럽조회</td>
	</tr>
	<tr>
		<th>회기선택</th>
		<td colspan="3"><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">2013 ~ 2014</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
	</tr>
	</tbody>
	</table>
</div>

<div class="table">
	<div class="tblTitle mT5 Scroll_Title">
	<table class="tblType2_1" summary="지역회기별인원현황표">
	<caption>지역회기별인원현황</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
	</colgroup>
	<tr>
		<th>No</th>
		<th>입회경력</th>
		<th>구성원</th>
		<th>퇴회사유1</th>
		<th>퇴회사유2</th>
		<th>퇴회사유3</th>
		<th>퇴회사유4</th>
		<th>퇴회사유5</th>
		<th>퇴회사유6</th>
		<th>퇴회사유7</th>
		<th>퇴회자</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
	</colgroup>
	<tbody>
	<tr>
		<td>1</td>
		<td class="left">1년 미만</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">-</td>
	</tr>
	<tr>
		<td>2</td>
		<td class="left">1-2년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">-</td>
	</tr>
	<tr>
		<td>3</td>
		<td class="left">2-3년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>4</td>
		<td class="left">3-4년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>5</td>
		<td class="left">4-5년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>6</td>
		<td class="left">5-6년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>7</td>
		<td class="left">6-7년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>8</td>
		<td class="left">7-8년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>9</td>
		<td class="left">8-9년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>10</td>
		<td class="left">9-10년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>11</td>
		<td class="left">10-15년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>12</td>
		<td class="left">15-20년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>13</td>
		<td class="left">20-25년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>14</td>
		<td class="left">25-30년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>15</td>
		<td class="left">30-40년</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>16</td>
		<td class="left">40년 이상</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
	</tr>
	<tr>
		<th colspan="2">계</th>
		<th class="right">-</th>
		<th class="right">-</th>
		<th class="right">-</th>
		<th class="right">-</th>
		<th class="right">-</th>
		<th class="right">-</th>
		<th class="right">-</th>
		<th class="right">-</th>
		<th class="right">-</th>
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






