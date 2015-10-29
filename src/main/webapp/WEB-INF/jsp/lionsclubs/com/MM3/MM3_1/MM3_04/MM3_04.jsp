<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script>
require(['init'], function () {
	$(document).ready(function () {
		$("#message div").html("${message}&nbsp;");
	
		$("#orgCode").organCode({
			 lvl:3
			,searchable: true     // 검색콤보박스 true/false
			,fixVal:"${vo.orgCode}"
		});	
		
		$("#thisYear").sessionYearCombo({
			 fixVal: "${vo.thisYear}" 
			,top:false
		});
		
		$("#selDstTitleCd option:eq(0)").replaceWith("<option value=''>--지구직책--</option>");
		$("#selClubTitleCd option:eq(0)").replaceWith("<option value=''>--클럽직책--</option>");
	
		//검색순서 체크박스 클릭시 하나만 선택가능하게  
		$("input[name='orderBy']:checkbox").bind("click", function(){
			$("input[name='orderBy']:checkbox").prop("checked", false);
			$(this).prop("checked", true);
		});
		
		//직책 체크박스 클릭시 하나만 선택가능하게하고 체크안된 영역의 셀렉트를 disable
		$("input[name='chkbox_dstTitleOrClubTitle']:checkbox").bind("click", function(){
			$("input[name='chkbox_dstTitleOrClubTitle']:checkbox").prop("checked", false);
			$(this).prop("checked", true);
			
			if($(this).val() == "d"){ //지구직책체크
				$("#selClubTitleCd option:eq(0)").prop("selected", "selected");
				$("#selClubTitleCd option").not(":selected").prop("disabled", "disabled");
				$("#selClubTitleCd").css('color', '#B6B6B6');
				$("#selDstTitleCd option").not(":selected").prop("disabled", "");
				$("#selDstTitleCd").css('color', '#333333');
			}else{					//클럽직책체크
				$("#selDstTitleCd option:eq(0)").prop("selected", "selected");
				$("#selDstTitleCd option").not(":selected").prop("disabled", "disabled");
				$("#selDstTitleCd").css('color', '#B6B6B6');
				$("#selClubTitleCd option").not(":selected").prop("disabled", "");
				$("#selClubTitleCd").css('color', '#333333');
			}
		});
		
		
		if("${vo.chkbox_dstTitleOrClubTitle}" == "d"){
			$("#selClubTitleCd option").not(":selected").attr("disabled", "disabled");
			$("#selClubTitleCd").css('color', '#B6B6B6');
			$("#selDstTitleCd option").not(":selected").prop("disabled", "");
			$("#selDstTitleCd").css('color', '#333333');
		}else{
			$("#selDstTitleCd option").not(":selected").prop("disabled", "disabled");
			$("#selDstTitleCd").css('color', '#B6B6B6');
			$("#selClubTitleCd option").not(":selected").prop("disabled", "");
			$("#selClubTitleCd").css('color', '#333333');
		} 
	
		$("#btnSearch").on("click", function(){
			$.saveOrganCode({
				 lvl:3
				,organCode: $("#orgCode").val()
			});
			
			checkFormSubmit();
		});
		
		var checkFormSubmit =  function(){
			if($("#orgCode").val().isEmpty()){
				alert("조직을 선택하세요");
				return;
			}
			
			if($("input:checkbox[name=termEnable]").is(":checked")){
				if($("#selDstTitleCd").val() != "" && $("#selClubTitleCd").val() != ""){
					alert("회기미선택시에는 지구직책과, 클럽직책중 하나만 선택해야합니다.");
					return;
				}
				
				if($("#selDstTitleCd").val() == "" && $("#selClubTitleCd").val() == ""){
					alert("직책을 선택하세요");
					return;
				}
			}
			$("#form_list").submit();
		};
		
		//회기선택 활성 비활성 체크박스 클릭 이벤트 
		$("input[name='termEnable']:checkbox").bind("click", function(){
			//alert($("input[name='termEnable']:checkbox").val());
			if($("input:checkbox[name=termEnable]").is(":checked")){
				$("#termLayer").hide();			
			}else{
				$("#termLayer").show();
			}
		});
		
	 	if($("input:checkbox[name=termEnable]").is(":checked")){
			$("#termLayer").hide();			
		}else{
			$("#termLayer").show();
		}
	});
});

</script>
<form:form id="form_list" modelAttribute="MM3_04VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1" summary="회장/지구임원 조회표">
			<caption>회장/지구임원 조회</caption>
			<colgroup>
				<col width="70px" />
				<col width="380px" />
				<col width="70px" />
				<col width="300px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>선택조직</th>
					<td>
						<div class="fL">
							<form:select path="orgCode" />
						</div>
					</td>
					<th>조회순서</th>
					<td class="LH" style="font-size:12px;letter-spacing:-1px">
						<form:radiobutton path="order" value="1" label="클럽순" cssClass="ml10" />
						<form:radiobutton path="order" value="2" label="직책순" cssClass="ml10" />
						<form:radiobutton path="order" value="3" label="성명순" cssClass="ml10" /><br/>
						<form:radiobutton path="order" value="4" label="입회일자순" cssClass="ml10" />
						<form:radiobutton path="order" value="5" label="직책역임순" cssClass="ml10" />					
					</td>
					<td class="LH" style="font-size:12px;letter-spacing:-1px">
						<form:checkbox path="outRemove" value="1" label="퇴직제외" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td style="font-size:12px;letter-spacing:-1px">
						<form:select path="thisYear" />
						<form:checkbox path="termEnable" name="termEnable" id="termEnable" value="1" label="회기미선택" cssClass="ml10" /> 			 
					</td>
					<th>직책선택</th>
					<td class="LH" style="font-size:12px;letter-spacing:-1px">
						<form:checkbox path="chkbox_dstTitleOrClubTitle" name="chkbox_dstTitleOrClubTitle" value="d" cssClass="ml10" /><lions:codeselect id="selDstTitleCd" path="selDstTitleCd" groupCode="2760" /><br/>
						<form:checkbox path="chkbox_dstTitleOrClubTitle" name="chkbox_dstTitleOrClubTitle" value="s" cssClass="ml10" /><lions:codeselect id="selClubTitleCd" path="selClubTitleCd" groupCode="2740" />
					</td>
					<td style="border-left:hidden;"></td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->

	<div class="table">
		<h4>클럽 회장/지구임원 역임자 조회</h4>
		<div class="btnBox">
			<img id="btnSearch" alt="조회" src="/images/lionsclubs/btn/btn_search.gif" style="margin-top:2px" class="pointer authorization read" />
		</div>
	
		<div class="tblTitle Height_0 Scroll_Title">
			<table class="tblType2" summary="클럽 회장/지구임원 역임자 조회 조회표">
				<caption>회원 업체조회</caption>
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="220px" />
					<col width="130px" />
				</colgroup>
				<thead>
				<tr>
					<th>No</th>
					<th>클럽명</th>
					<th>성명</th>
					<th>입회일자</th>
					<th>직책역임</th>
					<th>지구직책</th>
					<th>휴대전화</th>
				</tr>
				</thead>
			</table>
		</div><!-- tblTitle -->
		<div id="Scroll_Area" class="Height_1">
			<table class="tblType2_1 Scroll_Table" id="listTable">
				<colgroup>
					<col width="50px" />
					<col width="*" />
					<col width="120px" />
					<col width="120px" />
					<col width="120px" />
					<col width="220" /> 
					<col width="130px" />
				</colgroup>
				<tbody>
					<c:forEach var="list" items="${resultList}" varStatus="listStatus">
						<tr>
							<td class="center">${listStatus.count}</td>
							<td class="left" title="${fn:substring(list.organCdClub, 0, 3)}-${fn:substring(list.organCdClub, 3, 8)}">
								${list.organNmClub}
							</td>
							<td class="center">${list.name}</td>
							<td class="center">
								<fmt:parseDate var="insertDate" value="${list.regDate}" pattern="yyyyMMdd" />
								<fmt:formatDate value="${insertDate }" pattern="yyyy.MM.dd" />  
							</td>
							<td class="center">${list.term }</td>
							<td class="left">${list.dstTitleNm }</td>
							<td class="center">${list.mobile }</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div><!-- Height_1 -->
	</div><!-- table -->

</form:form>