<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script>
	$(document).ready(function() {


	});
</script>
<fieldset>
	<h1>다혜 숙제 폼입니다.</h1>
	
	<fieldset>
	<legend> 2018.12.10 - 숙제</legend>
	<div>
	
	<p><a href="reviewList">강의 reviewList</a></p>
	<p><a href="s_reviewList">스터디 reviewList</a></p>
	</div>
	
	</fieldset>

	<fieldset>
	<legend> 2018.12.07~09 - 숙제</legend>
	<div>
		* 강사 수강 리스트
		<a href="tc_list_1? mt_id=${ mt_id}">강사 수강 리스트</a>
		<form method="post" action="tc_list_1" id="tc_list_1">
			<input type="text" name="mt_id" id="mt_id">
			<input type="submit" value="강사 상세 수강리스트">
		</form>
	</div>


	<div>
		* 강사 마일리지 리스트
		<a href="tmileage">강사 수강 리스트</a>
		<form method="post" action="tmileage" id="tmileage">
			<input type="submit" name="tmileage" id="tmileage" value="강사마일리지">
		</form>
	</div>
	</fieldset>

</fieldset>


