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
	padding: 30px;
}

#nav.justify-content-center{
	background-color: black;
}

/* ul {
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
} */
</style>
<!-- header 영역 시작 -->

<div class="container text-center">
	<div class="form-control" style="background-color:black;">
	<c:if test="${not empty mt_id}">
		<p style="color: white; float: right; font-size: 20px;">${mt_id }강사님환영합니다♥</p>
	</c:if>
	<c:if test="${not empty ms_id}">
		<p style="color: white; float: right; font-size: 20px;">${ms_id }님환영합니다♥</p>
	</c:if>
	</div>
	<div class="container text-center"
		style="background-color: black; margin-bottom: 0; margin-top:-5px;">
		<p id="hackdang">
			<a href="main"><img src="resources/images/hack.jpg" /></a>
		</p>
	</div>
</div>

<div class="container" >
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black">
  <a class="navbar-brand" href="main"><img src="resources/images/studying.png" style="background-color: white;"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <%-- <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="selectListStudy?page=1">스터디</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showclasslist?page=1">오프라인 강의</a>
      </li>
      
      <!-- 강사와 학생의 session값이 없으면 가입 태그와 로그인 태그가 생성 -->
				<c:if test="${empty mt_id}">
					<c:if test="${empty ms_id}">
							<li class="nav-item"><a class="nav-link" href="reg_m_student">학생가입</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="reg_m_teacher">강사가입</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="choiseLogin">로그인</a>
							</li>
					</c:if>
				</c:if>

       <!-- 학생 session값이 있으면 마이페이지 로그인 태그가 생성 -->
				<c:if test="${!empty ms_id}">
					<li class="nav-item"><a class="nav-link"
						href="modify_m_student">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="blockForm">신고하기</a>
					</li>
				</c:if>

		<!-- 강사 session값이 있으면 강사페이지 로그인 태그가 생성 -->
				<c:if test="${!empty mt_id}">
					<li class="nav-item"><a class="nav-link"
						href="modify_m_teacher">강사페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="blockForm">신고하기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="teacher_logout">로그아웃</a>
					</li>
				</c:if>
		
		</ul> --%>
					<ul class="navbar-nav">
				<c:if test="${empty a_id }">
					<li class="nav-item"><a class="nav-link"
						href="selectListStudy?page=1">스터디</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showclasslist?page=1">강의</a></li>
					<!-- 2019.01.02 이지수  
						9. 상단바에 강사아이디로그인 - 학생가입/학생아이디로그인-강사가입 삭제
						비회원만 가입 가능하게끔 하기-->
				<c:if test="${empty ms_id && empty mt_id}">
					<li class="nav-item"><a class="nav-link" href="reg_m_student">학생가입</a>
					</li>
				</c:if>
				<c:if test="${empty ms_id && empty mt_id}">
					<li class="nav-item"><a class="nav-link" href="reg_m_teacher">강사가입</a>
					</li>
				</c:if>	

				<c:if test="${empty ms_id && empty mt_id}">
					<li class="nav-item"><a class="nav-link" href="choiseLogin">로그인</a>
					</li>
				</c:if>

				</c:if>
				<c:if test="${not empty ms_id}">
					<!-- <li class="nav-item"><a class="nav-link" href="reg_m_student">학생가입</a>
					</li> -->
					<li class="nav-item"><a class="nav-link" href="mypage_student_info">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="blockForm">신고하기</a>
					</li>
				</c:if>
				<!-- 관리자 아이디 추가 -->
				<c:if test="${not empty mt_id}">
					<li class="nav-item"><a class="nav-link"
						href="mypage_teacher_info">강사페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="blockForm">신고하기</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="teacher_logout">로그아웃</a>
					</li>
				</c:if>
				<c:if test="${not empty a_id }">
					<li class="nav-item"><a class="nav-link"
						href="showstuall?page=1">학생관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showteachall?page=1">강사관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showclassall?page=1">강의관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showstudyall?page=1">스터디 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showblockall?page=1">신고관리</a></li>
					<li class="nav-item"><a class="nav-link" href="admintonggea">통계</a>
					</li>
					<li class="nav-item"><a class="nav-link" style="color: white;">${a_id }관리자님
							환영합니다★</a></li>
					<li class="nav-item"><a class="nav-link" href="adminLogout">로그아웃</a>
					</li>
				</c:if>
			</ul>
  </div>  
</nav>


<!--  2018.12.26 검색어 select로 수정 -->
<div class="container" style="background-color: black; padding-bottom: 5px;">
	<form action="totalSearch" method="get">
	<input type="hidden" name="page" id="page" value="1">
		<div class="input-group mb-3" style="background-color: black; text-align: center;">
		<select name="searchType" id="searchType" class="custom-select col-sm-2">
					<option value="1">강의명</option>
					<option value="2">강의서비스분야</option>
					<option value="3">강의지역</option>
					<option value="4">스터디명</option>
					<option value="5">스터디서비스분야</option>
					<option value="6">스터디지역</option>
				</select>
			<input type="text" class="form-control" name="searchValue" id="searchValue"
				placeholder="검색어를 입력하세요.">
			<div>
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</div>
	</form>
	</div>
</div>


<!-- 
<div class="container" style="padding-top: 10px; padding-bottom: 10px;">
	<div class="row" id="rowrow">
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=1">
				<img src="resources/images/language.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=2">
				<img src="resources/images/sports.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=3">
				<img src="resources/images/music.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=4">
				<img src="resources/images/art.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=5">
				<img src="resources/images/dance.jpg" class="img-fluid">
			</a>
		</div>
	</div>
	<div class="row" id="rowrow">
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=6">
				<img src="resources/images/acting.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=7">
				<img src="resources/images/certificate.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=8">
				<img src="resources/images/hobby.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=9">
				<img src="resources/images/beauty.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=10">
				<img src="resources/images/programming.jpg" class="img-fluid">
			</a>
		</div>
	</div>
	<hr/>
</div>
 -->