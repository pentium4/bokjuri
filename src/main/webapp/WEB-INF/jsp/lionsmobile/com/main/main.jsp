<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<%@ include file="/WEB-INF/jsp/lionsmobile/common/stylesheet.jsp" %>
<%@ include file="/WEB-INF/jsp/lionsmobile/common/javascript.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	var user = authenticatedUser();
	
	/*
	 *	회기 검색
	 */
	$("#sessionYear").sessionYearCombo({
		 top: false
		,fixVal: user.searchSessionYear
		,isMobile: true
	});
	
	$("#sessionYear").change(function() {
		$.saveSessionYear({
			sessionYear: $(this).val()
		});
	});
	
	$("#districtCode").organCode({
		 lvl: 3
		,onlyName: true
		,shortenName: true
		,fixVal: user.searchDistrictCode
		,isMobile: true
	});

	$("#districtCode").on("change", function(){
		var _districtCode = $(this).val();

		$("#clubCode").organCode({
			 lvl: 4
	     	,onlyName: false
			,nameWithShortenCode: true
			,upperOrganCode: _districtCode
			,isMobile: true
		}, function(){
			$("#clubCode").trigger("change");	
		});
	});
	
	$("#clubCode").organCode({
		 lvl: 4
     	,onlyName: false
		,nameWithShortenCode: true
		,fixVal: user.searchClubCode
		,upperOrganCode: user.searchDistrictCode
		,isMobile: true
	});
});

$.mobile.document
// The custom selectmenu plugin generates an ID for the listview by suffixing the ID of the
// native widget with "-menu". Upon creation of the listview widget we want to place an
// input field before the list to be used for a filter.
.on( "listviewcreate", "#districtCode-menu,#title-districtCode-menu", function( event ) {
    var input,
        list = $( event.target ),
        form = list.jqmData( "filter-form" );
    // We store the generated form in a variable attached to the popup so we avoid creating a
    // second form/input field when the listview is destroyed/rebuilt during a refresh.
    if ( !form ) {
        input = $( "<input data-type='search'></input>" );
        form = $( "<form></form>" ).append( input );
        input.textinput();
        list
            .before( form )
            .jqmData( "filter-form", form ) ;
        form.jqmData( "listview", list );
    }
    // Instantiate a filterable widget on the newly created listview and indicate that the
    // generated input form element is to be used for the filtering.
    list.filterable({
        input: input,
        children: "> li:not(:jqmData(placeholder='true'))"
    });
})
// The custom select list may show up as either a popup or a dialog, depending on how much
// vertical room there is on the screen. If it shows up as a dialog, then the form containing
// the filter input field must be transferred to the dialog so that the user can continue to
// use it for filtering list items.
.on( "pagecontainerbeforeshow", function( event, data ) {
    var listview, form,
        id = data.toPage && data.toPage.attr( "id" );
    if ( !( id === "districtCode-dialog" || id === "title-districtCode-dialog" ) ) {
        return;
    }
    listview = data.toPage.find( "ul" );
    form = listview.jqmData( "filter-form" );
    // Attach a reference to the listview as a data item to the dialog, because during the
    // pagecontainerhide handler below the selectmenu widget will already have returned the
    // listview to the popup, so we won't be able to find it inside the dialog with a selector.
    data.toPage.jqmData( "listview", listview );
    // Place the form before the listview in the dialog.
    listview.before( form );
})
// After the dialog is closed, the form containing the filter input is returned to the popup.
.on( "pagecontainerhide", function( event, data ) {
    var listview, form,
        id = data.toPage && data.toPage.attr( "id" );
    if ( !( id === "districtCode-dialog" || id === "title-districtCode-dialog" ) ) {
        return;
    }
    listview = data.toPage.jqmData( "listview" ),
    form = listview.jqmData( "filter-form" );
    // Put the form back in the popup. It goes ahead of the listview.
    listview.before( form );
});


$.mobile.document
// The custom selectmenu plugin generates an ID for the listview by suffixing the ID of the
// native widget with "-menu". Upon creation of the listview widget we want to place an
// input field before the list to be used for a filter.
.on( "listviewcreate", "#clubCode-menu,#title-clubCode-menu", function( event ) {
    var input,
        list = $( event.target ),
        form = list.jqmData( "filter-form" );
    // We store the generated form in a variable attached to the popup so we avoid creating a
    // second form/input field when the listview is destroyed/rebuilt during a refresh.
    if ( !form ) {
        input = $( "<input data-type='search'></input>" );
        form = $( "<form></form>" ).append( input );
        input.textinput();
        list
            .before( form )
            .jqmData( "filter-form", form ) ;
        form.jqmData( "listview", list );
    }
    // Instantiate a filterable widget on the newly created listview and indicate that the
    // generated input form element is to be used for the filtering.
    list.filterable({
        input: input,
        children: "> li:not(:jqmData(placeholder='true'))"
    });
})
// The custom select list may show up as either a popup or a dialog, depending on how much
// vertical room there is on the screen. If it shows up as a dialog, then the form containing
// the filter input field must be transferred to the dialog so that the user can continue to
// use it for filtering list items.
.on( "pagecontainerbeforeshow", function( event, data ) {
    var listview, form,
        id = data.toPage && data.toPage.attr( "id" );
    if ( !( id === "clubCode-dialog" || id === "title-clubCode-dialog" ) ) {
        return;
    }
    listview = data.toPage.find( "ul" );
    form = listview.jqmData( "filter-form" );
    // Attach a reference to the listview as a data item to the dialog, because during the
    // pagecontainerhide handler below the selectmenu widget will already have returned the
    // listview to the popup, so we won't be able to find it inside the dialog with a selector.
    data.toPage.jqmData( "listview", listview );
    // Place the form before the listview in the dialog.
    listview.before( form );
})
// After the dialog is closed, the form containing the filter input is returned to the popup.
.on( "pagecontainerhide", function( event, data ) {
    var listview, form,
        id = data.toPage && data.toPage.attr( "id" );
    if ( !( id === "clubCode-dialog" || id === "title-clubCode-dialog" ) ) {
        return;
    }
    listview = data.toPage.jqmData( "listview" ),
    form = listview.jqmData( "filter-form" );
    // Put the form back in the popup. It goes ahead of the listview.
    listview.before( form );
});

function moveLink(link) {
	if($("#clubCode").val() == null || $("#clubCode").val() == ""){
		alert("클럽이 선택되지 않았습니다.");
		return false;
	}
	location.href = link;
}
</script>
<form:form modelAttribute="main" action="/m/main/main.do" data-ajax="false">
<!-- 상단 -->
<div class="header">
	<h1><img src="/images/lionsclubs/mobile/logo.jpg" alt="국제라이온스협회 업무통합관리시스템" /></h1>
</div>
<!-- 상단 -->

<!-- 컨테이너 -->
<div class="container">
	<!-- 내용 -->
	<div id="content">
		<div class="yearBox ui-field-contain">
			<table width="100%">
				<colgroup>
					<col width="20%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td style="text-align:center;vertical-align:middle;">
							회기
						</td>
						<td style="padding-right:12px;">
							<div class="base">
								<select id="sessionYear" data-mini="true"></select>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;vertical-align:middle;">
							지구
						</td>
						<td style="padding-right:12px;">
							<div class="base">
								<select id="districtCode" data-mini="true" data-native-menu="false"></select>
							</div>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;vertical-align:middle;">
							클럽
						</td>
						<td style="padding-right:12px;">
							<div class="base">
								<select id="clubCode" data-mini="true" data-native-menu="false"></select>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="menu"><a class="show-page-loading-msg" href="#" onclick="moveLink('/m/MM6/MM6_1/MM6_01/MM6_01.do')" class="btn">클럽인원조회</a></div>
		<div class="menu"><a class="show-page-loading-msg" href="#" onclick="moveLink('/m/MM6/MM6_1/MM6_02/MM6_02.do')">클럽4역조회</a></div>
		<div class="menu"><a class="show-page-loading-msg" href="#" onclick="moveLink('/m/MM6/MM6_1/MM6_03/MM6_03.do')">지구임원조회</a></div>
		<div class="menu"><a class="show-page-loading-msg" href="#" onclick="moveLink('/m/MM6/MM6_1/MM6_04/MM6_04.do')">지역지대조회</a></div>
		<div class="menu"><a class="show-page-loading-msg" href="#" onclick="moveLink('/m/MM6/MM6_1/MM6_05/MM6_05.do')">회기별회장조회</a></div>
		<div class="menu"><a class="show-page-loading-msg" href="#" onclick="moveLink('/m/MM6/MM6_1/MM6_07/MM6_07.do')">회원 업체조회</a></div>
		<div class="menu"><a class="show-page-loading-msg" href="#" onclick="moveLink('/m/MM6/MM6_1/MM6_08/MM6_08.do')">납부금 현황</a></div>
	</div>
	<!-- 내용 -->
</div>

<!-- 컨테이너 -->
</form:form>