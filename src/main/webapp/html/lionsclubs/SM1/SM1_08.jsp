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

<body onload="GLNB_Select(5,1,4)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>지구별 미 사용코드 설정</span></p> 
		</div>

<h3><div>지구별 미 사용코드 설정</div></h3>
<div class="table">
	<table class="tblType1" summary="지구별 미 사용코드 설정표" style="width:94%;">
	<caption>지구별 미 사용코드 설정</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td><input class="input" id="" size="12" value="355-D" style="vertical-align:top !important;margin-top:2px;" /> <select id="" name="" class="select" style="width:72.5%;vertical-align:top !important;margin-top:2px;">
				<option value="All" >355 직책</option>
				<option value="" >1050 직책</option>
			</select></td>
		<th>그룹코드</th>
		<td><select id="" name="" class="select" style="width:100%;">
				<option value="All" >1050 직책</option>
				<option value="" >1050 직책</option>
			</select>
		</td>
	</tr>
	</tbody>
	</table>
	<div class="btnBox"><input type="image" id="delete-user" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="margin-top:4px;width:57px" /></div>
</div>

<div class="table">
	<div class="tblTitle mT5 Scroll_Title">
	<table class="tblType2" summary="지구별 미 사용코드 설정표">
	<caption>지구별 미 사용코드 설정</caption>
	<colgroup>
		<col width="90px" />
		<col width="60px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th>코드</th>
		<th>미사용</th>
		<th>코드명칭</th>
		<th>등록일자</th>
		<th>수정일자</th>
		<th>순서</th>
		<th>옵션1</th>
		<th>옵션2</th>
		<th>옵션3</th>
		<th>코드 내용 설명</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="90px" />
		<col width="60px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
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







