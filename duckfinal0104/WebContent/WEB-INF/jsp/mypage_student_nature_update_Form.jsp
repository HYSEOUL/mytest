<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- �˻� ī�װ� �޴� -->
<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<form method="post" action="natureModify" > 
					<h3>�л� ���� ���� ��</h3>
					<div class="form-group">
					<div>
						<label>1) �ڱ� ���� ����</label> <select name="sn_my"
							class="custom-select" >
							<option value="${snvo.sn_my}"> �������� : ${snvo.sn_my}</option>
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
						<label>2) ���� ��Ī ���� ����</label> <select name="sn_you"
							class="custom-select" >
							<option value="${snvo.sn_you}">�������� : ${snvo.sn_you}</option>
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
						<label>3) �н� ���� �о� ����</label> <select name="sn_category"
							class="custom-select" >
							<option value="${snvo.sn_category}">�������� : ${snvo.sn_category}</option>
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
								value="���ÿϷ�">
						</div>
					</div>
			</form>
		</div>
	</div>
</div>