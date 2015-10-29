<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#closeBtn").click(function(){
			top.close();
		});
	});
});	
</script>

<div class="popup_bg">
	<h3 style="width:99%;"><div>행사곡 연주</div></h3>
	<div class="table">
		<table class="tblType1" summary="행사곡 연주">
			<caption>행사곡 연주</caption>
			<colgroup>
				<col width="50">
				<col width="*" />
				<col width="50" />
			</colgroup>
			<thead>
				<th>순서</th>
				<th>곡명</th>
				<th>실행</th>
			</thead>
			<tbody>
				<tr>
					<td class="center">1</td>
					<td>국기에 대하여 경례</td>
					<td class="center">
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="25" height="20"
						    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
						    <param name="movie" value="/js/lionsclubs/singlemp3player.swf?file=/media/1.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100" />
						    <param name="wmode" value="transparent" />
						    <embed wmode="transparent" width="25" height="20" src="/js/lionsclubs/singlemp3player.swf?file=/media/1.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100"
						    type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
						</object>
					</td>
				</tr>
				<tr>
					<td class="center">2</td>
					<td>애국가</td>
					<td class="center">
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="25" height="20"
						    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
						    <param name="movie" value="/js/lionsclubs/singlemp3player.swf?file=/media/2.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100" />
						    <param name="wmode" value="transparent" />
						    <embed wmode="transparent" width="25" height="20" src="/js/lionsclubs/singlemp3player.swf?file=/media/2.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100"
						    type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
						</object>
					</td>
				</tr>
				<tr>
					<td class="center">3</td>
					<td>묵념</td>
					<td class="center">
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="25" height="20"
						    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
						    <param name="movie" value="/js/lionsclubs/singlemp3player.swf?file=/media/3.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100" />
						    <param name="wmode" value="transparent" />
						    <embed wmode="transparent" width="25" height="20" src="/js/lionsclubs/singlemp3player.swf?file=/media/3.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100"
						    type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
						</object>
					</td>
				</tr>
				<tr>
					<td class="center">4</td>
					<td>한국라이온노래</td>
					<td class="center">
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="25" height="20"
						    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
						    <param name="movie" value="/js/lionsclubs/singlemp3player.swf?file=/media/4.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100" />
						    <param name="wmode" value="transparent" />
						    <embed wmode="transparent" width="25" height="20" src="/js/lionsclubs/singlemp3player.swf?file=/media/4.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100"
						    type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
						</object>
					</td>
				</tr>
				<tr>
					<td class="center">5</td>
					<td>다시만날 때 까지</td>
					<td class="center">
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="25" height="20"
						    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
						    <param name="movie" value="/js/lionsclubs/singlemp3player.swf?file=/media/5.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100" />
						    <param name="wmode" value="transparent" />
						    <embed wmode="transparent" width="25" height="20" src="/js/lionsclubs/singlemp3player.swf?file=/media/5.mp3&backColor=990000&frontColor=ddddff&repeatPlay=false&songVolume=100"
						    type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
						</object>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="popupBtn" style="text-align:center;"><img id="closeBtn" src="/images/lionsclubs/btn/btn_close.gif" alt="닫기" title="닫기" class="pointer" /></div>
</div><!-- popup_bg -->

<!-- <h5><div>해당자료가 조회되었습니다.</div></h5> -->
