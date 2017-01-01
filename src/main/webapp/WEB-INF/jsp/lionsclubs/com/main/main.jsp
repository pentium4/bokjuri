<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="복주리 봉사단" />
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW" />
<meta name="keyword" content="복주리 봉사단" />
<title>복주리 봉사단</title>
<link rel="stylesheet" href="<c:url value="/css/lionsclubs/content_main.css" />" type="text/css" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		if (!isMobile()) { 
			if("${newReceptionCount}" > 0){
				openPopup('<c:url value="/MM7/MM7_1/MM7_01/receptionAlermPopup.do" />', 800, 600, 'receptionAlermPopup');
			}
		} 
	});
});
function openAnniversaryInfoPopup(kindCode, codeName){
	openPopup("/main/anniversaryInfoPopup.do?kindCode=" + kindCode + "&codeName=" + encodeURIComponent(codeName), '700', '500', "anniversaryInfoPopup");
}
</script>
</head>

<body>
	<div id="wrap">
		<table>
			<tr>
				<td class="content_left">
					<div class="logBox">
						<h3>${name  }</h3>
						<p><strong>${shortDistrictName }</strong><br />
						업무통합관리시스템에<br />오신것을 환영합니다.</p>
					</div>
					<div class="linkBox">
						<h3><img src="/images/lionsclubs/link_title.gif" alt="라이온스협회 홈페이지 연결" /></h3>
						<div class="link">
							<ul>
								<li><a href="http://www.lionsclubs.org" target="_blank">국제본부</a></li>
								<li><a href="http://www.korealionsclubs.org" target="_blank">한국연합회</a></li>
								<li><a href="http://www.lionpress.co.kr" target="_blank">THE LION지</a></li>
								<li><a href="http://www.lionsclub354a.org" target="_blank">354-A지구</a></li>
								<li><a href="http://www.lions354b.org" target="_blank">354-B지구</a></li>
								<li><a href="http://lions354c.com" target="_blank">354-C지구</a></li>
								<li><a href="http://www.lionsclub354d.or.kr" target="_blank">354-D지구</a></li>
								<li><a href="http://www.lc354e.com" target="_blank">354-E지구</a></li>
								<li><a href="http://www.354flions.or.kr" target="_blank">354-F지구</a></li>
								<li><a href="http://www.354g.org" target="_blank">354-G지구</a></li>
								<li><a href="http://www.lions354h.co.kr" target="_blank">354-H지구</a></li>
								<li><a href="http://www.lc355a.org" target="_blank">355-A지구 </a></li>
								<li><a href="http://www.lions355b1.com" target="_blank">355-B1지구</a></li>
								<li><a href="http://www.lions355b2.com" target="_blank">355-B2지구</a></li>
								<li><a href="http://www.lions355-b3.kr" target="_blank">355-B3지구</a></li>
								<li><a href="http://www.lions355-c.org" target="_blank">355-C지구</a></li>
								<li><a href="http://kilc.kr/home/355d/home.do" target="_blank">355-D지구</a></li>
								<li><a href="http://www.lions355e.org" target="_blank">355-E지구</a></li>
								<li><a href="http://www.lions356a.org" target="_blank">356-A지구</a></li>
								<li><a href="http://www.lions356-b.or.kr" target="_blank">356-B지구</a></li>
								<li><a href="http://www.356-clions.or.kr" target="_blank">356-C지구</a></li>
								<li><a href="http://www.lions356-d.or.kr" target="_blank">356-D지구</a></li>
								<li><a href="http://www.lions356-e.or.kr" target="_blank">356-E지구</a></li>
								<li><a href="http://www.lions356-f.or.kr" target="_blank">356-F지구</a></li>
							</ul>
						</div>
					</div>
				</td>
				<td style="width:100%;padding:20px;vertical-align:top;">
					<h2 class="blind">소식들</h2>
					<jsp:include page="/WEB-INF/jsp/lionsclubs/include/main_notice.jsp" />
				</td>
				<td class="content_right">
					<div class="quickBox">
						<h3><img src="/images/lionsclubs/quick_title.gif" alt="Quick Link" /></h3>
						<p><a href="/notice/notice.do?menuId=477"><img src="/images/lionsclubs/quick_ban1.gif" alt="Q&amp;A 질문과 답변" /></a></p>
						<p><a href="/notice/notice.do?menuId=574"><img src="/images/lionsclubs/quick_ban2.gif" alt="FAQ 자주묻는 질문" /></a></p>
						<p><a href="/notice/notice.do?menuId=419"><img src="/images/lionsclubs/quick_ban3.gif" alt="양식함 문서양식 모음" /></a></p>
					</div>
					<div class="aniBox">
						<h3><img src="/images/lionsclubs/ani_title.gif" alt="기념일" /></h3>
						<dl>
							<dt><c:out value="${lions:formatOrganCode(clubCode) }" /><br /><c:out value="${clubName }" /></dt>
							<c:forEach items="${anniversaryCountInfo}" var="list" varStatus="status">
							<dd class="pointer" onclick="openAnniversaryInfoPopup('<c:out value="${list.kindCode }" />','<c:out value="${list.codeName }" />')"><span class="day"><c:out value="${list.codeName }" /></span><span class="num"><fmt:formatNumber value="${list.cnt }" />명</span></dd>
							</c:forEach>
						</dl>
						<p><img src="/images/lionsclubs/ani_btm.gif" alt="축하해주세요" /></p>
						<p class="mT5">
							<a href="/login/actionMain.do?site_preference=mobile">
								<img src="/images/lionsclubs/btn/btn_mobile.png" alt="모바일 버전" />
							</a>
						</p>
					</div>
				</td>
			</tr>
		</table>
	</div><!-- wrap -->
</body>
</html>
