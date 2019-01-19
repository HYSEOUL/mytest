<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container">
	<div class="container">
		<div class="container">
			<h3>강사 비밀번호 찾기</h3>
		</div>
		<form class="form-horizontal" method="post" action="find_teacher_pw" >
		<div>
			<p>
				<label>강사 이름</label>
				<input class="form-control" type="text"
					id="mt_name" name="mt_name">
			</p>
			<p>
				<label>강사 아이디</label>
				<input class="form-control" type="text"
					id="mt_id" name="mt_id">
			</p>
			<p>
				<label>강사 이메일</label>
				<input class="form-control" type="email"
					id="mt_email" name="mt_email">
			</p>
			<p>
				<button type="submit" id=findBtn 
				class="btn btn-primary btn-block">비밀번호찾기</button>
				<button type="button" onclick="history.go(-1);"
					class="btn btn-primary btn-block">취소</button>
			</p>
		</div>
		</form>
	</div>
</div>