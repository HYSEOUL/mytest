<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>강의 개설하기</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" class="register" 
	action="classcreate" id="classcreate" enctype="multipart/form-data">
		<div class="container">
			<div class="form-group">
				<div>
					<label>강의 생성자</label>
					<input type="text" name="c_name" id="c_name" class="form-control">
				</div>
			</div>
		
			<div class="form-group">
				<div>
					<label>강의명</label>
					<input type="text" name="c_title" id="c_title" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>강의 시작일</label> 
					<input type="text" id="c_date1" name="c_date1" autocomplete="off" placeholder="날짜선택">
				</div>
			</div>
			<hr/>	
			<div class="form-group">
				<div>
					<label>강의 종료일</label> 
					<input type="text" id="c_date2" name="c_date2" autocomplete="off" placeholder="날짜선택">
				</div>
			</div>
			<hr/>	
			<div class="form-group">
				<div>
					<label>강의 인원 수</label>
					<select name="c_pnum" id="c_pnum" class="custom-select" style="width: 70px;">
					<c:forEach var="e" begin="1" end="50">
						<option>${e }</option>
					</c:forEach>
					</select>명
				</div>
			</div>
			<hr/>
			<div class="form-group">
				<div>
					<label>강의 위치 시/도 주소</label>
					<select name="c_loc1" id="c_loc1" class="custom-select">
					<option value="서울특별시">서울특별시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="인천광역시">인천광역시</option>
					<option value="광주광역시">광주광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="제주특별자치도">제주특별자치도</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>상세주소</label> 
					<input type="text" name="c_loc2" id="c_loc2" class="form-control" autocomplete="name">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>강의 소개 / 설명</label>
					<textarea class="form-control" rows="5" id="c_comment" name="c_comment"></textarea>
				</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>강의 분야</label>
					<select name="c_category" id="c_category" class="custom-select">
					<option value="외국어">외국어</option>
					<option value="스포츠">스포츠</option>
					<option value="음악">음악</option>
					<option value="미술">미술</option>
					<option value="댄스">댄스</option>
					<option value="연기">연기</option>
					<option value="자격증">자격증</option>
					<option value="취미">취미</option>
					<option value="뷰티">뷰티</option>
					<option value="프로그래밍">프로그래밍</option>
					</select>
					</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>강의 참가비</label>
					<select name="c_price" id="c_price" class="custom-select">
					<option value="5000">5000</option>
					<option value="10000">10000</option>
					<option value="15000">15000</option>
					<option value="20000">20000</option>
					<option value="25000">25000</option>
					<option value="30000">30000</option>
					<option value="35000">35000</option>
					<option value="40000">40000</option>
					<option value="45000">45000</option>
					<option value="50000">50000</option>
					</select>
					</div>
			</div>
			
			<div class="form-group">
					<label>주 강의 횟수</label>
					<select name="c_count" id="c_count" class="custom-select">
					<c:forEach var="e" begin="1" end="5">
						<option>${e }</option>
					</c:forEach>
					</select>
			</div>
			
			<div class="form-group">
			<label>이미지 파일</label>
				<div class="custom-file">
					 <!-- c_img -->
					<input type="text" name="c_img" id="c_img" class="form-control">
					<!-- <label class="custom-file-label" for="customFile">Choose file</label> -->
				</div>
			</div>
			
			<div class="form-group">
					<label>마일리지 사용 옵션</label>
					<select name="c_point" id="c_point" class="custom-select">					
						<option>1</option>
						<option>2</option>
					</select>
			</div>
			
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="강의생성">
				</div>
			</div>
		</div>
	</form>
</div>
<script>
$(function() {
  $( "#c_date1" ).datepicker({
    dateFormat: 'yymmdd'
  });
  $( "#c_date2" ).datepicker({
	    dateFormat: 'yymmdd'
	  });
});
</script>


<%-- <label>강의 시작일</label>
<select name="c_date1year" id="c_date1year" class="custom-select" style="width: 85px;">
<c:forEach var="e" begin="2018" end="2050">
	<option>${e }</option>
</c:forEach>
</select>년 &nbsp;&nbsp;&nbsp;&nbsp;

<select name="c_date1month" id="c_date1month" class="custom-select" style="width: 70px;">
<c:forEach var="e" begin="1" end="12">
	<option>${e }</option>
</c:forEach>
</select>월 &nbsp;&nbsp;&nbsp;&nbsp;

<select name="c_date1day" id="c_date1day" class="custom-select" style="width: 70px;">
<c:forEach var="e" begin="1" end="31">
	<option>${e }</option>
</c:forEach>
</select>일 --%>
					