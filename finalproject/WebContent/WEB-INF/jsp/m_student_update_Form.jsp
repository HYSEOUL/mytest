<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container text-center" style="margin-top: 30px;">
	<h3>����������</h3>
</div>

<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
	<table>
	<tr>ȸ    ��   �� - ${msvo.ms_name}</tr>
	<br/>
	<tr>���� ���� - ${msvo.ms_gender} </tr>
	<br/>
	<tr>��    ��    Ʈ - ${msvo.ms_email}</tr>
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
					href="modify_m_student">ȸ�� ����</a></li> -->
				<li class="nav-item"><a class="nav-link" href="characterInsert">�������</a></li>
				<li class="nav-item"><a class="nav-link" href="mileageForm">���ϸ���
						����</a></li>
				<li class="nav-item"><a class="nav-link"
					href="mypage_class_study_list">������� ����</a></li>
				<li class="nav-item"><a class="nav-link" href="shopbag">��ٱ���
				</a></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container" style="padding: 50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>�������������</h3>
		</div>
	</div>
	<!-- <form class="form-horizontal" method="post" action="m_student_modify"
		id="m_student_modify" enctype="multipart/form-data"> -->
		<div class="container ">

			<div class="form-group">
				<div>
					<label>���� ���� -> </label> 
					<a>${msvo.ms_gender}</a>
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>���� ���� -> </label>
					<a>${msvo.ms_gender}</a> 
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>���� �о� -> </label> 
					<a>${msvo.ms_gender}</a> 
				</div>
			</div>
	</div>
	<a href="characterModify">���ä����������̤��ä�</a>
	<!-- <form class="form-horizontal" method="post" action="characterModify"
		id="m_student_modify" enctype="multipart/form-data">
	<input type="submit" value="�������">
	</form> -->
	<!-- </form> -->
</div>
