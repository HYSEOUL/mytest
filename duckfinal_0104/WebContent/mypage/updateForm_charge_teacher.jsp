<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>

</style>
<div class="teacher_mileage_updateForm_charge">
	<h2>����Ʈ ����</h2>
	<h5>* �ʿ��� ����Ʈ�� �����Ͽ� �Է��ϼ���. *</h5>
	<form action="t_mileageupdate" method="post">
		<h4>���� ���̵� : ${mt_id } </h4>
		<input type="hidden" name="mt_id" id="mt_id" value="${mt_id }">
		<h4>
			Point : 
			<select name="math_point" id="math_point">
					<option value="5000">5,000</option>
					<option value="10000">10,000</option>
					<option value="20000">20,000</option>
					<option value="30000">30,000</option>
					<option value="40000">40,000</option>
					<option value="50000">50,000</option>
					<option value="100000">100,000</option>
					<option value="200000">200,000</option>
					<option value="500000">500,000</option>
					<option value="1000000">1,000,000</option>
					<option value="2000000">2,000,000</option>
					</select>
		</h4>
		<input type="hidden" name="tm_point" id="mypoint" value="${tmvo.tm_point }">
		<input type="hidden" name="tmNumber" value="4"> 
		<input	style="" type="submit" name="" class="btn btn-primary btn-block" value="����Ʈ ����">
	</form>
</div>
<script>
	$(document).ready(function(){
		$('#mypoint').val($('#sendPoint').html());
	});
</script>
