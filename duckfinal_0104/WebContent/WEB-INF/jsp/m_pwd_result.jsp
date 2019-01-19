<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container text-center" style="padding:100px;">
		
		<c:choose>
			<c:when test="${ms_pwd != null}">
				<h3>회원님의 임시 비밀번호는 "${ms_pwd}" 입니다.</h3>
			</c:when>
			<c:when test="${mt_pwd != null}">
				<h3>회원님의 임시 비밀번호는 "${mt_pwd}" 입니다.</h3>
			</c:when>
		</c:choose>
		<br />
			
			<div class="row">
		<div class="col-sm-6">
		<button onclick="history.go(-1);" 
		class="btn btn-primary btn-block">뒤로가기</button>
		</div>
		
		<div class="col-sm-6">
		<input type="button" value="로그인 페이지로"
			onclick="location='/springproject/choiseLogin'"
			class="btn btn-primary btn-block" >
		</div>
		</div>
</div>