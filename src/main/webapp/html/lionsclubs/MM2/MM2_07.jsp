<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>클럽인원조회</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,0,6)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu02.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
		<h2 class="blind">메뉴 경로</h2>
		<p>HOME &gt; 클럽관리 &gt; 기본 및 조회업무 &gt; <span>클럽인원조회</span></p> 
		</div>


<h3><div>클럽 인원 조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽 인원 조회표">
	<caption>클럽 인원 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>클럽코드</th>
		<td><div class="fL">K26-067</div>
			<div class="fR mr20">
				<a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 회원이름순&nbsp;&nbsp;
			<label for="s2">직책순</label><input type="checkbox" id="s2" name="" value="" /> 업체명순&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="s3">담당분과</label><input type="checkbox" id="s3" name="" value="" /> 소속클럽순&nbsp;&nbsp;
			<label for="s4">현회원</label><input type="checkbox" id="s4" name="" value="" /> 업체주소순<br />
			<label for="s5">회원번호</label><input type="checkbox" id="s5" name="" value="" /> 성명순
			<label for="s6">직책순</label><input type="checkbox" id="s6" name="" value="" style="margin-left:38px;" /> 입회일자순
			<label for="s7">담당분과</label><input type="checkbox" id="s7" name="" value="" style="margin-left:12px;" /> 행사참여순&nbsp;&nbsp;
			<label for="s8">현회원</label><input type="checkbox" id="s8" name="" value="" /> 퇴회자순<br />
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
<h4>회원 업체조회</h4>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="회원업체 조회표">
	<caption>회원 업체조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="150px" />
		<col width="170px" />
		<col width="120px" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th>회원번호</th>
		<th>성명</th>
		<th>입회일자</th>
		<th>직책</th>
		<th>담당분과</th>
		<th>행사참여순</th>
		<th>퇴회일자</th>
		<th>퇴회사유</th>
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
		<col width="150px" />
		<col width="170px" />
		<col width="120px" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>12345678</td>
		<td><a href="../include/mm2_7profile.html" onclick="window.open(this.href,'popup','width=500,height=210'); return false;" title="새창">홍길동</a></td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
	</tr>
	<tr>
		<td>12345678</td>
		<td>김종비</td>
		<td>2011.08.01</td>
		<td class="left">지구총재</td>
		<td class="left">회원출석위원장</td>
		<td>80.1%(9/12)</td>
		<td>2012.11.22</td>
		<td class="left">자퇴</td>
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





