<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>강사 회원가입 폼</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" class="register" action="m_teacher_create" id="m_teacher_create"
		enctype="multipart/form-data">
		<div class="container ">
			<div class="form-group">
				<div>
					<label>아이디</label>
					<input type="text" name="mt_id" id="mt_id" class="form-control">
				</div>
				<div style="padding-top:10px;">
					<p id="target">아이디 중복확인 결과 출력</p><input type="button" id="idChkBtn" class="btn btn-primary" value="중복확인">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>비밀번호</label>
				<input type="password" name="mt_pwd" id="mt_pwd" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>이름</label>
				<input type="text" name="mt_name"
					id="mt_name" required="required" pattern="[^a-zA-X]+"
					oninvalid="this.setCustomValidity('한글만 입력')"
					oninput="this.setCustomValidid('')" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>생년월일(6자리)</label>
				<input type="text" name="mt_birth" id="mt_birth" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
				<label>성별</label>
				<select name="mt_gender" id="mt_gender" class="custom-select" style="width:100px;">
				<option value="남자">남자</option>
				<option value="여자">여자</option>
				</select>
			</div>
			</div>

			
			<div class="form-group">
				<div>
				<label>이메일</label>
				<input type="email" name="mt_email" id="mt_email" class="form-control">
				</div>
			</div>	
				
			<div class="form-group">
				<div>
				<label>전화번호</label>
				<input type="text" name="mt_phone" id="mt_phone" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			  <label>동기여부</label>
			  <p>푸시 알람 설정에 동의하시겠습니까?</p>
			    <div class="form-inline">
					<input type="radio" name="mt_boolean" id="mt_boolean_true" value="1"  />동의&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mt_boolean" id="mt_boolean_false" value="0" />비동의
				</div>
			</div>
			
			<br/>
			<div class="form-group">
				<label>이미지 파일</label>
				<div class="custom-file">
					<!-- 
					<input class="custom-file-input" name="mf_img" id="mf_img" type="file">
					<label class="custom-file-label" for="customFile">Choose file</label>
				 	-->
				 	<input type="file" class="form-control-file border" name="mf_img" id="mf_img">
				</div>
			</div>

			<br/>
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="회원가입">
				</div>
			</div>
		</div>
	</form>
</div>
<script>
$(function(){
   // 회원 아이디 중복 확인!
   $('#idChkBtn').click(function(){
      $.ajax({
         url:"idconfirm/idcheck2?mt_id="+$('#mt_id').val(),
         success:function(data){
            console.log(data);
            if(data == 0){
               $('#target').show().css("color","blue").text("사용가능");
            } else{
               $('#target').show().css("color","red").text("사용중");
            }
         }
      });
   });
});
</script>