<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>클럽 납부금 입력조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(2,3,4)">
	
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
			<p>HOME &gt; 지구관리 &gt; 제의무금 부과 &gt; <span>클럽 납부금 입력조회</span></p>
		</div>


<h3><div>클럽 납부금 입력조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽 납부금 입력조회표">
	<caption>클럽 납부금 입력조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td><input class="input" value="K26-067" id="" name="" size="10" /> 울산원클럽</td>
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
<h4>클럽 납부금 조회</h4>
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_pay_cal.gif" alt="납부금정산" style="width:94px" />
		<a href="../include/mm3_22popup.html" onclick="window.open(this.href,'popup','width=500,height=350'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_pay_input.gif" alt="납부금입력" style="width:94px" /></a>
	</div>

<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="클럽별 납부금 조회표">
	<caption>클럽별 납부금 조회</caption>
	<colgroup>
		<col width="50px" />
		<col width="80px" />
		<col width="*" />
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
		<th rowspan="2">No</th>
		<th rowspan="2">분기</th>
		<th rowspan="2">부과금항목</th>
		<th colspan="2">부과금</th>
		<th colspan="2">납부금누계</th>
		<th colspan="2">잔액</th>
		<th colspan="2">납부금</th>
	</tr>
	<tr>
		<th>＄</th>
		<th>금액</th>
		<th>＄</th>
		<th>금액</th>
		<th>＄</th>
		<th>금액</th>
		<th>납부일자</th>
		<th>금액</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="80px" />
		<col width="*" />
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
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>2</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>3</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>4</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>5</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>6</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>7</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>8</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>9</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>10</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>11</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>12</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>13</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>14</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>15</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>16</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>17</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>18</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>19</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>20</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>21</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>22</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>23</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>24</td>
		<td>상반기</td>
		<td class="left">지구회비</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<th colspan="3">총 계</th>
		<th class="right f11">4,565,000111111111111111111111</th>
		<th class="right f11">1,120,000</th>
		<th class="right f11">2,759,000</th>
		<th class="right f11">34,450,750</th>
		<th class="right f11">6,884,555</th>
		<th class="right f11">170,000</th>
		<th>납부금계</th>
		<th class="right f11">4,050,000</th>
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






