<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>납부금입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,1,1)">
	
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
		<p>HOME &gt; 개인기록관리 &gt; 개인납부금 &gt; <span>납부금입력</span></p> 
		</div>


<h3><div>납부금입력 </div></h3>
<jsp:include page="../include/sub_profile.jsp" />

<div class="table">
<h4>납부금</h4>
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_pay.gif" alt="납부" style="width:57px" /></a>
		<a href="../include/mm1_9popup.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_regi.gif" alt="입력" style="width:57px" /></a>
		<a href="../include/mm1_9popup2.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="납부금 안내표">
	<caption>납부금</caption>
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="150px" />
		<col width="140px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
	</colgroup>
	<tr>
		<th>발생일자</th>
		<th>수입분류항목</th>
		<th>수입세부항목</th>
		<th>납부금</th>
		<th>참고사항</th>
		<th>납부일자</th>
		<th>결손</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="150px" />
		<col width="140px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
	</colgroup>
	<tbody>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<td class="center">2010.06.23</td>
		<td>경조금</td>
		<td>자녀결혼</td>
		<td class="right">50,000</td>
		<td>울산롯데호텔(6/20 12:00)</td>
		<td class="center">2013.10.01</td>
		<td class="center"></td>
	</tr>
	<tr>
		<th colspan="3">선택월 누계</th>
		<th class="right">30,850,320</th>
		<th>정산일자</th>
		<th>2013.11.10</th>
		<th></th>
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






