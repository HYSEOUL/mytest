<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu-selected" id="natureBtn">�������</button>
	   <c:if test="${not empty snvo }">
	   <button class="btn-menu" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu" id="classBtn">�������</button>
	   <button class="btn-menu" id="cartBtn">��ٱ���</button>
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
      <div class="mypageInfo-box">
      <c:if test="${not empty snvo }">
      <div class="mypageInfo-left">
      <table class="mypageInfo-table">
               <tr><td>���� ���� -> <h5 class="mypageInfo-table-h5"> ${snvo.sn_my}</h5></td>
               <tr><td>�� ��ȣ ���� -> <h5 class="mypageInfo-table-h5"> ${snvo.sn_you}</h5></td>
               <tr><td>���� �о� -> <h5 class="mypageInfo-table-h5"> ${snvo.sn_category}</h5></td>
      </table>
      <nav style="width:75%; padding: 0px 40px 0px 0px; ">
      <button type="submit" id="natureUpdateBtn" class="btn btn-primary btn-block" >
         ���� ����
         </button>
         </nav>
      </div >
      <div class="mypageInfo-right-table">
      <c:if test="${slist ==null }">
         <tr><th colspan="5">* ����� ��ȣ ���� [ ${snvo.sn_you} ] �� ���� �о� [ ${snvo.sn_category} ]�� ���� ��Ī �� ���͵� �����ϴ�. *<th></tr>
      </c:if>
      <c:if test="${slist !=null }">
      <table class="table" style="">
      <thead class="thead-dark">
      <tr><th colspan="5">����� ��ȣ ���� [ ${snvo.sn_you} ] �� ���� �о� [ ${snvo.sn_category} ]�� ���� ��Ī �� ���͵� �Դϴ�. <th></tr>
      <tr>
      <td class="table-head-st">���͵� ��</td>
      <td class="table-head-st">���͵� �о�</td>
      <td class="table-head-st">���͵� ����</td>
      <td class="table-head-st">���� ����</td>
      <td class="table-head-st"></td>
      </tr>
      </thead>
      
      <tbody>
      <c:forEach var="s" items="${slist }">
      <tr>
      <td>${s.s_title }</td>
      <td>${s.s_category}</td>
      <td>${s.ms_id }</td>
      <td>${snvo.sn_you}</td>
      <td><a href="selectOneStudy?s_num=${s.s_num }">�󼼺���</a></td>
      </tr>
      </c:forEach>
      </tbody>
      
      </table>
      </c:if>
      </div>
      </c:if>
      <c:if test="${empty snvo }">
      <nav style="margin:30px;">
         <button id="newStudent_nature" class="btn-point">���� �Է�</button>
         </nav>
      </c:if>   
      
      </div>   
   </div>
   <script>
$(function(){   
   $('#natureUpdateBtn').click(function(){
   location.href = 'natureModify_form';/* 'characterModify' */
   });
   $('#newStudent_nature').on('click',function(){
		location.href = "student_nature_Insert";
	});
});
</script>
   
