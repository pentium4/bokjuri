<%
 /**
  * @Class Name : EgovQnaCnAnswerUpdt.jsp
  * @Description : EgovQnaCnAnswerUpdt 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *
  *  @author 공통서비스팀
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>Q&amp;A내용답변수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css' />">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/button.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qnaManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_qnacnanswer(){

	// 첫 입력란에 포커스..
	qnaManageVO.answerCn.focus();

}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_qnacnanswer(form, qaId){

	// 서버사이드 테스트용
	/*
		form.action = "<c:url value='/uss/olh/qnm/QnaCnAnswerUpdt.do'/>";
		form.submit();
		return;
	*/

	if (!validateQnaManageVO(form)) {

		return;

	} else {


		form.qaId.value = qaId;

		if	(confirm("저장하시겠습니까?"))	{

			form.action = "<c:url value='/uss/olh/qnm/QnaCnAnswerUpdt.do'/>";
			form.submit();

		}


	}

}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnaanswerlist() {

	qnaManageVO.action = "<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>";
	qnaManageVO.submit();

}

/* ********************************************************
 * 메일발송을 위한 화면을 호출
 ******************************************************** */
function fn_egov_pop_mailform() {
/*
	var url 	= "<c:url value='/ems/insertSndngMailView.do'/>";
	var	status 	= "width=640,height=480,top=200,left=200";


	window.open(url,'popup', status);
*/
}


</script>
</head>
<body onLoad="fn_egov_initl_qnacnanswer();">
<DIV id="content" style="width:700px">
<!-- 상단타이틀 -->
<form:form commandName="qnaManageVO" action="${pageContext.request.contextPath}/uss/olh/qnm/QnaCnAnswerUpdt.do" method="post">

<!-- hidden 화일정의-->
<input name="qaId" type="hidden" value="<c:out value='${result.qaId}'/>">

<input name="writngPassword" type="hidden" value="<c:out value='${result.writngPassword}'/>">

<!-- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="left" alt="제목아이콘이미지">&nbsp;Q&amp;A내용답변수정</h1></td>
 </tr>
</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 등록  폼 영역  -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="Q&amp;A에 대한 답변을 수정합니다.">
  <caption>Q&amp;A답변수정</caption>
  <tr>
    <th scope="row" width="20%" height="23" class="required_text" nowrap ><label for="wrterNm">작성자명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
    	<input name="wrterNm" type="text" size="22" readonly value="<c:out value='${result.wrterNm}'/>" maxlength="20" title="작성자명">
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="areaNo">전화번호</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
		<input name="areaNo" type="text" size="5" 		readonly value="<c:out value='${result.areaNo}'/>" maxlength="5" title="전화번호(지역)">-
		<input name="middleTelno" type="text" size="5" 	readonly value="<c:out value='${result.middleTelno}'/>" maxlength="5" title="전화번호(국번)">-
		<input name="endTelno" type="text" size="5" 	readonly value="<c:out value='${result.endTelno}'/>" maxlength="5" title="전화번호(지번)">
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="emailAdres">이메일</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
		<input name="emailAdres" type="text" size="30" readonly value="<c:out value='${result.emailAdres}'/>" maxlength="30" title="이메일">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input name="emailAnswerAt" type="checkbox" disabled value="Y" <c:if test="${result.emailAnswerAt == 'Y'}">checked</c:if> title="이메일답변여부"> 이메일답변여부
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="qestnSj">질문제목</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
    	<input name="qestnSj" type="text" size="70" readonly value="<c:out value="${result.qestnSj}"/>" maxlength="70" title="질문제목">
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="qestnCn">질문내용</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
      <textarea name="qestnCn" class="textarea"  cols="300" rows="20"  readonly style="width:450px;" title="질문내용"><c:out value="${result.qestnCn}"/></textarea>
    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="qnaProcessSttusCode">진행처리상태</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td>
     	<select name="qnaProcessSttusCode" class="select" title="진행처리상태">
  		   <option selected value="<c:out value='${result.qnaProcessSttusCode}'/>"><c:out value='${result.qnaProcessSttusCodeNm}'/>&nbsp;&nbsp;</option>
			<c:forEach var="result" items="${resultList}" varStatus="status">
				<option value='<c:out value="${result.code}"/>'><c:out value="${result.codeNm}"/></option>
			</c:forEach>
  		</select>

    </td>
  </tr>

  <tr>
    <th scope="row" height="23" class="required_text" ><label for="cnsltCn">답변내용<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수항목"></th>
    <td width="80%" nowrap>
      <form:textarea path="answerCn" cols="300" rows="20" cssClass="txaClass" title="답변내용"/>
      <div><form:errors path="answerCn"/></div>
    </td>
  </tr>

</table>

<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>

<!-- 목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
  <td><span class="button"><input type="submit" value="답변" onclick="fn_egov_updt_qnacnanswer(document.forms[0],'<c:out value="${result.qaId}"/>'); return false;"></span></td>
  <td>&nbsp;&nbsp;</td>
  <td><span class="button"><a href="<c:url value='/uss/olh/qnm/QnaAnswerListInqire.do'/>" onclick="fn_egov_inqire_qnaanswerlist(); return false;"><spring:message code="button.list" /></a></span></td>
  <td>&nbsp;&nbsp;</td>
</tr>
</table>


</form:form>
</DIV>

</body>
</html>
