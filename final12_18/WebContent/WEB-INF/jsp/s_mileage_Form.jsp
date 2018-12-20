<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container text-center" style="margin-top:30px;">
	<h3>마이페이지</h3>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_student">회원 수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="characterInsert">성향관리 (입력/수정)</a></li>
				<li class="nav-item"><a class="nav-link" href="mileageForm">마일리지
						관리</a></li>
				<li class="nav-item"><a class="nav-link" href="reg_m_teacher">수강목록
						관리</a></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container">
	<div id="article">
		<div id="header2">
			<h1>마일리지 포인트</h1>
			<p id="time">2018-11-20</p>
		</div>
		<div>
			입력하기
			<form action="creatS_mileage" method="post">
				Num : <input type="text" name="sm_num" id="sm_num"> ID : <input
					type="text" name="ms_id" id="ms_id"> Point : <input
					type="text" name="sm_point" id="sm_point"> <input
					type="submit" name="" id="" value="마일리지 입력">
			</form>
		</div>
		<div>
			조회하기
			<form action="readS_mileage" method="post">
				ID : <input type="text" name="ms_id" id="ms_id"> <input
					type="submit" name="" id="" value="아이디로 조회하기">
			</form>
		</div>
		<div>
			수정하기
			<form action="updateS_mileage" method="post">
				ID : <input type="text" name="ms_id" id="ms_id"> Point : <input
					type="text" name="math_point" id="math_point"> <input
					type="submit" name="" id="" value="아이디로 포인트 수정하기">
			</form>
		</div>
	</div>
</div>
