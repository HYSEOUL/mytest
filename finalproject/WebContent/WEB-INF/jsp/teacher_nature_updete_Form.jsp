<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container text-center" style="margin-top:30px;">
	<h3>����������</h3>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_teacher">���� ����</a></li>
				<li class="nav-item"><a class="nav-link"
					href="natureInsert">������� (�Է�/����)</a></li>
				<li class="nav-item"><a class="nav-link" href="tmileage">���ϸ���
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="#">���Ǹ��
						����</a></li>
			</ul>
		</div>
	</nav>
</div>


<div class="container">
	<div id="row">
			<div class="row" style="margin-top:10px;">
			<div class="col-sm-8">
				<h3>���� ���� ��</h3>
			</div>
			</div>
			<form method="post" action="natureModify_teacher" id="natureModify_teacher">
				<input type="hidden" name="mt_id" value="${mt_id }">
					<div class="form-group">
					<div>
						<label>1) �ڱ� ���� ����</label>
						<select name="tn_my" id="tn_my"
							class="custom-select" 
							value="${mtvo.tn_my}">
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="���">���</option>
							<option value="�米">�米</option>
							<option value="����">����</option>
							<option value="ȣ���">ȣ���</option>
							<option value="����">����</option>
							<option value="����">����</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<div>
						<label>2) ���� ��Ī ���� ����</label> <select name="tn_you" id="tn_you"
							class="custom-select" value="${mtvo.tn_you}">
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="����">����</option>
							<option value="���">���</option>
							<option value="�米">�米</option>
							<option value="����">����</option>
							<option value="ȣ���">ȣ���</option>
							<option value="����">����</option>
							<option value="����">����</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<div>
						<label>3) �н� ���� �о� ����</label> <select name="tn_category" id="tn_category"
							class="custom-select" value="${mtvo.tn_category}">
							<option value="�ܱ���">�ܱ���</option>
							<option value="������">������</option>
							<option value="����">����</option>
							<option value="�̼�">�̼�</option>
							<option value="��">��</option>
							<option value="����">����</option>
							<option value="�ڰ���">�ڰ���</option>
							<option value="���">���</option>
							<option value="��Ƽ">��Ƽ</option>
							<option value="���α׷���">���α׷���</option>
						</select>
					</div>
				</div>
					
					<div class="form-group">
						<div>
							<input type="submit" class="btn btn-primary btn-block"
								value="�������">
						</div>
					</div>
			</form>
	</div>
</div>

<%-- 

<div id="content">
	<form method="post" action="natureModify" id="natureModify">
		<fieldset>
			<legend>���� ���� �� �о� �Է� ��</legend>
			<div>
			<p>
				<label>1) �ڱ� ����</label>
			</p>
			<p>
			<input type="text" name="tn_my" id="tn_my" value="${tnvo.tn_my}">
			</p>
			</div>
			<div>
			<p>
				<label>2) ���� ��Ī ����</label>
			</p>
			<p>
				<input type="text" name="tn_you" id="tn_you" value="${tnvo.tn_you}">
			</p>
			</div>
			<div>
			<p>
				<label>3) �н� ���� �о�</label>
			</p>
			<p>
				<input type="text" name="tn_category" id="tn_category" value="${tnvo.tn_category}">
			</p>
			</div>
			<p>
			<input type="submit" value="�������">
			</p>
		</fieldset>
	</form>
	<form method="post" action="natureDelete_teacher">
		<p>
			<input type="submit" id="delete" value="�������">
		</p>
	</form>
</div> --%>