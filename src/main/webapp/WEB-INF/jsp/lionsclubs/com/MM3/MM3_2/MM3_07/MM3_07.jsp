<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<form:form modelAttribute="MM3_07VO">

<h3><div>클럽/지구행사 조회 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽/지구행사 조회표">
	<caption>클럽/지구행사 조회</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="410px" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td>K26-067 355-D지구
			<div class="arrow"><a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a> <a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a></div></td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">행사주관</label><input type="checkbox" id="s1" name="" value="" /> 행사주관&nbsp;&nbsp;
			<label for="s2">행사일시별</label><input type="checkbox" id="s2" name="" value="" /> 행사일시별&nbsp;&nbsp;
			<label for="s3">클럽별</label><input type="checkbox" id="s3" name="" value="" /> 클럽별&nbsp;&nbsp;
			<label for="s4">행사명</label><input type="checkbox" id="s4" name="" value="" /> 행사명
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
<h4>클럽 및 지구행사 조회</h4>
	<div class="btnBox">
		<a href="../include/mm3_6popup.html" onclick="window.open(this.href,'popup','width=700,height=445'); return false;" title="새창">
		<input type="image" src="/images/lionsclubs/btn/btn_input.gif" alt="입력" style="width:57px" /></a>
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
		<input type="image" src="/images/lionsclubs/btn/btn_del.gif" alt="삭제" style="width:57px" />
	</div>

	<div class="tblTitle Height_0 Scroll_Title">
	<table class="tblType2" summary="클럽 및 지구행사 입력 조회표">
	<caption>클럽 및 지구행사 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="100px" />
		<col width="150px" />
		<col width="*" />
		<col width="80px" />
	</colgroup>
	<thead>
	<tr>
		<th>시작일</th>
		<th>행사시간</th>
		<th>행사주관</th>
		<th>클럽명</th>
		<th>행사명</th>
		<th>행사내용 및 장소</th>
		<th>사진</th>
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
		<col width="100px" />
		<col width="150px" />
		<col width="*" />
		<col width="80px" />
	</colgroup>
	<tbody>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">지구</td>
		<td class="left">355-D지구</td>
		<td class="left">거리청소</td>
		<td>깨끗한 거리 만들기</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">지구</td>
		<td class="left">355-D지구</td>
		<td class="left">거리청소</td>
		<td>깨끗한 거리 만들기</td>
		<td>☞</td>
	</tr>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>