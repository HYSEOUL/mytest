<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script>
	$(document).ready(function() {


	});
</script>
<fieldset>
	<h1>���� ���� ���Դϴ�.</h1>
	
	<fieldset>
	<legend> 2018.12.10 - ����</legend>
	<div>
	
	<p><a href="reviewList">���� reviewList</a></p>
	<p><a href="s_reviewList">���͵� reviewList</a></p>
	</div>
	
	</fieldset>

	<fieldset>
	<legend> 2018.12.07~09 - ����</legend>
	<div>
		* ���� ���� ����Ʈ
		<a href="tc_list_1? mt_id=${ mt_id}">���� ���� ����Ʈ</a>
		<form method="post" action="tc_list_1" id="tc_list_1">
			<input type="text" name="mt_id" id="mt_id">
			<input type="submit" value="���� �� ��������Ʈ">
		</form>
	</div>


	<div>
		* ���� ���ϸ��� ����Ʈ
		<a href="tmileage">���� ���� ����Ʈ</a>
		<form method="post" action="tmileage" id="tmileage">
			<input type="submit" name="tmileage" id="tmileage" value="���縶�ϸ���">
		</form>
	</div>
	</fieldset>

</fieldset>


