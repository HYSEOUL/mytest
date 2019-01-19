<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#rowrow {
	text-align: center;
	margin-left: 170px;
	margin-right: 170px;
}

#icon {
	border: 1px solid black;
}

#hackdang {
	text-align: center;
	padding: 30px;
}

#nav.justify-content-center{
	background-color: black;
}

/* ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: black;
	float: center;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: gray;
} */
</style>
<!-- header ���� ���� -->

<div class="container text-center">
	<div class="form-control" style="background-color:black;">
	<c:if test="${not empty mt_id}">
		<p style="color: white; float: right; font-size: 20px;">${mt_id }�����ȯ���մϴ٢�</p>
	</c:if>
	<c:if test="${not empty ms_id}">
		<p style="color: white; float: right; font-size: 20px;">${ms_id }��ȯ���մϴ٢�</p>
	</c:if>
	</div>
	<div class="container text-center"
		style="background-color: black; margin-bottom: 0; margin-top:-5px;">
		<p id="hackdang">
			<a href="main"><img src="resources/images/hack.jpg" /></a>
		</p>
	</div>
</div>

<div class="container" >
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black">
  <a class="navbar-brand" href="main"><img src="resources/images/studying.png" style="background-color: white;"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <%-- <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="selectListStudy?page=1">���͵�</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showclasslist?page=1">�������� ����</a>
      </li>
      
      <!-- ����� �л��� session���� ������ ���� �±׿� �α��� �±װ� ���� -->
				<c:if test="${empty mt_id}">
					<c:if test="${empty ms_id}">
							<li class="nav-item"><a class="nav-link" href="reg_m_student">�л�����</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="reg_m_teacher">���簡��</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="choiseLogin">�α���</a>
							</li>
					</c:if>
				</c:if>

       <!-- �л� session���� ������ ���������� �α��� �±װ� ���� -->
				<c:if test="${!empty ms_id}">
					<li class="nav-item"><a class="nav-link"
						href="modify_m_student">����������</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">�α׾ƿ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="blockForm">�Ű��ϱ�</a>
					</li>
				</c:if>

		<!-- ���� session���� ������ ���������� �α��� �±װ� ���� -->
				<c:if test="${!empty mt_id}">
					<li class="nav-item"><a class="nav-link"
						href="modify_m_teacher">����������</a></li>
					<li class="nav-item"><a class="nav-link" href="blockForm">�Ű��ϱ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="teacher_logout">�α׾ƿ�</a>
					</li>
				</c:if>
		
		</ul> --%>
					<ul class="navbar-nav">
				<c:if test="${empty a_id }">
					<li class="nav-item"><a class="nav-link"
						href="selectListStudy?page=1">���͵�</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showclasslist?page=1">����</a></li>
					<!-- 2019.01.02 ������  
						9. ��ܹٿ� ������̵�α��� - �л�����/�л����̵�α���-���簡�� ����
						��ȸ���� ���� �����ϰԲ� �ϱ�-->
				<c:if test="${empty ms_id && empty mt_id}">
					<li class="nav-item"><a class="nav-link" href="reg_m_student">�л�����</a>
					</li>
				</c:if>
				<c:if test="${empty ms_id && empty mt_id}">
					<li class="nav-item"><a class="nav-link" href="reg_m_teacher">���簡��</a>
					</li>
				</c:if>	

				<c:if test="${empty ms_id && empty mt_id}">
					<li class="nav-item"><a class="nav-link" href="choiseLogin">�α���</a>
					</li>
				</c:if>

				</c:if>
				<c:if test="${not empty ms_id}">
					<!-- <li class="nav-item"><a class="nav-link" href="reg_m_student">�л�����</a>
					</li> -->
					<li class="nav-item"><a class="nav-link" href="mypage_student_info">����������</a></li>
					<li class="nav-item"><a class="nav-link" href="logout">�α׾ƿ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="blockForm">�Ű��ϱ�</a>
					</li>
				</c:if>
				<!-- ������ ���̵� �߰� -->
				<c:if test="${not empty mt_id}">
					<li class="nav-item"><a class="nav-link"
						href="mypage_teacher_info">����������</a></li>
					<li class="nav-item"><a class="nav-link" href="blockForm">�Ű��ϱ�</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="teacher_logout">�α׾ƿ�</a>
					</li>
				</c:if>
				<c:if test="${not empty a_id }">
					<li class="nav-item"><a class="nav-link"
						href="showstuall?page=1">�л�����</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showteachall?page=1">�������</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showclassall?page=1">���ǰ���</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showstudyall?page=1">���͵� ����</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showblockall?page=1">�Ű����</a></li>
					<li class="nav-item"><a class="nav-link" href="admintonggea">���</a>
					</li>
					<li class="nav-item"><a class="nav-link" style="color: white;">${a_id }�����ڴ�
							ȯ���մϴ١�</a></li>
					<li class="nav-item"><a class="nav-link" href="adminLogout">�α׾ƿ�</a>
					</li>
				</c:if>
			</ul>
  </div>  
</nav>


<!--  2018.12.26 �˻��� select�� ���� -->
<div class="container" style="background-color: black; padding-bottom: 5px;">
	<form action="totalSearch" method="get">
	<input type="hidden" name="page" id="page" value="1">
		<div class="input-group mb-3" style="background-color: black; text-align: center;">
		<select name="searchType" id="searchType" class="custom-select col-sm-2">
					<option value="1">���Ǹ�</option>
					<option value="2">���Ǽ��񽺺о�</option>
					<option value="3">��������</option>
					<option value="4">���͵��</option>
					<option value="5">���͵𼭺񽺺о�</option>
					<option value="6">���͵�����</option>
				</select>
			<input type="text" class="form-control" name="searchValue" id="searchValue"
				placeholder="�˻�� �Է��ϼ���.">
			<div>
				<button type="submit" class="btn btn-primary">�˻�</button>
			</div>
		</div>
	</form>
	</div>
</div>


<!-- 
<div class="container" style="padding-top: 10px; padding-bottom: 10px;">
	<div class="row" id="rowrow">
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=1">
				<img src="resources/images/language.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=2">
				<img src="resources/images/sports.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=3">
				<img src="resources/images/music.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=4">
				<img src="resources/images/art.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=5">
				<img src="resources/images/dance.jpg" class="img-fluid">
			</a>
		</div>
	</div>
	<div class="row" id="rowrow">
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=6">
				<img src="resources/images/acting.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=7">
				<img src="resources/images/certificate.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=8">
				<img src="resources/images/hobby.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=9">
				<img src="resources/images/beauty.jpg" class="img-fluid">
			</a>
		</div>
		<div class="col" id="icon" style="width: 20%">
			<a href="selectGeneralSearch?page=1&searchType=10">
				<img src="resources/images/programming.jpg" class="img-fluid">
			</a>
		</div>
	</div>
	<hr/>
</div>
 -->