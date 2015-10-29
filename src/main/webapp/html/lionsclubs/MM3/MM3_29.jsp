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

<body onload="GLNB_Select(2,4,4)">
	
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
			<p>HOME &gt; 지구관리 &gt; 공적 관리업무 &gt; <span>클럽봉사실적조회</span></p>
		</div>


<h3><div>클럽봉사실적조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽 봉사실적 조회표">
	<caption>클럽 봉사실적 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td><input class="input" id="" name="" size="10" value="K26-000" /> 355-D지구
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
<h4>클럽 봉사실적 조회
	<div class="dateBox">
		<input type="image" src="/images/lionsclubs/btn/btn_club1.gif" alt="클럽순" style="width:66px" />
		<input type="image" src="/images/lionsclubs/btn/btn_result.gif" alt="실적순" style="width:66px" />
		<input type="image" src="/images/lionsclubs/btn/btn_result_list.gif" alt="항목실적순" style="width:94px" />
	</div>
</h4>

<div class="Height_1" style="overflow-x:auto;">
	<table class="tblType2_1 Scroll_Table" summary="권한그룹 관리표">
	<caption>권한그룹 관리</caption>
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
	</colgroup>
	<thead>
	<tr>
		<th>No</th>
		<th>클럽명</th>
		<th>총원</th>
		<th>총점</th>
		<th>회원증감</th>
		<th>클럽탄생</th>
		<th>주관클럽</th>
		<th>봉사금액</th>
		<th>기타점수</th>
		<th>기타점수</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td>1</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>2</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>3</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>4</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>5</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>6</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>7</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>8</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>9</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>10</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>11</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>12</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>13</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>14</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>15</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>16</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>17</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>18</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>19</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>20</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>21</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>22</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>23</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>24</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>25</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
	</tr>
	<tr>
		<td>26</td>
		<td class="left">울산클럽</td>
		<td class="right">45</td>
		<td class="right">1,150</td>
		<td class="right">150</td>
		<td class="right">150</td>
		<td class="right">300</td>
		<td class="right">300</td>
		<td class="right">200</td>
		<td class="right">50</td>
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







