<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<form method="post" action="pushAlarm">
	<p>
		<label>번호</label> <input type="text" name="num" id="num"
			value="${num}">
	</p>
	<p>
		<label>아이디</label> <input type="text" name="id" id="id" value="${id}">
	</p>
	<p style="text-align: right;">
		<input type="submit" id="push" name="push" value="푸시알림">
	</p>
</form>

<script>
	$(function() {
		
	});
</script>