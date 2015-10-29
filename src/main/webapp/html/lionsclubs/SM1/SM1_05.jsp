<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>조직코드 이력관리</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,1,1)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>조직코드 이력관리</span></p> 
		</div>

<h3><div>조직코드 이력관리 </div></h3>

<div class="table">
	<table class="tblType1" summary="조직코드 이력관리표">
	<caption>조직코드 이력관리</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
        <col width="*" />
		<col width="100px" />
        <col width="*" />
		<col width="100px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>조직코드</th>
		<td colspan="3">
			<div class="fL" style="padding-top:2px;"><input type="text" id="" name="" value="355-D" class="input" size="40" /></div>
			<div class="fR mr20"><a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a> <a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
			</div>
		</td>
		<th>조직등급</th>
		<td colspan="3">40 지구</td>
	</tr>
	<tr>
		<th>한 글 명</th>
		<td colspan="3"><a href="../include/sm1_4popup.html" onclick="window.open(this.href,'popup','width=700,height=380'); return false;" title="새창"><input type="text" id="" name="" value="국제라이온스협회 355-D(울산,양산)지구" class="input" size="40" /></a></td>
		<th>상위조직</th>
		<td colspan="3">K20-000 355복합지구</td>
	</tr>
	<tr>
		<th>한글약어</th>
		<td>355-D(울산,양산)지구</td>
		<th>한글약어</th>
		<td>355-D</td>
		<th>클럽구성</th>
		<td colspan="3">남성클럽</td>
	</tr>
	<tr>
		<th>한 자 명</th>
		<td colspan="3">국제라이온스협회 355-D(울산,양산)지구</td>
		<th>조직총회</th>
		<td colspan="3">2001.01.10</td>
	</tr>
	<tr>
		<th>영 문 명</th>
		<td colspan="3">국제라이온스협회 355-D(울산,양산)지구</td>
		<th>현장의 밤</th>
		<td colspan="3">2001.01.10</td>
	</tr>
	<tr>
		<th>책 임 자</th>
		<td colspan="3">홍길동</td>
		<th>이사회</th>
		<td>셋째주 수요일</td>
		<th>출력순(1)</th>
		<td>12</td>
	</tr>
	 <tr>
		<th>책임자호칭</th>
		<td>총재</td>
		<th>등록번호</th>
		<td>12345678</td>
		<th>월 례 회</th>
		<td>네째주 목요일</td>
		<th>출력순(2)</th>
		<td>20</td>
	</tr>
	<tr>
		<th>조직연대</th>
		<td>11대</td>
		<th>스폰클럽</th>
		<td>울산백양클럽</td>
		<th>폐지일자</th>
		<td>2014.06.30</td>
		<th>폐지사유</th>
		<td>인원미달</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->


<div class="table">	
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>
	<div class="mT10"></div>

	<h4>조직 변동 이력 사항</h4>
	<div class="tblTitle Scroll_Title">
	<table class="tblType2" summary="조직 변동 이력 사항 표">
	<caption>조직 변동 이력 사항</caption>
	<colgroup>
		<col width="100px" />
		<col width="120px" />
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="180px" />
		<col width="100px" />
		 <col width="120px" />
	</colgroup>
	<thead>
	<tr>
		<th>시작일</th>
		<th>현조직 명칭</th>
		<th>책임자</th>
		<th>변동 사유</th>
		<th>상위조직</th>
		<th>상위 명칭</th>
		<th>분기조직</th>
		<th>분기조직 명칭</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2 Scroll_Table">
	<colgroup>
		<col width="100px" />
		<col width="120px" />
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="180px" />
		<col width="100px" />
		 <col width="120px" />
	</colgroup>
	<tbody>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
	</tr>
	<tr>
		<td class="center">2002.07.01</td>
		<td>울산원클럽</td>
		<td class="center">홍길동</td>
		<td>명칭변경</td>
		<td class="center">K26-000</td>
		<td>355-D(울산,양산)지구</td>
		<td class="center">K26-058</td>
		<td>울산백양</td>
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


<!-- <br /><br />
<div class="table">	
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>
	<h4>조직 변동 이력 사항</h4>
	<div class="tblTitle">
	<table class="tblType2" summary="조직 변동 이력 사항 표">
	<caption>조직 변동 이력 사항</caption>
	<colgroup>
		<col width="100px" />
		<col width="120px" />
		<col width="100px" />
		<col width="180px" />
		<col width="100px" />
		<col width="180px" />
		<col width="100px" />
		 <col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th>시작일</th>
		<th>현조직 명칭</th>
		<th>책임자</th>
		<th>변동 사유</th>
		<th>상위조직</th>
		<th>상위 명칭</th>
		<th>분기조직</th>
		<th>분기조직 명칭</th>
	</tr>
	</thead>
	</table>
	</div>
	<div class="tblInnerH3_5">
	<table class="tblType2">
	<colgroup>
		<col width="100px" />
		<col width="120px" />
		<col width="100px" />
		<col width="180px" />
		<col width="100px" />
		<col width="180px" />
		<col width="100px" />
		 <col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	<tr>
		<td class="center"><input class="input" size="10" id="" name="" maxlength="10" /></td>
		<td><input class="input" size="12" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="20" id="" name="" /></td>
		<td class="center"><input class="input" size="10" id="" name="" /></td>
		<td><input class="input" size="10" id="" name="" /></td>
	</tr>
	</tbody>
	</table>
	</div> -->







