<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<div id="content_body">
	<h2>본문</h2>
	
	<h3>시스템권한관리</h3>
	<div class="table">
		<table class="tblType1" summary="시스템권한관리 안내표">
			<caption>시스템권한관리</caption>
			<colgroup>
				<col width="100px" />
				<col width="*" />
				<col width="100px" />
				<col width="41%" />
			</colgroup>
			<tbody>
				<tr>
					<th>클럽코드</th>
					<td>분류코드</td>
					<th rowspan="2">조회선택</th>  
					<td rowspan="2">
						<label for="s1">권한그룹</label><input type="checkbox" id="s1" name="" value="" /> 권한그룹
						<label for="s2">권한조직</label><input type="checkbox" id="s2" name="" value="" /> 권한조직
						<label for="s3">화면권한</label><input type="checkbox" id="s3" name="" value="" /> 화면권한
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<a href=""><img src="/images/lionsclubs/sub/icon_pre.gif" alt="이전 년도" /></a> 
						<strong class="year">2013 ~ 2014</strong> 
						<a href=""><img src="/images/lionsclubs/sub/icon_next.gif" alt="다음 년도" /></a>
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4>시스템 관리자 조회</h4>
		<table class="tblType2" summary="시스템관리자 조회표">
			<caption>시스템 관리자 조회</caption>
			<colgroup>
				<col width="100px" />
				<col width="150px" />
				<col width="100px" />
				<col width="*" />
				<col width="150px" />
				<col width="150px" />
				<col width="100px" />
			</colgroup>
			<thead>
				<tr>
					<th>성명</th>
					<th>소속클럽</th>
					<th>클럽직책</th>
					<th>지구직책</th>
					<th>권한그룹</th>
					<th>권한조직</th>
					<th>화면권한</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="center">홍길동</td>
					<td>울산원클럽</td>
					<td class="center">회장</td>
					<td>국제친선위원장</td>
					<td>복합지구총재</td>
					<td>354복합지구</td>
					<td class="center">5</td>
				</tr>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td class="center">${list.name }</td>
						<td>${list.tel }</td>
						<td class="center">회장</td>
						<td>국제친선위원장</td>
						<td>복합지구총재</td>
						<td>354복합지구</td>
						<td class="center">5</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<center>
			<div>
				<ui:pagination paginationInfo = "${paginationInfo}" type="image" 	jsFunction="linkPage"/>
			</div>
		</center>
	</div><!-- table -->
	<!-- 본문 내용 끝 -->
</div><!-- content_body -->