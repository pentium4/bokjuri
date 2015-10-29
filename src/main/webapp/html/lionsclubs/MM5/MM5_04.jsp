<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>월별항목별급여조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(4,3,0)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu05.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
			<h2 class="blind">메뉴 경로</h2>
			<p>HOME &gt; 지구근무자 &gt; <span>월별항목별급여조회</span></p> 
		</div>


<h3><div>월별항목별급여조회 </div></h3>
<jsp:include page="../include/league_profile2.jsp" />

<div class="table">
<h4>급여 조회
	<div class="dateBox">조회년도 : <select class="input" name="1">
		<option value selected>2013년</option>
		</select>
	</div>
</h4>
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_excel2.gif" alt="엑셀받기" style="width:78px" />
	</div>
</div>

<div class="table">
<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="기금약정 납부조회표">
	<caption>기금약정 납부조회</caption>
	<colgroup>
		<col width="70px" />
		<col width="120px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="120px" />
		<col width="100px" />
		<col width="100px" />
		<col width="120px" />
		<col width="*" />
	</colgroup>
	<tr>
		<th rowspan="2">월</th>
		<th colspan="5">수당</th>
		<th colspan="3">공제</th>
		<th rowspan="2">차감지급액</th>
	</tr>
	<tr>
		<th>기본급</th>
		<th>수당</th>
		<th>통상급</th>
		<th>상여금</th>
		<th>급여계</th>
		<th>4대보험</th>
		<th>기타공제</th>
		<th>공제계</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area"  class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="70px" />
		<col width="120px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="120px" />
		<col width="100px" />
		<col width="100px" />
		<col width="120px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>1월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>2월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>3월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>4월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>5월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>6월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>7월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>8월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>9월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>10월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>11월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>12월</td>
		<td class="right">1,200,000</td>
		<td class="right">290,000</td>
		<td class="right">1,490,000</td>
		<td class="right">50,000</td>
		<td class="right">1,500,000</td>
		<td class="right">46,200</td>
		<td class="right"></td>
		<td class="right">46,200</td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<th>년계</th>
		<th class="right">10,565,000</th>
		<th class="right">2,610,000</th>
		<th class="right">1,120,000</th>
		<th class="right">2,759,000</th>
		<th class="right">34,450,750</th>
		<th class="right">415,800</th>
		<th class="right">-</th>
		<th class="right">415,800</th>
		<th class="right">6,884,555</th>
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






