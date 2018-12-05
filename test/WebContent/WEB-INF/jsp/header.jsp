<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>kosta188기 메인입니다.</title>
<link rel="stylesheet" type="text/css" href="resources/css/default.css">
<style type="text/css">
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<ul>
				<li>홈|</li>
				<li>
				<c:choose>
					<c:when test="${sessionScope.id==null }">
					<a href="loginForm">로그인</a>
					</c:when>
					<c:otherwise>
						${sessionScope.name }님, <a href="logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
				|
				</li>
				<li><a href="">회원가입</a>|</li>
				<li><a href="">부서리스트</a>|</li>
				<li><a href="">회원리스트</a>|</li>
				<li>IP:${reip}</li>
			</ul>
		
		</div>