<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-bottom:50px;">
	<h2>강의 정보</h2>
	<hr/>
			<div class="form-group">
				<label>강의 이미지</label>
				<div class="form-group text-center">
				<p>
				<img src="resources/img/${advo.ad_img}" style="width:700px; height:300px;">
				</p>
				</div>
			</div>
			<div class="form-group">
				<div>
				<label>강의명</label>
				<input type="text" name="ad_title" id="ad_title" class="form-control" value="${advo.ad_title}">
				</div>
			</div>
			<div class="form-group">
				<div>
				<label>강의날짜</label>
				<input type="text" name="ad_date1" id="ad_date1" class="form-control" value="${advo.ad_date1}">
				<input type="text" name="ad_date2" id="ad_date2" class="form-control" value="${advo.ad_date2}">
				</div>
			</div>
			<div class="form-group">
				<div>
				<label>강의장소</label>
				<input type="text" name="ad_loc1" id="ad_loc1" class="form-control" value="${advo.ad_loc1}">
				</div>
			</div>
</div>