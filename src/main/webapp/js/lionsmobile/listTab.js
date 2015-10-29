jQuery(function($){
	var tab = $('.listTab');
	tab.removeClass('jsOff');
	tab.css('height', tab.find('>ul>li>ul:visible').height()+40);
	function onSelectTab(){
		var t = $(this);
		var myClass = t.parent('li').attr('class');
		t.parents('.listTab:first').attr('class', 'listTab '+myClass);
		tab.css('height', t.next('ul').height()+40);
		return false;
	}
	tab.find('>ul>li>a').click(onSelectTab).focus(onSelectTab);
	
});