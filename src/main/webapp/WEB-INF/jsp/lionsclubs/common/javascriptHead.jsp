<script type="text/javascript">
/*
user strict 명령은 엄격하게 JavaScript 룰을 적용하라는 의미이다.
일부 브라우저의 경우 use strict 명령을 통해 보다 빠르게 동작하는 경우도 존재하는 것 같다.
잘못된 부분에 대한 검증도 보다 엄격하게 동작한다.
하지만, 일부 라이브러리의 경우 use strict 명령을 사용하면 동작하지 않는 경우도 있으므로 주의해야 한다.
*/
'use strict';
var require = {
/*
	baseUrl:
	JavaScript 파일이 있는 기본 경로를 설정한다.
	만약 data-main 속성이 사용되었다면, 그 경로가 baseUrl이 된다.
	data-main 속성은 require.js를 위한 특별한 속성으로 require.js는 스크립트 로딩을 시작하기 위해 이 부분을 체크한다.
*/
	baseUrl:'/js',

/*
    paths: 
    path는 baseUrl 아래에서 직접적으로 찾을 수 없는 모듈명들을 위해 경로를 매핑해주는 속성이다.
    "/"로 시작하거나 "http" 등으로 시작하지 않으면, 기본적으로는 baseUrl에 상대적으로 설정하게 된다.
 
    paths: {
        "exam": "aaaa/bbbb"
    }
 
    의 형태로 설정한 뒤에, define에서 "exam/module" 로 불러오게 되면, 스크립트 태그에서는 실제로는 src="aaaa/bbbb/module.js" 로 잡을 것이다.
    path는 또한 아래와 같이 특정 라이브러리 경로 선언을 위해 사용될 수 있는데, path 매핑 코드는 자동적으로 .js 확장자를 붙여서 모듈명을 매핑한다.
*/
	paths:{
		//뒤에 js 확장자는 생략한다.
		 'init': 'require/init'
		,'jquery': 'lionsclubs/jquery-1.11.2.min'
		,'progress': 'lionsclubs/progress'
		,'common': 'lionsclubs/common'
		,'formdata': 'lionsclubs/formdata/formdata'
		,'jquery.lazyload': 'lionsclubs/lazyload/jquery.lazyload'
		,'purl': 'lionsclubs/purl'
		,'javascript': 'lionsclubs/javascript'
		,'script': 'lionsclubs/script'
		,'json': '/resource/jfile/json'
		,'jwork.fileUpload': '/resource/jfile/jwork/jwork.fileUpload'
		,'jwork.fileDownload': '/resource/jfile/jwork/jwork.fileDownload'
		,'swfupload': '/resource/jfile/swfupload/swfupload/swfupload'
		,'swfupload.queue': '/resource/jfile/swfupload/js/swfupload.queue'
		,'jquery.form': '/resource/jfile/jqueryform/2.4/jquery.form'
		,'jquery-ui': 'lionsclubs/ui/jquery-ui'
// 		,'json2': '/resource/jfile/json2'
		,'jquery.maskedinput': 'lionsclubs/jquery.maskedinput'
		,'date': 'lionsclubs/date'
		,'jquery.validate': 'lionsclubs/validation/jquery.validate'
		,'jquery.maskMoney': 'lionsclubs/maskmoney/jquery.maskMoney'
// 		,'jquery.ui.datepicker': 'lionsclubs/ui/jquery.ui.datepicker'
		,'jquery.ui.datepicker-ko': 'lionsclubs/ui/i18n/jquery.ui.datepicker-ko'
		,'jquery.timepicker': 'lionsclubs/jquery.timepicker'
		,'jquery.searchabledropdown-1.0.8.src': 'lionsclubs/searchabledropdown/jquery.searchabledropdown-1.0.8.src'
		,'chosen.jquery': 'lionsclubs/chosen/chosen.jquery'
		,'jquery.tooltipster': 'lionsclubs/tooltipster/jquery.tooltipster'
		,'jquery.simplemodal': 'lionsclubs/simplemodal/jquery.simplemodal-1.4.4'
		,'jquery.inputfile': 'lionsclubs/inputfile/jquery.inputfile'
		,'jquery.cookie': 'lionsclubs/cookie/jquery.cookie'
		,'jquery.autosize': 'lionsclubs/autosize/jquery.autosize'
		,'jssor': 'lionsclubs/jssor/jssor'
		,'jssor.slider': 'lionsclubs/jssor/jssor.slider'
		,'jquery.treetable': 'lionsclubs/treetable/jquery.treetable'
		,'fotorama': '/lions/js/fotorama'
		,'placeholders': 'lionsclubs/placeholders/placeholders'
		,'jquery.placeholder': 'lionsclubs/jquery.placeholder/jquery.placeholder'
		,'fullcalendar-1.6.7': 'lionsclubs/fullcalendar-1.6.7/fullcalendar'
		,'jquery.ui.monthpicker': 'lionsclubs/monthpicker/jquery.ui.monthpicker'
	},
	
/*
	shim:
	AMD 형식을 지원하지 않는 라이브러리의 경우 아래와 같이 SHIM을 사용해서 모듈로 불러올 수 있다.
	참고 : http://gregfranko.com/blog/require-dot-js-2-dot-0-shim-configuration/
*/
	shim:{
		 'progress': ['jquery']
		,'common': ['jquery', 'jquery-ui', 'jquery.tooltipster']
		,'formdata': ['jquery']
		,'jquery.lazyload': ['jquery']
		,'purl': ['jquery']
		,'javascript': ['jquery']
		,'script': ['jquery', 'common']
// 		,'json': ['jquery', 'json2']
		,'jwork.fileUpload': ['jquery']
		,'jwork.fileDownload': ['jquery']
		,'swfupload': ['jquery']
		,'swfupload.queue': ['jquery']
		,'jquery.form': ['jquery']
		,'jquery-ui': ['jquery']
// 		,'json2': []
		,'jquery.maskedinput': ['jquery']
		,'date': ['jquery']
		,'jquery.validate': ['jquery']
		,'jquery.maskMoney': ['jquery']
// 		,'jquery.ui.datepicker': ['jquery']
		,'jquery.ui.datepicker-ko': ['jquery', 'jquery-ui', 'jquery.maskedinput']
		,'jquery.timepicker': ['jquery']
		,'jquery.searchabledropdown-1.0.8.src': ['jquery']
		,'chosen.jquery': ['jquery']
		,'jquery.tooltipster': ['jquery']
		,'jquery.simplemodal': ['jquery']
		,'jquery.inputfile': ['jquery']
		,'jquery.cookie': ['jquery']
		,'jquery.autosize': ['jquery']
		,'jssor': ['jquery']
		,'jssor.slider': ['jquery']
		,'jquery.treetable': ['jquery']
		,'fotorama': ['jquery']
		,'jquery.placeholder': ['jquery']
		,'fullcalendar-1.6.7': ['jquery']
		,'jquery.ui.monthpicker': ['jquery', 'jquery-ui']
	},
	waitSeconds: 60
};

var READ = "${select}";
var WRITE = "${input}";	
</script>
<script src="<c:url value="/js/require/require.js" />"></script>
