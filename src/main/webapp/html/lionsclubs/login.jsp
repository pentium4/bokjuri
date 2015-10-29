<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=euc-kr"/>
<meta name="author" content="국제라이온스협회 업무통합관리시스템"/>
<meta name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
<meta name="keyword" content="국제라이온스협회 업무통합관리시스템"/>
<title>로그인ㅣ국제라이온스협회 업무통합관리시스템</title>
<link rel="stylesheet" href="/css/lionsclubs/style.css" type="text/css" />
<script type="text/javascript" src="/js/lionsclubs/javascript.js"></script>
<script type="text/javascript" src="/js/lionsclubs/script.js"></script>
</head>

<body>


<div id="loginWrap">
	<h1><img src="/images/lionsclubs/login_logo.gif" alt="국제라이온스협회 업무통합관리시스템" /></h1>
	<div class="login">
		<p class="txt"><img src="/images/lionsclubs/login_title.gif" alt="Member Login" /></p>
		<p class="txt"><img src="/images/lionsclubs/login_txt.gif" alt="국제라이온스협회 업무통합관리시스템에 오신 것을 환영합니다." /></p>
		<div class="loginBox1 clfix">
			<div class="login_txt">
				<p>
					<label for="m_id">아이디</label>
					<img src="/images/lionsclubs/id.gif" alt="아이디" /> <input type="text" id="m_id" class="input1" title="아이디" tabindex="1" />
				</p>
				<p>
					<label for="m_pw">비밀번호</label>
					<img src="/images/lionsclubs/pw.gif" alt="비밀번호" /> <input type="password" id="m_pw" class="input1" title="비밀번호" tabindex="2" />
				</p>
				<p class="check">
                    <label for="m_pw">아이디 저장</label>
                    <input type="checkbox" id="m_save" title="아이디 저장" tabindex="3" /> 아이디 저장
                </p>
			</div>
			<div class="btn">
				<input type="image" id="m_login" src="/images/lionsclubs/btn_login.gif" alt="로그인" tabindex="4" />
			</div>
		</div><!-- loginBox1 -->
		<div class="loginBox2">    
			<dl>
				<dt>아이디/비밀번호를 잊으셨나요?</dt>
				<dd><a href="/"><img src="/images/lionsclubs/btn_id.gif" alt="아이디찾기" /></a></dd>
				<dd><a href="/"><img src="/images/lionsclubs/btn_pw.gif" alt="비밀번호찾기" /></a></dd>
			</dl>
			<dl>
				<dt>아직 회원이 아니신가요?</dt>
				<dd><a href="/"><img src="/images/lionsclubs/btn_join.gif" alt="회원가입" /></a></dd>
			</dl>
		</div><!-- loginBox2 -->
		<div class="copy">COPYRIGHT(C) 2014 국제라이온스협회 업무통합관리시스템. ALL RIGHTS RESERVED.</div>
	</div><!-- login -->
</div><!-- loginWrap -->


</body>
</html>

