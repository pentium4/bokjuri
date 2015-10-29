<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>
<script>
require(['init'], function () {
	$(document).ready(function () {
		$.ajax({
			type: "POST",
			async: false,			
			url: '<c:url value="/SM1/SM1_2/SM1_04/organTreeList.do" />',
	 		data: {lvl: 2},  
			dataType: 'json',
			success: function(data) {
				alert(data.result);
				if(data.result){
					var treeList = data.organTreeList;
					$.each(treeList, function(index, object){
						$("#complex").append("<option value="+ object.organCode +">"+ object.koName +"</option>");
					});
				}
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"error:"+error);
			}
		});
	});
});
</script>
<form:form id="form" modelAttribute="SM1_08VO" action="/SM1/SM1_2/SM1_08/SM1_08.do">
<h3><div><lions:menutitle menuId="${param.menuId }" kind="title" /></div></h3>
<div class="table">
	<table class="tblType1" summary="지구별 미 사용코드 설정표">
	<caption>지구별 미 사용코드 설정</caption>
	<colgroup>
		<col width="100px" />
		<col width="*" />
		<col width="100px" />
		<col width="41%" />
	</colgroup>
	<tbody>
	<tr>
		<th>지구코드</th>
		<td>
			<select id="complex" name="complexCode" class="select">
				<option value="">전체</option>
			</select>
		</td>
		<th>그룹코드</th>
		<td><select id="" name="" class="select" style="width:100%;">
				<option value="All" >1050 직책</option>
				<option value="" >1050 직책</option>
			</select>
		</td>
	</tr>
	</tbody>
	</table>
</div>

<div class="table">
	<h4><lions:menutitle menuId="${param.menuId }" kind="subtitle" /></h4>
	<div class="btnBox"><input type="image" id="delete-user" src="/images/lionsclubs/btn/btn_save.gif" alt="저장" style="margin-top:4px;width:57px" /></div>
	<div class="tblTitle mT5 Scroll_Title Height_0">
	<table class="tblType2" summary="지구별 미 사용코드 설정표">
	<caption>지구별 미 사용코드 설정</caption>
	<colgroup>
		<col width="90px" />
		<col width="60px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="*" />
	</colgroup>
	<thead>
	<tr>
		<th>코드</th>
		<th>미사용</th>
		<th>코드명칭</th>
		<th>등록일자</th>
		<th>수정일자</th>
		<th>순서</th>
		<th>옵션1</th>
		<th>옵션2</th>
		<th>옵션3</th>
		<th>코드 내용 설명</th>
	</tr>
	</thead>
	</table>
	</div><!-- tblTitle -->
	<div id="Scroll_Area" class="Height_1">
	<table class="tblType2_1 Scroll_Table">
	<colgroup>
		<col width="90px" />
		<col width="60px" />
		<col width="250px" />
		<col width="100px" />
		<col width="100px" />
		<col width="50px" />
		<col width="60px" />
		<col width="60px" />
		<col width="60px" />
		<col width="*" />
	</colgroup>
	<tbody>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	<tr>
		<td>1000</td>
		<td><input type="checkbox" id="" name="" /></td>
		<td class="left">회원확장부총재</td>
		<td>2014.07.10</td>
		<td>2014.07.10</td>
		<td>1000</td>
		<td></td>
		<td></td>
		<td>*</td>
		<td class="left">지구 책임자</td>
	</tr>
	</tbody>
	</table>
				</div><!-- Height_1 -->
			</div><!-- table -->
</form:form>