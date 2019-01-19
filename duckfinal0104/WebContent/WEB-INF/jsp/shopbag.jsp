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
				<li class="nav-item"><a class="nav-link" href="#">�������
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="shopbag">��ٱ���
						</a></li>
			</ul>
		</div>
	</nav>
</div>

<div class="container" style="margin-top: 30px; padding: 10px;">
	<h3>���͵� ��ٱ��� ���</h3>
	<table class="table" style="margin-bottom: 30px;">
		<thead class="thead-dark">
			<tr>
				<th colspan="14">���͵� ��ٱ��� ���</th>
			</tr>
			<tr>
				<!-- <td><input type="checkbox" id="checkall"></td> -->
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
				<!-- 	<td><input type="checkbox" id="chk" name="chk"></td> -->
					<td><a href=""> <img src="resources/images/${e.s_img }">
					</a></td>
					<td><a href="selectOneStudy?s_num=${e.s_num }">${e.s_title}</a></td>
					<td>${e.ms_name}</td>
					<td>${e.s_category}</td>
					<td>${e.s_loc1}</td>
					<td>${e.s_date1}</td>
					<td>${e.s_date2}</td>
					<td>${e.s_count}</td>
					<td>${e.s_pnum}</td>
					<td>${e.s_price}</td>
					<td><a href="deleteStudy_list?num=${e.sl_num}">����</a></td>
					<td><a
						href="updateStudy_list?num=${e.sl_num}&&buynum=2&&price=${e.s_price}">����</a></td>
				</tr>
			</c:forEach>
			<!-- 				<tr>
             		<td colspan="5" width="100%">�� ��ǰ���� <strong id="tot_price"></strong>�� </td>
            	</tr>
            	
          		<tr>
             		<td colspan="5">�� �ֹ� ��ǰ�� <strong id="tot_amount"></strong>��(��)</td>
          		</tr> -->
		</tbody>
	</table>
	<hr />
</div>



<div class="container" style="margin-top: 30px; padding: 10px;">
	<h3>���� ��ٱ��� ���</h3>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th colspan="15">���� ��ٱ��� ���</th>
			</tr>
			<tr>
				<!-- <td><input type="checkbox" id="checkall2"></td> -->
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
			<c:set var="amt" value="${bagnum}" />
			<c:forEach var="listv" items="${scvolist }">
				<tr>
				<!-- 	<td><input type="checkbox" id="chk" name="chk2"></td> -->
					<td><a href=""> <img src="resources/images/${listv.c_img}">
					</a></td>
					<td><a href="selectoneclassc1?num=${listv.c_num }"
						style="color: gray;">${listv.c_title }</a></td>
					<td>${listv.c_name }</td>
					<td>${listv.c_category}</td>
					<td>${listv.c_loc1 }</td>
					<td>${listv.c_date1 }</td>
					<td>${listv.c_date2 }</td>
					<td>${listv.c_count}</td>
					<td>${listv.c_pnum }</td>
					<td>${listv.c_price }</td>
					<td><a href="deleteClass_list?num=${listv.sc_num}">����</a></td>
					<td><a
						href="updateClass_list?num=${listv.sc_num}&&buynum=2&&price=${listv.c_price }">����</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
	// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
	$(function() {
		//���͵� �ֻ�� üũ�ڽ� Ŭ��
		$("#checkall").click(function() {
			//Ŭ���Ǿ�����
			if ($("#checkall").prop("checked")) {
				//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
				$("input[name=chk]").prop("checked", true);
				//Ŭ���� �ȵ�������
			} else {
				//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
				$("input[name=chk]").prop("checked", false);
			}
		})
		//���� �ֻ�� üũ�ڽ� Ŭ��
		$("#checkall2").click(function() {
			//Ŭ���Ǿ�����
			if ($("#checkall2").prop("checked")) {
				//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
				$("input[name=chk2]").prop("checked", true);
				//Ŭ���� �ȵ�������
			} else {
				//input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
				$("input[name=chk2]").prop("checked", false);
			}
		})
		//���� ���Ź�ư Ŭ��
		$("#classbuybut").click(function() {
			var pram;
			//Ŭ���Ǿ�����
			$('.chk').each(function() {
				if ($(this).is(":checked")) {
					if (i === 0) {

					}
				}

			})
		})
	});
</script>
<!-- 
//���õ� ����
$('input:checkbox[name="chk2"]:checked').length 
 -->