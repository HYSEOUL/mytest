<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>
</style>
<div class="teacher_mileage_updateForm_exchange">
	<h2>����Ʈ ȯ��</h2>
	<h5>* �ʿ��� ����Ʈ�� �����Ͽ� �Է��ϼ���. *<br>
	 ����Ʈ ȯ�� �� 10%�� �����ᰡ �ΰ��˴ϴ�.</h5>
	<form action="t_mileageupdate" method="post">
		<h4>���� ���̵� : ${mt_id }</h4>
		<input type="hidden" name="mt_id" id="mt_id" value="${mt_id }">
		<h4>
			Point : <select name="math_point" id="math_point">
					<option value="100000">100,000</option>
					<option value="150000">150,000</option>
					<option value="200000">200,000</option>
					<option value="300000">300,000</option>
					<option value="400000">400,000</option>
					<option value="500000">500,000</option>
					<option value="1000000">1,000,000</option>
					<option value="2000000">2,000,000</option>
					</select>
		</h4>
		<input type="text" name="tm_point" id="mypoint" value="${tmvo.tm_point }">
		<input type="hidden" name="tmNumber" value="5">
		<input style="" type="submit" name="" class="btn btn-primary btn-block" value="����Ʈ ȯ��">
	</form>
</div>
<script>
$(document).ready(function(){
	$('#mypoint').val($('#sendPoint').html());
});
</script>