<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#rowrow {
   text-align: center;
   margin-left: 170px;
   margin-right: 170px;
}

#icon {
   border: 1px solid black;
}

#hackdang {
   text-align: center;
   padding: 2px;
}

#nav.justify-content-center{
   background-color: black;
}

ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
   overflow: hidden;
   background-color: black;
   float: center;
}

li {
   float: left;
}

li a {
   display: block;
   color: white;
   text-align: center;
   padding: 14px 16px;
   text-decoration: none;
}

li a:hover {
   background-color: gray;
}
</style>
<!-- header 영역 시작 -->

<div class="container">
<c:if test="${not empty mt_id}">
   <p style="color:white; float:right; font-size: 20px;">${mt_id }강사님환영합니다♥</p>
   </c:if>
   <c:if test="${not empty ms_id}">
   <p style="color:white; float:right; font-size: 20px;">${ms_id }님환영합니다♥</p>
   </c:if>
   <div class="jumbotron text-center" style="background-color: black; margin-bottom:0;">
   
   <p id="hackdang">
      <a href="home"><img src="resources/images/hack.jpg" /></a>
   </p>
   
</div>
</div>

<div class="container" >
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black">
  <a class="navbar-brand" href="/"><img src="resources/images/studying.png" style="background-color: white;"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
    <c:if test="${empty a_id }">
      <li class="nav-item">
        <a class="nav-link" href="selectListStudy?page=1">스터디</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showclasslist?page=1">강의</a>
      </li>
    <c:if test="${empty mt_id}">
      <li class="nav-item">
        <a class="nav-link" href="reg_m_student">학생가입</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="reg_m_teacher">강사가입</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="choiseLogin">로그인</a>
      </li>
      </c:if>
     </c:if>
      <c:if test="${not empty ms_id}">
      <li class="nav-item">
        <a class="nav-link" href="modify_m_student">마이페이지</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout">로그아웃</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="blockForm">신고하기</a>
      </li>
      </c:if>
      <!-- 관리자 아이디 추가 --> 
      <c:if test="${not empty mt_id}">
      <li class="nav-item">
        <a class="nav-link" href="modify_m_teacher">강사페이지</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="blockForm">신고하기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="teacher_logout">로그아웃</a>
      </li>
      </c:if>
      <c:if test="${not empty a_id }">  
	  <li class="nav-item">
        <a class="nav-link" href="showstuall?page=1">학생관리</a>	
      </li> 
      <li class="nav-item">
      	<a class="nav-link" href="showteachall?page=1">강사관리</a>
      </li>
      <li class="nav-item">
      	<a class="nav-link" href="showclassall?page=1">강의관리</a>
      </li>
      <li class="nav-item">
      	<a class="nav-link" href="showstudyall?page=1">스터디 관리</a>
      </li> 
      <li class="nav-item">
      	<a class="nav-link" href="showblockall?page=1">신고관리</a>
      </li>
      <li class="nav-item">
      	<a class="nav-link" href="admintonggea">통계</a>
      </li>
      <li class="nav-item">
      	<a class="nav-link" style="color: white;">${a_id }관리자님 환영합니다★</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="adminLogout">로그아웃</a>
      </li>	
      </c:if>
    </ul>
  </div>  
</nav>
<div class="container" style="background-color: black; padding-bottom: 5px;">
   <form>
      <div class="input-group mb-3" style="background-color: black; text-align: center;">
         <input type="text" class="form-control"
            placeholder="검색어를 입력하세요.">
         <div>
            <button type="submit" class="btn btn-primary">검색</button>
         </div>
      </div>
   </form>
   </div>
</div>
