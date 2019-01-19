<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- <script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "../find_pw.do",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script> -->

<div class="container">
	<div class="container">
		<div class="container">
			<h3>학생 비밀번호 찾기</h3>
		</div>
		<form class="form-horizontal" method="post" action="find_student_pw" >
		<div>
			<p>
				<label>학생 이름</label>
				<input class="form-control" type="text"
					id="ms_name" name="ms_name" required>
			</p>
			<p>
				<label>학생 아이디</label>
				<input class="form-control" type="text"
					id="ms_id" name="ms_id" required>
			</p>
			<p>
				<label>학생 이메일</label>
				<input class="form-control" type="email"
					id="ms_email" name="ms_email" required>
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