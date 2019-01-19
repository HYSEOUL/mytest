<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>���� ȸ������ ��</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" class="register" action="m_teacher_create" id="m_teacher_create"
		enctype="multipart/form-data">
		<div class="container ">
			<div class="form-group">
				<div>
					<label>���̵�</label>
					<input type="text" name="mt_id" id="mt_id" class="form-control">
				</div>
				<div style="padding-top:10px;">
					<p id="target">���̵� �ߺ�Ȯ�� ��� ���</p><input type="button" id="idChkBtn" class="btn btn-primary" value="�ߺ�Ȯ��">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>��й�ȣ</label>
				<input type="password" name="mt_pwd" id="mt_pwd" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>�̸�</label>
				<input type="text" name="mt_name"
					id="mt_name" required="required" pattern="[^a-zA-X]+"
					oninvalid="this.setCustomValidity('�ѱ۸� �Է�')"
					oninput="this.setCustomValidid('')" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>�������(6�ڸ�)</label>
				<input type="text" name="mt_birth" id="mt_birth" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
				<label>����</label>
				<select name="mt_gender" id="mt_gender" class="custom-select" style="width:100px;">
				<option value="����">����</option>
				<option value="����">����</option>
				</select>
			</div>
			</div>

			
			<div class="form-group">
				<div>
				<label>�̸���</label>
				<input type="email" name="mt_email" id="mt_email" class="form-control">
				</div>
			</div>	
				
			<div class="form-group">
				<div>
				<label>��ȭ��ȣ</label>
				<input type="text" name="mt_phone" id="mt_phone" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			  <label>���⿩��</label>
			  <p>Ǫ�� �˶� ������ �����Ͻðڽ��ϱ�?</p>
			    <div class="form-inline">
					<input type="radio" name="mt_boolean" id="mt_boolean_true" value="1"  />����&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mt_boolean" id="mt_boolean_false" value="0" />����
				</div>
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

			<br/>
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
         url:"idconfirm/idcheck2?mt_id="+$('#mt_id').val(),
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