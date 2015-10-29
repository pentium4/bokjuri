<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>클럽기본사항입력</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(1,0,0)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>클럽기본사항입력</span></p> 
		</div>


<h3><div>클럽기본사항입력 </div></h3>
<jsp:include page="../include/club_profile.jsp" />

<div class="table">
<h4>회원기본</h4>
	<div class="btnBox">
		<a href="../include/mm2_1popup.html" onclick="window.open(this.href,'popup','width=700,height=420'); return false;" title="새창">
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
	</div>
	<div class="Height_1">
	<table class="tblType2" summary="회원기본사항 안내표">
	<caption>회원기본사항</caption>
	<colgroup>
		<col width="90px" />
		<col width="70px" />
		<col width="80px" />
		<col width="70px" />
		<col width="80px" />
		<col width="70px" />
		<col width="70px" />
		<col width="90px" />
		<col width="*" />
		<col width="90px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>대표수장</th>
		<td colspan="8">
			<table>
			<tr>
				<td width="260px" class="border0 padding0"><span class="Blue">대표수상(1)</span></td>
				<td style="border-left:1px solid #ccc;border-right:0;border-bottom:0"><span class="Blue">대표수상(2)</span></td>
			</tr>
			</table>
		</td>
		<th>지구조직</th>
		<td><span class="Blue">2지역 1지대</span></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td colspan="2">052-333-3333</td>
		<th>휴대폰</th>
		<td colspan="3">010-280-2345</td>
		<th>이사회</th>
		<td><span class="Blue">세째주 수요일</span></td>
		<th>월례회</th>
		<td><span class="Blue">네째주 수요일</span></td>
	</tr>
	<tr>
		<th>팩스번호</th>
		<td colspan="2">052-333-3333</td>
		<th>메일</th>
		<td colspan="3">kjkk@hanmail.net</td>
		<th colspan="4">이사회</th>
	</tr>
	<tr>
		<th rowspan="2">회사슬로건<br />(영문)</th>
		<td colspan="6">참봉사 실천으로 신뢰받는 라이온스!</td>
		<td colspan="4" rowspan="5" class="innerTbl">
			<div class="innerTitle" style="border-bottom:1px solid #aaa;">
				<table>
				<colgroup>
					<col width="90px" />
					<col width="155px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>직책</th>
					<th>성명</th>
					<th>클럽/지구직책</th>
				</tr>
				</table>
			</div><!-- InnerTitle -->
			<div class="Inner">
				<table class="Scroll_Table">
				<colgroup>
					<col width="90px" />
					<col width="155px" />
					<col width="*" />
				</colgroup>
				<tr>
					<td>1부회장</td>
					<td>안기영</td>
					<td class="left">회원확장분과위원장</td>
				</tr>
				<tr>
					<td>2부회장</td>
					<td>안기영</td>
					<td class="left">회원확장분과위원장</td>
				</tr>
				<tr>
					<td>3부회장</td>
					<td>안기영</td>
					<td class="left">회원확장분과위원장</td>
				</tr>
				<tr>
					<td>총무</td>
					<td>안기영</td>
					<td class="left">회원확장분과위원장</td>
				</tr>
				<tr>
					<td>재무</td>
					<td>안기영</td>
					<td class="left">회원확장분과위원장</td>
				</tr>
				<tr>
					<td>1부회장</td>
					<td>안기영</td>
					<td class="left">회원확장분과위원장</td>
				</tr>
				</table>
			</div><!-- Inner -->
		</td>
	</tr>
	<tr><td colspan="6">THE LIONS PUTS THEORY INTO PRACTICE!</td></tr>
	<tr>
		<th>회원증감</th>
		<th>취임</th>
		<td class="right"><span class="Blue">94</span></td>
		<th>퇴임</th>
		<td class="right"><span class="Blue">96</span></td>
		<th>증감</th>
		<td class="right"><span class="Blue">2</span></td>
	</tr>
	<tr>
		<th colspan="7" class="wMM2">주요 활동내용</th>
	</tr>
	<tr>
		<td colspan="7" style="height:50px;padding:0;">
<textarea cols="50" rows="2" style="width:100%;border:0;height:50px;font-size:14px;color:#555">
  1. 소속클럽 활성화를 위해 클럽과 유대강화
  2. 장학회 활성화 노력
  3. 봉사활동 적극 참여
</textarea></td>
	</tr>
	<tr>
		<th colspan="7">클럽탄생</th>
		<th colspan="4">자매결연</th>
	</tr>
	<tr>
		<td colspan="7" class="innerTbl">
			<div class="innerTitle" style="border-bottom:1px solid #aaa;">
				<table>
				<colgroup>
					<col width="90px" />
					<col width="*" />
					<col width="90px" />
				</colgroup>
				<tr>
					<th>조직총회</th>
					<th>클럽명</th>
					<th>가이딩</th>
				</tr>
				</table>
			</div><!-- InnerTitle -->
			<div class="Inner">
				<table class="Scroll_Table">
				<colgroup>
					<col width="90px" />
					<col width="*" />
					<col width="90px" />
				</colgroup>
				<tr>
					<td>2006.06.07</td>
					<td class="left">울산MJF클럽</td>
					<td>김종비</td>
				</tr>
				<tr>
					<td>2012.11.03</td>
					<td class="left">울산MJF클럽</td>
					<td>이양규</td>
				</tr> 
				<tr>
					<td>2006.06.07</td>
					<td class="left">울산MJF클럽</td>
					<td>김종비</td>
				</tr>
				<tr>
					<td>2012.11.03</td>
					<td class="left">울산MJF클럽</td>
					<td>이양규</td>
				</tr>
				<tr>
					<td>2006.06.07</td>
					<td class="left">울산MJF클럽</td>
					<td>김종비</td>
				</tr>
				<tr>
					<td>2012.11.03</td>
					<td>울산설송클럽</td>
					<td>이양규</td>
				</tr>
				</table>
			</div><!-- Inner -->
		</td>
		<td colspan="4" class="innerTbl">
			<div class="innerTitle" style="border-bottom:1px solid #aaa;">
				<table>
				<colgroup>
					<col width="90px" />
					<col width="155px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>결연일자</th>
					<th>단체명</th>
					<th>지원내용</th>
				</tr>
				</table>
			</div><!-- InnerTitle -->
			<div class="Inner">
				<table class="Scroll_Table">
				<colgroup>
					<col width="90px" />
					<col width="155px" />
					<col width="*" />
				</colgroup>
				<tr>
					<td>2012.11.02</td>
					<td>대만클럽</td>
					<td class="left">매년방문교류</td>
				</tr>
				<tr>
					<td>2012.11.03</td>
					<td>울산대학병원</td>
					<td class="left">매년방문교류</td>
				</tr>
				<tr>
					<td>2012.11.02</td>
					<td>대만클럽</td>
					<td class="left">매년방문교류</td>
				</tr>
				<tr>
					<td>2012.11.03</td>
					<td>울산대학병원</td>
					<td class="left">매년방문교류</td>
				</tr>
				<tr>
					<td>2012.11.02</td>
					<td>대만클럽</td>
					<td class="left">매년방문교류</td>
				</tr>
				<tr>
					<td>2012.11.03</td>
					<td>울산대학병원</td>
					<td class="left">매년방문교류</td>
				</tr>
				</table>
			</div><!-- Inner -->
		</td>
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


<!-- 입력 폼  -->
<!-- <div class="table">
<h4>회원기본</h4>
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
	</div>
	<table class="wrtType1" summary="회원기본사항 안내표">
	<caption>회원기본사항</caption>
	<colgroup>
		<col width="115px" />
		<col width="55px" />
		<col width="60px" />
		<col width="55px" />
		<col width="60px" />
		<col width="55px" />
		<col width="60px" />
		<col width="115px" />
		<col width="*" />
		<col width="115px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>대표수장</th>
		<td colspan="8">
			<table>
			<tr>
				<td width="260px" class="border0 padding0"><input class="input" size="15" id="" name="" /></td>
				<td style="border-left:1px solid #ccc;border-right:0;border-bottom:0"><input class="input" size="15" id="" name="" /></td>
			</tr>
			</table>
		</td>
		<th>지구조직</th>
		<td><input class="input" size="15" id="" name="memNum" /></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td colspan="2"><input class="input" size="12" id="" name="" /></td>
		<th>휴대폰</th>
		<td colspan="3"><input class="input" size="25" id="" name="" /></td>
		<th>이사회</th>
		<td><input class="input" size="15" id="" name="" /></td>
		<th>월례회</th>
		<td><input class="input" size="15" id="" name="" /></td>
	</tr>
	<tr>
		<th>팩스번호</th>
		<td colspan="2"><input class="input" size="12" id="" name="" /></td>
		<th>메일</th>
		<td colspan="3"><input class="input" size="25" id="" name="" /></td>
		<th colspan="4">이사회</th>
	</tr>
	<tr>
		<th rowspan="2">회사슬로건<br />(영문)</th>
		<td colspan="6"><input class="input" size="40" id="" name="" /></td>
		<td colspan="4" rowspan="5" class="innerTbl" width="50%">
			<div class="InnerTitle">
				<table>
				<colgroup>
					<col width="120px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>직책</th>
					<th>성명</th>
					<th>클럽/지구직책</th>
				</tr>
				</table>
			</div>
			<div class="Inner">
				<table>
				<colgroup>
					<col width="120px" />
					<col width="100px" />
					<col width="*" />
				</colgroup>
				<tr>
					<td><input class="input" size="11" id="" name="" /></td>
					<td><input class="input" size="10" id="" name="" /></td>
					<td><input class="input" size="30" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="11" id="" name="" /></td>
					<td><input class="input" size="10" id="" name="" /></td>
					<td><input class="input" size="30" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="11" id="" name="" /></td>
					<td><input class="input" size="10" id="" name="" /></td>
					<td><input class="input" size="30" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="11" id="" name="" /></td>
					<td><input class="input" size="10" id="" name="" /></td>
					<td><input class="input" size="30" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="11" id="" name="" /></td>
					<td><input class="input" size="10" id="" name="" /></td>
					<td><input class="input" size="30" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="11" id="" name="" /></td>
					<td><input class="input" size="10" id="" name="" /></td>
					<td><input class="input" size="30" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="11" id="" name="" /></td>
					<td><input class="input" size="10" id="" name="" /></td>
					<td><input class="input" size="30" id="" name="" /></td>
				</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr><td colspan="6"><input class="input" size="40" id="" name="" /></td></tr>
	<tr>
		<th>회원증감</th>
		<th>취임</th>
		<td><input class="input" size="5" id="" name="" /></td>
		<th>퇴임</th>
		<td><input class="input" size="5" id="" name="" /></td>
		<th>증감</th>
		<td><input class="input" size="5" id="" name="" /></td>
	</tr>
	<tr>
		<th colspan="7">주요 활동내용</th>
	</tr>
	<tr>
		<td colspan="7">
			<textarea cols="50" rows="3"></textarea>
		</td>
	</tr>
	<tr>
		<th colspan="7">클럽탄생</th>
		<th colspan="4">자매결연</th>
	</tr>
	<tr>
		<td colspan="7" class="innerTbl">
			<div class="InnerTitle">
				<table>
				<colgroup>
					<col width="120px" />
					<col width="220px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>조직총회</th>
					<th>클럽명</th>
					<th>가이딩</th>
				</tr>
				</table>
			</div>
			<div class="Inner">
				<table>
				<colgroup>
					<col width="120px" />
					<col width="220px" />
					<col width="*" />
				</colgroup>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="12" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="12" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="12" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="12" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="12" id="" name="" /></td>
				</tr>
				</table>
			</div>
		</td>
		<td colspan="4" class="innerTbl">
			<div class="InnerTitle">
				<table>
				<colgroup>
					<col width="120px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>결연일자</th>
					<th>단체명</th>
					<th>지원내용</th>
				</tr>
				</table>
			</div>
			<div class="Inner">
				<table>
				<colgroup>
					<col width="120px" />
					<col width="200px" />
					<col width="*" />
				</colgroup>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="15" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="15" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="15" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="15" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="15" id="" name="" /></td>
				</tr>
				<tr>
					<td><input class="input" size="12" id="" name="" /></td>
					<td><input class="input" size="25" id="" name="" /></td>
					<td><input class="input" size="15" id="" name="" /></td>
				</tr>
				</table>
			</div> -->




