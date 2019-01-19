<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container text-center" style="padding-top: 10%; padding-bottom:10%;">
		
		<c:choose>
			<c:when test="${ms_pwd != null}">
				<h3>회원님의 임시 비밀번호는 "${ms_pwd}" 입니다.</h3>
			</c:when>
			<c:when test="${mt_pwd != null}">
				<h3>회원님의 임시 비밀번호는 "${mt_pwd}" 입니다.</h3>
			</c:when>
		</c:choose>
		<br />
		
		<button onclick="history.go(-1);" 
		class="btn btn-primary btn-block">뒤로가기</button>
		
		<input type="button" value="로그인 페이지로"
			onclick="location='/springproject/choiseLogin'"
			class="btn btn-primary btn-block" >
</div>