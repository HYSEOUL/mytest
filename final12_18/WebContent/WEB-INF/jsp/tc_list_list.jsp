<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div>
	<fieldset>
			<legend>���� ����(����) ���</legend>
			<table>
				<thead>
				<tr>
					<th>���Ǹ�</th>
					<th>�����</th>
					<th>������</th>
					<th>������</th>
					<th>�з�</th>
					<th>����</th>
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