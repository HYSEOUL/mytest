<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<!-- �˻� ī�װ� �޴� -->

<div class="container" style="padding: 50px;">
	<div class="form-group">
			<h3 style="margin-left: 35px;">�� �� ����</h3>
	</div>
	<div class="mypageInfo-box">
		<div class="mypageInfo-left">
		<table>
					<tr><td>���̵� : <h5 class="mypageInfo-table-h5">${msvo.ms_id}</h5></td>
					<tr><td>�̸��� : <h5 class="mypageInfo-table-h5"> ${msvo.ms_email}</h5></td>
					<tr><td>��й�ȣ : <h5 class="mypageInfo-table-h5">${msvo.ms_pwd }</h5></td>
					<tr><td>�̸� : <h5 class="mypageInfo-table-h5">${msvo.ms_name}</h5></td>
					<tr><td>������� : <h5 class="mypageInfo-table-h5">${msvo.ms_birth} </h5></td>
					<tr><td>���� : <h5 class="mypageInfo-table-h5">${msvo.ms_gender}</h5></td>
					<tr><td>��ȭ��ȣ : <h5 class="mypageInfo-table-h5">${msvo.ms_phone}</h5></td>
					<tr><td>�ּ� : <h5 class="mypageInfo-table-h5"> ${msvo.ms_loc1}</h5></td>
					<tr><td>���Գ�¥ : <h5 class="mypageInfo-table-h5"> ${msvo.ms_regdate}</h5></td>
					<tr><td>���� ���� ���� : <h5 class="mypageInfo-table-h5"> ${msvo.ms_boolean}</h5></td>
		</table>
		</div>
		<div class="mypageInfo-right">
					<br><label>���ε�� ����</label>
					<img src="resources/img/${msvo.ms_img}" class="img-fluid" alt="${msvo.ms_img} �̹����� ������ ���ε� �ٽ��ؾ��Ұ�">
					<div class="custom-file">
							<label class="custom-file-label"
							for="customFile">${msvo.ms_img}</label>
					</div>
		</div>
		</div>
		
			<form action="delete" method="post">
				<input type="submit" class="btn btn-primary btn-block" value="Ż��">
			</form>
			
				<input type="button" class="btn btn-primary btn-block" id="myInfoupdate" value="����">
			
</div>

<script>
// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
$(function(){	
	/* �����κ� */
	$('#myInfoupdate').click(function(){
	      if(confirm("�� ������ ���� �Ͻðڽ��ϱ�?")){
	         location = 'modify_m_student_update';/* 'characterModify' */
	      }      
	   });
	/* �����κ� �� */
});
</script>
