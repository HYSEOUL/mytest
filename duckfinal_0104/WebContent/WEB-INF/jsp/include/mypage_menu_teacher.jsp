<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.mypage-menu-bar{
  text-align: center;
  margin: 5% 5% -7px 5%;
  padding: 20px 0px 20px 0px;

  
}
.menu-item{
	color: black;
	font-size: 30px;
	margin-left: 40px;
}
.menu-link:hover{
	color: blue;
	font-weight: bold;
	font-size: 30px;
	margin: 0% 0% -7px 0%;
	border-top:2px solid black;
  	border-right:2px solid black;
  	border-left:2px solid black;
}
</style>

<div class="container">
   <nav class="mypage-menu-bar">
         <ul class="nav justify-content-center">
            <li class="menu-item"><a class="menu-link" href="modify_m_teacher">성향관리</a></li><!-- characterInsert -->
            <li class="menu-item"><a class="menu-link" href="mileageForm">마일리지</a></li>
            <li class="menu-item"><a class="menu-link" href="mypage_class_study_list">수강목록</a></li>
            <li class="menu-item"><a class="menu-link" href="mypage_teacher_Tc_list">개설 클래정보</a></li>
         </ul>
   </nav>
</div>