//requireJS를 활용하여 모듈 로드
define( [
 		 'jquery'
		,'progress'
		,'common'
		,'formdata'
		,'jquery.lazyload'
		,'purl'
		,'javascript'
		,'script'
		,'json'
		,'jwork.fileUpload'
		,'jwork.fileDownload'
		,'swfupload'
		,'swfupload.queue'
		,'jquery.form'
		,'jquery-ui'
//		,'json2'
		,'jquery.maskedinput'
		,'date'
		,'jquery.validate'
		,'jquery.maskMoney'
		,'jquery.ui.datepicker-ko'
		,'jquery.timepicker'
		,'jquery.searchabledropdown-1.0.8.src'
		,'chosen.jquery'
		,'jquery.tooltipster'
		,'jquery.simplemodal'
		,'jquery.inputfile'
		,'jquery.cookie'
		,'jquery.autosize'
		,'jssor'
		,'jssor.slider'
		,'jquery.treetable'
		,'fotorama'
		,'placeholders'
		,'jquery.placeholder'
		,'fullcalendar-1.6.7'
		,'jquery.ui.monthpicker'
	],
	//디펜던시 로드뒤 콜백함수
	function () {
		return this;
//	    // 의존 모듈들이 모두 로딩 완료되면 이 함수를 실행한다.
//	    // 초기화 영역
//	    var i = 0;
//	
//	    function increase() {
//	        i++;
//	    }
//	
//	    function get() {
//	      return i;
//	    }
//	
//	    // 외부에 노출할 함수들만 반환한다.
//	    return {
//	        increase: increase,
//	        get: get
//	    };
	}
);