<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>kosta188�� �����Դϴ�.</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css">
<style type="text/css">
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<ul>
				<li>Ȩ|</li>
				<li>
				<c:choose>
					<c:when test="${sessionScope.id==null }">
					<a href="loginForm">�α���</a>
					</c:when>
					<c:otherwise>
						${sessionScope.name }��, <a href="logout">�α׾ƿ�</a>
					</c:otherwise>
				</c:choose>
				|
				</li>
				<li><a href="">ȸ������</a>|</li>
				<li><a href="">�μ�����Ʈ</a>|</li>
				<li><a href="">ȸ������Ʈ</a>|</li>
				<li>IP:${reip}</li>
			</ul>
		
		</div>