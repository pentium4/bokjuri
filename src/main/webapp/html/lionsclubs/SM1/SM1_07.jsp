<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>코드 입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,1,3)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>코드 입력</span></p> 
		</div>

<h3><div>코드 입력</div></h3>
<div class="table">
	<table class="tblType1" summary="코드 입력표">
	<caption>코드 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>그룹</th>
		<td>
			<select id="" name="" class="select" style="width:100%;">
				<option value="1050" >1050 직책</option>
				<option value="1100" >1100 직책</option>
			</select>
		</td>
		<th>명칭 설명</th>
		<td></td>
	</tr>
	</tbody>
	</table>
</div>


<div class="table">
	<div class="btnBox2">
		<a href="../include/sm1_7popup.html" onclick="window.open(this.href,'popup','width=500,height=400'); return false;" title="새창"><input type="image" id="create-user" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" /></a>
		<a href="../include/sm1_7popup2.html" onclick="window.open(this.href,'popup','width=500,height=400'); return false;" title="새창"><input type="image" id="update-user" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
		<input type="image" id="delete-user" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
		<input type="image" id="delete-user" src="/images/lionsclubs/btn/btn_group.gif" alt="그룹" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="코드 입력표">
	<caption>코드 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th>코드</th>
		<th>코드명칭</th>
		<th>등록일자</th>
		<th>수정일자</th>
		<th>순서</th>
		<th>옵션1</th>
		<th>옵션2</th>
		<th>옵션3</th>
		<th>코드 내용 설명</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>1000</td>
		<td class="left">총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1050</td>
		<td class="left">국제이사후보</td>
		<td>2014.07.11</td>
		<td>2014.07.11</td>
		<td>1010</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">차기 후보자</td>
	</tr>
	<tr>
		<td>1100</td>
		<td class="left">직전총재</td>
		<td>2014.07.12</td>
		<td>2014.07.12</td>
		<td>1020</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left"></td>
	</tr>
	<tr>
		<td>1150</td>
		<td class="left">당선총재</td>
		<td>2014.07.13</td>
		<td>2014.07.13</td>
		<td>1030</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left"></td>
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





