//requireJS를 활용하여 모듈 로드
define( [
		 'jquery'
		,'common'
		,'jquery.lazyload'
		,'jquery-ui'
		,'chosen.jquery'
		,'jquery.tooltipster'
		,'jquery.simplemodal'
		,'date'
		,'jquery.cookie'
		,'jquery.ui.datepicker-ko'
		,'jquery.maskedinput'
		,'fullcalendar-1.6.7'		
	],
	//디펜던시 로드뒤 콜백함수
	function () {
		return this;
	}
);