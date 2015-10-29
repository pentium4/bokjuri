<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원업체조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,0,5)">
	
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
		<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>회원업체조회</span></p> 
		</div>


<h3><div>회원업체 조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="회원업체 조회표">
	<caption>회원업체 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="400px" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>업종분류</th>
		<td>식음서비스</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원이름순</label><input type="checkbox" id="s1" name="" value="" /> 회원이름순&nbsp;&nbsp;&nbsp;
			<label for="s2">업체명순</label><input type="checkbox" id="s2" name="" value="" /> 업체명순&nbsp;&nbsp;<br />
			<label for="s3">소속 클럽순</label><input type="checkbox" id="s3" name="" value="" /> 소속 클럽순&nbsp;&nbsp;
			<label for="s4">업체주소순</label><input type="checkbox" id="s4" name="" value="" /> 업체주소순
		</td>
	</tr>
	<tr>
		<th>업종</th>
		<td>한식점업</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->


<div class="table">
<h4>회원 업체조회</h4>
	<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="회원업체 조회표">
	<caption>회원 업체조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="250px" />
		<col width="100px" />
		<col width="130px" />
		<col width="*" />
	</colgroup>
	<tr>
		<th>회원이름</th>
		<th>소속클럽</th>
		<th>업체명</th>
		<th>업체직책</th>
		<th>전화번호</th>
		<th>업체주소</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="250px" />
		<col width="100px" />
		<col width="130px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td><a href="../include/sub_profile.html" onclick="window.open(this.href,'popup','width=500,height=150'); return false;" title="새창">홍길동(팝업)</a></td>
		<td class="left">울산원클럽</td>
		<td class="left">한성마트뱅크</td>
		<td>사장</td>
		<td>052-280-2222</td>
		<td class="left">울산광역시 북구 진징동 123-5번지</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
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






