<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container">
	<div class="form-group" style="border: 1px solid black; padding:100px; margin:100px;">
		<div class="row">
			<div class="col-sm-8">
				<h3>���͵� �󼼺���</h3>
			</div>
			<div class="col-sm-4" style="margin-bottom:10px; float: right">
				<form action="updateStudyForm">
					<input type="hidden" id="s_num" name="s_num" value="${svo.s_num}">
					<button type="submit" class="btn btn-primary btn-block" >�����ϱ�</button>
				</form>
			</div>
		</div>
		<div class="container">
		<%-- <img src="resources/imgfile/${svo.s_img }" class="img-fluid"> --%>
			<img src="resources/img/${svo.s_img}" class="img-fluid">
		</div>
		<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		<p>��ȣ : ${svo.s_num }</p>
		<p>���̵� : ${svo.ms_id }</p>
		<p>���� : ${svo.s_title }</p>
		<p>�з� : ${svo.s_category }</p>
		<p>����1 : ${svo.s_loc1 }</p>
		<p>����2 : ${svo.s_loc2 }</p>
		<p>������ - ������ : ${svo.s_date1 } - ${svo.s_date2 }</p>
		<p>Ƚ�� : ${svo.s_count }</p>
		<p>�ο� : ${svo.s_pnum }</p>
		<p>���� : ${svo.s_comment }</p>
		<p>���� : ${svo.s_price }</p>
		</div>
		<div class="form-group">
			<form action="studydelete">
				<input type="button" class="btn btn-primary btn-block" id="reviewdelBtn" value="���͵����">
				<a href="insertStudyList_l?num=${svo.s_num }&&msid=${svo.ms_id }&&buynum=2">���͵��û</a>
				<a href="insertStudyList_l?num=${svo.s_num }&&msid=${svo.ms_id }&&buynum=1">���͵���</a>
			</form>
			</div>
		</div>
	</div>



<script>
	$(function() {

	});
</script>