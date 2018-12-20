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
				<c:forEach var="e" items="${clist}">
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
</div>
