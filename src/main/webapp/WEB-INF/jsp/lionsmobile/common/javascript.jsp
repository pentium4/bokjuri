<script type="text/javascript" src="<c:url value="/js/lionsclubs/jquery-1.11.2.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsmobile/jquery.mobile-1.4.5.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsmobile/jquery-tabs.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsmobile/javascript.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsmobile/listTab.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsmobile/iscroll.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsmobile/iscroll-infinite.js"/>"></script>
<script type="text/javascript" src="<c:url value="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/lionsmobile/jquery.stickyheader.js"/>"></script>
		
<script type="text/javascript" src="<c:url value="/js/lionsclubs/tooltipster/jquery.tooltipster.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsclubs/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsclubs/lazyload/jquery.lazyload.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsclubs/date.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/lionsclubs/chosen/chosen.jquery.js" />"></script>

<script language='javascript' type="text/javascript">
var READ = "${select}";
var WRITE = "${input}";

$(document).ready(function(){
	$(document).ajaxStart(function() {
		$.mobile.loading('show');
	});
	
	$(document).ajaxStop(function() {
		$.mobile.loading('hide');
	});
	
	$("a, button").on("click", function(){
		$.mobile.loading('show');
	});
});
</script>