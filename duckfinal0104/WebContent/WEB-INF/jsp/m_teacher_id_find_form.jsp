<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>���� ���̵� ã�� ������</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="find_teacher_id" >
		<div class="container ">
			<div class="form-group">
				<div>
				<label>�����̸�</label>
				<input type="text" name="mt_name"
					id="mt_name" required="required" pattern="[^a-zA-X]+"
					oninvalid="this.setCustomValidity('�ѱ۸� �Է�')"
					oninput="this.setCustomValidid('')" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>�̸���</label>
				<input type="email" name="mt_email" id="mt_email" 
				class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="���̵�ã��">
					<input type="button" class="btn btn-primary btn-block" value="�ڷΰ���" onclick="history.go(-1);" >
				</div>
			</div>
    </div>
  </form>
</div>
    