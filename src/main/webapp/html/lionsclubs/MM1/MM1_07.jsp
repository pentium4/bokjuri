<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>행사출석현황</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,0,6)">
	
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
		<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>행사출석현황</span></p> 
		</div>


<h3><div>행사출석현황 </div></h3>
<jsp:include page="../include/sub_profile.jsp" />  

<div class="table">
<h4>출석현황</h4>
	<div class="btnBox">
		<a href="../include/mm1_7popup.html" onclick="window.open(this.href,'popup','width=700,height=450'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_event.gif" alt="행사명 입력" style="width:94px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="출석현황 안내표이며 월례회,이사회,행사 정보를 제공">
	<caption>출석현황</caption>
	<colgroup>
		<col width="100px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="100px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th>월</th>
		<th>월례회</th>
		<th>이사회</th>
		<th>행사(1)</th>
		<th>행사(2)</th>
		<th>행사(3)</th>
		<th>월</th>
		<th>월례회</th>
		<th>이사회</th>
		<th>행사(1)</th>
		<th>행사(2)</th>
		<th>행사(3)</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1">
	<colgroup>
		<col width="100px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="100px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="85px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>7월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
		<th>1월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>8월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
		<th>2월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>9월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
		<th>3월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>10월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
		<th>4월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>11월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
		<th>5월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>12월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
		<th>6월</th>
		<td>O</td>
		<td>X</td>
		<td></td>
		<td></td>
		<td></td>
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






