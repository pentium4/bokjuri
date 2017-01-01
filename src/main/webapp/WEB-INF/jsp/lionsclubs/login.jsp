<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=euc-kr"/>
<meta name="author" content="복주리 봉사단"/>
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
<meta name="keyword" content="복주리 봉사단"/>
<title>로그인ㅣ복주리 봉사단</title>

<style>
body {
    background: url('http://i.imgur.com/Eor57Ae.jpg') no-repeat fixed center center;
    background-size: cover;
    font-family: Montserrat;
}

.logo {
    width: 213px;
    height: 36px;
    background: url('http://i.imgur.com/fd8Lcso.png') no-repeat;
    margin: 30px auto;
}

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #ff656c;
    margin: 0 auto;
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: Montserrat;
    padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#username:focus {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#password {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#password:focus {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #ff656c;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #ff656c;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #e15960;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #ff7b81;
}

.mobile {
    width: 200px;
    padding: 20px;
    margin: 0 auto;
}

.mobile button {
    width: 100%;
    height: 40px;
    background: #ff656c;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #e15960;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.mobile button:hover {
    background: #ff7b81;
}

</style>
<script type="text/javascript">
require(['jquery', 'jquery.cookie'], function () {
	$(document).ready(function () {
		init();		
	});
});

require(['init'], function () {
	$(document).ready(function () {
		var saveCookie = $.cookie('save') == 'true' ? true : false;
		$("#m_save").prop("checked", saveCookie);
		
		$("#m_save").on("click", function(){
			var saveCheck = $(this).prop("checked");
			$.cookie('save', saveCheck, {expires: 7});
			if(!saveCheck){
				$.removeCookie('idCookie');
			}
		});
	
		var idCookie = $.cookie('idCookie');
		$("#m_id").val(idCookie);
	});
});

function saveIdCookie(){
	var saveCheck = $("#m_save").prop("checked");
	if(saveCheck){
		$.cookie('idCookie', $("#m_id").val(), {expires: 7});	
	} else {
		$.removeCookie('idCookie');
	}
}

function init() {
	if($.cookie('idCookie') != null){
		$("#m_pw").focus();
	} else {
		$("#m_id").focus();
	}
}

function actionLogin() {
	saveIdCookie();
	
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

function mobile() {
	location.href = "/login/actionMain.do?site_preference=mobile";
}
</script>
</head>

<body>
<form name="loginForm" action ="<c:url value='/j_spring_security_check?site_preference=normal'/>" method="post">
	<div class="logo"></div>
	<div class="login-block">
	    <h1>복주리 봉사단</h1>
	    <input type="text" value="" placeholder="아이디" id="m_id" name="j_username" />
	    <input type="password" value="" placeholder="패스워드" id="m_pw" name="j_password" />
	    <button onclick="actionLogin()">로그인</button>
	</div>
	
	<div class="mobile">
		<button onclick="mobile()">모바일 버전</button>
	</div>
</form>
</body>

</html>
