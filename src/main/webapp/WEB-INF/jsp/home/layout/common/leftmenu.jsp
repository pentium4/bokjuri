<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<div class="secondary">
	<div class="menuTitle">
		<img src="/images/home/leftmenu/leftMenuTitle${leftMenuTitle }.png">
	</div>
	
	<ul class="nav">
		<c:choose>
			<c:when test="${leftMenuTitle eq '01'}">
				<li><a href="/home/355d/intro/intro1.do">국제라이온스협회 창시자</a></li> 
				<li><a href="/home/355d/intro/intro2.do">국제라이온스협회 역사</a></li> 
				<li><a href="/home/355d/intro/intro3.do">협회의 목적/윤리강령</a></li> 
				<li><a href="/home/355d/intro/intro4.do">국제라이온스협회 상징</a></li> 
				<li><a href="/home/355d/intro/intro5.do">국제라이온스협회 현황</a></li> 
				<li><a href="/home/355d/intro/intro6.do">국제라이온스협회 기록실</a></li> 
				<li><a href="/home/355d/intro/intro7.do">레오클럽 소개</a></li> 
			</c:when>
			<c:when test="${leftMenuTitle eq '02'}">
				<li><a href="/home/355d/district/district1.do">총재인사말</a></li> 
				<li><a href="/home/355d/district/district2.do">연혁 및 현황</a></li> 
				<li><a href="/home/355d/district/district3.do">지구집행부 조직도</a></li> 
				<li><a href="/home/355d/district/district4.do">지구운영 계획안</a></li> 
				<li><a href="/home/355d/district/district5.do">행사 및 사업계획</a></li> 
				<li><a href="/home/355d/district/district6.do">지구별 위치도</a></li>
			</c:when>
			<c:when test="${leftMenuTitle eq '03'}">
				<li><a href="/home/355d/join/join1.do">회원자격과 가입,자격상실</a></li>
				<li><a href="/home/355d/join/join2.do">회원종류 및 회비안내</a></li>
				<li><a href="/home/355d/join/join3.do">전입과 전출</a></li>
			</c:when>
			<c:when test="${leftMenuTitle eq '04'}">
				<li><a href="/home/355d/schedule/schedule1.do">지구 행사일정</a></li> 
				<li><a href="/home/355d/schedule/schedule2.do">클럽 행사일정</a></li> 
			</c:when>
			<c:when test="${leftMenuTitle eq '05'}">
				<li><a href="/home/355d/photo/photo1.do">지구행사 갤러리</a></li>
				<li><a href="/home/355d/photo/photo2.do">클럽행사 갤러리</a></li>
				<li><a href="/home/355d/photo/photo3.do">지구행사 리스트</a></li>
				<li><a href="/home/355d/photo/photo4.do">클럽행사 리스트</a></li>
			</c:when>
		</c:choose>	
	</ul>
	<div class="menuTitle">
		<img src="/images/home/subMenuBottom.png">
	</div>	
	<div class="promo">
<!-- 		<img src="/images/home/subMenuBottom.png" /> -->
	</div>
</div>
