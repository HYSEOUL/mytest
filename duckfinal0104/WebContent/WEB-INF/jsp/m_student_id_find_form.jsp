<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>학생 아이디 찾기 페이지</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="find_student_id" >
		<div class="container ">
			<div class="form-group">
				<div>
				<label>학생이름</label>
				<input type="text" name="ms_name"
					id="ms_name" required="required" pattern="[^a-zA-X]+"
					oninvalid="this.setCustomValidity('한글만 입력')"
					oninput="this.setCustomValidid('')" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>이메일</label>
				<input type="email" name="ms_email" id="ms_email" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="아이디찾기">
					<input type="button" class="btn btn-primary btn-block" value="뒤로가기" onclick="history.go(-1);" >
				</div>
			</div>
    </div>
  </form>
</div>
    