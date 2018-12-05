<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div id="content">
	<fieldset>
		<legend>로그인 폼</legend>
		<form method="post" action="loginProcess" autocomplete="off">
			<p>
				<label>아이디</label> <input type="text" name="id" id="id">
			</p>
			<p>
				<label>비밀번호</label> <input type="password" name="pwd" id="pwd">
			</p>
			<p style="text-align: right;">

				<input type="submit" value="로그인">
			</p>
		</form>
	</fieldset>
</div>