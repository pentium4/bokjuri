$(document).ready(function() {
	// 스크롤바 유무 check
	$.fn.hasVerticalScrollbar = function() {
	    // This will return true, when the div has vertical scrollbar
	    return this.get(0).scrollHeight > this.height();
	};
	
	$.fn.hasHorizontalScrollbar = function() {
	    // This will return true, when the div has horizontal scrollbar
	    return this.get(0).scrollWidth > this.width();
	};
	
	//스크롤 관련
	Scroll_Actrion();
	Scroll_Table1();
});

$(window).resize(function(){
	Scroll_Actrion();
	Scroll_Table1();
});

/* 전체화면 스크롤바 관련 스크립트 */
function Scroll_Actrion(){
	//Scroll 스크립트 #1
	var Scr_Size = $(window).height();
	
	$(".table").each(function(index){
		var table_title_Size = 0;
		var Height_1 = 0;
		
		$(this).find(".Height_0").each(function(){
			table_title_Size += $(this).outerHeight(true);
			
			Height_1 = Scr_Size - table_title_Size - 50;
		});
		
		$(this).find(".Height_1").each(function(){
			$(this).height(Height_1);
		});
	});
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
}