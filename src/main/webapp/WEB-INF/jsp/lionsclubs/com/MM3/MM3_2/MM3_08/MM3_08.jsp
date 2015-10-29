<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<form:form modelAttribute="MM3_08VO">

<h3><div>클럽/지구행사 영상 </div></h3>
<div class="table">
	<table class="tblType1" summary="클럽/지구행사 영상표">
	<caption>클럽/지구행사 영상</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td>K26-067 원클럽
			<div class="arrow"><a href="/" title="이전 페이지"><img src="/images/lionsclubs/sub/icon_pre2.gif" alt="전" /></a> <a href="/" title="다음 페이지"><img src="/images/lionsclubs/sub/icon_next2.gif" alt="후" /></a></div></td>
		<th rowspan="2">조회구분</th>
		<td rowspan="2" class="LH">
			<label for="s1">회원번호</label><input type="checkbox" id="s1" name="" value="" /> 구분&nbsp;&nbsp;
			<label for="s2">직책순</label><input type="checkbox" id="s2" name="" value="" /> 행사 제목별
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
<div id="Scroll_Area" class="Height_1 mT0">
	<table class="tblPhoto">
	<tr>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
	</tr>
	<tr>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
	</tr>
	<tr>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
	</tr>
	<tr>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
		<td><p class="photo"><img src="/images/lionsclubs/noimg.gif" alt="이미지가 없습니다" /></p><p class="txt">거리청소<br />2013.07.01</p></td>
	</tr>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->

</form:form>