<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>시스템권한그룹관리</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<link rel="stylesheet" href="/css/lionsclubs/content_sub.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body onload="GLNB_Select(5,0,1)">
	
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
			<p>HOME &gt; 개인기록관리 &gt; 입력 및 조회업무 &gt; <span>시스템권한그룹관리</span></p> 
		</div>


<h3><div>시스템권한그룹관리 </div></h3>
<div class="table"></div>
<div class="table clfix Height_1">
<div class="fL" style="position:relative;width:38%;margin-right:10px;">
	<h4>권한그룹 관리</h4>
	<div style="position:absolute;top:10px;right:0;z-index:1000">
		<input type="image" id="create-user" src="/images/lionsclubs/btn/btn_add.gif" alt="추가" style="width:57px" />
		<input type="image" id="update-user" src="/images/lionsclubs/btn/btn_set.gif" alt="적용" style="width:57px" />
		<input type="image" id="delete-user" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>

	<div class="tblTitle Scroll_Title">
	<table class="tblType2_1" summary="권한그룹 관리표">
	<caption>권한그룹 관리</caption>
	<colgroup>
		<col width="40px" />
		<col width="*" />

		<col width="110px" />
		<col width="40px" />
		<col width="40px" />
		<col width="40px" />
	</colgroup>
	<tr>
		<th rowspan="2">No</th>
		<th rowspan="2">그룹명</th>
		<th rowspan="2">권한조직</th>
		<th colspan="2">화면권한</th>
		<th rowspan="2">선택</th>
	</tr>
	<tr>
		<th>조회</th>
		<th>등록</th>
	</tr>
	</table>
	</div><!-- tblTitle -->
	<div class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="40px" />
		<col width="*" />
		<col width="110px" />
		<col width="40px" />
		<col width="40px" />
		<col width="40px" />
	</colgroup>
	<tbody>
	<tr>
		<td>1</td>
		<td class="left">일반그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>2</td>
		<td class="left">클럽총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>3</td>
		<td class="left">지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>4</td>
		<td class="left">지구총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>5</td>
		<td class="left">복합지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>복합지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>6</td>
		<td class="left">복합지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>복합지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>7</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>연합회</option>
		<option value="1">연합회</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>8</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>9</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>연합회</option>
		<option value="1">연합회</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>10</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>11</td>
		<td class="left">일반그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>12</td>
		<td class="left">클럽총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>13</td>
		<td class="left">지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>14</td>
		<td class="left">지구총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>15</td>
		<td class="left">복합지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>복합지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>16</td>
		<td class="left">복합지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>복합지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>17</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>연합회</option>
		<option value="1">연합회</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>18</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>19</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>연합회</option>
		<option value="1">연합회</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>20</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>21</td>
		<td class="left">일반그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>22</td>
		<td class="left">클럽총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>23</td>
		<td class="left">지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>24</td>
		<td class="left">지구총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>25</td>
		<td class="left">복합지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>복합지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>26</td>
		<td class="left">복합지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>복합지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>27</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>연합회</option>
		<option value="1">연합회</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>28</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>29</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>연합회</option>
		<option value="1">연합회</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>30</td>
		<td class="left">연합회A그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>31</td>
		<td class="left">일반그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>32</td>
		<td class="left">클럽총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>클럽</option>
		<option value="1">원클럽</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>33</td>
		<td class="left">지구그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>
		<td>34</td>
		<td class="left">지구총무그룹</td>
		<td><select class="input" name="" id="" style="width:90%;">
		<option value selected>지구</option>
		<option value="1">355-D지구</option>
	</select></td>
		<td>100</td>
		<td>10</td>
		<td><label for="">선택</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	</tbody>
	</table>
	</div>
</div><!-- fL -->

<div class="fL" style="width:30%;margin-right:10px;">
	<h4>화면권한</h4>
	<div class="innerTitle" style="border-bottom:1px solid #aaa;">
	<table class="tblType2" summary="화면권한 안내표">
	<caption>화면권한</caption>
	<colgroup>
		<col width="80px" />
		<col width="*" />
		<col width="40px" />
		<col width="40px" />
	</colgroup>
	<thead>
	<tr>
		<th>화면No</th>
		<th>화면명</th>
		<th>조회</th>
		<th>등록</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="80px" />
		<col width="*" />
		<col width="40px" />
		<col width="40px" />
	</colgroup>
	<tbody>
	<tr>	 
		<td>MM1_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_07</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_08</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_09</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_10</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_11</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_12</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_13</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	</tbody>
	</table>
	</div>
</div><!-- fL -->

<div class="fL" style="position:relative;width:30%;">
	<h4>권한그룹별 직책등록</h4>
	<div style="position:absolute;top:10px;right:0;z-index:1000">
		<input type="image" id="check-update" src="/images/lionsclubs/btn/btn_set.gif" alt="적용" style="width:57px" />
		<input type="image" id="check-delete" src="/images/lionsclubs/btn/btn_cancel.gif" alt="취소" style="width:57px" />
	</div>

	<div class="innerTitle" style="border-bottom:1px solid #aaa;">
	<table class="tblType2" summary="권한그룹별 직책등록표">
	<caption>권한그룹별 직책등록</caption>
	<colgroup>
		<col width="80px" />
		<col width="*" />
		<col width="40px" />
	</colgroup>
	<thead>
	<tr>
		<th>직책코드</th>
		<th>직책명</th>
		<th>선택</th>
	</tr>
	</thead>
	</table>
	</div>
	<div class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="80px" />
		<col width="*" />
		<col width="40px" />
	</colgroup>
	<tbody>
	<tr>	 
		<td>MM1_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_07</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_08</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_09</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_10</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_11</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_12</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_13</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_11</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_12</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_13</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_11</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_12</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_13</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_11</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_12</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM1_13</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_01</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_02</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_03</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_04</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_05</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	<tr>	 
		<td>MM2_06</td>
		<td class="left">- 개인기본사항</td>
		<td><label for="">개인기본사항</label><input type="checkbox" id="" name="" value="" /></td>
	</tr>
	</tbody>
	</table>
	</div>
</div><!-- fL -->

			</div><!-- table -->
			<h5><div>해당자료가 조회되었습니다.</div></h5>
		</div>
		<!-- //Contents_Table_area -->
	</div>
	<!-- Wrap_Area -->
</body>
</html>





