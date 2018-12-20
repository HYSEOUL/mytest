<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div>
	<fieldset>
			<legend>강사 개설(수강) 목록</legend>
			<table>
				<thead>
				<tr>
					<th>강의명</th>
					<th>강사명</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>분류</th>
					<th>가격</th>
				</tr>
				</thead>

				<tfoot>
					<tr><td colspan="6">
					</td></tr>
				</tfoot>

	 			<tbody>
	 			<c:forEach var="e" items="${tcvo}">
	 			<tr>
	 				<td> <a href="selectoneclass?num=${e.c_num }"> ${e.c_title} /${e.c_num }  </a></td>
    				<td>  ${e.c_name} </td>
    				<td> ${e.c_date1} </td>
    				<td> ${e.c_date2} </td>
    				<td> ${e.c_category} </td>
    				<td> ${e.c_price} </td>
  				</c:forEach>
	 			</tbody>
	
  	</table>
  	</fieldset>
    </div>