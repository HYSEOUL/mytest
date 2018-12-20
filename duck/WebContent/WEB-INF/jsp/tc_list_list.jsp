<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container text-center" style="margin-top:30px;">
	<h3>����������</h3>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_teacher">���� ����</a></li>
				<li class="nav-item"><a class="nav-link"
					href="natureInsert">������� (�Է�/����)</a></li>
				<li class="nav-item"><a class="nav-link" href="tmileage">���ϸ���
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="tc_list">���Ǹ��
						����</a></li>
			</ul>
		</div>
	</nav>
</div>

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