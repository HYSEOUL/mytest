<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container text-center" style="margin-top: 30px;">
	<h3>마이페이지</h3>
</div>

<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
	<table>
	<tr>회    원   명 - ${msvo.ms_name}</tr>
	<br/>
	<tr>나의 성향 - ${msvo.ms_gender} </tr>
	<br/>
	<tr>포    인    트 - ${msvo.ms_email}</tr>
	</table>
	</nav>
</div>

<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center"
		style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<!-- <li class="nav-item"><a class="nav-link"
					href="modify_m_student">회원 수정</a></li> -->
				<li class="nav-item"><a class="nav-link" href="characterInsert">성향관리</a></li>
				<li class="nav-item"><a class="nav-link" href="mileageForm">마일리지
						관리</a></li>
				<li class="nav-item"><a class="nav-link"
					href="mypage_class_study_list">수강목록 관리</a></li>
				<li class="nav-item"><a class="nav-link" href="shopbag">장바구니
				</a></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container" style="padding: 50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>성향관리페이지</h3>
		</div>
	</div>
	<!-- <form class="form-horizontal" method="post" action="m_student_modify"
		id="m_student_modify" enctype="multipart/form-data"> -->
		<div class="container ">

			<div class="form-group">
				<div>
					<label>나의 성향 -> </label> 
					<a>${msvo.ms_gender}</a>
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>너의 성향 -> </label>
					<a>${msvo.ms_gender}</a> 
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>관심 분야 -> </label> 
					<a>${msvo.ms_gender}</a> 
				</div>
			</div>
	</div>
	<a href="characterModify">ㅅㅓㅇㅎㅑㅇㅅㅜㅈㅓㅇ</a>
	<!-- <form class="form-horizontal" method="post" action="characterModify"
		id="m_student_modify" enctype="multipart/form-data">
	<input type="submit" value="성향수정">
	</form> -->
	<!-- </form> -->
</div>
