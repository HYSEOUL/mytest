<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style>

</style>
<div class="student_mileage_updateForm_exchange">
	<h2>포인트 환전</h2>
	<h5>* 필요한 포인트를 선택하여 입력하세요. *<br>
	 포인트 환전 시 10%의 수수료가 부과됩니다.</h5>
	<form action="updateS_mileage" method="post">
		<h4>결제 아이디 : ${ms_id }</h4>
		<input type="hidden" name="ms_id" id="ms_id" value="${ms_id }">
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
		<input type="hidden" name="sm_point" id="mypoint" value="${smvo.sm_point }">
		<input type="hidden" name="smNumber" value="5"> <br>
		<input style="" type="submit" name="" class="btn btn-primary btn-block" value="포인트 환전">
	</form>
</div>
<script>
$(document).ready(function(){
	$('#mypoint').val($('#sendPoint').html());
});
</script>
