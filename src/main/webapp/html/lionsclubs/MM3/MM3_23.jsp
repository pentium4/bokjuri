<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>약정금납부조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(2,3,5)">
	
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
			<p>HOME &gt; 지구관리 &gt; 제의무금 부과 &gt; <span>약정금납부조회</span></p>
		</div>


<h3><div>약정금납부조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="약정금납부조회표">
	<caption>약정금납부조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td><input class="input" size="10" id="" name="" value="K26-067" /> 355-D(울산,양산)지구</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 클럽별&nbsp;&nbsp;
			<label for="s2">직책순</label><input type="checkbox" id="s2" name="" value="" /> 항목/고납입순&nbsp;&nbsp;
			<label for="s3">현회원</label><input type="checkbox" id="s3" name="" value="" /> 미납자<br />
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 약정일&nbsp;&nbsp;
			<label for="s2">직책순</label><input type="checkbox" id="s2" name="" value="" /> 전체고액납입자순
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
<h4>기금약정 납부조회</h4>

<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="기금약정 납부조회표">
	<caption>기금약정 납부조회</caption>
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
		<col width="140px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
		<col width="90px" />
	</colgroup>
	<tr>
		<th rowspan="2">No</th>
		<th rowspan="2">클럽명</th>
		<th rowspan="2">성명</th>
		<th rowspan="2">약정일</th>
		<th rowspan="2">항목</th>
		<th colspan="2">약정금</th>
		<th colspan="2">납입금</th>
		<th colspan="2">잔액</th>
	</tr>
	<tr>
		<th>＄</th>
		<th>금액</th>
		<th>＄</th>
		<th>금액</th>
		<th>＄</th>
		<th>금액</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
		<col width="140px" />
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
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>2</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>3</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>4</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>5</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>6</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>7</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>8</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>9</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>10</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>11</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>12</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>13</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>14</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>15</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>16</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>17</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>18</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>19</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>20</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>21</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>22</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<td>23</td>
		<td class="left">울산클럽</td>
		<td>김클럽</td>
		<td>2013.07.15</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
		<td class="right"></td>
		<td class="right">1,500,000</td>
	</tr>
	<tr>
		<th colspan="5">총 계</th>
		<th class="right f11">4,565,000</th>
		<th class="right f11">1,120,000</th>
		<th class="right f11">2,759,000</th>
		<th class="right f11">34,450,750</th>
		<th class="right f11">6,884,555</th>
		<th class="right f11">170,000</th>
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






