<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container text-center" style="padding-top: 10%; padding-bottom:10%;">
		
		<c:choose>
			<c:when test="${ms_pwd != null}">
				<h3>ȸ������ �ӽ� ��й�ȣ�� "${ms_pwd}" �Դϴ�.</h3>
			</c:when>
			<c:when test="${mt_pwd != null}">
				<h3>ȸ������ �ӽ� ��й�ȣ�� "${mt_pwd}" �Դϴ�.</h3>
			</c:when>
		</c:choose>
		<br />
		
		<button onclick="history.go(-1);" 
		class="btn btn-primary btn-block">�ڷΰ���</button>
		
		<input type="button" value="�α��� ��������"
			onclick="location='/springproject/choiseLogin'"
			class="btn btn-primary btn-block" >
</div>