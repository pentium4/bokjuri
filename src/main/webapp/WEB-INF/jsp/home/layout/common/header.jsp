<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<style>
.header {
	position: relative;
}

.home {
	position: absolute;
	top: 40px;
	left: 50px;
	width: 165px;
	height: 60px;
}

.btnHome {
	position: absolute;
	top: 25px;
	left: 747px;
	width: 50px;
	height: 20px;
}

.btnLogin {
	position: absolute;
	top: 25px;
	left: 803px;
	width: 50px;
	height: 20px;
}

.btnContact {
	position: absolute;
	top: 25px;
	left: 859px;
	width: 50px;
	height: 20px;
}
</style>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$(".topMenu").on({
			click: function() {
// 				alert("click");
			}, mouseenter: function() {
				var $id = $(this).prop("id");
				$(".submenu ul").hide();
				$("." + $id).show();
			}, mouseleave: function() {
// 				alert("mouseleave");
			}
		});
		
		$(".home, .btnHome").on("click", function(){
			location.href = "/home/355d/home.do";
		});

		$(".btnLogin").on("click", function(){
			location.href = "/";
		});

		$(".btnContact").on("click", function(){
			location.href = "/";
		});
	});
});
</script>

<div class="header">
	<div class="home pointer"></div>
	<div class="btnHome pointer"></div>
	<div class="btnLogin pointer"></div>
	<div class="btnContact pointer"></div>
	
	<div class="mainmenu">
		<ul>
			<li id="01" class="topMenu"><a href="/home/355d/intro/intro1.do">국제라이온스협회소개</a></li>
			<li id="02" class="topMenu"><a href="/home/355d/district/district1.do">355-D지구소개</a></li>
			<li id="03" class="topMenu"><a href="/home/355d/join/join1.do">가입안내</a></li>
			<li id="04" class="topMenu"><a href="/home/355d/schedule/schedule1.do">행사일정</a></li>
			<li id="05" class="topMenu"><a href="/home/355d/photo/photo1.do">포토갤러리</a></li>
		</ul>
	</div>
	<div class="submenu">
		<ul class="01" style="display: none;">
			<li><a href="/home/355d/intro/intro1.do">협회창시자</a></li>
			<li><a href="/home/355d/intro/intro2.do">협회역사</a></li>
			<li><a href="/home/355d/intro/intro3.do">목적·윤리강령</a></li>
			<li><a href="/home/355d/intro/intro4.do">협회상징</a></li>
			<li><a href="/home/355d/intro/intro5.do">협회현황</a></li>
			<li><a href="/home/355d/intro/intro6.do">협회기록실</a></li>
			<li><a href="/home/355d/intro/intro7.do">레오클럽소개</a></li>
		</ul>
		<ul class="02" style="display: none;">
			<li><a href="/home/355d/district/district1.do">총재인사말</a></li>
			<li><a href="/home/355d/district/district2.do">연혁 및 현황</a></li>
			<li><a href="/home/355d/district/district3.do">지구집행부조직도</a></li>
			<li><a href="/home/355d/district/district4.do">지구운영계획안</a></li>
			<li><a href="/home/355d/district/district5.do">행사 및 사업계획</a></li>
			<li><a href="/home/355d/district/district6.do">지구별 위치도</a></li>
		</ul>
		<ul class="03" style="display: none;">
			<li><a href="/home/355d/join/join1.do">회원자격과 가입,자격상실</a></li>
			<li><a href="/home/355d/join/join2.do">회원종류 및 회비안내</a></li>
			<li><a href="/home/355d/join/join3.do">전입과 전출</a></li>
		</ul>
		<ul class="04" style="display: none;">
			<li><a href="/home/355d/schedule/schedule1.do">지구 행사일정</a></li>
			<li><a href="/home/355d/schedule/schedule2.do">클럽 행사일정</a></li>
		</ul>
		<ul class="05" style="display: none;">
			<li><a href="/home/355d/photo/photo1.do">지구행사 갤러리</a></li>
			<li><a href="/home/355d/photo/photo2.do">클럽행사 갤러리</a></li>
			<li><a href="/home/355d/photo/photo3.do">지구행사 리스트</a></li>
			<li><a href="/home/355d/photo/photo4.do">클럽행사 리스트</a></li>
		</ul>
	</div>
</div> 