<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="lions" prefix="lions"%>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" name="viewport" />
<%@ include file="/WEB-INF/jsp/lionsmobile/common/javascript.jsp" %>
<%@ include file="/WEB-INF/jsp/lionsmobile/common/stylesheet.jsp" %>
<script type="text/javascript">

function actionLogin() {
    if($("#m_id").val() == "") {
        alert("아이디를 입력하세요.");
        $("#m_id").focus();
        return false;
    } else if ($("#m_pw").val() == "") {
        alert("비밀번호를 입력하세요.");
        $("#m_pw").focus();
        return;
    } else {
        document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}
</script>	
<form name="loginForm" action ="<c:url value='/j_spring_security_check'/>" method="post">

	<!-- 상단 -->
	<div class="header">
		<h1><img src="/images/lionsclubs/mobile/logo.png" alt="국제라이온스협회 업무통합관리시스템" /></h1>
	</div>
	<!-- 상단 -->

	<!-- 컨테이너 -->
	<div class="container">
		<!-- 내용 -->
		<div id="content" class="p0">
			<!-- 로그인박스 -->
			<div id="loginWrap">
			
				<div class="login">
					<p class="img"><img src="/images/lionsclubs/mobile/login_img.png" alt="국제라이온스협회" /></p>
					<p class="txt"><img src="/images/lionsclubs/mobile/login_title.png" alt="Member Login" /></p>
					<div class="loginBox1 clfix">
							<table style="width:100%;">
								<colgroup>
									<col width="55px" />
									<col width="*" />
									<col width="100px" />
								</colgroup>
								<tbody>
									<tr height="55">
										<td style="padding-left:5px;">
											<label for="m_id">아이디</label>
											<img src="/images/lionsclubs/mobile/id.gif" alt="아이디" />		
										</td>
										<td>
											<input type="tel" name="j_username" id="m_id" title="아이디" tabindex="1" />
										</td>
										<td rowspan="2" align="center">
											<img id="m_login" src="/images/lionsclubs/mobile/btn_login.png" alt="로그인" tabindex="4" onclick="actionLogin()" />
										</td>
									</tr>
									<tr height="55">
										<td style="padding-left:5px;">
											<label for="m_pw">비밀번호</label>
											<img src="/images/lionsclubs/mobile/pw.gif" alt="비밀번호" />	
										</td>
										<td>
											<input type="password" name="j_password" id="m_pw" title="비밀번호" tabindex="2" />
										</td>
									</tr>
								</tbody>
							</table>
					</div><!-- loginBox1 -->
				</div><!-- login -->
			</div><!-- loginWrap -->
			<!-- 로그인박스 -->
		</div>
		<!-- 내용 -->
	</div>
	<!-- 컨테이너 -->
</form>
