<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
						<select name="tn_my" id="tn_my" class="custom-select" >
							<option value="${mtvo.tn_my}">���� : ${mtvo.tn_my}</option>
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
						<label>2) ���� ��Ī ���� ����</label> <select name="tn_you" id="tn_you" class="custom-select">
							<option value="${mtvo.tn_you}"> ���� : ${mtvo.tn_you}</option>
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
							class="custom-select" >
							<option value="${mtvo.tn_category}">���� : ${mtvo.tn_category}</option> 
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
