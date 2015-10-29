<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회비납부현황</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,1,0)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu01.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
		<h2 class="blind">메뉴 경로</h2>
		<p>HOME &gt; 개인기록관리 &gt; 개인납부금 &gt; <span>회비납부현황</span></p> 
		</div>


<h3><div>회비납부현황 </div></h3>
<jsp:include page="../include/sub_profile.jsp" />  

<div class="table">
<h4>월회비 납부내용</h4>

<div id="Scroll_Area" class="Height_1 clfix">
<div class="fL w33">
	<div class="tblTitle">
	<table class="tblType2_1" summary="월회비 납부안내 표" style="border-bottom:1px solid #aaa;">
		<caption>월회비 납부내용</caption>
		<colgroup>
			<col width="40px" />
			<col width="100px" />
			<col width="90px" />
			<col width="*" />
		</colgroup>
		<tr>
			<th colspan="4" class="Gbg">2013-2014</th>
		</tr>
		<tr>
			<th>월</th>
			<th>부과금</th>
			<th>납부일자</th>
			<th>납부금</th>
		</tr>
		</table>
	</div>
	<table class="tblType2_1 Scroll_Table" style="border-top:1px solid #aaa;">
	<colgroup>
		<col width="40px" />
		<col width="100px" />
		<col width="90px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>7</th>
		<td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>8</th>
		<td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th class="Ybg">9</th>
		<td class="Ybg right">50,000</td>
		<td class="Ybg">2013.07.15</td>
		<td class="Ybg right">50,000</td>
	</tr>
	<tr>
		<th class="Ybg">10</th>
		<td class="Ybg right ">50,000</td>
		<td class="Ybg">2013.07.15</td>
		<td class="Ybg right">50,000</td>
	</tr>
	<tr>
		<th>11</th>
		<td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>12</th>
		<td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>1</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>2</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>3</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>4</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>5</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>6</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	</tbody>
	</table>
</div><!-- fL -->

<div class="fL w32 p10">
	<div class="tblTitle">
	<table class="tblType2_1" summary="월회비 납부안내 표" style="border-left:1px solid #aaa;border-bottom:1px solid #aaa;">
		<caption>월회비 납부내용</caption>
		<colgroup>
			<col width="40px" />
			<col width="100px" />
			<col width="90px" />
			<col width="*" />
		</colgroup>
		<tr>
			<th colspan="4" class="Gbg">2011-2012</th>
		</tr>
		<tr>
			<th>월</th>
			<th>부과금</th>
			<th>납부일자</th>
			<th>납부금</th>
		</tr>
		</table>
	</div>
	<table class="tblType2_1 Scroll_Table" style="border-left:1px solid #aaa;border-top:1px solid #aaa;">
	<colgroup>
		<col width="40px" />
		<col width="100px" />
		<col width="90px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>7</th>
		<td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>8</th>
		 <td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>9</th>
		 <td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>10</th>
		 <td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>11</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>12</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>1</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>2</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>3</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>4</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>5</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>6</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	</tbody>
	</table>
</div><!-- fR -->
<div class="fL w33">
	<div class="tblTitle">
	<table class="tblType2_1" summary="월회비 납부안내 표" style="border-left:1px solid #aaa;border-bottom:1px solid #aaa;">
		<caption>월회비 납부내용</caption>
		<colgroup>
			<col width="40px" />
			<col width="100px" />
			<col width="90px" />
			<col width="*" />
		</colgroup>
		<tr>
			<th colspan="4" class="Gbg">2012-2013</th>
		</tr>
		<tr>
			<th>월</th>
			<th>부과금</th>
			<th>납부일자</th>
			<th>납부금</th>
		</tr>
		</table>
	</div>
	<table class="tblType2_1 Scroll_Table" style="border-left:1px solid #aaa;border-top:1px solid #aaa;">
	<colgroup>
			<col width="40px" />
			<col width="100px" />
			<col width="90px" />
			<col width="*" />
		</colgroup>
	<tbody>
	<tr>
		<th>7</th>
		<td class="right">50,000</td>
		<td>2013.07.15</td>
		<td class="right">50,000</td>
	</tr>
	<tr>
		<th>8</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>9</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>10</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>11</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>12</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>1</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>2</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>3</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>4</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>5</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>6</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	</tbody>
	</table>
</div><!-- fR -->
</div>
				</div><!-- Height_1 -->
			</div><!-- table -->
			<h5><div>해당자료가 조회되었습니다.</div></h5>
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<!-- Wrap_Area -->
</body>
</html>






