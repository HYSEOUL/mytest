<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container text-center" style="margin-top:30px;">
	<h3>강사페이지</h3>
</div>
<div class="container" >
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_student">강사 수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="characterInsert">성향관리 (입력/수정)</a></li>
				<li class="nav-item"><a class="nav-link" href="tmileage">마일리지
						관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">강의목록
						관리</a></li>
			</ul>
		</div>
	</nav>
</div>    

<div class="container">
<div id="article">
   <div id="header2">
      <h1> 마일리지 포인트 </h1>
      <p id="time">2018-11-20</p>
   </div>
   <!-- 
   <div>입력하기
      <form action="mt_creatS_mileage" method="post">
      ID : <input type="text" name="mt_id" id="mt_id">
      Point : <input type="text" name="tm_point" id="tm_point">
      <input type="submit" name="" id="" value="마일리지 입력" >
      </form>
   </div>
    -->
   <div>조회하기
      <form action="tm_point_s" method="post">
      ID : <input type="text" name="mt_id" id="mt_id">
      <input type="submit" name="" id="" value="아이디로 조회하기" >
      </form>
   </div>
   <div>수정하기 
      <form action="t_mileageupdate" method="post">
      ID : <input type="text" name="mt_id" id="mt_id">
      math_point : <input type="text" name="math_point" id="math_point">
      <input type="submit" name="" id="" value="포인트 update" >
      </form>
   </div>
</div>
</div>
