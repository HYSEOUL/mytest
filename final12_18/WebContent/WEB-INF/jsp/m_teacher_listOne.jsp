<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <h1>강사 마이페이지</h1>
    

    <p> <label>이름 : </label> ${dto.mt_name} </p>
    
    <p> <label>아이디 : </label> ${dto.mt_id} </p>
    <p> <label>패스워드 : </label> ${mt_pwd} </p>
    <p> <label>이멜 : </label> ${mt_email} </p>
    <p> <label>폰번호 : </label> ${MT_PHONE} </p>
    <p> <label>생일 : </label>
    ${MT_BIRTH}
    </p>
    <p> <label>포인트 : </label>
    ${tm_point}
    </p>

    
    