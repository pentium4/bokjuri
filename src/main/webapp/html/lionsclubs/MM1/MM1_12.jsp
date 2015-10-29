<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>약정금 입력/납입</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,1,4)">
	
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
		<p>HOME &gt; 개인기록관리 &gt; 개인납부금 &gt; <span>약정금 입력/납입</span></p> 
		</div>


<h3><div>약정금 입력/납입 </div></h3>
<jsp:include page="../include/sub_profile.jsp" />

<div class="table">
<h4>약정금 입력/납입</h4>
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="약정금 입력/납입표">
	<caption>약정금 입력/납입</caption>
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="80px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
	</colgroup>
	<tr>
		<th rowspan="2">약정일</th>
		<th rowspan="2">납부일</th>
		<th rowspan="2">구분</th>
		<th rowspan="2">항목</th>
		<th colspan="2">약정금</th>
		<th colspan="2">납부금</th>
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
		<col width="100px" />
		<col width="100px" />
		<col width="80px" />
		<col width="*" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
	</colgroup>
	<tbody>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<td>2010.06.23</td>
		<td>2013.02.03</td>
		<td>지구</td>
		<td class="left">장학기금</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
		<td class="right"></td>
		<td class="right">2,000</td>
	</tr>
	<tr>
		<th colspan="4">총계</th>
		<th class="right">3,000</th>
		<th class="right">11,782,000</th>
		<th class="right">2,0000</th>
		<th class="right">2,000</th>
		<th class="right"></td>
		<th class="right">2,685,000</th>
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






