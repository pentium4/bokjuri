<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>조직코드입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,1,0)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>조직코드입력</span></p> 
		</div>


<h3><div>조직코드입력 </div></h3>
<div class="table">
	<table class="tblType1" summary="개인 기본사항 안내표">
	<caption>개인 기본사항</caption>
	<colgroup>
		<col width="92px" />
		<col width="90px" />
		<col width="32%" />
		<col width="90px" />
		<col width="*" />
		<col width="92px" />
	</colgroup>
	<tbody>
	<tr>
		<td rowspan="5" class="Profile_img"><img src="http://lunagravity.dothome.co.kr/lions/images/default/p1376.jpg" alt="본인 사진" /></td>
		<th>코드명</th>
		<td colspan="3"><div class="fL" style="padding-top:2px"><input type="text" id="" name="" size="50" class="input" /></div>
			<div class="fR">
				<a href="/" title="이전 페이지" ><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a>
				<a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a>
				<a href="../include/sm1_4profile.html" onclick="window.open(this.href,'popup','width=700,height=480'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px;vertical-align:top !important;margin-top:2px;margin-left:15px;" /></a>
				<a href="../include/sm1_4profile2.html" onclick="window.open(this.href,'popup','width=700,height=450'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px;vertical-align:top !important;margin-top:2px;" /></a>
				<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px;vertical-align:top !important;margin-top:2px;" />
			</div>
		</td>
		<td rowspan="5" class="Profile_img"><img src="http://lunagravity.dothome.co.kr/lions/images/default/p940.jpg" alt="배우자 사진" /></td>
	</tr>
	<tr>
		<th>한 글 명</span></th>
		<td colspan="3"><input type="text" id="" name="" size="50" class="input" /></td>
	</tr>
	<tr>
		<th>한글약어</th>
		<td><a href="../include/sm1_4popup.html" onclick="window.open(this.href,'popup','width=700,height=380'); return false;" title="새창">355-D(울산,양산)지구</a></td>
		<th>한글약어(2)</th>
		<td>355-D</td>
	</tr>
	<tr>
		<th>한 자 명</span></th>
		<td colspan="3">國際Lions協會 355-D(울산,양산)地區</td>
	</tr>
	<tr>
		<th>영 문 명</span></th>
		<td colspan="3">District 355-D Lions Club International</td>
	</tr>
	</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<div class="btnBox">
		<a href="../include/sm1_4popup1.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" /></a>
		<a href="../include/sm1_4popup2.html" onclick="window.open(this.href,'popup','width=500,height=300'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_s_prev.gif" alt="이전" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_s_next.gif" alt="다음" style="width:57px" />
	</div>
	<div class="mT10"></div>
	<h4>코드내용</h4>
	<div class="Height_1">
	<table class="tblType2" summary="코드내용 표">
	<caption>코드내용</caption>
	<colgroup>
		<col width="90px" />
		<col width="*" />
		<col width="*" />
		<col width="90px" />
		<col width="*" />
		<col width="90px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th colspan="3" class="Gbg">조직변동 항목</th>
		<th colspan="4" class="Gbg">조직분기 및 합병</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th>변경일자</th>
		<td colspan="2">2004.05.20</td>
		<th>분기조직</th>
		<td colspan="3">K26-058&nbsp;&nbsp;&nbsp;&nbsp;새울산</td>
	</tr>
	<tr>
		<th>변경코드</th>
		<td colspan="2"><div class="tdW20">21</div><div class="fL">조직책임자변동</div></td>
		<th>분기일자</th>
		<td colspan="3">2010.01.01</td>
	</tr>
	<tr>
		<th colspan="3" class="Gbg">조직변동 내용</th>
		<th colspan="4" class="Gbg">회의 및 회비</th>
	</tr>
	<tr>
		<th>조직책임자</th>
		<td colspan="2"><div class="tdW20">12345678</div><div class="fL">홍길동</div></td>
		<th>월회비</th>
		<td>50,000</td>
		 <th>도농</th>
		<td>도시</td>
	</tr>
	<tr>
		<th>책임자호칭</th>
		<td colspan="2"><div class="tdW20">33</div><div class="fL">총재</div></td>
		<th>이 사 회</th>
		<td colspan="3">셋째주 수요일</td>
	</tr>
	<tr>
		<th>책임자연대</th>
		<td colspan="2"><div class="tdW20">0</div><div class="fL">초대</div></td>
		<th>월 례 회</th>
		<td colspan="3">셋째주 수요일</td>
	</tr>
	<tr>
		<th>조직등급</th>
		<td colspan="2"><div class="tdW20">40</div><div class="fL">지구</div></td>
		<th colspan="4" class="Gbg">조직설립</th>
	</tr>
	<tr>
		<th>조직구분</th>
		<td colspan="2"><div class="tdW20">1</div><div class="fL">남성클럽</div></td>
		<th>조직총회</th>
		<td colspan="3">2004.03.21</td>
	</tr>
	<tr>
		<th>상위조직</th>
		<td colspan="2"><div class="tdW20">K20-000</div><div class="fL">355복합지구</div></td>
		<th>현장의밤</th>
		<td colspan="3">2004.03.21</td>
	</tr>
	<tr>
		<th>출력순서</th>
		<td>12</td>
		<td>20</td>
		<th>등록번호</th>
		<td colspan="3">12345678</td>
	</tr>
	<tr>
		<th colspan="3" class="Gbg">조직폐지</th>
		<th colspan="4" class="Gbg">클럽 가이딩</th>
	</tr>
	<tr>
		<th>조직폐지</th>
		<td colspan="2">2015.07.10</td>
		<th>가이딩클럽</th>
		<td colspan="3"><div class="tdW20">K26-067</div><div class="fL">울산원클럽</div></td>
	</tr>
	<tr>
		<th>폐지사유</th>
		<td colspan="2"><div class="tdW20">15</div><div class="fL">클럽인원 미달</div></td>
		<th>가이딩회원</th>
		<td colspan="3"><div class="tdW20">12345678</div><div class="fL">이양규</div></td>
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





