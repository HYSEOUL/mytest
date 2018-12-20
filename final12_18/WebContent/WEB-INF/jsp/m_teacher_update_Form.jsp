<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container text-center" style="margin-top:30px;">
	<h3>강사페이지</h3>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_teacher">강사 수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="natureInsert">성향관리 (입력/수정)</a></li>
				<li class="nav-item"><a class="nav-link" href="tmileage">마일리지
						관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">강의목록
						관리</a></li>
			</ul>
		</div>
	</nav>
</div>

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
					<label>비밀번호</label> <input type="password" name="ms_pwd"
						id="ms_pwd" class="form-control" value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>이름</label> <input type="text" name="mt_name" id="mt_name"
						required="required" pattern="[^a-zA-X]+"
						oninvalid="this.setCustomValidity('한글만 입력')"
						oninput="this.setCustomValidid('')" class="form-control"
						value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>생년월일(6자리)</label> <input type="text" name="mt_birth"
						id="mt_birth" class="form-control" readonly="readonly"
						value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>성별</label> <input type="text" name="mt_gender"
						id="mt_gender" class="form-control" readonly="readonly"
						value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>이메일</label> <input type="text" name="mt_email" id="mt_email"
						class="form-control" readonly="readonly" value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>전화번호</label> <input type="text" name="mt_phone"
						id="mt_phone" class="form-control" value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<label>강의 이미지</label>
				<div class="container">
					<%-- <img src="resources/imgfile/${svo.s_img }" class="img-fluid"> --%>
					<img src="resources/img/iu5.PNG" class="img-fluid">
				</div>
			</div>

			<br />
			<div class="form-group">
				<label>이미지 파일</label>
				<div class="custom-file">

					<input class="custom-file-input" name="mf_img" id="mf_img"
						type="file"> <label class="custom-file-label"
						for="customFile">Choose file</label>
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