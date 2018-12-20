<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="article">
	<div id="header2">
		<h1>개설된 스터디 목록 보기</h1>
	</div>
	<div id="content">
		<table>
			<thead>
				<tr>
					<th colspan="13">스터디 목록</th>
				</tr>
				<tr>
					<td>작성자</td>
					<td>스터디명</td>
					<td>분류</td>
					<td>시 / 도 단위 주소</td>
					<td>상세주소</td>
					<td>시작일</td>
					<td>종료일</td>
					<td>횟수</td>
					<td>인원</td>
					<td>스터디소개</td>
					<td>이미지파일</td>
					<td>금액</td>
					<td>수정하러가기</td>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${list}">
					<tr>
						<td>${e.ms_id}</td>
						<td><a href="selectOneStudy?num=${e.s_num }">${e.s_title}</a></td>
						<td>${e.s_category}</td>
						<td>${e.s_loc1}</td>
						<td>${e.s_loc2}</td>
						<td>${e.s_date1}</td>
						<td>${e.s_date2}</td>
						<td>${e.s_count}</td>
						<td>${e.s_pnum}</td>
						<td>${e.s_count}</td>
						<td><a href=""> 
						<!-- <img src="resources/imgfile/${e.path}">-->
						<img src="resources/imgfile/${e.s_img }">
						</a></td>
						<td>${e.s_price}</td>
						<td><a href="updateStudyForm?num=${e.s_num }">수정하러가기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
		$(function(){
			
		});
</script>
<style type="text/css">
#content {
	
	width: 1000px;
	margin: auto;
}

#content > table {
	width: 100%;
	border-collapse: collapse;
}

#content > table, thead, th, td {
	border: 1px solid black;
}

#content > table > thead > td {
	text-align: right;
	background-color: white
}

#content tbody img {
	width:	100px;
	border: 0px
}

</style> --%>