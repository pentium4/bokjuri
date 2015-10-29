<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<form:form modelAttribute="MM5_01VO">


<h3><div>근무자개인기본입력 </div></h3>
<jsp:include page="/WEB-INF/jsp/lionsclubs/include/sub_profile.jsp" /> 

<div class="table">
<h4>개인기본</h4>
	<div class="btnBox">
		<input type="image" src="/images/lionsclubs/btn/btn_edit.gif" alt="수정" style="width:57px" />
	</div>
	<div class="Height_1">
	<table class="tblType2" summary="회원기본사항 안내표">
	<caption>회원기본사항</caption>
	<colgroup>
		<col width="90px" />
		<col width="*" />
		<col width="90px" />
		<col width="200px" />
		<col width="90px" />
		<col width="90px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<th>주 소</th>
		<td colspan="4">울산광역시 남구 삼산동 182-1번지 아데라움아파트 108동 804호</td>
		<th>우편번호</th>
		<td>808-602</td>
	</tr>
	<tr>
		<th>휴대전화</th>
		<td colspan="3">010-9377-7777</td>
		<th colspan="3">담당클럽</th>
	</tr>
	<tr>
		<th>자택전화</th>
		<td colspan="3">052-280-1234</td>
		<td colspan="3" rowspan="11" class="innerTbl wMM1">
		<div class="innerBox">
			<div class="tblTitle Scroll_Title mT0">
				<table>
				<colgroup>
					<col width="90px" />
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<tr>
					<th class="bT0">클럽명</th>
					<th class="bT0">시작일</th>
					<th class="bT0 bR0">종료일</th>
				</tr>
				</table>
			</div><!-- InnerTitle -->
			<div class="Inner3">
				<table class="tblCenter Scroll_Table">
				<colgroup>
					<col width="90px" />
					<col width="*" />
					<col width="100px" />
				</colgroup>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				<tr>
					<td class="left">원클럽</td>
					<td>2011.07.01</td>
					<td>2012.06.30</td>
				</tr>
				</table>
			</div><!-- Inner -->
		</div><!-- InnerBox -->
		</td>
	</tr>
	<tr>
		<th>직장전화</th>
		<td colspan="3">052-280-1234</td>
	</tr>
	<tr>
		<th>메일주소</th>
		<td colspan="3">abcd@nate.com</td>
	</tr>
	<tr>
		<th>최종학력</th>
		<td colspan="3">대졸</td>
	</tr>
	<tr>
		<th>출신학교</th>
		<td colspan="3">한국대학교</td>
	</tr>
	<tr>
		<th>전공과목</th>
		<td colspan="3">기계공학과</td>
	</tr>
	<tr>
		<th>병역관계</th>
		<td colspan="3">군필</td>
	</tr>
	<tr>
		<th>취미활동</th>
		<td colspan="3">골프</td>
	</tr>
	<tr>
		<th>결혼여부</th>
		<td colspan="3">기혼</td>
	</tr>
	<tr>
		<th>추 천 자</th>
		<td>11대 지구 총재</td>
		<th>추천관계</th>
		<td>지인소개</td>
	</tr>
	<tr>
		<th>자녀</th>
		<td colspan="3">1남 1녀</td>
	</tr>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->
			
</form:form>