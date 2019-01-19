<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu" id="natureBtn">�������</button>
	   <button class="btn-menu" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu-selected" id="classBtn">�������</button>
	   <button class="btn-menu" id="cartBtn">��ٱ���</button>
   </nav>
</div>
<script>
$('#myinfoBtn').on('click',function(){
	console.log($('#myinfoBtn').html());
	location.href = "mypage_student_info";
});
	$('#natureBtn').on('click',function(){
		console.log($('#natureBtn').html());
		location.href = "mypage_student_nature";
	});
	$('#mileageBtn').on('click',function(){
		console.log($('#mileageBtn').html());
		location.href = "mileageForm?ms_id=${ms_id }";
	});
	$('#classBtn').on('click',function(){
		console.log($('#classBtn').html());
		location.href = "mypage_class_study_list";
	});
	$('#cartBtn').on('click',function(){
		console.log($('#cartBtn').html());
		location.href = "shopbag";
	});
</script>
<div class="container" style="padding: 5px; ">
		<div class="mypageInfo-box">
<div class="container" style="margin-top: 30px; padding: 10px;">
		<h3>���͵� ���� ���</h3>
		<table class="table" style="margin-bottom: 30px;">
			<thead class="thead-dark">
				<tr>
					<th colspan="14"> ���͵� ���� ��� </th>
				</tr>
				<tr>
					<td></td>
					<td class="table-head-st">���͵��</td>
					<td class="table-head-st">�ۼ���</td>
					<td class="table-head-st">�з�</td>
					<td class="table-head-st">�ּ�</td>
					<td class="table-head-st">������</td>
					<td class="table-head-st">������</td>
					<td class="table-head-st">Ƚ��</td>
					<td class="table-head-st">�ο�</td>
					<td class="table-head-st">�ݾ�</td>
				</tr>
			</thead>
			<tbody>
			<%-- <c:set var="amt" value="${bagnum}"/> --%>
				<c:forEach var="e" items="${slvolist}">
					<tr>
						<td><a href=""> 
						<img src="resources/images/${e.s_img }" style="width:50px; height:50px;">
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
								<a href="selectoneclassc1?num=${listv.c_num }"
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
</div>
</div>

<script>
// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
$(function(){
	    
});
</script>
