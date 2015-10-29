<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<form:form modelAttribute="MM3_06VO">

<h3><div>클럽/지구행사 입력 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽/지구행사 입력표">
	<caption>클럽/지구행사 입력</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="410px" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td>K26-067 원클럽
			<div class="arrow"><a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a> <a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a></div></td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 행사주관&nbsp;&nbsp;
			<label for="s2">직책순</label><input type="checkbox" id="s2" name="" value="" /> 행사일시별&nbsp;&nbsp;
			<label for="s3">현회원</label><input type="checkbox" id="s3" name="" value="" /> 행사명&nbsp;&nbsp;
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
<h4>클럽 및 지구행사 입력</h4>
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
		<col width="200px" />
		<col width="*" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<thead>
	<tr>
		<th>행사일자</th>
		<th>행사시간</th>
		<th>행사주관</th>
		<th>행사명</th>
		<th>행사내용 및 장소</th>
		<th>인원</th>
		<th>시간</th>
		<th>점수(M)</th>
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
		<col width="200px" />
		<col width="*" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
		<col width="80px" />
	</colgroup>
	<tbody>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">클럽</td>
		<td class="left">거리청소</td>
		<td class="left">깨끗한 거리 만들기</td>
		<td>11</td>
		<td>33</td>
		<td>15</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">클럽</td>
		<td class="left">거리청소</td>
		<td class="left">깨끗한 거리 만들기</td>
		<td>11</td>
		<td>33</td>
		<td>15</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">클럽</td>
		<td class="left">거리청소</td>
		<td class="left">깨끗한 거리 만들기</td>
		<td>11</td>
		<td>33</td>
		<td>15</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">클럽</td>
		<td class="left">거리청소</td>
		<td class="left">깨끗한 거리 만들기</td>
		<td>11</td>
		<td>33</td>
		<td>15</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">클럽</td>
		<td class="left">거리청소</td>
		<td class="left">깨끗한 거리 만들기</td>
		<td>11</td>
		<td>33</td>
		<td>15</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">클럽</td>
		<td class="left">거리청소</td>
		<td class="left">깨끗한 거리 만들기</td>
		<td>11</td>
		<td>33</td>
		<td>15</td>
		<td>☞</td>
	</tr>
	<tr>
		<td>2013.01.02</td>
		<td>09:00~12:00</td>
		<td class="left">클럽</td>
		<td class="left">거리청소</td>
		<td class="left">깨끗한 거리 만들기</td>
		<td>11</td>
		<td>33</td>
		<td>15</td>
		<td>☞</td>
	</tr>
	<tr>
		<th colspan="5">계</th>
		<th>84</th>
		<th>163</th>
		<th>95</th>
		<th></th>
	</tr>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>