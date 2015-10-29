<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>클럽/지구행사 조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(2,1,1)">
	
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
			<p>HOME &gt; 지구관리 &gt; 행사입력 및 조회 &gt; <span>지구기본사항입력</span></p>
		</div>


<h3><div>클럽/지구행사 조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽/지구행사 조회표">
	<caption>클럽/지구행사 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="410px" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td>K26-067 355-D지구
			<div class="arrow"><a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a> <a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a></div></td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">행사주관</label><input type="checkbox" id="s1" name="" value="" /> 행사주관&nbsp;&nbsp;
			<label for="s2">행사일시별</label><input type="checkbox" id="s2" name="" value="" /> 행사일시별&nbsp;&nbsp;
			<label for="s3">클럽별</label><input type="checkbox" id="s3" name="" value="" /> 클럽별&nbsp;&nbsp;
			<label for="s4">행사명</label><input type="checkbox" id="s4" name="" value="" /> 행사명
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
<h4>클럽 및 지구행사 조회</h4>
	<div class="btnBox">
		<a href="../include/mm3_6popup.html" onclick="window.open(this.href,'popup','width=700,height=445'); return false;" title="새창">
		<input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="클럽 및 지구행사 입력 조회표">
	<caption>클럽 및 지구행사 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="150px" />
		<col width="*" />
		<col width="80px" />
	</colgroup>
	<thead>
	<tr>
		<th>시작일</th>
		<th>행사시간</th>
		<th>행사주관</th>
		<th>클럽명</th>
		<th>행사명</th>
		<th>행사내용 및 장소</th>
		<th>사진</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="150px" />
		<col width="*" />
		<col width="80px" />
	</colgroup>
	<tbody>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">지구</td>
		<td class="left">355-D지구</td>
		<td class="left">거리청소</td>
		<td>깨끗한 거리 만들기</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">지구</td>
		<td class="left">355-D지구</td>
		<td class="left">거리청소</td>
		<td>깨끗한 거리 만들기</td>
		<td>☞</td>
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






