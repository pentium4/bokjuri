<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="lionsclubs.com.SM1.SM1_3.SM1_09.SM1_09VO" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%
List<SM1_09VO> headerMenuList = (List<SM1_09VO>)request.getAttribute("headerMenuList");
%>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		/*
		 *	비밀번호 변경팝업
		 */
		$("#password").click(function() {
			openPopup('<c:url value="/common/password/passwordPopup.do" />', 350, 200, 'password');
		});
		
		$("#reception").on("click", function(){
			openPopup('<c:url value="/MM7/MM7_1/MM7_01/receptionAlermPopup.do" />', 800, 600, 'receptionAlermPopup');
		});
	});
});
</script>
<div id="Header">
	<h1><a href="/main.do"><img src="/images/lionsclubs/logo.gif" alt="국제라이온스협회 업무통합관리시스템" /></a></h1>
	<div class="topBox">
		<div class="topmenu">
			<div class="top_btn">
				<ul>
					<!--
					<li><a href="../main/sitemap.jsp"><img src="/images/lionsclubs/top_sitemap.gif" alt="사이트맵" /></a></li>
					-->
					<li><a href="#" id="password"><img src="/images/lionsclubs/top_modify.gif" alt="비밀번호변경" /></a></li>
					<c:if test="${sessionChange eq 'Y' }">
						<li><a href="/login/sessionChangeLogout.do"><img src="/images/lionsclubs/btn/btn_session_chang_logout.png" alt="세션변경로그아웃" /></a></li>
					</c:if>
					<li><a href="/login/actionLogout.do?site_preference=mobile"><img src="/images/lionsclubs/top_logout.gif" alt="로그아웃" /></a></li>
				</ul>
			</div>
			<div class="top_name">
				<ul>
					<li>${name } : ${clubTitleName }</li>
					<li class="last">&nbsp;</li>
				</ul>
			</div>
			<div class="top_login">
				<ul>
					<c:if test="${newReceptionCount > 0 }">
						<li id="reception" class="pointer">읽지않은수신문서 : ${newReceptionCount }개</li>
					</c:if>
					<li>${districtName }</li>
					<li>${clubName }</li>
					<li>${id }</li>
				</ul>
			</div>
		</div>
	</div><!-- top -->

	<div id="GNB">
		<div>
			<ul>
				<%
		 			for(SM1_09VO vo : headerMenuList){
						int menuId = vo.getUiNo();
						String param = vo.getUrl().split("\\?").length > 1 ? "&menuId=" + menuId : "?menuId=" + menuId;
						out.print("<li><a href='" + vo.getUrl() + param + "'>" + vo.getTitle() + "</a></li>");
		 			}
				%>
			</ul>
		</div>
	</div>
</div><!--Header-->
