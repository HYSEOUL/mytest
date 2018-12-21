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
					href="modify_m_student">ȸ�� ����</a></li>
				<li class="nav-item"><a class="nav-link"
					href="characterInsert">������� (�Է�/����)</a></li>
				<li class="nav-item"><a class="nav-link" href="mileageForm">���ϸ���
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="mypage_class_study_list">�������
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="shopbag">��ٱ���
						</a></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container" style="margin-top: 30px; padding: 10px;">
		<h3>���� �� ���͵� ��� - �̴���</h3>
		<table class="table" style="margin-bottom: 30px;">
			<thead class="thead-dark">
				<tr>
					<th colspan="14"> ���͵� ���� ��� </th>
				</tr>
				<tr>
					<td></td>
					<td>���͵��</td>
					<td>�ۼ���</td>
					<td>�з�</td>
					<td>�ּ�</td>
					<td>������</td>
					<td>������</td>
					<td>Ƚ��</td>
					<td>�ο�</td>
					<td>�ݾ�</td>
				</tr>
			</thead>
			<tbody>
			<%-- <c:set var="amt" value="${bagnum}"/> --%>
				<c:forEach var="e" items="${slvolist}">
					<tr>
						<td><a href=""> 
						<img src="resources/images/${e.s_img }" style="width:50px; height:50px;">
						</a></td>
						<td><a href="selectOneStudy?num=${e.s_num }">${e.s_title}</a></td>
						<td>${e.ms_name}</td>
						<td>${e.s_category}</td>
						<td>${e.s_loc1}</td>
						<td>${e.s_date1}</td>
						<td>${e.s_date2}</td>
						<td>${e.s_count}</td>
						<td>${e.s_pnum}</td>
						<td>${e.s_price}</td>
					</tr>
				</c:forEach>
<!-- ���� �߰� ���� ���� ���� 	
				<tr>
             		<td colspan="5" width="100%">�� ��ǰ���� <strong id="tot_price"></strong>�� </td>
            	</tr>
            	
          		<tr>
             		<td colspan="5">�� �ֹ� ��ǰ�� <strong id="tot_amount"></strong>��(��)</td>
          		</tr> -->
			</tbody>
		</table>
	</div>
	
<div class="container" style="margin-top: 30px; padding: 10px;">
	<h3>����  ���� ���</h3>
	<table class="table">
		<thead class="thead-dark">
				<tr>
					<th colspan="15"> ����  ���� ��� </th>
				</tr>
				<tr>
						<td></td>
						<td>���Ǹ�</td>
						<td>�����</td>
						<td>�о�</td>
						<td>��ġ</td>
						<td>������</td>
						<td>������</td>
						<td>Ƚ��</td>
						<td>�ο�</td>
						<td>���</td>
					</tr>
				</thead>
				<tbody>
				<c:set var="amt" value="${bagnum}"/>
					<c:forEach var="listv" items="${scvolist }">
						<tr>
							<td><a href=""> 
							<img src="resources/images/${listv.c_img}" style="width:50px; height:50px;">
							</a></td>
							<td>
								<a href="selectoneclass?num=${listv.c_num }"
								style="color: gray;">${listv.c_title }</a>
							</td>
							<td>${listv.c_name }</td>
							<td>${listv.c_category}</td>
							<td>${listv.c_loc1 }</td>
							<td>${listv.c_date1 }</td>
							<td>${listv.c_date2 }</td>
							<td>${listv.c_count}</td>
							<td>${listv.c_pnum }</td>
							<td>${listv.c_price }</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>

<script>
// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
$(function(){
	    
});
</script>
