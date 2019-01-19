<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu-selected" id="natureBtn">�������</button>
	   <button class="btn-menu" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu" id="tc_list_Btn">�������Ǹ��</button>
   </nav>
</div>
<script>   /* ���⿩�� */
$('#myinfoBtn').on('click',function(){
	console.log($('#myinfoBtn').html());
	location.href = "mypage_teacher_info";
});
	$('#natureBtn').on('click',function(){
		console.log($('#natureBtn').html());
		location.href = "mypage_teacher_nature";/* modify_m_teacher */
	});
	$('#mileageBtn').on('click',function(){
		console.log($('#mileageBtn').html());
		location.href = "mileageForm_teacher";
	});
	$('#tc_list_Btn').on('click',function(){
		console.log($('#tc_list_Btn').html());
		location.href = "mypage_teacher_Tc_list";
	});
</script>

<div class="container" style="padding: 5px; ">
		<div class="mypageInfo-box">
		<c:if test="${not empty tnvo }">
		<div class="mypageInfo-left">
		<table class="mypageInfo-table">
					<tr><td>���� ���� -> <h5 class="mypageInfo-table-h5"> ${tnvo.tn_my}</h5></td>
					<tr><td>�� ��ȣ ���� -> <h5 class="mypageInfo-table-h5"> ${tnvo.tn_you}</h5></td>
					<tr><td>���� �о� -> <h5 class="mypageInfo-table-h5"> ${tnvo.tn_category}</h5></td>
		</table>
		<nav style="width:75%; padding: 0px 40px 0px 0px; ">
		<button type="submit" id="natureUpdateBtn" class="btn btn-primary btn-block" >
			���� ����
			</button>
			</nav>
		</div>
		</c:if>
		<c:if test="${empty tnvo }">
			<a href="teacher_natureInsert">������ �Է��� �ּ���</a>
		</c:if>	
		
		</div>	
	</div>
	
<script>
$(function(){	
	$('#natureUpdateBtn').click(function(){
	location.href = 'modify_m_teacher';/* 'characterModify' */
	});
});
</script>
	 

