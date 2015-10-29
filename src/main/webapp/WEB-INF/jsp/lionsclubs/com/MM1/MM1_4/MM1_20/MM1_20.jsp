<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<style>
<!--
.button{
	margin: 0 0 5px 0;
}
-->
</style>
<script type="text/javascript">
require(['init'], function () {
	$(document).ready(function () {
		$("#startDate").datepicker();
		$("#endDate").datepicker();
		
		/*
		 * 코드 구하기
		 */
		$("#organCode").organCode({
			 lvlStart: 3
			,lvlEnd: 4
			,fixVal: "${MM1_20VO.organCode}"
			,searchable: true
		});
		
		$("#excelDownload").on("click", function(){
			if(!$("form").valid()){
				return false;
			}
			
			$(window).unbind();
			$.download("/MM1/MM1_4/MM1_20/excelDownload.do", $("form").serialize());
		});
		
		/* 
			테이블 클릭 
		*/
		var tbl = $(".tblType1 tbody tr td:not(:first-child)");
		tbl.on("click", function(){
			var tr = $(this).closest("tr");
			var infoChk = tr.find(".info").is(":checked");
			tr.find(".info").prop("checked", !infoChk);
			
			selected($(this));
		});
		
		$(".info").on("click", function(){
			selected($(this));
		});
		
		$(".required").each(function(){
			$(this).find(".info").prop("checked", true);
			selected($(this));
		});
		
		$("#lcheckAll").on("click", function(){
			$(".lcheck").prop("checked", $(this).is(":checked"));
			selected($(".lcheck"));
		});
	
		$("#mcheckAll").on("click", function(){
			$(".mcheck").prop("checked", $(this).is(":checked"));
			selected($(".mcheck"));
		});
		
		$("#rcheckAll").on("click", function(){
			$(".rcheck").prop("checked", $(this).is(":checked"));
			selected($(".rcheck"));
		});	
		
		$(".kind").on("click", function(){
			var $this = $(this);
			var kindVal = $this.val();
			
			$(".kindCondition").hide();
			$("#" + kindVal).show();
		});
		
		$("#appKindCode").on("change", function(){
			$("#appDescCode").option1Code({
				 groupCode: '2700' // 그룹코드
			    ,code: $(this).val() // 코드
			    ,topLabel: '-- 전체 --' // 상단명(상단명을 정하지 않으면 나타나지 않음)
			    ,fixVal: "${MM1_20VO.appDescCode}"
			});
		}).change();
	
		/**
			개인(교육/징계/포상)구분
			1000	개인→교육	code1 : 3120
			1010	개인→징계	code1 : 3210
			1020	개인→포상	code1 : 3010
		*/
		$("#prizeEducationCode").on("change", function(){
			$("#prizeItemCode").option1Code({ 
		    	groupCode: '3310',	// 그룹코드
		    	code: $(this).val(),	// 코드
		    	topLabel: '-- 전체 --'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
			});
		}).change();	
		
		$("#educationEducationCode").on("change", function(){
			$("#educationItemCode").option1Code({ 
		    	groupCode: '3120',	// 그룹코드
		    	code: $(this).val(),	// 코드
		    	topLabel: '-- 전체 --'	// 상단명(상단명을 정하지 않으면 나타나지 않음)
			});
		}).change();
	});
});

// 조회
function _search(){
	$("form").submit();
}

function selected(_this){
	var tr = _this.closest("tr");
	var infoChk = tr.find(".info").is(":checked");
	
	if(tr.find(".info").val() != undefined){
		if(infoChk){
			tr.css("background-color","#E0FFE0");
		} else {
			tr.css("background-color","#ffffff");
		}
	}
	
	var lLength = $(".lcheck").length;
	var lCheckLength = $(".lcheck:checked").length;
	
	if(lLength == lCheckLength){
		$("#lcheckAll").prop("checked", true);
	} else {
		$("#lcheckAll").prop("checked", false);
	}

	var mLength = $(".mcheck").length;
	var mCheckLength = $(".mcheck:checked").length;
	
	if(mLength == mCheckLength){
		$("#mcheckAll").prop("checked", true);
	} else {
		$("#mcheckAll").prop("checked", false);
	}

	var rLength = $(".rcheck").length;
	var rCheckLength = $(".rcheck:checked").length;
	
	if(rLength == rCheckLength){
		$("#rcheckAll").prop("checked", true);
	} else {
		$("#rcheckAll").prop("checked", false);
	}
}
</script>

<form:form modelAttribute="MM1_20VO">
	<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
	<div class="table">
		<table class="tblType1">
			<colgroup>
				<col width="80px" />
				<col width="380px" />
				<col width="80px" />
				<col width="250px" />
				<col width="80px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>지구코드</th>
					<td><form:select path="organCode" cssClass="required" caption="지구코드" /></td>
					<th rowspan="2">조회순서</th>
					<td rowspan="2" class="LH">
						<form:radiobutton path="order" label="회원번호" value="1" cssClass="ml10" />
						<form:radiobutton path="order" label="직책순" value="2" cssClass="ml10" /><br/>
						<form:radiobutton path="order" label="성명순" value="3" cssClass="ml10" />
						<form:radiobutton path="order" label="입회일자순" value="4" cssStyle="margin-left: 24px;" />
					</td>
					<th rowspan="2">조회구분</th>
					<td rowspan="2" class="LH">
						<form:checkbox path="activeMember" label="현회원" value="Y" cssClass="ml10" /><br/>
						<form:checkbox path="quitMember" label="퇴회자" value="Y" cssClass="ml10" />
					</td>
				</tr>
				<tr>
					<th>회기선택</th>
					<td>
						<form:input path="startDate" cssClass="input required date" /> ~ <form:input path="endDate" cssClass="input required date" />
					</td>
				</tr>
			</tbody>
		</table>
	</div><!-- table -->
	
	<div class="table">
		<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	
		<div class="btnBox">
			<img id="excelDownload" src="/images/lionsclubs/btn/btn_excel2.gif" style="margin-top:2px" alt="엑셀다운로드" class="pointer authorization read" />
		</div>
		<div id="Scroll_Area" class="Height_1">
			<div style="float: left;">
				<table class="tblType1" style="width: 200px;">
					<colgroup>
						<col width="30px" />
						<col width="*" />
					</colgroup>
					<thead>				
						<tr>
							<th><input id="lcheckAll" type="checkbox" /></th>
							<th>개인기록관리</th>
						</tr>
					</thead>
					<tbody>
						<tr style="background: #E0FFE0">
							<td class="center"><img src="/css/lionsmobile/images/icons-png/check-black.png" /></td>
							<td>회번</td>
						</tr>
						<tr>
							<td class="center"><form:checkbox path="sectorDistrict" cssClass="info lcheck" value="Y" /></td>
							<td>지구조직</td>
						</tr>
						<tr>
							<td class="center"><form:checkbox path="clubCode" cssClass="info rcheck" value="Y" /></td>
							<td>클럽코드</td>
						</tr>
						<tr class="required">							
							<td class="center"><form:checkbox path="sectorClub" cssClass="info lcheck" value="Y" /></td>
							<td>클럽조직명</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="area" cssClass="info lcheck" value="Y" /></td>
							<td>지역</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="zone" cssClass="info lcheck" value="Y" /></td>
							<td>지대</td>
						</tr>
						<tr class="required">							
							<td class="center"><form:checkbox path="name" cssClass="info lcheck" value="Y" /></td>
							<td>성명</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="chinName" cssClass="info lcheck" value="Y" /></td>
							<td>한자</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="engName" cssClass="info lcheck" value="Y" /></td>
							<td>영문</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="districtTitle" cssClass="info lcheck" value="Y" /></td>
							<td>지구직책</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="division" cssClass="info lcheck" value="Y" /></td>
							<td>회원구분</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="birth" cssClass="info lcheck" value="Y" /></td>
							<td>생년월일</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="singDate" cssClass="info lcheck" value="Y" /></td>
							<td>입회일자</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="quitKind" cssClass="info lcheck" value="Y" /></td>
							<td>활동회원구분</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="quitDate" cssClass="info lcheck" value="Y" /></td>
							<td>퇴회일자</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="quitDivision" cssClass="info lcheck" value="Y" /></td>
							<td>퇴회사유</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div style="float: left; margin-left: 10px;">
				<table class="tblType1" style="width: 200px; border-left: 1px solid #aaa;">
					<colgroup>
						<col width="30px" />
						<col width="*" />
					</colgroup>
					<thead>				
						<tr>
							<th><input id="mcheckAll" type="checkbox" /></th>
							<th>개인기록관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>							
							<td class="center"><form:checkbox path="address" cssClass="info mcheck" value="Y" /></td>
							<td>현주소</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="zipCode" cssClass="info mcheck" value="Y" /></td>
							<td>우편번호</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="mobile" cssClass="info mcheck" value="Y" /></td>
							<td>휴대전화</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="workTel" cssClass="info mcheck" value="Y" /></td>
							<td>직장전화</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="homeTel" cssClass="info mcheck" value="Y" /></td>
							<td>자택전화</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="fax" cssClass="info mcheck" value="Y" /></td>
							<td>팩스번호</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="mailAddress" cssClass="info mcheck" value="Y" /></td>
							<td>메일주소</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="gmail" cssClass="info mcheck" value="Y" /></td>
							<td>HP/Gmail</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="businessClass" cssClass="info mcheck" value="Y" /></td>
							<td>업종분류</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="industry" cssClass="info mcheck" value="Y" /></td>
							<td>업종</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="companyTitle" cssClass="info mcheck" value="Y" /></td>
							<td>업체직책</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="companyName" cssClass="info mcheck" value="Y" /></td>
							<td>업체명</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="companyAddress" cssClass="info mcheck" value="Y" /></td>
							<td>업체주소</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="endEducation" cssClass="info mcheck" value="Y" /></td>
							<td>최종학력</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="nativeSchool" cssClass="info mcheck" value="Y" /></td>
							<td>출신학교</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div style="float: left; margin-left: 10px;">
				<table class="tblType1" style="width: 200px; border-left: 1px solid #aaa;">
					<colgroup>
						<col width="30px" />
						<col width="*" />
					</colgroup>
					<thead>				
						<tr>
							<th><input id="rcheckAll" type="checkbox" /></th>
							<th>개인기록관리</th>
						</tr>
					</thead>
					<tbody>
						<tr>							
							<td class="center"><form:checkbox path="majorSubject" cssClass="info rcheck" value="Y" /></td>
							<td>전공과목</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="army" cssClass="info rcheck" value="Y" /></td>
							<td>병력관계</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="blood" cssClass="info rcheck" value="Y" /></td>
							<td>혈액형</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="hobby" cssClass="info rcheck" value="Y" /></td>
							<td>취미활동</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="height" cssClass="info rcheck" value="Y" /></td>
							<td>신장</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="recommMemberNo" cssClass="info rcheck" value="Y" /></td>
							<td>추천자 회번</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="recommMemberName" cssClass="info rcheck" value="Y" /></td>
							<td>추천자 성명</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="recommRealtionship" cssClass="info rcheck" value="Y" /></td>
							<td>추천관계</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="marryStatus" cssClass="info rcheck" value="Y" /></td>
							<td>결혼여부</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="gameteName" cssClass="info rcheck" value="Y" /></td>
							<td>배우자성명</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="family" cssClass="info rcheck" value="Y" /></td>
							<td>본인가족</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="children" cssClass="info rcheck" value="Y" /></td>
							<td>자녀</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="clubTitle" cssClass="info rcheck" value="Y" /></td>
							<td>현클럽직책</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="divisionSector" cssClass="info rcheck" value="Y" /></td>
							<td>현클럽분과소속</td>
						</tr>
						<tr>							
							<td class="center"><form:checkbox path="firstSingDate" cssClass="info rcheck" value="Y" /></td>
							<td>최초입회일자</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div style="float: left; margin-left: 10px;">
				<div style="float: left;" class="mT10 mb10">
					<form:radiobutton path="kind" cssClass="kind" label="없음" />
					<form:radiobutton path="kind" cssClass="kind" value="1" label="경력(선임/위촉)/조회" />
					<form:radiobutton path="kind" cssClass="kind" value="2" label="포상" />
					<form:radiobutton path="kind" cssClass="kind" value="3" label="교육" />
				</div>
				<div style="clear: both; width: 310px; word-wrap: break-word;">
					<table id="1" class="tblType1 kindCondition" style="border: 1px solid #aaa; display: none;">
						<colgroup>
							<col width="80px" />
							<col width="*" />
						</colgroup>					
						<tr>
							<th colspan="2">경력(선임/위촉)/조회</th>
						</tr>
						<tr>
							<th>선임구분</td>
							<td>
								<lions:codeselect path="appKindCode" groupCode="2700" cssStyle="select" caption="선임구분" topLabel="-- 전체 --" /><br/>
							</td>
						</tr>
						<tr>
							<th>선임직책및내용</td>
							<td>
								<form:select path="appDescCode" cssClass="select" caption="선임직책및내용" cssStyle="width: 100%" />
							</td>
						</tr>
					</table>
					
					<table id="2" class="tblType1 kindCondition" style="border: 1px solid #aaa; display: none;">
						<colgroup>
							<col width="80px" />
							<col width="*" />
						</colgroup>					
						<tr>
							<th colspan="2">포상</th>
						</tr>
						<tr>
							<th>주관</td>
							<td><lions:codeselect path="prizeEducationCode" groupCode="3010" cssStyle="select" caption="주관" topLabel="-- 전체 --" /></td>
						</tr>
						<tr>
							<th>항목</td>
							<td><form:select path="prizeItemCode" caption="항목" cssStyle="width: 100%" /></td>
						</tr>
						<tr>
							<th>포상수여자</td>
							<td><lions:codeselect path="prizeAwardGrantorCode" groupCode="3000" caption="포상수여자" topLabel="-- 전체 --" /></td>
						</tr>
					</table>
					
					<table id="3" class="tblType1 kindCondition" style="border: 1px solid #aaa; display: none;">
						<colgroup>
							<col width="80px" />
							<col width="*" />
						</colgroup>					
						<tr>
							<th colspan="2">교육</th>
						</tr>
						<tr>
							<th>주관</td>
							<td><lions:codeselect path="educationEducationCode" groupCode="3010" cssStyle="select" caption="주관" topLabel="-- 전체 --" /></td>
						</tr>
						<tr>
							<th>항목</td>
							<td><form:select path="educationItemCode" caption="항목" cssStyle="width: 100%" /></td>
						</tr>
					</table>										
				</div>
			</div>
		</div>
	</div>
</form:form>