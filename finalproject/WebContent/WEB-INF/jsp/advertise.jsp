<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-bottom:50px;">
	<h2>���� ����</h2>
	<hr/>
			<div class="form-group">
				<label>���� �̹���</label>
				<div class="form-group text-center">
				<p>
				<img src="resources/img/${advo.ad_img}" style="width:700px; height:300px;">
				</p>
				</div>
			</div>
			<div class="form-group">
				<div>
				<label>���Ǹ�</label>
				<input type="text" name="ad_title" id="ad_title" class="form-control" value="${advo.ad_title}">
				</div>
			</div>
			<div class="form-group">
				<div>
				<label>���ǳ�¥</label>
				<input type="text" name="ad_date1" id="ad_date1" class="form-control" value="${advo.ad_date1}">
				<input type="text" name="ad_date2" id="ad_date2" class="form-control" value="${advo.ad_date2}">
				</div>
			</div>
			<div class="form-group">
				<div>
				<label>�������</label>
				<input type="text" name="ad_loc1" id="ad_loc1" class="form-control" value="${advo.ad_loc1}">
				</div>
			</div>
</div>