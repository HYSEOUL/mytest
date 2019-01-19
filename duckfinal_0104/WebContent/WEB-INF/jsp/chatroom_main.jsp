<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="text" id="userId" value="${login}">

<div class="container" style="margin-bottom:30px;">
<div class="row">
<div class="col-sm-9 text-center">
		<h3>실시간 강의정보공유 채팅 커뮤니티</h3>
</div>
<div class="col-sm-3 text-center">
		<input type="button" class="btn btn-primary btn-block" value="방 만들기" id="createRoom">
</div>
</div>
</div>

<div class="container">
<div class="row">
<div class="col-sm-9 table-responsive-sm">
<table class="table">
	<thead class="table-primary text-center">
		<tr>
			<th>방번호</th><th>제목</th><th>서비스분야</th><th>개설자</th><th>개설일</th><th>현재인원</th>
		</tr>
	</thead>
	<tbody class="body">
		<tr>
			<!-- <td>${chatroom}</td><td>${chatroom}</td><td>${chatroom}</td><td>${chatroom}</td><td>${chatroom}</td><td>${chatroom}</td> -->
		</tr>
	</tbody>
</table>
</div>
<div class="col-sm-3">
<table>
	<tr>
		<input type="text" class="form-control" placeholder="방제목을 입력해주세요." id="searchRoom" style="margin-bottom:5px;">
		<input type="submit" class="btn btn-primary btn-block" value="검색" id="searchRoomBtn">
	</tr>
	<thead style="margin-top:10px;">
		<tr>
			<th>채팅 접속자 목록</th>
		</tr>
	</thead>
	<tbody class="body">
		<tr>
			<!-- <td>${chatroom}</td> -->
		</tr>
	</tbody>
</table>
</div>
</div>
</div>