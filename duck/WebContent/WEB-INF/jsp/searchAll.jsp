<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<fieldset>
		<legend>강의명에 대한 강의 검색 결과입니다.</legend>
		<table style="width: 70%">
			<thead>
				<tr style="background: pink; height: 50px">
					<th>강사명</th>
					<th>강의명</th>
					<th>일정</th>
					<th>활동지역</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${classList}">
					<tr style="text-align: center;">
						<td>${e.c_name}</td>
						<td>${e.c_title}</td>
						<td>${e.c_date1}- ${e.c_date2}</td>
						<td>${e.c_loc2}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="4">검색끝</th>
				</tr>
			</tfoot>
		</table>
	</fieldset>
	<fieldset>
		<legend>강사명에 대한 강의 검색 결과입니다.</legend>
		<table style="width: 70%">
			<thead>
				<tr style="background: pink; height: 50px">
					<th>강사명</th>
					<th>강의명</th>
					<th>일정</th>
					<th>활동지역</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${teacherList}">
					<tr style="text-align: center;">
						<td>${e.c_name}</td>
						<td>${e.c_title}</td>
						<td>${e.c_date1}- ${e.c_date2}</td>
						<td>${e.c_loc2}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="4">검색끝</th>
				</tr>
			</tfoot>
		</table>
	</fieldset>
	<fieldset>
		<legend>스터디 검색 결과입니다.</legend>
		<table style="width: 70%">
			<thead>
				<tr style="background: pink; height: 50px">
					<th>이미지</th>
					<th>스터디 제목</th>
					<th>분류</th>
					<th>스터디 지역</th>
					<th>일정</th>
					<th>인원</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${studyList}">
					<tr style="text-align: center;">
					<td><img style="margin: 10px; height: 10px; border: 1px dotted black;"
							src="resources/images/${e.s_img}"></td>
						<td>${e.s_title}</td>
						<td>${e.s_category }</td>
						<td>${e.s_loc1}</td>
						<td>${e.s_date1 } - ${e.s_date2 }</td>
						<td>${e.s_pnum }</td>
						<td>${e.s_price }</td> 
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="4">검색끝</th>
				</tr>
			</tfoot>
		</table>
	</fieldset>
</div>
