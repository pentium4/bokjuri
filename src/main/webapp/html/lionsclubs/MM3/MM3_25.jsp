<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>클럽/지구행사점수 입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(2,4,0)">
	
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
			<p>HOME &gt; 지구관리 &gt; 공적 관리업무 &gt; <span>클럽/지구행사점수 입력</span></p>
		</div>


<h3><div>클럽/지구행사점수 입력 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽/지구행사점수 입력표">
	<caption>클럽/지구행사점수 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="41%" />
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>조직코드</th>
		<td><div class="fL" style="padding-top:3px;">K26-067 355-D지구</div>
			<div class="fR mr20"><a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a> <a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a></div></td>
		<th>회기선택</th>
		<td colspan="3"><a href="/"><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a>
			<strong class="year">2013 ~ 2014</strong> 
			<a href="/"><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
	</tr>
	<tr>
		<th>지구행사</th>
		<td>총재배골프대회</td>
		<th>실시일자</th>
		<td>2013.10.07</td>
		<th>장소</th>
		<td>통도CC</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
<h4>클럽/지구행사 점수 입력
	<div class="dateBox2">
		<input type="image" src="/images/lionsclubs/btn/btn_club_all.gif" alt="클럽전체조회" style="width:106px" />
		<input type="image" src="/images/lionsclubs/btn/btn_club_num.gif" alt="점수있는클럽조회" style="width:130px" />
	</div>
</h4>

	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_cha.gif" alt="클럽차타순" style="width:94px" />
		<input type="image" src="/images/lionsclubs/btn/btn_lineup.gif" alt="클럽가나다순" style="width:106px" />
	</div>

<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="클럽/지구행사 점수표">
	<caption>클럽/지구행사 점수</caption>
	<colgroup>
		<col width="40px" />
		<col width="150px" />
		<col width="100px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="120px" />
		<col width="80px" />
		<col width="*" />
	</colgroup>
	<tr>
		<th rowspan="2">No</th>
		<th rowspan="2">클럽명</th>
		<th rowspan="2">총점</th>
		<th colspan="3">주관</th>
		<th colspan="3">참가</th>
		<th colspan="3">봉사금</th>
	</tr>
	<tr>
		<th>인원</th>
		<th>수정</th>
		<th>기준점수</th>
		<th>인원</th>
		<th>수정</th>
		<th>기준점수</th>
		<th>총액</th>
		<th>기준</th>
		<th>기준점수</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="40px" />
		<col width="150px" />
		<col width="100px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="70px" />
		<col width="120px" />
		<col width="80px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>1</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>2</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>3</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>4</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>5</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>6</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>7</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>8</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>9</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>10</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>11</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>12</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>13</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>14</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>15</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>16</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>17</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>18</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>19</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>20</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>21</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>22</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>23</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>24</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>25</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
	</tr>
	<tr>
		<td>26</td>
		<td class="left">울산클럽</td>
		<td class="right">660</td>
		<td class="right">5</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">11</td>
		<td class="right"></td>
		<td class="right">10</td>
		<td class="right">1,500,000</td>
		<td class="right">20,000</td>
		<td class="right">10</td>
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






