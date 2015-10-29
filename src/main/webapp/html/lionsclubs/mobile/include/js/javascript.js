/* GNB : Navigation */

function gnbSet(param, gnbIndex){
	var gnb = $(param);
	gnb.find('ul').hide();
	gnb.find(gnbIndex + ' > ul').show().find('li:first').addClass('first').parent().find('li:last').addClass('last');;
	gnb.find('> li > a').bind('mouseenter keyup',function(){
		var t = $(this);
		gnb.find('ul').hide();
		t.parent('li').find('ul').show().find('li:first').addClass('first').parent().find('li:last').addClass('last');
		return false;
	});
	/*
	gnb.find('ul').bind('mouseout keydown',function(){
		var t = $(this);
		gnb.find('ul').hide(0);
	});
	gnb.find('ul').bind('mouseover keyup',function(){
		var t = $(this);
		t.show();
	});
	*/
}

//PNG 이미지출력
function setPng24(obj) {
  obj.width=obj.height=1;
  obj.className=obj.className.replace(/\bpng24\b/i,'');
  obj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');"
  obj.src='';
  return '';
}