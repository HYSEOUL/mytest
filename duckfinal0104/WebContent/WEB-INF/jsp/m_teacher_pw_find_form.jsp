<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container">
	<div class="container">
		<div class="container">
			<h3>���� ��й�ȣ ã��</h3>
		</div>
		<form class="form-horizontal" method="post" action="find_teacher_pw" >
		<div>
			<p>
				<label>���� �̸�</label>
				<input class="form-control" type="text"
					id="mt_name" name="mt_name">
			</p>
			<p>
				<label>���� ���̵�</label>
				<input class="form-control" type="text"
					id="mt_id" name="mt_id">
			</p>
			<p>
				<label>���� �̸���</label>
				<input class="form-control" type="email"
					id="mt_email" name="mt_email">
			</p>
			<p>
				<button type="submit" id=findBtn 
				class="btn btn-primary btn-block">��й�ȣã��</button>
				<button type="button" onclick="history.go(-1);"
					class="btn btn-primary btn-block">���</button>
			</p>
		</div>
		</form>
	</div>
</div>