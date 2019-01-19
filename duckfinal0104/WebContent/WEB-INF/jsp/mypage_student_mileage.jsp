<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu" id="natureBtn">�������</button>
	   <c:if test="${not empty snvo }">
	   		<c:if test="${not empty smvo }">
	   <button class="btn-menu-selected" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu" id="classBtn">�������</button>
	   <button class="btn-menu" id="cartBtn">��ٱ���</button>
	   	</c:if>
	   </c:if>
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
<div class="mypageInfo-box" >
		<div class="mypageInfo-left">
			<h4>
				���� ����Ʈ : <a id="sendPoint">${smvo.sm_point }</a>
			</h4>
		<div style="margin: 20px;">
			<button class="btn-point" id="chargeBtn">����Ʈ �����ϱ�</button><br>
			<button class="btn-point" id="exchangeBtn">����Ʈ ȯ���ϱ�</button>
		</div>
		</div>
		<div class="mypageInfo-right-point" id="mypage_student_target">
		</div>
		
</div>
</div>

<script>
	$(document).ready(function() { 
		$('#chargeBtn').on("click", function() {
			var urlPath = "mypage/updateForm_charge.jsp";
			$('#mypage_student_target').load(urlPath,'.student_mileage_updateForm_charge');
		});
		$('#exchangeBtn').on("click", function() {
			var urlPath = "mypage/updateForm_exchange.jsp";
			$('#mypage_student_target').load(urlPath,".student_mileage_updateForm_exchange");
		});
	});
</script> 
