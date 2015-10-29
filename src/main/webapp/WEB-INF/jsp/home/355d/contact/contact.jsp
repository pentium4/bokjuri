<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/lionsclubs/common/taglib.jsp" %>

<div style="margin:30px 0px 0px 30px;">

<table width=550 cellpadding=0 cellspacing=0 border=0 style='border-collapse:collapse;border-top:#DDDDDD 1px solid;table-layout:fixed;margin-left:10px;'>
	<tr>
		<td class=td1 style='width:100px;text-align:center;font-weight:bold;background-color:#EEEEEE;'>발신자명</td>
		<td class=td2 style='padding:2px;'><input type='text' name='name' size=20 maxlength=40></td>
	</tr>
	<tr>
		<td class=td1 style='width:100px;text-align:center;font-weight:bold;background-color:#EEEEEE;'>발신자이메일</td>
		<td class=td2 style='padding:2px;'><input type='text' name='email' size=50 maxlength=100></td>
	</tr>
	<tr>
		<td class=td1 style='width:100px;text-align:center;font-weight:bold;background-color:#EEEEEE;'>제목</td>
		<td class=td2 style='padding:2px;'><input type='text' name='subject' size=50 maxlength=100></td>
	</tr>
	<tr>
		<td class=td1 style='width:100px;text-align:center;font-weight:bold;background-color:#EEEEEE;'>내용</td>
		<td class=td2 style='padding:2px;'>
			<textarea name='content' style='width:100%;height:300px;'></textarea>
		</td>
	</tr>
</table>

<div style='width:550px;margin-left:20px;text-align:center;margin-top:15px;'>
	<input type='image' src='/images/lionsclubs/btn/btn_confirm.gif'>
</div>
