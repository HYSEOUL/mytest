<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container text-center" style="margin-top: 30px;">
	<h3>原戚凪戚走</h3>
</div>

<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
	<table>
	<tr>噺    据   誤 - ${msvo.ms_name}</tr>
	<br/>
	<tr>蟹税 失狽 - ${msvo.ms_gender} </tr>
	<br/>
	<tr>匂    昔    闘 - ${msvo.ms_email}</tr>
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
					href="modify_m_student">噺据 呪舛</a></li> -->
				<li class="nav-item"><a class="nav-link" href="characterInsert">失狽淫軒</a></li>
				<li class="nav-item"><a class="nav-link" href="mileageForm">原析軒走
						淫軒</a></li>
				<li class="nav-item"><a class="nav-link"
					href="mypage_class_study_list">呪悪鯉系 淫軒</a></li>
				<li class="nav-item"><a class="nav-link" href="shopbag">舌郊姥艦
				</a></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container" style="padding: 50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>失狽淫軒凪戚走</h3>
		</div>
	</div>
	<!-- <form class="form-horizontal" method="post" action="m_student_modify"
		id="m_student_modify" enctype="multipart/form-data"> -->
		<div class="container ">

			<div class="form-group">
				<div>
					<label>蟹税 失狽 -> </label> 
					<a>${msvo.ms_gender}</a>
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>格税 失狽 -> </label>
					<a>${msvo.ms_gender}</a> 
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>淫宿 歳醤 -> </label> 
					<a>${msvo.ms_gender}</a> 
				</div>
			</div>
	</div>
	<a href="characterModify">さっしぞちしさぬじっし</a>
	<!-- <form class="form-horizontal" method="post" action="characterModify"
		id="m_student_modify" enctype="multipart/form-data">
	<input type="submit" value="失狽呪舛">
	</form> -->
	<!-- </form> -->
</div>
