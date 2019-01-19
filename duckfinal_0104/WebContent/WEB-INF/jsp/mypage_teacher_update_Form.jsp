<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container" style="padding: 50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>강사 수정 폼</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="m_teacher_modify"
		id="m_teacher_modify" enctype="multipart/form-data">
		<div class="container ">

			<div class="form-group">
				<div>
					<label>아이디</label> <input type="text" name="mt_id" id="mt_id"
						class="form-control" readonly="readonly" value="${mtvo.mt_id}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>비밀번호</label> <input type="password" name="mt_pwd"
						id="mt_pwd" class="form-control" value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>이름</label> <input type="text" name="mt_name" id="mt_name"
						required="required" pattern="[^a-zA-X]+"
						oninvalid="this.setCustomValidity('한글만 입력')"
						oninput="this.setCustomValidid('')" class="form-control"
						value="${mtvo.mt_name }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>생년월일(6자리)</label> <input type="text" name="mt_birth"
						id="mt_birth" class="form-control" readonly="readonly"
						value="${mtvo.mt_birth}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>성별</label> <input type="text" name="mt_gender"
						id="mt_gender" class="form-control" readonly="readonly"
						value="${mtvo.mt_gender}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>이메일</label> <input type="text" name="mt_email" id="mt_email"
						class="form-control" readonly="readonly" value="${mtvo.mt_email}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>전화번호</label> <input type="text" name="mt_phone"
						id="mt_phone" class="form-control" value="${mtvo.mt_phone}">
				</div>
			</div>

			<div class="form-group">
				<label>강사 이미지</label>
				<div class="container">
					<img src="resources/images/${mtvo.mt_img}" class="img-fluid">
					
				</div>
			</div>

			<hr />
			<div class="form-group">
				<label>이미지 파일</label>
				<div class="custom-file">
					<input class="custom-file-input" name="mf_img" id="mf_img" type="file" >
					<label class="custom-file-label" for="customFile">${mtvo.mt_img}</label>
				</div>
			</div>
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="강사수정">
				</div>
			</div>
		</div>
	</form>
	<div class="container">
	<div class="form-group">
		<form action="delete" method="post">
			<input type="submit" class="btn btn-primary btn-block" value="강사탈퇴">
		</form>
	</div>
	</div>
</div>