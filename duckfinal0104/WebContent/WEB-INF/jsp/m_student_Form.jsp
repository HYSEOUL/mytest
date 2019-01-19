<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>�л� ȸ������ ��</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" class="register" action="m_student_create" id="m_student_create"
		enctype="multipart/form-data">
		<div class="container ">
			<div class="form-group">
				<div>
					<label>���̵�</label>
					<input type="text" name="ms_id" id="ms_id" class="form-control">
				</div>
				<div style="padding-top:10px;">
					<p id="target">���̵� �ߺ�Ȯ�� ��� ���</p><input type="button" id="idChkBtn" class="btn btn-primary" value="�ߺ�Ȯ��">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>�̸���</label>
				<input type="email" name="ms_email" id="ms_email" class="form-control">
				</div>
			</div>	
				
			<div class="form-group">
				<div>
				<label>��й�ȣ</label>
				<input type="password" name="ms_pwd" id="ms_pwd" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>�̸�</label>
				<input type="text" name="ms_name"
					id="ms_name" required="required" pattern="[^a-zA-X]+"
					oninvalid="this.setCustomValidity('�ѱ۸� �Է�')"
					oninput="this.setCustomValidid('')" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>�������(6�ڸ�)</label>
				<input type="text" name="ms_birth" id="ms_birth" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
				<label>����</label>
				<select name="ms_gender" id="ms_gender" class="custom-select" style="width:100px;">
				<option value="����">����</option>
				<option value="����">����</option>
				</select>
			</div>
			</div>

			
		
			
			<div class="form-group">
				<div>
				<label>��ȭ��ȣ</label>
				<input type="text" name="ms_phone" id="ms_phone" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>�� / �� ���� �ּ�</label>
					<select name="ms_loc1" id="ms_loc1" class="custom-select">
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
			
			<br/>
			<div class="form-group">
			  <label>���⿩��</label>
			  <p>Ǫ�� �˶� ������ �����Ͻðڽ��ϱ�?</p>
					<input type="radio" name="ms_boolean_true" value="1" />����&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ms_boolean_false" value="0" />����
			</div>
			
			<br/>
			<div class="form-group">
			<label>�̹��� ����</label>
				<div class="custom-file">
					<!-- 
					<input class="custom-file-input" name="mf_img" id="mf_img" type="file">
					<label class="custom-file-label" for="customFile">Choose file</label>
					 -->
					<input type="file" class="form-control-file border" name="mf_img" id="mf_img">
				</div>
			</div>

			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="ȸ������">
				</div>
			</div>
		</div>
	</form>
</div>
<script>
$(function(){
   // ȸ�� ���̵� �ߺ� Ȯ��!
   $('#idChkBtn').click(function(){
      $.ajax({
         url:"idconfirm/idcheck?ms_id="+$('#ms_id').val(),
         success:function(data){
            console.log(data);
            if(data == 0){
               $('#target').show().css("color","blue").text("��밡��");
            } else{
               $('#target').show().css("color","red").text("�����");
            }
         }
      });
   });
});
</script>