<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container" style="padding:150px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>신고하기</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="createBlock"
		enctype="multipart/form-data">
		<div class="container">
			<div class="form-group">
				<div>
				<label>신고당하는 ID</label>
				<input type="text" name="b_id" id="b_id" class="form-control">
				</div>
			</div>
		
			<div class="form-group">
				<div>
					<label>제목</label>
					<input type="text" name="b_title" id="b_title" class="form-control">
				</div>
			</div>
	
	        <div class="form-group">
				<div>
					<label>신고 분류</label>
					<select name="b_category" id="b_category" class="custom-select">
					<option value="욕설">욕설</option>
					<option value="음란">음란</option>
					<option value="비매너">비매너</option>
					<option value="수업방해">수업방해</option>
					<option value="버그사용">버그사용</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>신고 내용</label>
					<textarea class="form-control" rows="10" cols="20" id="b_content" name="b_content">
					</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="확인">
				</div>
			</div>
		</div>
	</form>
</div>
<!-- 	
<div id="article">
	<div id="header2">
		<h1> 신고 게시판 </h1>
		<p id="time">2018-12-10</p>
	</div>
	<div>신고하기
		<form action="createBlock" method="post">
		신고당하는 ID : <input type="text" name="b_id" id="b_id">
		제목 : <input type="text" name="b_title" id="b_title"><br>
		신고 분류 : 
		<select id="b_category" name="b_category">
		<option>욕설</option>
		<option>음란</option>
		<option>비매너</option>
		<option>수업방해</option>
		<option>버그사용</option>
		</select>
		내용 : <textarea rows="30" cols="40"  name="b_content" id="b_content"></textarea>
		<input type="submit" name="" id="" value="신고 하기" >
		</form>
	</div>
	<hr>
</div> -->

















<!-- 
	<div>리스트 조회하기
	<h2><a style="color: black" href="selectListBlock">신고 리스트 조회하기</a></h2>
	</div>
	
	<hr><hr><hr>
	
		<div>하나씩 조회하기
		<form action="readS_mileage" method="post">
		ID : <input type="text" name="ms_id" id="ms_id">
		<input type="submit" name="" id="" value="아이디로 조회하기" >
		</form>
	</div>
	<div>수정하기 
		<form action="updateS_mileage" method="post">
		ID : <input type="text" name="ms_id" id="ms_id">
		Point : <input type="text" name="math_point" id="math_point">
		<input type="submit" name="" id="" value="아이디로 포인트 수정하기" >
		</form>
	</div> -->


<script>
	$(function(){
		
	});
</script>