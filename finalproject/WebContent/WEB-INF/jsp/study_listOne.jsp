<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container">
	<div class="form-group" style="border: 1px solid black; padding:100px; margin:100px;">
		<div class="row">
			<div class="col-sm-8">
				<h3>스터디 상세보기</h3>
			</div>
			<div class="col-sm-4" style="margin-bottom:10px; float: right">
				<form action="updateStudyForm">
					<input type="hidden" id="s_num" name="s_num" value="${svo.s_num}">
					<button type="submit" class="btn btn-primary btn-block" >수정하기</button>
				</form>
			</div>
		</div>
		<div class="container">
		<%-- <img src="resources/imgfile/${svo.s_img }" class="img-fluid"> --%>
			<img src="resources/img/${svo.s_img}" class="img-fluid">
		</div>
		<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		<p>번호 : ${svo.s_num }</p>
		<p>아이디 : ${svo.ms_id }</p>
		<p>제목 : ${svo.s_title }</p>
		<p>분류 : ${svo.s_category }</p>
		<p>지역1 : ${svo.s_loc1 }</p>
		<p>지역2 : ${svo.s_loc2 }</p>
		<p>시작일 - 종료일 : ${svo.s_date1 } - ${svo.s_date2 }</p>
		<p>횟수 : ${svo.s_count }</p>
		<p>인원 : ${svo.s_pnum }</p>
		<p>내용 : ${svo.s_comment }</p>
		<p>가격 : ${svo.s_price }</p>
		</div>
		<div class="form-group">
			<form action="studydelete">
				<input type="button" class="btn btn-primary btn-block" id="reviewdelBtn" value="스터디삭제">
				<a href="insertStudyList_l?num=${svo.s_num }&&msid=${svo.ms_id }&&buynum=2">스터디신청</a>
				<a href="insertStudyList_l?num=${svo.s_num }&&msid=${svo.ms_id }&&buynum=1">스터디담기</a>
			</form>
			</div>
		</div>
	</div>



<script>
	$(function() {

	});
</script>