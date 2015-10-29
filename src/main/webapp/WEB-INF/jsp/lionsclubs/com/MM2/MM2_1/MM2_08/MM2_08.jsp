<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("<span>${totalCount*6}</span>건의 데이터를 조회하였습니다.");
			
		//기관 클럽코드 세팅
		$("#organCode").organCode({
			 lvl: 4
			,searchable: true
			,fixVal: "${MM2_08VO.organCode}"
		});
		
		
		//조회 버튼선택
		$("#searchBtn").on("click", function(){
			/**
			 * 검색유지 조직코드를 저장한다.
			 * lvl 1:연합회, 2:복합지구, 3:지구, 4:클럽
			 * organCode: 조직코드
			 */
			$.saveOrganCode({
				 lvl: 4
				,organCode: $("#organCode").val()
			});
		
			_search();
		});
		
	    $("img").lazyload({
	    	container: $("#Scroll_Area")
	    });
	});
});

//조회
function _search(){
	$("#form_list").submit();
}
</script>
<style>
<!--
#Scroll_Area{
	height: 400px;
}

.tblPhotoTitle td{
	margin:0;
	padding:0;
	border:0;
	text-align:left;
}

.tblPhotoTitle p.title{
	height:20px;
	padding:0;
	color:blue;
	font-weight:bold;
	text-align:center;
}

.tblPhoto p.txt{
	height: 20px;
}
-->
</style>
<form:form id="form_list" modelAttribute="MM2_08VO">

<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>

<div class="table">
	<table class="tblType1" summary="클럽 인원 조회표">
		<caption>클럽 인원 조회</caption>
		<colgroup>
			<col width="100px" />
			<col width="*" />
		</colgroup>
		<tbody>
			<tr height="40">
				<th>클럽코드</th>
				<td height="40">
					<form:select path="organCode" cssClass="select" />
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- table -->

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	
	<div class="btnBox">
		<img id="searchBtn" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" alt="조회" class="pointer authorization read" />
	</div>
	
	<div class="tblTitle Scroll_Title Height_0">
		<table class="tbl mt20" border="1">
			<colgroup>
				<col width="80px" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr class="tblPhotoTitle" style="height: 40px;">
					<td class="center"></td>
					<td class="center"><p class="title">회장</p></td>
					<td class="center"><p class="title">1부회장</p></td>
					<td class="center"><p class="title">2부회장</p></td>
					<td class="center"><p class="title">3부회장</p></td>
					<td class="center"><p class="title">총무</p></td>
					<td class="center"><p class="title">재무</p></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="Scroll_Area" class="Height_1 mT0">
		<table class="tbl mt20" border="1">
			<colgroup>
				<col width="80px" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
			</colgroup>
			<tbody>
				<c:forEach items="${memberList}" var="list" varStatus="status">
					<tr class="tblPhoto">
						<td class="center LH">
							<strong>
								<div class="ml20">${list.sessionYear - 1 }</div>
								<div class="ml20">${list.sessionYear }</div>
							</strong>
						</td>
						<td class="center">
							<p class="photo" style="width: 100px; height: 120px;">
								<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.presidentPicture}" height="120px" width="100px" />
							</p>
							<p class="txt">
								${list.presidentName }
							</p>
						</td>
						<td class="center">
							<p class="photo" style="width: 100px; height: 120px;">
								<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.vice1Picture}" height="120px" width="100px" />
							</p>
							<p class="txt">
								${list.vice1Name }
							</p>
						</td>
						<td class="center">
							<p class="photo" style="width: 100px; height: 120px;">
								<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.vice2Picture}" height="120px" width="100px" />
							</p>
							<p class="txt">
								${list.vice2Name }
							</p>
						</td>
						<td class="center">
							<p class="photo" style="width: 100px; height: 120px;">
								<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.vice3Picture}" height="120px" width="100px" />
							</p>
							<p class="txt">
								${list.vice3Name }
							</p>
						</td>
						<td class="center">
							<p class="photo" style="width: 100px; height: 120px;">
								<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.managerPicture}" height="120px" width="100px" />
							</p>
							<p class="txt">
								${list.managerName }
							</p>
						</td>
						<td class="center">
							<p class="photo" style="width: 100px; height: 120px;">
								<img data-original="${ctx}/jfile/thumbPreview.do?fileId=${list.financialPicture}" height="120px" width="100px" />
							</p>
							<p class="txt">
								${list.financialName }
							</p>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<!-- //Contents_Table_area -->
</div>

</form:form>