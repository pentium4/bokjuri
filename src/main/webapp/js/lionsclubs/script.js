//GNB,LNB 버튼 퍼포먼스
$('#GNB li, #LNB li').hover(
   function() {
	   $(this).addClass('On');
   },
   function() {
	   $(this).removeClass('On');
   }
);

//LNB 리스트 최하단 border-none
$('#LNB div:last').css('border','none');

//LNB 기본동작
$('#LNB h3').click(function(){
	$('#LNB h3').removeClass('On');
	$('#LNB ul').css('display','none');
	$(this).addClass('On');
	$(this).parent('div').children('ul').css('display','block');
});
//LNB 숨기기
$('#LNB h1 img').click(function(){
	$('#LNB').css('width','12px');
	//
	$('#LNB > div').height($(window).height() - $('#Header').outerHeight(true));		/* 접을때 높이 다시 계산 */
	$('#LNB h1, #LNB > div > div').css('display','none');
	$('#LNB h2').css('display','block');
	Scroll_Table1();
});
$('#LNB h2 img').click(function(){
	$('#LNB').css('width','185px');
	$('#LNB h1, #LNB > div > div').css('display','block');
	$('#LNB h2').css('display','none');
	$('.Scroll_Title table').css('width','406px');
	Scroll_Table1();
});

require(['init'], function () {
	$(document).ready(function () {
		//스크롤 관련
		$('.Scroll_Table tr:odd').css('background','#efefef');
		Scroll_Actrion();
		Scroll_Table1();
	});
});	

$(window).resize(function(){
	Scroll_Actrion();
	Scroll_Table1();
});

/* LNB & GNB 동작성 스크립트 */
function GLNB_Select(GNum,HNum,LNum){
	$('#GNB li').eq(GNum).addClass('Select');
	$('#LNB h3').eq(HNum).addClass('On');
	$('#LNB h3').eq(HNum).parent('div').children('ul').css('display','block');
	$('#LNB h3').eq(HNum).parent('div').children('ul').children('li').eq(LNum).addClass('Select');
	
	var menu1 = $('#GNB li').eq(GNum).text();
	var menu2 = $('#LNB h3').eq(HNum).text();
	var menu3 = $('#LNB h3').eq(HNum).parent('div').children('ul').children('li').eq(LNum).text();
	
	$("#position p").html("HOME > " + menu1 + " > " + menu2 + " > " + "<span>" + menu3 + "</span>");
	$("#menuTitle").html(menu1);
}
/* 전체화면 스크롤바 관련 스크립트 */
function Scroll_Actrion(){
	//Scroll 스크립트 #1
	var Scr_Size = $(window).height();
	var Header_Size = $('#Header').outerHeight(true);
	var bottom_Size = $('#message').outerHeight(true);
	var home_path_Size = $("#position").outerHeight(true);
	
	var page_Size = 0;
	$(".pagination").each(function(){
		page_Size += $(this).outerHeight(true);
	});
	
	var title_Size = $(".table > h4").outerHeight(true) + $(".fL > h4").outerHeight(true);
	
	var table_title_Size = 0;
	$(".Height_0").each(function(){
		table_title_Size += $(this).outerHeight(true);
	});
	
	
	/*
	var Member_Size = $('#Contetns_Area h3').not(".Height_1 h3").outerHeight(true) +
					$('#Contetns_Area #position').not(".Height_1 #position").outerHeight(true) +
					$('#Contetns_Area table.tblType1').not(".Height_1 table.tblType1").outerHeight(true) + 
					$('#Contetns_Area h4').not(".Height_1 h4").outerHeight(true) + 
					$('#Contetns_Area h5').not(".Height_1 h5").outerHeight(true) + 
					$('#popup h3').not(".Height_1 h3").not(":hidden").outerHeight(true) +
					$('#popup h5').not(".Height_1 h5").not(":hidden").outerHeight(true) - ($(".dialog").length > 0 ? 4 : 0);
	*/
	
	var tableHeight = 0;
	$(".table").each(function(index){
		var height1Len = $(this).find(".Height_1").length;
		
		if(height1Len == 0){
			tableHeight += $(this).outerHeight(true);
		}
	});
	
	if(tableHeight == 0){
		tableHeight -= 3;
	}
	
	var Member_Size = $('#Contetns_Area h3').not(".Height_1 h3").outerHeight(true) + tableHeight;
	
	var Height_1 = Scr_Size - Header_Size - Member_Size - home_path_Size - bottom_Size - page_Size - title_Size - table_title_Size;
	
	var LNBTitle_Size = $('#LNB > p').outerHeight(true) + $('#LNB > h1').outerHeight(true);
	var LNB_Size = (Member_Size + Height_1 + bottom_Size + page_Size + title_Size + table_title_Size + home_path_Size) -  LNBTitle_Size;
	$('.Height_1').height(Height_1);
	$('.hm30').height(Height_1 - 30);
	
	$('#LNB > div').height(LNB_Size);
}

/* 중간테이블 같게 만들기 */
function Scroll_Table1(){
	$('.Scroll_Table').each(function(index){
		var Scroll_Area = $(this).width();
		
		$('.Scroll_Title thead').eq(index).closest('table').width(Scroll_Area);
		$('.Scroll_Title tfoot').eq(index).closest('table').width(Scroll_Area);
		
		var inner = $(this).closest('.Inner');
		if(inner.length > 0){
	 		if(inner.hasVerticalScrollbar()){
	 			var it = $(this).closest('.innerTbl');
	 			it.find('.innerTitle').css("margin-right", "17px");	
	 		}
		}
 	});
	
	if($('#Scroll_Area').length > 0){
		if($('#Scroll_Area').hasVerticalScrollbar()){
			$('.widthLong').css("margin-right", "17px");
		}
	}
}