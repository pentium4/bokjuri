<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>개인별권한관리</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,0,3)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>개인별권한관리</span></p> 
		</div>
		



<h3><div>개인별권한관리 </div></h3>
<jsp:include page="../include/sub_profile.jsp" />

<div class="table clfix">
	<div class="btnBox1">
		<a href="../include/sm1_3popup2.html" onclick="window.open(this.href,'popup','width=700,height=500'); return false;" title="새창">
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="width:57px" />
	</div>

	<div class="Height_1" style="width:100%">
	<div class="fL" style="width:49.5%;">
		<h4>조직권한 그룹
		<div class="fLBtn">
			<a href="../include/sm1_3popup2.html" onclick="window.open(this.href,'popup','width=700,height=500'); return false;" title="새창">
			<input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" /></a>
			<a href="../include/sm1_3popup2.html" onclick="window.open(this.href,'popup','width=700,height=500'); return false;" title="새창"><input type="image" src="/images/lionsclubs/btn/btn_set.gif" alt="적용" style="width:57px" /></a>
			<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
		</div>
		</h4>

		<div class="tblTitle Scroll_Title">
		<table class="tblType2_1" summary="권한그룹 선택표">
		<caption>권한그룹 선택</caption>
		<colgroup>
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tr>
			<th>권한그룹</th>
			<th class="bR0">권한그룹 명칭</th>
		</tr>
		</table>
		</div><!-- tblTitle -->
		<div class="tblInnerH1">
		<table id="grouplist" class="tblType2_1 Scroll_Table">
		<colgroup>
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
		<tr>
			<td>100</td>
			<td class="left">일반그룹</td>
		</tr>
		<tr>
			<td>200</td>
			<td class="left">일반그룹</td>
		</tr>
		<tr>
			<td>300</td>
			<td class="left">일반그룹</td>
		</tr>
		<tr>
			<td>100</td>
			<td class="left">일반그룹</td>
		</tr>
		<tr>
			<td>200</td>
			<td class="left">일반그룹</td>
		</tr>
		<tr>
			<td>300</td>
			<td class="left">일반그룹</td>
		</tr>
		</tbody>
		</table>
		</div><!-- tblInner -->
		
		<div class="H10"></div>
		<h4>추가권한 조직
		<div class="fLBtn">
			<a href="../include/sm1_3popup.html" onclick="window.open(this.href,'popup','width=700,height=480'); return false;" title="새창">
			<input type="image" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" /></a>
			<a href="../include/sm1_3popup.html" onclick="window.open(this.href,'popup','width=700,height=480'); return false;" title="새창">
			<input type="image" src="/images/lionsclubs/btn/btn_set.gif" alt="적용" style="width:57px" /></a>
			<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
		</div>
		</h4>
		<div class="tblTitle Scroll_Title">
		<table class="tblType2_1" summary="추가권한 조직표">
		<caption>추가권한 조직</caption>
		<colgroup>
			<col width="100px" />
			<col width="*" />
			<col width="60px" />
		</colgroup>
		<tr>
			<th>조직코드</th>
			<th>조직명칭</th>
			<th>선택</th>
		</tr>
		</table>
		</div><!-- tblTitle -->
		<div class="tblInnerH3">
		<table class="tblType2_1 Scroll_Table">
		<colgroup>
			<col width="100px" />
			<col width="*" />
			<col width="60px" />
		</colgroup>
		<tbody>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			<td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		<tr>
			<td>K10-000</td>
			<td class="left">354복합지구</td>
			 <td><input type="checkbox" id="" name="" /></td>
		</tr>
		</tbody>
		</table>
		</div><!-- tblInner -->
		
		<h4>추가권한 설정내용</h4>
		<textarea cols="" rows="" style="border:1px solid #aaa;width:99.8%;height:49px;"></textarea>
	</div><!-- fL -->
	
	<div class="fR" style="width:49.5%;">
		<h4>화면권한 부여</h4>
		<div class="tblTitle Scroll_Title">
		<table class="tblType2_1" summary="화면권한 부여표">
		<caption>화면권한 부여</caption>
		<colgroup>
			<col width="100px" />
			<col width="*" />
			<col width="60px" />
			<col width="60px" />
		</colgroup>
		<tr>
			<th>화면번호</th>
			<th>화면명</th>
			<th>입력</th>
			<th>조회</th>
		</tr>
		</table>
		</div><!-- tblTitle -->
		<div class="tblInnerH4">
		<table class="tblType2_1 Scroll_Table">
		<colgroup>
			<col width="100px" />
			<col width="*" />
			<col width="60px" />
			<col width="60px" />
		</colgroup>
		<tbody>
		<tr>
			<td>A01</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A02</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A03</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A04</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A05</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A06</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A07</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A08</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A09</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A10</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A11</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A12</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A11</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A12</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A11</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
			<td>A12</td>
			<td class="left">개인기본</td>
			<td>X</td>
			<td></td>
		</tr>
		<tr>
            <td>A12</td>
            <td class="left">개인기본</td>
            <td>X</td>
            <td></td>
        </tr>
        <tr>
            <td>A11</td>
            <td class="left">개인기본</td>
            <td>X</td>
            <td></td>
        </tr>
        <tr>
            <td>A12</td>
            <td class="left">개인기본</td>
            <td>X</td>
            <td></td>
        </tr>
		</tbody>
		</table>
		</div><!-- tblInner -->
	</div><!-- fL -->
				</div><!-- Height_1 -->
			</div><!-- table -->
			<h5><div>해당자료가 조회되었습니다.</div></h5>
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<!-- Wrap_Area -->
</body>
</html>





