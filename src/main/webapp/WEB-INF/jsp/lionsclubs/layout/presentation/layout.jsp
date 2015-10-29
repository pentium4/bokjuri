<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>회의모드</title>
		
		<meta name="description" content="A jQuery library for modern HTML presentations">
		<meta name="author" content="Caleb Troughton">
		<meta name="viewport" content="width=1024, user-scalable=no">
		
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/mCustomScrollbar/jquery.mCustomScrollbar.css" />" type="text/css" />
		
		<!-- deck 웹 프레젠테이션 START -->
		<!-- Core and extension CSS files -->
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/core/deck.core.css" />" type="text/css" />
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/extensions/goto/deck.goto.css" />" type="text/css" />
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/extensions/menu/deck.menu.css" />" type="text/css" />
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/extensions/navigation/deck.navigation.css" />" type="text/css" />
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/extensions/status/deck.status.css" />" type="text/css" />
<%-- 		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/extensions/scale/deck.scale.css" />" type="text/css" /> --%>
		
		<!-- Style theme. More available in /themes/style/ or create your own. -->
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/themes/style/web-2.0.css" />" type="text/css" />
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/themes/style/custom.css" />" type="text/css" />
		
		<!-- Transition theme. More available in /themes/transition/ or create your own. -->
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/deck/themes/transition/horizontal-slide.css" />" type="text/css" />
		
		<!-- Basic black and white print styles -->
		<link rel="stylesheet" media="print" href="<c:url value="/css/lionsclubs/deck/core/print.css" />" type="text/css" />
		
		
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/tooltipster/tooltipster.css" />" type="text/css" />
		<link rel="stylesheet" media="screen" href="<c:url value="/css/lionsclubs/tooltipster/themes/tooltipster-deck-yellow.css" />" type="text/css" />		
		
		<!-- deck 웹 프레젠테이션 END -->
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/modernizr/modernizr.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/jquery-1.11.2.min.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/common.js" />"></script>
	</head>
	<body>
		<tiles:insertAttribute name="body" />
		
		<p class="deck-status" aria-role="status">
			<span id="requestfullscreen" style="cursor: pointer;">전체화면</span>
			<span id="exitfullscreen" style="display: none;cursor: pointer;">전체화면 닫기</span>
		</p>

		<script type="text/javascript" src="<c:url value="/js/lionsclubs/mCustomScrollbar/jquery.mCustomScrollbar.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/fullscreen/jquery.fullscreen-0.4.1.js" />"></script>
		
		<!-- deck 웹 프레젠테이션 START -->
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/script.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/core/deck.core.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/extensions/menu/deck.menu.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/extensions/goto/deck.goto.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/extensions/status/deck.status.js" />"></script>
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/extensions/navigation/deck.navigation.js" />"></script>
<%-- 		<script type="text/javascript" src="<c:url value="/js/lionsclubs/deck/extensions/scale/deck.scale.js" />"></script> --%>
		<!-- deck 웹 프레젠테이션 END -->
		
		<script type="text/javascript" src="<c:url value="/js/lionsclubs/tooltipster/jquery.tooltipster.js" />"></script>
		<!-- Initialize the deck. You can put this in an external file if desired. -->
		
		<script type="text/javascript">
			$(document).ready(function() {
				$.deck('.slide');
			
				$(".cscroll").mCustomScrollbar({
					theme:"inset-dark"
				});
				
				$(document).on("keypress", function(event){
					if ( event.which == 27 ) {
						$.fullscreen.exit();
						closeWin();
						event.preventDefault();
					}
				});
				
				// open in fullscreen
				$('#requestfullscreen').click(function() {
					$('body').fullscreen();
					return false;
				});
			
				// exit fullscreen
				$('#exitfullscreen').click(function() {
					$.fullscreen.exit();
					return false;
				});				
				
				// document's event
				$(document).on('fscreenchange', function(e, state, elem) {
					// if we currently in fullscreen mode
					if ($.fullscreen.isFullScreen()) {
						$('#requestfullscreen').hide();
						$('#exitfullscreen').show();
					} else {
						$('#requestfullscreen').show();
						$('#exitfullscreen').hide();
					}
			
					$('#state').text($.fullscreen.isFullScreen() ? '' : 'not');
				});
				
			 	$.deck('go', "${param.page}");
			 	
				/* title이 있는 모든곳에 tooltip 적용 */
				$("*[title]").each(function(){
					if(!$(this).prop("title").isEmpty()){
						$(this).tooltipster({
							contentAsHTML: true
						});
					}
				});
				
				// 스크롤바 유무 check
			    $.fn.hasVerticalScrollbar = function() {
			        // This will return true, when the div has vertical scrollbar
			        return this.get(0).scrollHeight > this.height();
			    };
			    
			    $.fn.hasHorizontalScrollbar = function() {
			        // This will return true, when the div has horizontal scrollbar
			        return this.get(0).scrollWidth > this.width();
			    };
			});
		</script>
	</body>
</html>