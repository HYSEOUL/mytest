<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="myclass_studentList">
<div class="container" style="margin-top: 30px; padding: 10px;">
	<h3>강좌별 수강생 목록 - 이다혜</h3>
	<table class="table" style="margin-bottom: 30px;">
		<thead class="thead-dark">
			<tr>
				<th colspan="14">강좌별 수강생 목록</th>
			</tr>
			<tr>
				<th></th>
				<th>학생명</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>

		<tbody>
			
				<c:forEach var="sc" items="${scvo}">
					<c:forEach var="c" items="${sc.msvo}">
					<tr>
						<td>
						<img src="resources/images/${c.ms_img }"
							style="width: 50px; height: 50px;">
						</td>
						<td>${c.ms_name }</td>
						<td>${c.ms_id }</td>
						<td>${c.ms_email }</td>
						<td>${c.ms_birth }</td>
						<td>${c.ms_gender }</td>
						<td>${c.ms_phone }</td>
						<td>${c.ms_loc1 }</td>
						</tr>
			</c:forEach>
			</c:forEach>
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="8"></td>
			</tr>
		</tfoot>
	</table>
</div>
</div>