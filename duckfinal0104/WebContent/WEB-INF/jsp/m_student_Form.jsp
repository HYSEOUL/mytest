<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>학생 회원가입 폼</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" class="register" action="m_student_create" id="m_student_create"
		enctype="multipart/form-data">
		<div class="container ">
			<div class="form-group">
				<div>
					<label>아이디</label>
					<input type="text" name="ms_id" id="ms_id" class="form-control">
				</div>
				<div style="padding-top:10px;">
					<p id="target">아이디 중복확인 결과 출력</p><input type="button" id="idChkBtn" class="btn btn-primary" value="중복확인">
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
				<label>비밀번호</label>
				<input type="password" name="ms_pwd" id="ms_pwd" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>이름</label>
				<input type="text" name="ms_name"
					id="ms_name" required="required" pattern="[^a-zA-X]+"
					oninvalid="this.setCustomValidity('한글만 입력')"
					oninput="this.setCustomValidid('')" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>생년월일(6자리)</label>
				<input type="text" name="ms_birth" id="ms_birth" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
				<label>성별</label>
				<select name="ms_gender" id="ms_gender" class="custom-select" style="width:100px;">
				<option value="남자">남자</option>
				<option value="여자">여자</option>
				</select>
			</div>
			</div>

			
		
			
			<div class="form-group">
				<div>
				<label>전화번호</label>
				<input type="text" name="ms_phone" id="ms_phone" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>시 / 도 단위 주소</label>
					<select name="ms_loc1" id="ms_loc1" class="custom-select">
					<option value="서울특별시">서울특별시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="광주광역시">광주광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주특별자치도">제주특별자치도</option>
					</select>
					</div>
			</div>
			
			<br/>
			<div class="form-group">
			  <label>동기여부</label>
			  <p>푸시 알람 설정에 동의하시겠습니까?</p>
					<input type="radio" name="ms_boolean_true" value="1" />동의&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ms_boolean_false" value="0" />비동의
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
         url:"idconfirm/idcheck?ms_id="+$('#ms_id').val(),
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