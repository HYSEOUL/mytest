<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>강사 아이디 찾기 페이지</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="find_teacher_id" >
		<div class="container ">
			<div class="form-group">
				<div>
				<label>강사이름</label>
				<input type="text" name="mt_name"
					id="mt_name" required="required" pattern="[^a-zA-X]+"
					oninvalid="this.setCustomValidity('한글만 입력')"
					oninput="this.setCustomValidid('')" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>이메일</label>
				<input type="email" name="mt_email" id="mt_email" 
				class="form-control">
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
    