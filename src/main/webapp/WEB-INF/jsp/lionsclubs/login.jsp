<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=euc-kr"/>
<meta name="author" content="국제라이온스협회 업무통합관리시스템"/>
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
<meta name="keyword" content="국제라이온스협회 업무통합관리시스템"/>
<title>로그인ㅣ국제라이온스협회 업무통합관리시스템</title>

<link rel="stylesheet" href="/lions/css/fotorama.css" type="text/css" />

<style>
<!--
#loginWrap h1 img {
	float: left;
}

#loginWrap h1 div {
	min-width: 500px;
}
-->
</style>

<script type="text/javascript">
require(['jquery', 'jquery.cookie'], function () {
	$(document).ready(function () {
		init();		
	});
});

require(['init'], function () {
	$(document).ready(function () {
		var saveCookie = $.cookie('save') == 'true' ? true : false;
		$("#m_save").prop("checked", saveCookie);
		
		$("#m_save").on("click", function(){
			var saveCheck = $(this).prop("checked");
			$.cookie('save', saveCheck, {expires: 7});
			if(!saveCheck){
				$.removeCookie('idCookie');
			}
		});
	
		var idCookie = $.cookie('idCookie');
		$("#m_id").val(idCookie);
		
// 		$.support.cors = true;
		$.ajax({
			 dataType: "jsonp"
			,url: "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=PLVcKJG2xkxGnyfbpta_AxfyD3Pc9jUPkB&key=AIzaSyAFzioDZ0dCajIeeFugy1VxlBKiBG6w1rw"
			,success: function(data){
// 				console.log(data);
				var total = data.items.length;
		   		$.each(data.items, function(key, entry) {
		   			var title = entry.snippet.title;
		   			var videoid= entry.snippet.resourceId.videoId;
		   			
		   			$("#sildes").append("<div onclick=ytplayer('" + videoid + "') class='pointer' title='" + title + "'><img u='image' src='http://img.youtube.com/vi/" + videoid + "/default.jpg' /></div>");
		   			if(key == total - 1){
		   			    var options = {
		   				        $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
		   				        $AutoPlaySteps: 4,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
		   				        $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
		   				        $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1
		   				
		   				        $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
		   				        $SlideDuration: 160,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
		   				        $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
		   				        $SlideWidth: 100,                                   //[Optional] Width of every slide in pixels, default value is width of 'slides' container
		   				        //$SlideHeight: 150,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
		   				        $SlideSpacing: 3, 					                //[Optional] Space between each slide in pixels, default value is 0
		   				        $DisplayPieces: 4,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
		   				        $ParkingPosition: 0,                              //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
		   				        $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
		   				        $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
		   				        $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
		   				
		   				        $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
		   				            $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
		   				            $ChanceToShow: 0,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
		   				            $AutoCenter: 0,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
		   				            $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
		   				            $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
		   				            $SpacingX: 0,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
		   				            $SpacingY: 0,                                   //[Optional] Vertical space between each item in pixel, default value is 0
		   				            $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
		   				        },
		   				
		   				        $ArrowNavigatorOptions: {
		   				            $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
		   				            $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
		   				            $AutoCenter: 2,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
		   				            $Steps: 4                                       //[Optional] Steps to go for each navigation request, default value is 1
		   				        }
		   				    };
		   				
		   				    var jssor_slider1 = new $JssorSlider$("slider1_container", options);
		   				    //responsive code end	
		   			}
		   		});
			},
			error:function(request,status,error){
// 				alert("잘못된 동작 입니다.\n입력값을 확인하신 후 다시 입력 해주세요.");
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}	
		});		
	});
});

function saveIdCookie(){
	var saveCheck = $("#m_save").prop("checked");
	if(saveCheck){
		$.cookie('idCookie', $("#m_id").val(), {expires: 7});	
	} else {
		$.removeCookie('idCookie');
	}
}

function init() {
	if($.cookie('idCookie') != null){
		$("#m_pw").focus();
	} else {
		$("#m_id").focus();
	}
}

function actionLogin() {
	saveIdCookie();
	
    if($("#m_id").val() == "") {
        alert("아이디를 입력하세요.");
        $("#m_id").focus();
        return false;
    } else if ($("#m_pw").val() == "") {
        alert("비밀번호를 입력하세요.");
        $("#m_pw").focus();
        return;
    } else {
//         document.loginForm.action="<c:url value='/actionLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}

function ytplayer(videoid){
	$("#ytplayer").prop("src", "//www.youtube.com/embed/" + videoid + "?list=PLVcKJG2xkxGnyfbpta_AxfyD3Pc9jUPkB&listType=playlist&loop=1&autohide=1");	
}
</script>
</head>
<body>
<form name="loginForm" action ="<c:url value='/j_spring_security_check?site_preference=normal'/>" method="post">
	<div id="loginWrap">
		<h1>
			<img src="/images/lionsclubs/login_logo.gif" alt="국제라이온스협회 업무통합관리시스템" />
			<div style="font-size: 25px; margin-top: 5px; font-family: HY헤드라인M;">국제라이온스 협회 355-D(울산·양산)지구</div>
			<div style="font-size: 18px; margin: 10px 0 0 75px; color: #aaa; font-family: HY헤드라인M;">District 355-D(Ulsan·Yangsan) Lions International</div>
		</h1>
		<div class="login">
<!-- 			<iframe id="ytplayer" width="204" height="115" src="//www.youtube.com/embed/qAN3GC8ua8M?list=PLVcKJG2xkxGnyfbpta_AxfyD3Pc9jUPkB&autoplay=1&listType=playlist&loop=1&autohide=1" frameborder="0" allowfullscreen style="float: right; margin: 33px 31px 0 0; width: 204px; height: 115px;"></iframe> -->

			<iframe id="ytplayer" width="204" height="115" src="//www.youtube.com/embed/videoseries?list=PLVcKJG2xkxGnyfbpta_AxfyD3Pc9jUPkB&loop=1&autohide=1" frameborder="0" allowfullscreen style="float: right; margin: 33px 31px 0 0; width: 204px; height: 115px;"></iframe>

			<a href="/home/355d/home.do">
				<img src="/images/lionsclubs/quicklink_355d.png" alt="355d지구 홈페이지 바로가기" style="float: right; margin: 33px 31px 0 0; width: 204px; height: 115px;" />
			</a>
			
			<div style="clear: both; float: right; margin: 30px 328px 0 0; width: 204px; height: 115px;">
			    <!-- Jssor Slider Begin -->
			    <!-- You can move inline styles to css file or css block. -->
			    <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 520px; height: 110px; overflow: hidden;">
			        <!-- Loading Screen -->
			        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
			            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
			                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
			            </div>
			            <div style="position: absolute; display: block; background: url(/css/lionsclubs/jssor/img/loading.gif) no-repeat center center;
			                top: 0px; left: 0px;width: 100%;height:100%;">
			            </div>
			        </div>
			
			        <!-- Slides Container --> 
			        <div id="sildes" u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 520px; height: 110px; overflow: hidden;"></div>
			        
			        <!-- Bullet Navigator Skin Begin -->
			        <style>
			            /* jssor slider bullet navigator skin 03 css */
			            /*
			            .jssorb03 div           (normal)
			            .jssorb03 div:hover     (normal mouseover)
			            .jssorb03 .av           (active)
			            .jssorb03 .av:hover     (active mouseover)
			            .jssorb03 .dn           (mousedown)
			            */
			            .jssorb03 div, .jssorb03 div:hover, .jssorb03 .av
			            {
			                background: url(/css/lionsclubs/jssor/img/b03.png) no-repeat;
			                overflow:hidden;
			                cursor: pointer;
			            }
			            .jssorb03 div { background-position: -5px -4px; }
			            .jssorb03 div:hover, .jssorb03 .av:hover { background-position: -35px -4px; }
			            .jssorb03 .av { background-position: -65px -4px; }
			            .jssorb03 .dn, .jssorb03 .dn:hover { background-position: -95px -4px; }
			        </style>
			        <!-- bullet navigator container -->
			        <div u="navigator" class="jssorb03" style="position: absolute; bottom: 4px; right: 6px;">
			            <!-- bullet navigator item prototype -->
			            <div u="prototype" style="position: absolute; width: 21px; height: 21px; text-align:center; line-height:21px; color:white; font-size:12px;"><div u="numbertemplate"></div></div>
			        </div>
			        <!-- Bullet Navigator Skin End -->
			        
			        <!-- Arrow Navigator Skin Begin -->
			        <style>
			            /* jssor slider arrow navigator skin 03 css */
			            /*
			            .jssora03l              (normal)
			            .jssora03r              (normal)
			            .jssora03l:hover        (normal mouseover)
			            .jssora03r:hover        (normal mouseover)
			            .jssora03ldn            (mousedown)
			            .jssora03rdn            (mousedown)
			            */
			            .jssora03l, .jssora03r, .jssora03ldn, .jssora03rdn
			            {
			            	position: absolute;
			            	cursor: pointer;
			            	display: block;
			                background: url(/css/lionsclubs/jssor/img/a03.png) no-repeat;
			                overflow:hidden;
			            }
			            .jssora03l { background-position: -3px -33px; }
			            .jssora03r { background-position: -63px -33px; }
			            .jssora03l:hover { background-position: -123px -33px; }
			            .jssora03r:hover { background-position: -183px -33px; }
			            .jssora03ldn { background-position: -243px -33px; }
			            .jssora03rdn { background-position: -303px -33px; }
			        </style>
			        <!-- Arrow Left -->
			        <span u="arrowleft" class="jssora03l" style="width: 55px; height: 55px; top: 123px; left: 8px;">
			        </span>
			        <!-- Arrow Right -->
			        <span u="arrowright" class="jssora03r" style="width: 55px; height: 55px; top: 123px; right: 8px">
			        </span>
			        <!-- Arrow Navigator Skin End -->
			        <a style="display: none" href="http://www.jssor.com">javascript</a>
			    </div>
			    <!-- Jssor Slider End -->
			</div>


			<c:choose>
				<c:when test="${param.login_error eq 1 }">
					<div style="font-size: 25px; padding: 0 0 8px 10px; font-family: HY헤드라인M;">업무통합시스템</div>
					<div style="font-size: 20px; padding: 0 0 35px 12px; color: #aaa; font-family: HY헤드라인M;">Korea Internation Lions Club</div>
				
					<p class="txt" style="font-size: 20px; font-family: HY헤드라인M;">라이온스 행정업무관리 전산 시스템</p>
					<p class="error" id="err_common" style="color: red; margin: 0 0 10px 10px;">아이디 또는 비밀번호를 잘못 입력하셨습니다.</p>
				</c:when>
				<c:otherwise>
					<div style="font-size: 25px; padding: 0 0 8px 10px; font-family: HY헤드라인M;">업무통합시스템</div>
					<div style="font-size: 20px; padding: 0 0 60px 12px; color: #aaa; font-family: HY헤드라인M;">Korea Internation Lions Club</div>
				
					<p class="txt" style="font-size: 20px; font-family: HY헤드라인M;">라이온스 행정업무관리 전산 시스템</p>
				</c:otherwise>
			</c:choose>
			
			<div class="loginBox1 clfix">
				<div class="login_txt">
					<p>
						<img src="/images/lionsclubs/id.gif" alt="아이디" /> <input type="text" id="m_id" name="j_username" class="input" title="아이디" tabindex="1" value="" style="ime-mode:inactive;" />
					</p>
					<p>
						<img src="/images/lionsclubs/pw.gif" alt="비밀번호" /> <input type="password" id="m_pw" name="j_password" class="input" title="비밀번호" tabindex="2" value="" />
					</p>
					<p class="check mt20">
	                    <label for="m_save">아이디 저장</label>
	                    <input type="checkbox" id="m_save" title="아이디 저장" tabindex="3" />
	                </p>
				</div>
				<div class="btn" onclick="actionLogin()">
					<input type="image" id="m_login" src="/images/lionsclubs/btn_login.gif" alt="로그인" tabindex="4" onclick="return false;" />
				</div>
			</div><!-- loginBox1 -->

			<!-- 
			<div class="loginBox2">    
				<dl>
					<dt>아이디/비밀번호를 잊으셨나요?</dt>
					<dd><a href="/"><img src="/images/lionsclubs/btn_id.gif" alt="아이디찾기" /></a></dd>
					<dd><a href="/"><img src="/images/lionsclubs/btn_pw.gif" alt="비밀번호찾기" /></a></dd>
				</dl>
				<dl>
					<dt>아직 회원이 아니신가요?</dt>
					<dd><a href="/"><img src="/images/lionsclubs/btn_join.gif" alt="회원가입" /></a></dd>
				</dl>
			</div>
			-->
			<!-- loginBox2 -->
			<div style="width:960px; height:300px; margin:50px 0 80px 0;">
				<div style="height:340px; width:460px; background:#303338; float:left; padding:10px 5px 20px 5px; text-align:right; color:white">
					<span style="margin-right: 25%">■ 지구역사 ■</span><a href="/lions/history/catalog.html" target="_blank " style="font-size:12px; color:white">전체화면보기</a>
					<br/>
					<div class="fotorama" id="fotorama" data-height="340px" data-width="460px" data-max-width="460px" data-nav="false" data-auto="true" data-autoplay="true" data-autoplay="1500">
						<img src="/lions/history/catalog/20150529/1.JPG" />
						<img src="/lions/history/catalog/20150529/2.JPG"/>
						<img src="/lions/history/catalog/20150529/3.JPG"/>
						<img src="/lions/history/catalog/20150529/4.JPG"/>
						<img src="/lions/history/catalog/20150529/5.JPG"/>
						<img src="/lions/history/catalog/20150529/6.JPG"/>
						<img src="/lions/history/catalog/20150529/7.JPG"/>
						<img src="/lions/history/catalog/20150529/8.JPG"/>
						<img src="/lions/history/catalog/20150529/9.JPG"/>
						<img src="/lions/history/catalog/20150529/10.JPG"/>
						<img src="/lions/history/catalog/20150529/11.JPG"/>
						<img src="/lions/history/catalog/20150529/12.JPG"/>
						<img src="/lions/history/catalog/20150529/13.JPG"/>
						<img src="/lions/history/catalog/20150529/14.JPG"/>
						<img src="/lions/history/catalog/20150529/15.JPG"/>
						<img src="/lions/history/catalog/20150529/16.JPG"/>
						<img src="/lions/history/catalog/20150529/17.JPG"/>
						<img src="/lions/history/catalog/20150529/18.JPG"/>
						<img src="/lions/history/catalog/20150529/19.JPG"/>
						<img src="/lions/history/catalog/20150529/20.JPG"/>
						<img src="/lions/history/catalog/20150529/21.JPG"/>
						<img src="/lions/history/catalog/20150529/22.JPG"/>
						<img src="/lions/history/catalog/20150529/23.JPG"/>
						<img src="/lions/history/catalog/20150529/24.JPG"/>
						<img src="/lions/history/catalog/20150529/25.JPG"/>
						<img src="/lions/history/catalog/20150529/26.JPG"/>
						<img src="/lions/history/catalog/20150529/27.JPG"/>
						<img src="/lions/history/catalog/20150529/28.JPG"/>
						<img src="/lions/history/catalog/20150529/29.JPG"/>
						<img src="/lions/history/catalog/20150529/30.JPG"/>
						<img src="/lions/history/catalog/20150529/31.JPG"/>
						<img src="/lions/history/catalog/20150529/32.JPG"/>
						<img src="/lions/history/catalog/20150529/33.JPG"/>
						<img src="/lions/history/catalog/20150529/34.JPG"/>
						<img src="/lions/history/catalog/20150529/35.JPG"/>
						<img src="/lions/history/catalog/20150529/36.JPG"/>
						<img src="/lions/history/catalog/20150529/37.JPG"/>
						<img src="/lions/history/catalog/20150529/38.JPG"/>
						<img src="/lions/history/catalog/20150529/39.JPG"/>
						<img src="/lions/history/catalog/20150529/40.JPG"/>
						<img src="/lions/history/catalog/20150529/41.JPG"/>
						<img src="/lions/history/catalog/20150529/42.JPG"/>
						<img src="/lions/history/catalog/20150529/43.JPG"/>
						<img src="/lions/history/catalog/20150529/44.JPG"/>
						<img src="/lions/history/catalog/20150529/45.JPG"/>
						<img src="/lions/history/catalog/20150529/46.JPG"/>
						<img src="/lions/history/catalog/20150529/47.JPG"/>
						<img src="/lions/history/catalog/20150529/48.JPG"/>
						<img src="/lions/history/catalog/20150529/49.JPG"/>
						<img src="/lions/history/catalog/20150529/50.JPG"/>
						<img src="/lions/history/catalog/20150529/51.JPG"/>
						<img src="/lions/history/catalog/20150529/52.JPG"/>
						<img src="/lions/history/catalog/20150529/53.JPG"/>
						<img src="/lions/history/catalog/20150529/54.JPG"/>
						<img src="/lions/history/catalog/20150529/55.JPG"/>
						<img src="/lions/history/catalog/20150529/56.JPG"/>
						<img src="/lions/history/catalog/20150529/57.JPG"/>
						<img src="/lions/history/catalog/20150529/58.JPG"/>
						<img src="/lions/history/catalog/20150529/59.JPG"/>
						<img src="/lions/history/catalog/20150529/60.JPG"/>
						<img src="/lions/history/catalog/20150529/61.JPG"/>
						<img src="/lions/history/catalog/20150529/62.JPG"/>
						<img src="/lions/history/catalog/20150529/63.JPG"/>
						<img src="/lions/history/catalog/20150529/64.JPG"/>
						<img src="/lions/history/catalog/20150529/65.JPG"/>
						<img src="/lions/history/catalog/20150529/66.JPG"/>
						<img src="/lions/history/catalog/20150529/67.JPG"/>
						<img src="/lions/history/catalog/20150529/68.JPG"/>
						<img src="/lions/history/catalog/20150529/69.JPG"/>
						<img src="/lions/history/catalog/20150529/70.JPG"/>
						<img src="/lions/history/catalog/20150529/71.JPG"/>
						<img src="/lions/history/catalog/20150529/72.JPG"/>
						<img src="/lions/history/catalog/20150529/73.JPG"/>
						<img src="/lions/history/catalog/20150529/74.JPG"/>
						<img src="/lions/history/catalog/20150529/75.JPG"/>
						<img src="/lions/history/catalog/20150529/76.JPG"/>
						<img src="/lions/history/catalog/20150529/77.JPG"/>
						<img src="/lions/history/catalog/20150529/78.JPG"/>
						<img src="/lions/history/catalog/20150529/79.JPG"/>
						<img src="/lions/history/catalog/20150529/80.JPG"/>
						<img src="/lions/history/catalog/20150529/81.JPG"/>
						<img src="/lions/history/catalog/20150529/82.JPG"/>
						<img src="/lions/history/catalog/20150529/83.JPG"/>
						<img src="/lions/history/catalog/20150529/84.JPG"/>
						<img src="/lions/history/catalog/20150529/85.JPG"/>
						<img src="/lions/history/catalog/20150529/86.JPG"/>
						<img src="/lions/history/catalog/20150529/87.JPG"/>
						<img src="/lions/history/catalog/20150529/88.JPG"/>
						<img src="/lions/history/catalog/20150529/89.JPG"/>
						<img src="/lions/history/catalog/20150529/90.JPG"/>
						<img src="/lions/history/catalog/20150529/91.JPG"/>
						<img src="/lions/history/catalog/20150529/92.JPG"/>
						<img src="/lions/history/catalog/20150529/93.JPG"/>
						<img src="/lions/history/catalog/20150529/94.JPG"/>
						<img src="/lions/history/catalog/20150529/95.JPG"/>
						<img src="/lions/history/catalog/20150529/96.JPG"/>
						<img src="/lions/history/catalog/20150529/97.JPG"/>
						<img src="/lions/history/catalog/20150529/98.JPG"/>
						<img src="/lions/history/catalog/20150529/99.JPG"/>
						<img src="/lions/history/catalog/20150529/100.JPG"/>
						<img src="/lions/history/catalog/20150529/101.JPG"/>
						<img src="/lions/history/catalog/20150529/102.JPG"/>
						<img src="/lions/history/catalog/20150529/103.JPG"/>
						<img src="/lions/history/catalog/20150529/104.JPG"/>
						<img src="/lions/history/catalog/20150529/105.JPG"/>
						<img src="/lions/history/catalog/20150529/106.JPG"/>
						<img src="/lions/history/catalog/20150529/107.JPG"/>
						<img src="/lions/history/catalog/20150529/108.JPG"/>
						<img src="/lions/history/catalog/20150529/109.JPG"/>
						<img src="/lions/history/catalog/20150529/110.JPG"/>
						<img src="/lions/history/catalog/20150529/111.JPG"/>
						<img src="/lions/history/catalog/20150529/112.JPG"/>
						<img src="/lions/history/catalog/20150529/113.JPG"/>
						<img src="/lions/history/catalog/20150529/114.JPG"/>
						<img src="/lions/history/catalog/20150529/115.JPG"/>
						<img src="/lions/history/catalog/20150529/116.JPG"/>
						<img src="/lions/history/catalog/20150529/117.JPG"/>
						<img src="/lions/history/catalog/20150529/118.JPG"/>
						<img src="/lions/history/catalog/20150529/119.JPG"/>
						<img src="/lions/history/catalog/20150529/120.JPG"/>
						<img src="/lions/history/catalog/20150529/121.JPG"/>
						<img src="/lions/history/catalog/20150529/122.JPG"/>
						<img src="/lions/history/catalog/20150529/123.JPG"/>
						<img src="/lions/history/catalog/20150529/124.JPG"/>
						<img src="/lions/history/catalog/20150529/125.JPG"/>
					</div>
				</div>
				<div style="height:340px; width:460px; background:#303338; float:right; padding:10px 5px 20px 5px; text-align:right;">
					<span style="margin-right: 25%; color:white">■ 지구활동내역 ■</span><a href="/lions/activity/catalog.html" target="_blank " style="font-size:12px; color:white">전체화면보기</a>
					<br/>
					<div class="fotorama" id="fotorama" data-height="340px" data-width="460px" data-max-width="460px" data-nav="false" data-auto="true" data-autoplay="true" data-autoplay="1500">
						<img src="/lions/activity/catalog/20150529/1.JPG"/>
						<img src="/lions/activity/catalog/20150529/2.JPG"/>
						<img src="/lions/activity/catalog/20150529/3.JPG"/>
						<img src="/lions/activity/catalog/20150529/4.JPG"/>
						<img src="/lions/activity/catalog/20150529/5.JPG"/>
						<img src="/lions/activity/catalog/20150529/6.JPG"/>
						<img src="/lions/activity/catalog/20150529/7.JPG"/>
						<img src="/lions/activity/catalog/20150529/8.JPG"/>
						<img src="/lions/activity/catalog/20150529/9.JPG"/>
						<img src="/lions/activity/catalog/20150529/10.JPG"/>
						<img src="/lions/activity/catalog/20150529/11.JPG"/>
						<img src="/lions/activity/catalog/20150529/12.JPG"/>
						<img src="/lions/activity/catalog/20150529/13.JPG"/>
						<img src="/lions/activity/catalog/20150529/14.JPG"/>
						<img src="/lions/activity/catalog/20150529/15.JPG"/>
						<img src="/lions/activity/catalog/20150529/16.JPG"/>
						<img src="/lions/activity/catalog/20150529/17.JPG"/>
						<img src="/lions/activity/catalog/20150529/18.JPG"/>
						<img src="/lions/activity/catalog/20150529/19.JPG"/>
						<img src="/lions/activity/catalog/20150529/20.JPG"/>
						<img src="/lions/activity/catalog/20150529/21.JPG"/>
						<img src="/lions/activity/catalog/20150529/22.JPG"/>
						<img src="/lions/activity/catalog/20150529/23.JPG"/>
						<img src="/lions/activity/catalog/20150529/24.JPG"/>
						<img src="/lions/activity/catalog/20150529/25.JPG"/>
						<img src="/lions/activity/catalog/20150529/26.JPG"/>
						<img src="/lions/activity/catalog/20150529/27.JPG"/>
						<img src="/lions/activity/catalog/20150529/28.JPG"/>
						<img src="/lions/activity/catalog/20150529/29.JPG"/>
						<img src="/lions/activity/catalog/20150529/30.JPG"/>
						<img src="/lions/activity/catalog/20150529/31.JPG"/>
						<img src="/lions/activity/catalog/20150529/32.JPG"/>
						<img src="/lions/activity/catalog/20150529/33.JPG"/>
						<img src="/lions/activity/catalog/20150529/34.JPG"/>
						<img src="/lions/activity/catalog/20150529/35.JPG"/>
						<img src="/lions/activity/catalog/20150529/36.JPG"/>
						<img src="/lions/activity/catalog/20150529/37.JPG"/>
						<img src="/lions/activity/catalog/20150529/38.JPG"/>
						<img src="/lions/activity/catalog/20150529/39.JPG"/>
						<img src="/lions/activity/catalog/20150529/40.JPG"/>
						<img src="/lions/activity/catalog/20150529/41.JPG"/>
						<img src="/lions/activity/catalog/20150529/42.JPG"/>
						<img src="/lions/activity/catalog/20150529/43.JPG"/>
						<img src="/lions/activity/catalog/20150529/44.JPG"/>
						<img src="/lions/activity/catalog/20150529/45.JPG"/>
						<img src="/lions/activity/catalog/20150529/46.JPG"/>
						<img src="/lions/activity/catalog/20150529/47.JPG"/>
						<img src="/lions/activity/catalog/20150529/48.JPG"/>
						<img src="/lions/activity/catalog/20150529/49.JPG"/>
						<img src="/lions/activity/catalog/20150529/50.JPG"/>
						<img src="/lions/activity/catalog/20150529/51.JPG"/>
						<img src="/lions/activity/catalog/20150529/52.JPG"/>
						<img src="/lions/activity/catalog/20150529/53.JPG"/>
						<img src="/lions/activity/catalog/20150529/54.JPG"/>
						<img src="/lions/activity/catalog/20150529/55.JPG"/>
						<img src="/lions/activity/catalog/20150529/56.JPG"/>
						<img src="/lions/activity/catalog/20150529/57.JPG"/>
						<img src="/lions/activity/catalog/20150529/58.JPG"/>
						<img src="/lions/activity/catalog/20150529/59.JPG"/>
						<img src="/lions/activity/catalog/20150529/60.JPG"/>
						<img src="/lions/activity/catalog/20150529/61.JPG"/>
						<img src="/lions/activity/catalog/20150529/62.JPG"/>
						<img src="/lions/activity/catalog/20150529/63.JPG"/>
						<img src="/lions/activity/catalog/20150529/64.JPG"/>
						<img src="/lions/activity/catalog/20150529/65.JPG"/>
						<img src="/lions/activity/catalog/20150529/66.JPG"/>
						<img src="/lions/activity/catalog/20150529/67.JPG"/>
						<img src="/lions/activity/catalog/20150529/68.JPG"/>
						<img src="/lions/activity/catalog/20150529/69.JPG"/>
						<img src="/lions/activity/catalog/20150529/70.JPG"/>
						<img src="/lions/activity/catalog/20150529/71.JPG"/>
						<img src="/lions/activity/catalog/20150529/72.JPG"/>
						<img src="/lions/activity/catalog/20150529/73.JPG"/>
						<img src="/lions/activity/catalog/20150529/74.JPG"/>
						<img src="/lions/activity/catalog/20150529/75.JPG"/>
						<img src="/lions/activity/catalog/20150529/76.JPG"/>
						<img src="/lions/activity/catalog/20150529/77.JPG"/>
						<img src="/lions/activity/catalog/20150529/78.JPG"/>
						<img src="/lions/activity/catalog/20150529/79.JPG"/>
						<img src="/lions/activity/catalog/20150529/80.JPG"/>
						<img src="/lions/activity/catalog/20150529/81.JPG"/>
						<img src="/lions/activity/catalog/20150529/82.JPG"/>
						<img src="/lions/activity/catalog/20150529/83.JPG"/>
						<img src="/lions/activity/catalog/20150529/84.JPG"/>
						<img src="/lions/activity/catalog/20150529/85.JPG"/>
						<img src="/lions/activity/catalog/20150529/86.JPG"/>
						<img src="/lions/activity/catalog/20150529/87.JPG"/>
						<img src="/lions/activity/catalog/20150529/88.JPG"/>
						<img src="/lions/activity/catalog/20150529/89.JPG"/>
						<img src="/lions/activity/catalog/20150529/90.JPG"/>
						<img src="/lions/activity/catalog/20150529/91.JPG"/>
						<img src="/lions/activity/catalog/20150529/92.JPG"/>
						<img src="/lions/activity/catalog/20150529/93.JPG"/>
						<img src="/lions/activity/catalog/20150529/94.JPG"/>
						<img src="/lions/activity/catalog/20150529/95.JPG"/>
						<img src="/lions/activity/catalog/20150529/96.JPG"/>
						<img src="/lions/activity/catalog/20150529/97.JPG"/>
						<img src="/lions/activity/catalog/20150529/98.JPG"/>
						<img src="/lions/activity/catalog/20150529/99.JPG"/>
						<img src="/lions/activity/catalog/20150529/100.JPG"/>
						<img src="/lions/activity/catalog/20150529/101.JPG"/>
						<img src="/lions/activity/catalog/20150529/102.JPG"/>
						<img src="/lions/activity/catalog/20150529/103.JPG"/>
						<img src="/lions/activity/catalog/20150529/104.JPG"/>
						<img src="/lions/activity/catalog/20150529/105.JPG"/>
						<img src="/lions/activity/catalog/20150529/106.JPG"/>
						<img src="/lions/activity/catalog/20150529/107.JPG"/>
						<img src="/lions/activity/catalog/20150529/108.JPG"/>
						<img src="/lions/activity/catalog/20150529/109.JPG"/>
						<img src="/lions/activity/catalog/20150529/110.JPG"/>
						<img src="/lions/activity/catalog/20150529/111.JPG"/>
						<img src="/lions/activity/catalog/20150529/112.JPG"/>
						<img src="/lions/activity/catalog/20150529/113.JPG"/>
						<img src="/lions/activity/catalog/20150529/114.JPG"/>
						<img src="/lions/activity/catalog/20150529/115.JPG"/>
						<img src="/lions/activity/catalog/20150529/116.JPG"/>
						<img src="/lions/activity/catalog/20150529/117.JPG"/>
						<img src="/lions/activity/catalog/20150529/118.JPG"/>
						<img src="/lions/activity/catalog/20150529/119.JPG"/>
						<img src="/lions/activity/catalog/20150529/120.JPG"/>
						<img src="/lions/activity/catalog/20150529/121.JPG"/>
						<img src="/lions/activity/catalog/20150529/122.JPG"/>
						<img src="/lions/activity/catalog/20150529/123.JPG"/>
						<img src="/lions/activity/catalog/20150529/124.JPG"/>
						<img src="/lions/activity/catalog/20150529/125.JPG"/>
						<img src="/lions/activity/catalog/20150529/126.JPG"/>
						<img src="/lions/activity/catalog/20150529/127.JPG"/>
						<img src="/lions/activity/catalog/20150529/128.JPG"/>
						<img src="/lions/activity/catalog/20150529/129.JPG"/>
						<img src="/lions/activity/catalog/20150529/130.JPG"/>
						<img src="/lions/activity/catalog/20150529/131.JPG"/>
						<img src="/lions/activity/catalog/20150529/132.JPG"/>
						<img src="/lions/activity/catalog/20150529/133.JPG"/>
						<img src="/lions/activity/catalog/20150529/134.JPG"/>
						<img src="/lions/activity/catalog/20150529/135.JPG"/>
						<img src="/lions/activity/catalog/20150529/136.JPG"/>
						<img src="/lions/activity/catalog/20150529/137.JPG"/>
						<img src="/lions/activity/catalog/20150529/138.JPG"/>
						<img src="/lions/activity/catalog/20150529/139.JPG"/>
						<img src="/lions/activity/catalog/20150529/140.JPG"/>
						<img src="/lions/activity/catalog/20150529/141.JPG"/>
						<img src="/lions/activity/catalog/20150529/142.JPG"/>
						<img src="/lions/activity/catalog/20150529/143.JPG"/>
						<img src="/lions/activity/catalog/20150529/144.JPG"/>
						<img src="/lions/activity/catalog/20150529/145.JPG"/>
						<img src="/lions/activity/catalog/20150529/146.JPG"/>
						<img src="/lions/activity/catalog/20150529/147.JPG"/>
						<img src="/lions/activity/catalog/20150529/148.JPG"/>
						<img src="/lions/activity/catalog/20150529/149.JPG"/>
						<img src="/lions/activity/catalog/20150529/150.JPG"/>
						<img src="/lions/activity/catalog/20150529/151.JPG"/>
						<img src="/lions/activity/catalog/20150529/152.JPG"/>
						<img src="/lions/activity/catalog/20150529/153.JPG"/>
						<img src="/lions/activity/catalog/20150529/154.JPG"/>
						<img src="/lions/activity/catalog/20150529/155.JPG"/>
						<img src="/lions/activity/catalog/20150529/156.JPG"/>
						<img src="/lions/activity/catalog/20150529/157.JPG"/>
						<img src="/lions/activity/catalog/20150529/158.JPG"/>
						<img src="/lions/activity/catalog/20150529/159.JPG"/>
						<img src="/lions/activity/catalog/20150529/160.JPG"/>
						<img src="/lions/activity/catalog/20150529/161.JPG"/>
						<img src="/lions/activity/catalog/20150529/162.JPG"/>
						<img src="/lions/activity/catalog/20150529/163.JPG"/>
						<img src="/lions/activity/catalog/20150529/164.JPG"/>
						<img src="/lions/activity/catalog/20150529/165.JPG"/>
						<img src="/lions/activity/catalog/20150529/166.JPG"/>
						<img src="/lions/activity/catalog/20150529/167.JPG"/>
						<img src="/lions/activity/catalog/20150529/168.JPG"/>
						<img src="/lions/activity/catalog/20150529/169.JPG"/>
						<img src="/lions/activity/catalog/20150529/170.JPG"/>
						<img src="/lions/activity/catalog/20150529/171.JPG"/>
						<img src="/lions/activity/catalog/20150529/172.JPG"/>
						<img src="/lions/activity/catalog/20150529/173.JPG"/>
						<img src="/lions/activity/catalog/20150529/174.JPG"/>
						<img src="/lions/activity/catalog/20150529/175.JPG"/>
						<img src="/lions/activity/catalog/20150529/176.JPG"/>
						<img src="/lions/activity/catalog/20150529/177.JPG"/>
						<img src="/lions/activity/catalog/20150529/178.JPG"/>
						<img src="/lions/activity/catalog/20150529/179.JPG"/>
						<img src="/lions/activity/catalog/20150529/180.JPG"/>
						<img src="/lions/activity/catalog/20150529/181.JPG"/>
						<img src="/lions/activity/catalog/20150529/182.JPG"/>
						<img src="/lions/activity/catalog/20150529/183.JPG"/>
						<img src="/lions/activity/catalog/20150529/184.JPG"/>
						<img src="/lions/activity/catalog/20150529/185.JPG"/>
						<img src="/lions/activity/catalog/20150529/186.JPG"/>
						<img src="/lions/activity/catalog/20150529/187.JPG"/>
						<img src="/lions/activity/catalog/20150529/188.JPG"/>
						<img src="/lions/activity/catalog/20150529/189.JPG"/>
						<img src="/lions/activity/catalog/20150529/190.JPG"/>
						<img src="/lions/activity/catalog/20150529/191.JPG"/>
						<img src="/lions/activity/catalog/20150529/192.JPG"/>
						<img src="/lions/activity/catalog/20150529/193.JPG"/>
						<img src="/lions/activity/catalog/20150529/194.JPG"/>
						<img src="/lions/activity/catalog/20150529/195.JPG"/>
						<img src="/lions/activity/catalog/20150529/196.JPG"/>
						<img src="/lions/activity/catalog/20150529/197.JPG"/>
						<img src="/lions/activity/catalog/20150529/198.JPG"/>
						<img src="/lions/activity/catalog/20150529/199.JPG"/>
						<img src="/lions/activity/catalog/20150529/200.JPG"/>
						<img src="/lions/activity/catalog/20150529/201.JPG"/>
						<img src="/lions/activity/catalog/20150529/202.JPG"/>
						<img src="/lions/activity/catalog/20150529/203.JPG"/>
						<img src="/lions/activity/catalog/20150529/204.JPG"/>
						<img src="/lions/activity/catalog/20150529/205.JPG"/>
						<img src="/lions/activity/catalog/20150529/206.JPG"/>
						<img src="/lions/activity/catalog/20150529/207.JPG"/>
						<img src="/lions/activity/catalog/20150529/208.JPG"/>
						<img src="/lions/activity/catalog/20150529/209.JPG"/>
						<img src="/lions/activity/catalog/20150529/210.JPG"/>
						<img src="/lions/activity/catalog/20150529/211.JPG"/>
						<img src="/lions/activity/catalog/20150529/212.JPG"/>
						<img src="/lions/activity/catalog/20150529/213.JPG"/>
					</div>
				</div>
			</div>			
			<div class="copy">업무통합 시스템 적용 문의 TEL. 010-8131-8330 <a href="/login/actionMain.do?site_preference=mobile" class="button small">모바일 버전</a></div>
		</div><!-- login -->
	</div><!-- loginWrap -->
</form>
</body>
</html>

