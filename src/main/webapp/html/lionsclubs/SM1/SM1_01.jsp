<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>시스템권한자관리</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,0,0)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>시스템권한자관리</span></p> 
		</div>

<h3><div>시스템권한자관리 </div></h3>
<div class="table">
	<table class="tblType1" summary="시스템권한자관리 안내표">
	<caption>시스템권한자관리</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>클럽코드</th>
		<td>분류코드</td>
		<th rowspan="2">조회선택</th>
		<td rowspan="2">
			<label for="s1">권한그룹</label><input type="checkbox" id="s1" name="" value="" /> 권한그룹&nbsp;&nbsp;
			<label for="s2">권한조직</label><input type="checkbox" id="s2" name="" value="" /> 권한조직&nbsp;&nbsp;
			<label for="s3">화면권한</label><input type="checkbox" id="s3" name="" value="" /> 화면권한
		</td>
	</tr>
	<tr>
		<th>회기선택</th>
		<td>
			<a href=""><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a> 
			<strong class="year">2013 ~ 2014</strong> 
			<a href=""><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
		</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->


<div class="table">
<h4>시스템 관리자 조회</h4>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="시스템관리자 조회표">
	<caption>시스템 관리자 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<col width="150px" />
		<col width="100px" />
	</colgroup>
	<tr>
		<th>성명</th>
		<th>소속클럽</th>
		<th>클럽직책</th>
		<th>지구직책</th>
		<th>권한그룹</th>
		<th>권한조직</th>
		<th>화면권한</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="150px" />
		<col width="100px" />
		<col width="*" />
		<col width="150px" />
		<col width="150px" />
		<col width="100px" />
	</colgroup>
	<tbody>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
	</tr>
	<tr>
		<td class="center">홍길동</td>
		<td>울산원클럽</td>
		<td class="center">회장</td>
		<td>국제친선위원장</td>
		<td>복합지구총재</td>
		<td>354복합지구</td>
		<td class="center">5</td>
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





