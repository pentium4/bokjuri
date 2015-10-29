<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>클럽행사점수조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(2,4,1)">
	
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
			<p>HOME &gt; 지구관리 &gt; 제의무금 부과 &gt; <span>클럽행사점수조회</span></p>
		</div>


<h3><div>클럽행사점수조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽행사점수조회표">
	<caption>클럽행사점수조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td><input class="input" id="" name="" size="10" value="K26-067" /> 울산원클럽
			<div class="arrow"><a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a> <a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a></div></td>
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
<h4>클럽행사점수조회</h4>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="클럽별 부과금액 조회표">
	<caption>클럽별 부과금액 조회</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="80px" />
		<col width="100px" />
		<col width="150px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<tr>
		<th>No</th>
		<th>행사명</th>
		<th>행사주관</th>
		<th>행사일자</th>
		<th>행사장소</th>
		<th>점수</th>
		<th>주관</th>
		<th>참가</th>
		<th>봉사금</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="80px" />
		<col width="100px" />
		<col width="150px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<tbody>
	<tr>
		<td>1</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">165</td>
		<td class="right">50</td>
		<td class="right">15</td>
		<td class="right">100</td>
	</tr>
	<tr>
		<td>2</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>3</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>4</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>5</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>6</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>7</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>8</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>9</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>10</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>11</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>12</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>13</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>14</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>15</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>16</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>17</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>18</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>19</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>20</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>21</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>22</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>23</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>24</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<td>25</td>
		<td class="left">16회 총재배골프대회</td>
		<td>지구</td>
		<td>2013.10.07</td>
		<td class="left">통도컨트리클럽</td>
		<td class="right">4</td>
		<td class="right">1</td>
		<td class="right">53</td>
		<td class="right"></td>
	</tr>
	<tr>
		<th colspan="4">총 계</th>
		<th class="right">744</th>
		<th class="right">134</th>
		<th class="right">16</th>
		<th class="right">892</th>
		<th class="right"></th>
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






