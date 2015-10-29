//rollover
$(document).ready(function() {
	var imgover = $(".imgover").size();
	var imgoveron = $(".imgoveron").size();
	
	if(imgover != 0) {
		$(".imgover").mouseover(function() {
			var overimg = $(this).find(">img")[0];
			
			//예외처리 (이미 on 되어있는 이미지 제외)
			var Dns;
			Dns = overimg.src;
			Dns = Dns.split("_on");
			Dns = Dns[1];
			if(Dns != ".gif") {
				overimg.src = overimg.src.replace(".gif", "_on.gif");
			}
		});
		$(".imgover").mouseout(function() {
			var overimg = $(this).find(">img")[0];
			overimg.src = overimg.src.replace("_on.gif", ".gif");
		});
		$(".imgover").focus(function() {
			var overimg = $(this).find(">img")[0];
			overimg.src = overimg.src.replace(".gif", "_on.gif");
			overimg.src = overimg.src.replace("_on_on.gif", "_on.gif");
		});
		$(".imgover").blur(function() {
			var overimg = $(this).find(">img")[0];
			overimg.src = overimg.src.replace("_on.gif", ".gif");
		});
	}
	if(imgoveron != 0) {
		var overonimg = $(".imgoveron").find(">img")[0];
		overonimg.src = overonimg.src.replace(".gif", "_on.gif");
	}
});

//rollover2
$(document).ready(function() {
	var imgover = $(".img2over").size();
	var imgoveron = $(".img2overon").size();
	
	if(imgover != 0) {
		$(".img2over").mouseover(function() {
			var overimg = $(this).find(">img")[0];
			
			//예외처리 (이미 on 되어있는 이미지 제외)
			var Dns;
			Dns = overimg.src;
			Dns = Dns.split("_on");
			Dns = Dns[1];
			if(Dns != ".gif") {
				overimg.src = overimg.src.replace(".gif", "_on.gif");
			}
		});
		$(".img2over").mouseout(function() {
			var overimg = $(this).find(">img")[0];
			overimg.src = overimg.src.replace("_on.gif", ".gif");
		});
		$(".img2over").focus(function() {
			var overimg = $(this).find(">img")[0];
			overimg.src = overimg.src.replace(".gif", "_on.gif");
			overimg.src = overimg.src.replace("_on_on.gif", "_on.gif");
		});
		$(".img2over").blur(function() {
			var overimg = $(this).find(">img")[0];
			overimg.src = overimg.src.replace("_on.gif", ".gif");
		});
	}
	if(imgoveron != 0) {
		var overonimg = $(".img2overon").find(">img")[0];
		overonimg.src = overonimg.src.replace(".gif", "_on.gif");
	}
});

//select box
function goSelectUrl(num){
	obj = document.getElementById(num);
	if(obj.value == '' || obj.value == 'total'){
	}else{
		window.open(obj.value);
		//location.href = obj.value;
	}
}

//topmenu
var old_sel = ""; //이전 선택메뉴의 서브메뉴
var old_img = ""; //이전 선택메뉴의 이미지
function topMenu(num) {
	jQuery("#tm > li > ul").hide();
	
	if(num != null) { //처음 선택된 메뉴
		if( $(".submenu"+num).size() != 0 ) { //자식이 있을때만 실행
			old_sel = $(".submenu"+num);
			old_img = $(".submenu"+num).parent().find("img")[0];
			old_sel.show();
			old_img.src = old_img.src.replace(".gif", "_on.gif");
		} else { //자식이 없을때만 실행
			old_img = $("#tm > li").eq(num-1).find("img")[0];
			old_img.src = old_img.src.replace(".gif", "_on.gif");
			old_sel = $(".submenu0"); //if(!old_sel) 회피용
		}
	}
	
	$("#tm > li > a").mouseover(function() {
		var sel = $(this).parent().find(">ul"); //현재 선택메뉴의 서브메뉴
		var oneimg = $(this).find(">img")[0]; //현재 선택메뉴의 이미지
		
		if(!old_sel) { //old_sel 이 값이 없을때(아무것도 선택되지 않은 초기값을 위해)

		} else { //old_sel 이 값이 있을때
			old_sel.hide();
			old_img.src = old_img.src.replace("_on.gif", ".gif");
		}
		
		if(sel.size() != 0){ //자식이 있을때만 실행
			sel.show();
			//sel.slideDown(1000);
		}
		oneimg.src = oneimg.src.replace(".gif", "_on.gif");
		
		old_sel = sel;
		old_img = oneimg;
		return false;
	});
	
	$("#tm > li > a").focus(function() {
		var sel = $(this).parent().find(">ul");
		var oneimg = $(this).find(">img")[0];
		
		if(!old_sel) {

		} else {
			old_sel.hide();
			old_img.src = old_img.src.replace("_on.gif", ".gif");
		}
		
		if(sel.size() != 0){
			sel.show();
		}
		oneimg.src = oneimg.src.replace(".gif", "_on.gif");
		
		old_sel = sel;
		old_img = oneimg;
		return false;
	});
}

//검색 인풋 스타일
function serInput(){
	$("#sertxt").val("어떤 정보가 필요하신가요?");
			
	$("#sertxt").click(function() {
		$("#sertxt").val("");
	});
	$("#sertxt").focus(function() {
		$("#sertxt").val("");
	});
}

//글로벌 선택박스
function globalSel() {
	//초기값
	$(".lang_sel").hide();
	$(".lang_sel").css("right", "0px");
	$(".lang_sel").css("top", "18px");
	
	//다국어 mouseover
	$(".lang_toggle").mouseover(function(){
		$(".lang_sel").show();
	});
	$(".lang_sel").hover(function(){$(".lang_sel").show();},function(){$(".lang_sel").hide();});
	
	//다국어 focus
	$(".lang_toggle").focus(function(){
		$(".lang_sel").show();
	});
	$(".lang_sel > li > a:last").blur(function(){
		$(".lang_sel").hide();
	});	
}

//전체메뉴보기
var site_visible = 1;
function siteToggle() {
	//초기값
	$(".sitebox").css("position", "absolute");
	$(".sitebox").css("left", "0px");
	$(".sitebox").css("top", "105px");
	
	if(site_visible == 0) {
		if( navigator.appName.indexOf("Microsoft") > -1 && navigator.appVersion.indexOf("MSIE 6") > -1 ){ // 마이크로소프트 익스플로러이면서 버전 6인지 확인
			$(".sitebox").hide();
		} else {
			$(".sitebox").slideUp(500);
		}
		$(".site_btn > a > img").attr("src", "/images/potal/common/site_btn_open.gif");
		$(".site_btn > a > img").attr("alt", "전체메뉴보기");	
		site_visible = 1;
	} else {
		if( navigator.appName.indexOf("Microsoft") > -1 && navigator.appVersion.indexOf("MSIE 6") > -1 ){
			$(".sitebox").show();
		} else {
			$(".sitebox").slideDown(500);
		}
		$(".site_box").css("top", "115px");
		$(".site_btn > a > img").attr("src", "/images/potal/common/site_btn_close.gif");
		$(".site_btn > a > img").attr("alt", "전체메뉴닫기");		
		site_visible = 0;
	}
}

//앱버전 보기
var app_visible = 1;
function appToggle() {
	//초기값
	$(".appBox").css("position", "absolute");
	$(".appBox").css("left", "0px");
	$(".appBox").css("top", "19px");
	
	if(app_visible == 0) {
		if( navigator.appName.indexOf("Microsoft") > -1 && navigator.appVersion.indexOf("MSIE 6") > -1 ){ // 마이크로소프트 익스플로러이면서 버전 6인지 확인
			$(".appBox").hide();
			$(".msel").show();
		} else {
			$(".appBox").slideUp(500);
		}		
		$(".mapp").css("background", "url(/images/potal/main/app_open_bg.gif) no-repeat center top");
		$(".mapp > strong > a > img").attr("src", "/images/potal/main/app_open.gif");
		$(".mapp > strong > a > img").attr("alt", "앱버전 보기");	
		app_visible = 1;
	} else {
		if( navigator.appName.indexOf("Microsoft") > -1 && navigator.appVersion.indexOf("MSIE 6") > -1 ){
			$(".appBox").show();
			$(".msel").hide(); //컨텐츠의 selectbox 그룹 보이지 않기
		} else {
			$(".appBox").slideDown(500);
		}		
		$(".mapp").css("background", "url(/images/potal/main/app_close_bg.gif) no-repeat center top");
		$(".mapp > strong > a > img").attr("src", "/images/potal/main/app_close.gif");
		$(".mapp > strong > a > img").attr("alt", "앱버전 닫기");		
		app_visible = 0;
	}
}// 2012-11-08 웹접근성 때문에 메인팝업을 수정함 (HGH)//메인 팝업var old_pop_count = 1;var control = true;function popTime(sel){	var timegap = 7000;		var num = $(".popimg_wrap > div").length;	//초기설정	$(".mpop").css("height", "129px");	$(".mpop").css("padding-bottom", "0px");	$(".popimg_wrap > li").css("position", "absolute");	$(".popimg_wrap > li").css("left", "0px");	$(".popimg_wrap > li").css("top", "0px");	$(".pop_control").css("position", "absolute");	$(".pop_control").css("right", "0px");	$(".pop_control").css("top", "6px");	if(num > 1) { //팝업 갯수가 하나 일때는 자동재생 실행 안됨		id = setInterval(rotation, timegap);	}	function rotation() {		if (sel == num) {			sel = 1;		} else {			sel++;		}				mainPop(sel);	}		popPrev = function(){		clearInterval(id);		if (sel == 1) {			sel = num;		} else {			sel--;		}		mainPop(sel);	};		popNext = function(){		clearInterval(id);		if (sel == num) {			sel = 1;		} else {			sel++;		}		mainPop(sel);	};		popPlay = function(){				if(control == false) {			sel = old_pop_count;			id = setInterval(rotation, timegap);			$(".playimg")[0].src = $(".playimg")[0].src.replace(".gif", "_on.gif");			$(".stopimg")[0].src = $(".stopimg")[0].src.replace("_on.gif", ".gif");			control = true;		}	};	popStop = function(){					if(control == true) {			clearInterval(id);			$(".playimg")[0].src = $(".playimg")[0].src.replace("_on.gif", ".gif");			$(".stopimg")[0].src = $(".stopimg")[0].src.replace(".gif", "_on.gif");			control = false;		}	};}function mainPop(sel){	clearInterval(id);	var old_issue = $(".popimg"+old_pop_count);		var new_issue = $(".popimg"+sel);		$(old_issue).fadeOut(0);	$(new_issue).fadeIn(500);	old_pop_count = sel;	if(control == true) {				popTime(sel);	}	}// 이하 메인 팝업 관련 원본소스
//메인 팝업
/*var old_pop_count = 1;var control = true;
function popTime(sel){	var timegap = 10000;		var num = $(".pop_num>li").length;
	//초기설정	$(".mpop").css("height", "129px");	$(".mpop").css("padding-bottom", "0px");	$(".popimg_wrap > li").css("position", "absolute");	$(".popimg_wrap > li").css("left", "0px");	$(".popimg_wrap > li").css("top", "27px");	$(".pop_control").css("position", "absolute");	$(".pop_control").css("right", "0px");	$(".pop_control").css("top", "6px");
	if(num > 1) { //팝업 갯수가 하나 일때는 자동재생 실행 안됨		id = setInterval(rotation, timegap);	}	function rotation() {		if (sel == num) {			sel = 1;				} else {			sel++;		}
		mainPop(sel);	}
	popPlay = function(){				if(control == false) {			sel = old_pop_count;			id = setInterval(rotation, timegap);			$(".playimg")[0].src = $(".playimg")[0].src.replace(".gif", "_on.gif");			$(".stopimg")[0].src = $(".stopimg")[0].src.replace("_on.gif", ".gif");			control = true;		}	}
	popStop = function(){					if(control == true) {			clearInterval(id);			$(".playimg")[0].src = $(".playimg")[0].src.replace("_on.gif", ".gif");			$(".stopimg")[0].src = $(".stopimg")[0].src.replace(".gif", "_on.gif");			control = false;		}	}
}
function mainPop(sel){	clearInterval(id);
	var old_issue = $(".popimg"+old_pop_count);		var old_img = $(".numimg"+old_pop_count);	var old_src = $(".numimg"+old_pop_count).attr("src");
	var new_issue = $(".popimg"+sel);		var new_img = $(".numimg"+sel);	var new_src = $(".numimg"+sel).attr("src");
	$(old_issue).fadeOut(500);	$(old_img)[0].src = $(old_img)[0].src.replace("_on.gif", ".gif");
	$(new_issue).fadeIn(500);	$(new_img)[0].src = $(new_img)[0].src.replace(".gif", "_on.gif");
	old_pop_count = sel;
	if(control == true) {				popTime(sel);	}	}*/

//notice
var old_tab = 1;
function mainNotice(tab) {	
	//초기설정
	$(".noticeBox > ul > li").css("float", "left");
	$(".noticeBox").css("height", "123px");
	$(".tabcon").css("position", "absolute");
	$(".tabcon").css("display", "none");
	$(".tabcon").css("left", "0px");
    $(".tabcon").css("top", "33px");
	$(".tabmore").css("position", "absolute");
	$(".tabmore").css("display", "none");
	
	var old_img = $(".main_notice"+old_tab);
	var old_content = $(".tabcon"+old_tab);
	var old_more = $(".tabmore"+old_tab);
	
	var new_img = $(".main_notice"+tab);
	var new_content = $(".tabcon"+tab);
	var new_more = $(".tabmore"+tab);
	
	$(old_img)[0].src = $(old_img)[0].src.replace("_on.gif", ".gif");
	$(old_content).hide();
	$(old_more).hide();
	
	$(new_img)[0].src = $(new_img)[0].src.replace(".gif", "_on.gif");
	$(new_content).show();
	$(new_more).show();

	old_tab = tab;
}

//news
var old_news = 1;
function mainNews(news) {	
	//초기설정
	$(".newsBox > ul > li").css("float", "left");
	$(".newsBox").css("height", "123px");
	$(".tabnews").css("position", "absolute");
	$(".tabnews").css("display", "none");
	$(".tabnews").css("left", "0px");
    $(".tabnews").css("top", "33px");
	$(".newsmore").css("position", "absolute");
	$(".newsmore").css("display", "none");
	
	var old_img = $(".main_news"+old_news);
	var old_content = $(".tabnews"+old_news);
	var old_more = $(".newsmore"+old_news);
	
	var new_img = $(".main_news"+news);
	var new_content = $(".tabnews"+news);
	var new_more = $(".newsmore"+news);
	
	$(old_img)[0].src = $(old_img)[0].src.replace("_on.gif", ".gif");
	$(old_content).hide();
	$(old_more).hide();
	
	$(new_img)[0].src = $(new_img)[0].src.replace(".gif", "_on.gif");
	$(new_content).show();
	$(new_more).show();

	old_news = news;
}


function resizeHeight(id) {
	  var the_height = document.getElementById(id).contentWindow.document.body.scrollHeight;
	  document.getElementById(id).height = the_height + 30;
	  $(".coniframe").contents().find("body").css("overflow","hidden");
}
