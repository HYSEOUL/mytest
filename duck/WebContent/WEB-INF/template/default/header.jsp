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

ul {
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
}
</style>
<!-- header ���� ���� -->

<div class="container">
<c:if test="${not empty mt_id}">
   <p style="color:white; float:right; font-size: 20px;">${mt_id }�����ȯ���մϴ٢�</p>
   </c:if>
   <c:if test="${not empty ms_id}">
   <p style="color:white; float:right; font-size: 20px;">${ms_id }��ȯ���մϴ٢�</p>
   </c:if>
   <div class="jumbotron text-center" style="background-color: black; margin-bottom:0;">
   
   <p id="hackdang">
      <a href=""><img src="resources/images/hack.jpg" /></a>
   </p>
   
</div>
</div>

<div class="container" >
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: black">
  <a class="navbar-brand" href="/"><img src="resources/images/studying.png" style="background-color: white;"/></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="selectListStudy?page=1">���͵�</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="showclasslist?page=1">����</a>
      </li>
    <c:if test="${empty mt_id}">
      <li class="nav-item">
        <a class="nav-link" href="reg_m_student">�л�����</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="reg_m_teacher">���簡��</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="choiseLogin">�α���</a>
      </li>
      </c:if>
      <c:if test="${not empty ms_id}">
      <li class="nav-item">
        <a class="nav-link" href="modify_m_student">����������</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout">�α׾ƿ�</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="blockForm">�Ű��ϱ�</a>
      </li>
      </c:if> 
      <c:if test="${not empty mt_id}">
      <li class="nav-item">
        <a class="nav-link" href="modify_m_teacher">����������</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="blockForm">�Ű��ϱ�</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="teacher_logout">�α׾ƿ�</a>
      </li>
      </c:if>
    </ul>
  </div>  
</nav>
<div class="container" style="background-color: black; padding-bottom: 5px;">
   <form>
      <div class="input-group mb-3" style="background-color: black; text-align: center;">
         <input type="text" class="form-control"
            placeholder="�˻�� �Է��ϼ���.">
         <div>
            <button type="submit" class="btn btn-primary">�˻�</button>
         </div>
      </div>
   </form>
   </div>
</div>

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


<%-- 
<div class="container" style="background-color: black;">
   <ul style="background-color: black;">
      <li><a class="active" href="#">���͵�</a></li>
      <li><a class="active" href="#">����</a></li>
      <c:if test="${empty mt_id}">
         <li><a class="active" href="reg_m_student">�л�����</a></li>
         <li><a class="active" href="reg_m_teacher">���簡��</a></li>
         <li><a class="active" href="choiseLogin">�α���</a></li>
      </c:if>

      <c:if test="${not empty ms_id}">
         <li><a class="active" href="modify_m_student">ȸ������</a></li>
         <li><a class="active" href="logout">�α׾ƿ�</a></li>
         <li><a class="active" href="create_study">���͵� �Խ���</a></li>
      </c:if>

      <c:if test="${not empty mt_id}">
         <li><a class="active" href="modify_m_teacher">���� ȸ������</a></li>
         <li><a class="active" href="teacher_logout">�α׾ƿ�</a></li>
      </c:if>

      <!-- ���� -->
      <li><a class="active" href="showclasslist">���� �Խ���</a></li>
      <li><a class="active" href="da_HW">��������</a></li>
      <li><a class="active" href="blockForm">�Ű� ���� CRUD</a></li>

      <c:if test="${not empty ms_id}">
         <p>${ms_id }��ȯ���մϴ٢�</p>
      </c:if>

      <c:if test="${not empty mt_id}">
         <p>${mt_id }�����ȯ���մϴ٢�</p>
      </c:if>

      <!-- <li style="margin-top: 11px; float: right"><input type="text"
         placeholder="�˻��� �غ��ô�." name="search" size="30"> <input
         type="submit" value="�˻�"></li> -->
   </ul>
</div> --%>