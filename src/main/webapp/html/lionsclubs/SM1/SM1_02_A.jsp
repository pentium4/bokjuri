<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>추가권한자 관리</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,0,2)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>추가권한자 관리</span></p> 
		</div>


<h3><div>추가권한자 관리 </div></h3>
<div class="table"></div>
<div class="table">
<div class="btnBox2">
	<a href="../include/sm1_2popup.html" onclick="window.open(this.href,'popup','width=700,height=470'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" /></a>
	<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
	<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="추가권한자 관리표">
	<caption>추가권한자 관리</caption>
	<colgroup>
		<col width="50px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="80px" />
		<col width="120px" />
		<col width="120px" />
		<col width="80px" />
		<col width="*" />
		<col width="40px" />
	</colgroup>
	<tr>
		<th>No</th>
		<th>복합지구</th>
		<th>지구</th>
		<th>소속클럽</th>
		<th>현직책</th>
		<th>등록일</th>
		<th>종료일</th>
		<th>성명</th>
		<th>내용</th>
		<th>선택</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="50px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="80px" />
		<col width="120px" />
		<col width="120px" />
		<col width="80px" />
		<col width="*" />
		<col width="40px" />
	</colgroup>
	<tbody>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>50</td>
		<td>354복합지구</td>
		<td>354-C지구</td>
		<td>울산원클럽</td>
		<td>회원</td>
		<td>2013.01.02 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>2014.01.01 <img src="/images/lionsclubs/sub/icon_date.gif" alt="" /></td>
		<td>홍길동</td>
		<td class="left">OOO 사용자의 요청에 의해...</td>
		<td><input type="checkbox" id="" name="" value="" /></td>
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






