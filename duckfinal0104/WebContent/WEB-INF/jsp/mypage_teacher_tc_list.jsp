<%@page import="javax.validation.constraints.Size"%>
<%@page import="org.hibernate.validator.constraints.Length"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("euc-kr");%> 

<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu" id="natureBtn">�������</button>
	   <button class="btn-menu" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu-selected" id="tc_list_Btn">�������Ǹ��</button>
   </nav>
</div>


    <div class="container" style="margin-top: 30px; padding: 10px;">
	<h3>���� ����(����) ��� </h3>
		<table class="table" style="margin-bottom: 30px;">
			<thead class="thead-dark">
				<tr>
					<th colspan="14"> ���� ����(����) ���</th>
				</tr>
				<tr>
					<th>���Ǹ�</th>
					<th>�����</th>
					<th>������</th>
					<th>������</th>
					<th>�з�</th>
					<th>����</th>
					<th></th>
				</tr>
				</thead>
	 			<tbody>
		 			<c:forEach var="tc" items="${tclist}">
	 					<tr>
	 					 <c:forEach var="c" items="${tc.cvo}">
    						<td>
    						<a href="selectoneclass?num=${c.c_num }" class="c_title_role" > 
    								${tc.c_title}</a> </td>
		    				<td>${c.c_name }</td>
		    				<td>${c.c_date1 }</td>
		    				<td>${c.c_date2 }</td>
		    				<td>${c.c_category }</td>
		    				<td>${c.c_price }</td>
		    				<input type="hidden" class="title_copy" value="${tc.c_title}">
		    				<td>
		    				<input type="button" class="mypage-class-studentBtn" id="studentBtn" value="�л�����">
		    				</td>
		    				</c:forEach> 
	    				 </tr>
    				
  				</c:forEach>
	 			</tbody>
				<tfoot>
						<tr>
						<c:if test="${sclist==null}">
							<td colspan="9">* ������ ������ �л� ������ Ȯ���� ������.</td>
						</c:if>
						<c:if test="${sclist!=null}">
							<td colspan="9">* [${sNum}]���� �л��� ���Ǹ� ������ϴ�.</td>
						</c:if>
						</tr>
				</tfoot>
  	</table>
    </div >
    
    
        <!-- �л�ȸ������ -->
    <c:if test="${sclist!=null}">
    <div class="container">
    <table class="table" style="margin-bottom: 30px;">
		<thead class="thead-dark">
			<tr>
				<th colspan="14">��[${sNum}]���� ������ ���</th>
			</tr>
			<tr>
				<th>�л���</th>
				<th>���̵�</th>
				<th>�̸���</th>
				<th>�������</th>
				<th>����</th>
				<th>��ȭ��ȣ</th>
				<th>�ּ�</th>
			</tr>
		</thead>
		<tbody>
			
				<c:forEach var="sc" items="${sclist}">
					<c:forEach var="c" items="${sc.msvo}">
					<tr>
						<td>${c.ms_name }</td>
						<td>${c.ms_id }</td>
						<td>${c.ms_email }</td>
						<td>${c.ms_birth }</td>
						<td>${c.ms_gender }</td>
						<td>${c.ms_phone }</td>
						<td>${c.ms_loc1 }</td>
						
						</tr>
			</c:forEach>
			</c:forEach>
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="8"></td>
			</tr>
		</tfoot>
	</table>
  	</div>
    </c:if>

		<script> /* ���⿩�� */
		$(function(){
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
	
		$('#studentBtn').on('click',function(){    
			let title = $('.title_copy').val();
			console.log("1"+title);
			title = encodeURI(title,'EUC-KR');
	      location = 'tc_list_studentRead?c_title='+title;
	   });
	});
	
</script>
