<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>개인 기념일 관리</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(0,0,1)">
	
	<h2 class="blind">스킵네비게이션</h2>
	<jsp:include page="../include/top_skipnavi.jsp" />
	
	<h2 class="blind">탑메뉴</h2>
	<jsp:include page="../include/top_menu1.jsp" />
	
	<!-- Wrap_Area -->
	<div id="Wrap">
		<!-- LNB_Area -->
		<jsp:include page="../include/submenu011.jsp" />
		<!-- //LNB_Area -->
		
		<!-- Contents_Table_area -->
		<div id="Contetns_Area">
		<div id="position">
		<h2 class="blind">메뉴 경로</h2>
		<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>개인 기념일 관리</span></p> 
		</div>


<h3><div>개인 기념일 관리 </div></h3>
<jsp:include page="../include/sub_profile.jsp" />

<div class="table">
<h4>개인 기념일 관리</h4>
	<div class="btnBox">
		<a href="../include/mm1_2popup.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" onclick="return false;" /></a>
		<a href="../include/mm1_2popup2.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" onclick="return false;" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" onclick="return false;" />
	</div>
	
	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="개인 기념일 관리 안내표">
	<caption>개인 기념일 관리</caption>
	<colgroup>
		<col width="100px" />
		<col width="120px" />
		<col width="*" />
		<col width="100px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<tr>
		<th>기념일자</th>
		<th>분류코드</th>
		<th>메세지 내용</th>
		<th>시간</th>
		<th>일전</th>
		<th>횟수</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="120px" />
		<col width="*" />
		<col width="100px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<tbody>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>2013.09.10</td>
		<td>결혼기념일</td>
		<td class="left">결혼한 날짜가 1992.09.10일 입니다.</td>
		<td>12:10</td>
		<td>2</td>
		<td>3</td>
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



<div class="table hidden">
<form onsubmit='' name="send" id="send" ACTION="/" METHOD="post" enctype="multipart/form-data">
<h4>개인 기념일 관리</h4>

	<table class="mail_write" summary="알림 메일을 보내기 위해 기념일자,분류코드,메세지 내용,시간,일전,횟수 작성">
	<caption>알림 메일보내기</caption>
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">기념일자 <strong class="em">*</strong></th>
		<td scope="row"><label for="mail_date">기념일자 입력</label><input type="text" name="mail_date" id="mail_date" size="30" /></td>
	</tr>
	<tr>
		<th scope="row">분류코드</th>
		<td>결혼기념일</td>
	</tr>
	<tr>
		<th scope="row">메세지 내용</th>
		<td>결혼한 날짜가 1992년 9월 10일 입니다.</td>
	</tr>
	<tr>
		<th scope="row">시간</th>
		<td>12:10</td>
	</tr>
	<tr>
		<th scope="row">일전</th>
		<td>2</td>
	</tr>
	<tr>
		<th scope="row">횟수</th>
		<td>3</td>
	</tr>
	</tbody>
	</table>
	
		<div class="board_btn">
			<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" />
			<input type="image" src="/images/lionsclubs/btn/btn_cancel.gif" alt="취소" />
		</div><!-- board_btn -->
	</form>
	</table>
</div>







