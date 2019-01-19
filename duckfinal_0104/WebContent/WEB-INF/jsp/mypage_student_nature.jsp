<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">내 정보</button>
	   <button class="btn-menu-selected" id="natureBtn">성향관리</button>
	   <c:if test="${not empty snvo }">
	   <button class="btn-menu" id="mileageBtn">포인트</button>
	   <button class="btn-menu" id="classBtn">수강목록</button>
	   <button class="btn-menu" id="cartBtn">장바구니</button>
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
               <tr><td>나의 성향 -> <h5 class="mypageInfo-table-h5"> ${snvo.sn_my}</h5></td>
               <tr><td>내 선호 성향 -> <h5 class="mypageInfo-table-h5"> ${snvo.sn_you}</h5></td>
               <tr><td>관심 분야 -> <h5 class="mypageInfo-table-h5"> ${snvo.sn_category}</h5></td>
      </table>
      <nav style="width:75%; padding: 0px 40px 0px 0px; ">
      <button type="submit" id="natureUpdateBtn" class="btn btn-primary btn-block" >
         성향 수정
         </button>
         </nav>
      </div >
      <div class="mypageInfo-right-table">
      <c:if test="${slist ==null }">
         <tr><th colspan="5">* 당신의 선호 성향 [ ${snvo.sn_you} ] 과 관심 분야 [ ${snvo.sn_category} ]를 통해 매칭 된 스터디가 없습니다. *<th></tr>
      </c:if>
      <c:if test="${slist !=null }">
      <table class="table" style="">
      <thead class="thead-dark">
      <tr><th colspan="5">당신의 선호 성향 [ ${snvo.sn_you} ] 과 관심 분야 [ ${snvo.sn_category} ]를 통해 매칭 된 스터디 입니다. <th></tr>
      <tr>
      <td class="table-head-st">스터디 명</td>
      <td class="table-head-st">스터디 분야</td>
      <td class="table-head-st">스터디 리더</td>
      <td class="table-head-st">리더 성향</td>
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
      <td><a href="selectOneStudy?s_num=${s.s_num }">상세보기</a></td>
      </tr>
      </c:forEach>
      </tbody>
      
      </table>
      </c:if>
      </div>
      </c:if>
      <c:if test="${empty snvo }">
      <nav style="margin:30px;">
         <button id="newStudent_nature" class="btn-point">성향 입력</button>
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
   
