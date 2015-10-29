<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>경조금 부과 입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,1,3)">
	
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
		<p>HOME &gt; 개인기록관리 &gt; 개인납부금 &gt; <span>경조금 부과 입력</span></p> 
		</div>


<h3><div>경조금 부과 입력 </div></h3>
<jsp:include page="../include/sub_profile.jsp" />

<div class="table">
<h4>지급 내역</h4>
	<div class="btnBox">
		<a href="../include/mm1_10popup.html" onclick="window.open(this.href,'popup','width=700,height=500'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<a href="../include/mm1_10popup2.html" onclick="window.open(this.href,'popup','width=700,height=500'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="지급 내역표">
	<caption>지급 내역</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="300px" />
		<col width="120px" />
		<col width="120px" />
		<col width="120px" />
	</colgroup>
	<tr>
		<th>발생일자</th>
		<th>경조사유</th>
		<th>방문지역</th>
		<th>개인부담금</th>
		<th>클럽총부과금</th>
		<th>클럽부담금</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="300px" />
		<col width="120px" />
		<col width="120px" />
		<col width="120px" />
	</colgroup>
	<tbody>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>자녀결혼</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="right">50,000</td>
		<td class="right">1,050,000</td>
		<td class="right">70,000</td>
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






