<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div id="content">
	<fieldset>
		<legend>성향 로그인 폼</legend>
		<form method="post" action="loginProcess" autocomplete="off">
			<p>
				<label>아이디</label> <input type="text" name="ms_id" id="ms_id">
			</p>
			<p>
				<label>비밀번호</label> <input type="password" name="ms_pwd" id="ms_pwd">
			</p>
			<p style="text-align: right;">
				<input type="submit" value="로그인">
			</p>
		</form>
		<a href="findIdPwd">아이디/비번찾기</a>
	</fieldset>
</div>