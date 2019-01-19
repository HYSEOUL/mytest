<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<!-- 검색 카테고리 메뉴 -->

<div class="container" style="padding: 50px;">
	<div class="form-group">
			<h3 style="margin-left: 35px;">내 상세 정보</h3>
	</div>
	<div class="mypageInfo-box">
		<div class="mypageInfo-left">
		<table>
					<tr><td>아이디 : <h5 class="mypageInfo-table-h5">${msvo.ms_id}</h5></td>
					<tr><td>이메일 : <h5 class="mypageInfo-table-h5"> ${msvo.ms_email}</h5></td>
					<tr><td>비밀번호 : <h5 class="mypageInfo-table-h5">${msvo.ms_pwd }</h5></td>
					<tr><td>이름 : <h5 class="mypageInfo-table-h5">${msvo.ms_name}</h5></td>
					<tr><td>생년월일 : <h5 class="mypageInfo-table-h5">${msvo.ms_birth} </h5></td>
					<tr><td>성별 : <h5 class="mypageInfo-table-h5">${msvo.ms_gender}</h5></td>
					<tr><td>전화번호 : <h5 class="mypageInfo-table-h5">${msvo.ms_phone}</h5></td>
					<tr><td>주소 : <h5 class="mypageInfo-table-h5"> ${msvo.ms_loc1}</h5></td>
					<tr><td>가입날짜 : <h5 class="mypageInfo-table-h5"> ${msvo.ms_regdate}</h5></td>
					<tr><td>수신 동의 여부 : <h5 class="mypageInfo-table-h5"> ${msvo.ms_boolean}</h5></td>
		</table>
		</div>
		<div class="mypageInfo-right">
					<br><label>업로드된 사진</label>
					<img src="resources/img/${msvo.ms_img}" class="img-fluid" alt="${msvo.ms_img} 이미지가 없나봐 업로드 다시해야할걸">
					<div class="custom-file">
							<label class="custom-file-label"
							for="customFile">${msvo.ms_img}</label>
					</div>
		</div>
		</div>
		
			<form action="delete" method="post">
				<input type="submit" class="btn btn-primary btn-block" value="탈퇴">
			</form>
			
				<input type="button" class="btn btn-primary btn-block" id="myInfoupdate" value="수정">
			
</div>

<script>
// 모든 컨텐츠가 로딩이 된 후에 호출되는 메서드
$(function(){	
	/* 다혜부분 */
	$('#myInfoupdate').click(function(){
	      if(confirm("내 정보를 수정 하시겠습니까?")){
	         location = 'modify_m_student_update';/* 'characterModify' */
	      }      
	   });
	/* 다혜부분 끝 */
});
</script>
