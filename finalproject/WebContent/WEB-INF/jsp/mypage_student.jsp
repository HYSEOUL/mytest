<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container text-center" style="margin-top:30px;">
	<h3>����������</h3>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_student">ȸ�� ����</a></li>
				<li class="nav-item"><a class="nav-link"
					href="characterInsert">������� (�Է�/����)</a></li>
				<li class="nav-item"><a class="nav-link" href="mileageForm">���ϸ���
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="mypage_class_study_list">�������
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="shopbag">��ٱ���
						</a></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container" style="padding: 50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>�л� ���� ��</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="m_student_modify"
		id="m_student_modify" enctype="multipart/form-data">
		<div class="container ">

			<div class="form-group">
				<div>
					<label>���̵�</label> <input type="text" name="ms_id" id="ms_id"
						class="form-control" readonly="readonly" value="${msvo.ms_id}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>�̸���</label> <input type="text" name="ms_email" id="ms_email"
						class="form-control" readonly="readonly" value="${msvo.ms_email}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>��й�ȣ</label> <input type="password" name="ms_pwd"
						id="ms_pwd" class="form-control" value="${msvo.ms_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>�̸�</label> <input type="text" name="ms_name" id="ms_name"
						required="required" pattern="[^a-zA-X]+"
						oninvalid="this.setCustomValidity('�ѱ۸� �Է�')"
						oninput="this.setCustomValidid('')" class="form-control"
						value="${msvo.ms_name}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>�������(6�ڸ�)</label> <input type="text" name="ms_birth"
						id="ms_birth" class="form-control" readonly="readonly"
						value="${msvo.ms_birth}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>����</label> <input type="text" name="ms_gender"
						id="ms_gender" class="form-control" readonly="readonly"
						value="${msvo.ms_gender}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>��ȭ��ȣ</label> <input type="text" name="ms_phone"
						id="ms_phone" class="form-control" value="${msvo.ms_phone}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>�� / �� ���� �ּ�</label> <select name="ms_loc1" id="ms_loc1"
						class="custom-select" value="${msvo.ms_loc1}">
						<option value="����Ư����">����Ư����</option>
						<option value="�λ걤����">�λ걤����</option>
						<option value="�뱸������">�뱸������</option>
						<option value="��õ������">��õ������</option>
						<option value="���ֱ�����">���ֱ�����</option>
						<option value="����������">����������</option>
						<option value="��걤����">��걤����</option>
						<option value="����Ư����ġ��">����Ư����ġ��</option>
						<option value="��⵵">��⵵</option>
						<option value="������">������</option>
						<option value="��û�ϵ�">��û�ϵ�</option>
						<option value="��û����">��û����</option>
						<option value="����ϵ�">����ϵ�</option>
						<option value="���󳲵�">���󳲵�</option>
						<option value="���ϵ�">���ϵ�</option>
						<option value="��󳲵�">��󳲵�</option>
						<option value="����Ư����ġ��">����Ư����ġ��</option>
					</select>
				</div>
			</div>

			<br />
			<!-- <div class="form-group">
									  <label>���⿩��</label>
									  <p>Ǫ�� �˶� ������ �����Ͻðڽ��ϱ�?</p>
									    <div class="form-inline">
											<input type="radio" name="ms_boolean" value="1">����&nbsp;&nbsp;&nbsp;
											<input type="radio" name="ms_boolean" value="0">���Ǿ���
										</div>
									</div> -->

			<div class="form-group">
				<label>���� �̹���</label>
				<div class="container">
					<%-- <img src="resources/imgfile/${svo.s_img }" class="img-fluid"> --%>
					<img src="resources/img/iu5.PNG" class="img-fluid">
				</div>

				<br />

				<div class="form-group">
					<label>�̹��� ���ε�</label>
					<div class="custom-file">

						<input class="custom-file-input" name="mf_img" id="mf_img"
							type="file"> <label class="custom-file-label"
							for="customFile">Choose file</label>
					</div>
				</div>

				<div class="form-group">
					<div>
						<input type="submit" class="btn btn-primary btn-block"
							value="�л�����">
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="container">
		<div class="form-group">
			<form action="delete" method="post">
				<input type="submit" class="btn btn-primary btn-block" value="�л�Ż��">
			</form>
		</div>
	</div>
</div>
