var _popup = null;
function openPopup(url, popWidth, popHeight, popupName){ 
	var winHeight = document.body.clientHeight; // 현재창의 높이 
	var winWidth = document.body.clientWidth; // 현재창의 너비 
	var winX = window.screenX || window.screenLeft || 0;// 현재창의 x좌표 
	var winY = window.screenY || window.screenTop || 0; // 현재창의 y좌표 
	
	var popX = winX + (winWidth - popWidth)/2; 
	var popY = winY + (winHeight - popHeight)/2; 
	
	popupName == null ? "popup" : this.popupName;
	_popup = window.open(encodeURI(url), popupName,"width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX); 
} 

function closeWin(){
	window.close();
}

function deckGoto(page){
	
}

if(typeof String.prototype.trim !== 'function') {
	String.prototype.trim = function() {
		return this.replace(/^\s+|\s+$/g, ''); 
	};
}

if(typeof String.prototype.ltrim !== 'function') {
	String.prototype.ltrim = function() {
	    return this.replace(/^\s+/,"");
	};
}

if(typeof String.prototype.rtrim !== 'function') {
	String.prototype.rtrim = function() {
	    return this.replace(/\s+$/,"");
	};
}

String.prototype.isEmpty = function() {
    return (this.length === 0 || !this.trim());
};

String.prototype.replaceAll = function(target, replacement) {
	return this.split(target).join(replacement);
};
