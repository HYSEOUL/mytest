<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container text-center" style="margin-top:30px;">
   <h3>마이페이지</h3>
</div>

<!-- 검색 카테고리 메뉴 -->

<div class="container" style="padding: 5px; ">
		<div class="mypageInfo-box">
   <div class="form-group">
      <div class="col-sm-8">
         <h3>학생 수정 폼</h3>
      </div>
   </div>
   <form class="form-horizontal" method="post" action="m_student_modify"
      id="m_student_modify" enctype="multipart/form-data">
      <div class="container ">

         <div class="form-group">
            <div>
               <label>아이디</label> <input type="text" name="ms_id" id="ms_id"
                  class="form-control" readonly="readonly" value="${msvo.ms_id}">
            </div>
         </div>

         <div class="form-group">
            <div>
               <label>이메일</label> <input type="text" name="ms_email" id="ms_email"
                  class="form-control" readonly="readonly" value="${msvo.ms_email}">
            </div>
         </div>

         <div class="form-group">
            <div>
               <label>비밀번호</label> <input type="password" name="ms_pwd"
                  id="ms_pwd" class="form-control" value="${msvo.ms_pwd }">
            </div>
         </div>

         <div class="form-group">
            <div>
               <label>이름</label> <input type="text" name="ms_name" id="ms_name"
                  required="required" pattern="[^a-zA-X]+"
                  oninvalid="this.setCustomValidity('한글만 입력')"
                  oninput="this.setCustomValidid('')" class="form-control"
                  value="${msvo.ms_name}">
            </div>
         </div>

         <div class="form-group">
            <div>
               <label>생년월일(6자리)</label> <input type="text" name="ms_birth"
                  id="ms_birth" class="form-control" readonly="readonly"
                  value="${msvo.ms_birth}">
            </div>
         </div>

         <div class="form-group">
            <div>
               <label>성별</label> <input type="text" name="ms_gender"
                  id="ms_gender" class="form-control" readonly="readonly"
                  value="${msvo.ms_gender}">
            </div>
         </div>

         <div class="form-group">
            <div>
               <label>전화번호</label> <input type="text" name="ms_phone"
                  id="ms_phone" class="form-control" value="${msvo.ms_phone}">
            </div>
         </div>

         <div class="form-group">
            <div>
               <label>시 / 도 단위 주소</label>
                <select name="ms_loc1" id="ms_loc1" class="custom-select" >
                  <option value="${msvo.ms_loc1}">기존 : ${msvo.ms_loc1}</option>
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

         <br />

         <div class="form-group">
            <label>학생 이미지</label>
            <div class="container">
               <%-- <img src="resources/imgfile/${svo.s_img }" class="img-fluid"> --%>
               <img src="resources/img/${msvo.ms_img}" class="img-fluid">
            </div>

            <br />

            <div class="form-group">
               <label>파일 업로드</label>
               <div class="custom-file">

                  <input class="custom-file-input" name="mf_img" id="mf_img"
                     type="file"> <label class="custom-file-label"
                     for="customFile">${msvo.ms_img}</label>
               </div>
            </div>

            <div class="form-group">
               <div>
                  <input type="submit" class="btn btn-primary btn-block"
                     value="학생수정">
               </div>
            </div>
         </div>
      </div>
   </form>
   <div class="container">
      <div class="form-group">
         <form action="delete" method="post">
            <input type="submit" class="btn btn-primary btn-block" value="학생탈퇴">
         </form>
      </div>
   </div>
</div>
</div>