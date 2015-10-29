<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&language=ko"></script>

<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount}</span>건의 데이터를 조회하였습니다.");
		/*
		 *	조직 선택하기 창 띄우기
		 */
		$("#button_select").click(function() {
			$("#pageIndex").val(1);
			$("#form_list").submit();
		});
		
		$("#address").focus();
		
		$("#businessClass").on("change", function(){
			$("#industry").option1Code({ 
		    	groupCode: '1200',	// 그룹코드
		    	code: $(this).val(),	// 코드
		    	fixVal: "${MM1_06VO.industry}",	// 고정값
		    	topLabel: '--선택--'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
			});		
		}).change();
	});
});

/*
 * 주소로 지도보기
 */
function googleMap(mapid, addr) {
	var address = addr;
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode( { 'address': address}, function(results, status) {
	  if (status == google.maps.GeocoderStatus.OK) {
        var map = new google.maps.Map(document.getElementById(mapid), {
            zoom: 18,
            center: results[0].geometry.location,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          });
		
	    var marker = new google.maps.Marker({
	        map: map,
	        position: map.getCenter()
	    });
	  } else {
// 	    alert("Geocode was not successful for the following reason: " + status);
	  }
	});
}

function address(addr){
	$("#map-dialog").dialogPopup({
		 height: 700
		,width: 1200
	});
	
    $("#map-canvas").css("display", "block");
    $("#map-canvas").html("");
    googleMap("map-canvas", addr);
}

</script>
<form:form id="form_list" modelAttribute="MM1_06VO" action="/MM1/MM1_1/MM1_06/MM1_06.do">
<h3><div>회원업체 조회</div></h3>
<div class="table">
	<table class="tblType1" summary="회원업체 조회표">
		<caption>회원업체 조회</caption>
		<colgroup>
			<col width="100px" />
			<col width="400px" />
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr>
				<th>업종분류</th>
				<td>
					<lions:codeselect path="businessClass" groupCode="1200" />
				</td>
				<th rowspan="2">조회구분</th>
				<td rowspan="2" class="LH">
					<form:radiobutton path="order" value="1"/>&nbsp;회원이름순&nbsp;&nbsp;&nbsp;
					<form:radiobutton path="order" value="2"/>&nbsp;업체명순&nbsp;&nbsp;<br/>
					<form:radiobutton path="order" value="3"/>&nbsp;소속 클럽순&nbsp;&nbsp;
					<form:radiobutton path="order" value="4"/>&nbsp;업체주소순
				</td>
			</tr>
			<tr>
				<th>업종</th>
				<td>
					<form:select path="industry" />
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->

<div id="map-dialog" title="회원업체 조회" style="display: none;">
	<div id="map-canvas" style="width: 1169px; height: 645px"></div>
</div>

<div class="table">
	<h4>회원 업체조회</h4>
	<div class="btnBox">
		<img id="button_select" src="/images/lionsclubs/btn/btn_search.gif" alt="조회" class="pointer authorization read"/>
	</div>
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tblType2" summary="회원업체 조회표">
			<caption>회원 업체조회</caption>
			<colgroup>
				<col width="91px" />
				<col width="130px" />
				<col width="260px" />
				<col width="100px" />
				<col width="130px" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th>회원이름</th>
					<th>소속클럽</th>
					<th>업체명</th>
					<th>업체직책</th>
					<th>전화번호</th>
					<th>업체주소</th>
				</tr>
			</thead>
		</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
		<table class="tblType2_1 Scroll_Table">
			<colgroup>
				<col width="91px" />
				<col width="130px" />
				<col width="260px" />
				<col width="100px" />
				<col width="130px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:forEach items="${resultList}" var="list" varStatus="status">
					<tr>
						<td>${list.name }</td>
						<td class="left" title="${list.sectorClubCode}.${list.sectorClub }">
							${list.sectorClubCode}.${list.sectorClub }
						</td>
						<td class="left" title="${list.companyName }">${list.companyName }</td>
						<td>${list.companyTitle }</td>
						<td>${list.workTel }</td>
						<td class="left" title="${list.companyAddress}">
							<a href="#" onclick="address('${list.companyAddress}')">
								${list.companyAddress}
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><!-- Height_1 -->
	<div class="pagination">
		<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
	</div>	
</div><!-- table -->
</form:form>