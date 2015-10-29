<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>시스템권한그룹관리</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,0,1)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu07.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
			<h2 class="blind">메뉴 경로</h2>
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>시스템권한그룹관리</span></p> 
		</div>
		



<h3><div>시스템권한그룹관리 </div></h3>
<div class="table clfix">
<div id="Scroll_Area" class="Height_1">
<div class="fL w33">
<h4>권한그룹 관리</h4>
	<div class="tblTitle">
	<table class="tblType2_1" summary="권한그룹 관리표">
	<caption>권한그룹 관리</caption>
	<colgroup>
		<col width="200px" />
		<col width="*" />
		<col width="300px" />
	</colgroup>
	<thead>
	<tr>
		<th>No</th>
		<th>그룹명 </th>
		<th>화면권한</th>  
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div class="tblInnerH2">
	<table class="tblType2_1">
	<colgroup>
		<col width="200px" />
		<col width="*" />
		<col width="300px" />
	</colgroup>
	<tbody>
	<tr>
		<td>1</td>
		<td>일반그룹</td>
		<td>10</td>
	</tr>
	<tr>
		<td>2</td>
		<td>클럽총무그룹</td>
		<td>10</td>
	</tr>
	<tr>
		<td>3</td>
		<td>지구그룹</td>
		<td>10</td>
	</tr>
	<tr>
		<td>4</td>
		<td>지구총무그룹</td>
		<td>10</td>
	</tr>
	<tr>
		<td>5</td>
		<td>복합지구그룹</td>
		<td>10</td>
	</tr>
	</tbody>
	</table>
	</div><!-- tblInner -->
	<div class="right">
		<input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>
</div>

<div class="fR w65">
<h4>화면권한</h4>
	<div class="tblInnerH5_5">

	<table class="tblType2_1" summary="화면권한 안내표">
	<caption>화면권한</caption>
	<colgroup>
		<col width="150px" />
		<col width="400px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
	</colgroup>
	<thead>
	<tr>
		<th class="th_top">화면No</th>
		<th class="th_top">화면명</th>
		<th class="th_top">조회</th>
		<th class="th_top">등록</th>
		<th class="th_top">등록</th>
	</tr>
	</thead>
	<tbody>
	<tr>	 
		<td>MM1_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_07</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_08</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_09</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_10</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_11</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_12</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_13</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	</tbody>
	</table>
	</div><!-- tblInner -->
	</div><!-- fL -->
				</div><!-- Height_1 -->
			</div><!-- table -->
			<h5><div>해당자료가 조회되었습니다.</div></h5>
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<!-- Wrap_Area -->
</body>
</html>





