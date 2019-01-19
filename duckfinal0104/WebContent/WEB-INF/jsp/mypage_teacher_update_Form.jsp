<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div class="container" style="padding: 50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>���� ���� ��</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="m_teacher_modify"
		id="m_teacher_modify" enctype="multipart/form-data">
		<div class="container ">

			<div class="form-group">
				<div>
					<label>���̵�</label> <input type="text" name="mt_id" id="mt_id"
						class="form-control" readonly="readonly" value="${mtvo.mt_id}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>��й�ȣ</label> <input type="password" name="mt_pwd"
						id="mt_pwd" class="form-control" value="${mtvo.mt_pwd }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>�̸�</label> <input type="text" name="mt_name" id="mt_name"
						required="required" pattern="[^a-zA-X]+"
						oninvalid="this.setCustomValidity('�ѱ۸� �Է�')"
						oninput="this.setCustomValidid('')" class="form-control"
						value="${mtvo.mt_name }">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>�������(6�ڸ�)</label> <input type="text" name="mt_birth"
						id="mt_birth" class="form-control" readonly="readonly"
						value="${mtvo.mt_birth}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>����</label> <input type="text" name="mt_gender"
						id="mt_gender" class="form-control" readonly="readonly"
						value="${mtvo.mt_gender}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>�̸���</label> <input type="text" name="mt_email" id="mt_email"
						class="form-control" readonly="readonly" value="${mtvo.mt_email}">
				</div>
			</div>

			<div class="form-group">
				<div>
					<label>��ȭ��ȣ</label> <input type="text" name="mt_phone"
						id="mt_phone" class="form-control" value="${mtvo.mt_phone}">
				</div>
			</div>

			<div class="form-group">
				<label>���� �̹���</label>
				<div class="container">
					<img src="resources/img/${mtvo.mt_img}" class="img-fluid">
					
				</div>
			</div>

			<hr />
			<div class="form-group">
				<label>�̹��� ����</label>
				<div class="custom-file">
					<input class="custom-file-input" name="mf_img" id="mf_img" type="file" >
					<label class="custom-file-label" for="customFile">${mtvo.mt_img}</label>
				</div>
			</div>
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="�������">
				</div>
			</div>
		</div>
	</form>
	<div class="container">
	<div class="form-group">
		<form action="delete" method="post">
			<input type="submit" class="btn btn-primary btn-block" value="����Ż��">
		</form>
	</div>
	</div>
</div>