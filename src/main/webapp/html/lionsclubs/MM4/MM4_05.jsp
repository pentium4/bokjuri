<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>지역별인원현황</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(3,1,0)">
	
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
			<p>HOME &gt; 복합/연합회 &gt; 현황조회 &gt; <span>지역별인원현황</span></p>
		</div>


<h3><div>지역별인원현황 </div></h3>
<div class="table">
	<table class="tblType1" summary="지역별인원현황표">
	<caption>지역별인원현황</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>선택조직</th>
		<td>K26-067&nbsp;&nbsp;&nbsp;&nbsp;355복합지구</td>
		<th>조회선택</th>
		<td><label for="s1">지구조회</label><input type="checkbox" id="s1" name="" value="" /> 지구조회</td>
	</tr>
	<tr>
		<th>회기선택</th>
		<td colspan="3"><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">2013 ~ 2014</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
			<a href="/" style="margin-left:3%"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 월" /></a>
			<strong class="year">07월</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 월" /></a>
		</td>
	</tr>
	</tbody>
	</table>
</div>

<div class="table">
	<div class="tblTitle mT5 Scroll_Title">
	<table class="tblType2_1" summary="지역별인원현황표">
	<caption>지역별인원현황</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="100px" />
		<col width="70px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="70px" />
		<col width="70px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="70px" />
	</colgroup>
	<tr>
		<th rowspan="2">No</th>
		<th rowspan="2">클럽명</th>
		<th rowspan="2">총재</th>
		<th colspan="5">클럽증감</th>
		<th colspan="5">회원증감</th>
	</tr>
	<tr>
		<th>취임</th>
		<th>신생</th>
		<th>해체</th>
		<th>증감</th>
		<th>현재</th>
		<th>취임</th>
		<th>입회</th>
		<th>퇴회</th>
		<th>증감</th>
		<th>현재</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="100px" />
		<col width="70px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="70px" />
		<col width="70px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="70px" />
	</colgroup>
	<tbody>
	<tr>
		<td>1</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>2</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>3</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>4</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>5</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>6</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>7</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>8</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>9</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>10</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>11</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>12</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>13</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>14</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>15</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>16</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>17</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>18</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>19</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>20</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>21</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>22</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>23</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<td>24</td>
		<td class="left">355-A지구</td>
		<td>박유근</td>
		<td class="right">132</td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right"></td>
		<td class="right">132</td>
		<td class="right">6,504</td>
		<td class="right">232</td>
		<td class="right">127</td>
		<td class="right">105</td>
		<td class="right">7,059</td>
	</tr>
	<tr>
		<th colspan="3">총 계</th>
		<th class="right">595</th>
		<th class="right"></th>
		<th class="right">1</th>
		<th class="right">-1</th>
		<th class="right">594</th>
		<th class="right">26,394</th>
		<th class="right">797</th>
		<th class="right">491</th>
		<th class="right">305</th>
		<th class="right">26,700</th>
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






