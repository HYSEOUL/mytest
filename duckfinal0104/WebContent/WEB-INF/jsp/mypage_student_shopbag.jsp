<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu" id="natureBtn">�������</button>
	   <button class="btn-menu" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu" id="classBtn">�������</button>
	   <button class="btn-menu-selected" id="cartBtn">��ٱ���</button>
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
	<h3>���͵� ��ٱ��� ���</h3>
	<table class="table" style="margin-bottom: 30px;">
		<thead class="thead-dark">
			<tr>
				<th colspan="14">���͵� ��ٱ��� ���</th>
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
			<c:forEach var="e" items="${slvolist}">
				<tr>
					<td><a href="selectOneStudy?s_num=${e.s_num }"> 
					<img src="resources/images/${e.s_img }" style="width:50px; height:50px;">
					</a></td>
					<td><a href="selectOneStudy?s_num=${e.s_num }" style="color: gray;">${e.s_title}</a></td>
					<td>${e.ms_name}</td>
					<td>${e.s_category}</td>
					<td>${e.s_loc1}</td>
					<td>${e.s_date1}</td>
					<td>${e.s_date2}</td>
					<td>${e.s_count}</td>
					<td>${e.s_pnum}</td>
					<td>${e.s_price}
					    <input type="hidden" id="s_price" value="${e.s_price}"> 
					</td>
					<td><input type="hidden" id="sl_num" value="${e.sl_num}">  
					<!-- <input type="button" class="mypage-class-studentBtn" id="deleteStudyBut" value="����"> -->
					<a href="deleteStudy_list?num=${e.sl_num}">����</a>
					</td>
					<td><!-- <input type="button" class="mypage-class-studentBtn" id="updateStudyBut" value="����"> -->
					<a href="updateStudy_list?num=${e.sl_num}&&buynum=2&&price=${e.s_price}">����</a>
					</td>
				</tr>
			</c:forEach>
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
					<td><a href="selectoneclassc1?num=${listv.c_num }"> 
					<img src="resources/images/${listv.c_img}" style="width:50px; height:50px;">
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
					<td>
						<!-- <input type="button" class="mypage-class-studentBtn" id="deleteClassBut" value="����"> -->
						<a href="deleteClass_list?num=${listv.sc_num}">����</a>
						</td>
						
					<td>
						<!-- <input type="button" class="mypage-class-studentBtn" id="updateClassBut" value="����"> -->
						<a href="updateClass_list?num=${listv.sc_num}&&buynum=2&&price=${listv.c_price }">����</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</div>
</div>

<script>
	// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
	$(function() {
		/* // ���͵� ����
		$('#deleteStudyBut').click(
			function() {
			var num = $('#sl_num').val();
			console.log($('#sl_num').val());
			//location.href = 'deleteStudy_list?num='+ num;
		}); */
	});
</script>