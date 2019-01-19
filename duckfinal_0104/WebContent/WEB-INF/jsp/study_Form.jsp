<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>스터디 개설하기</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" class="register" action="createStudy" id="createStudy"
		enctype="multipart/form-data">
		<div class="container">
			<div class="form-group">
				<div>
				<!-- <label>스터디 생성자</label> -->
				<input type="hidden" name="ms_id" id="ms_id" class="form-control" value="${ms_id}">
				</div>
			</div>
		
			<div class="form-group">
				<div>
					<label>스터디명</label>
					<input type="text" name="s_title" id="s_title" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>스터디 분야</label>
					<select name="s_category" id="s_category" class="custom-select">
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
					<label>스터디 위치 시/도 주소</label>
					<select name="s_loc1" id="s_loc1" class="custom-select">
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
			
			<div class="form-group">
				<div>
					<label>상세 주소</label>
					<input type="text" name="s_loc2" id="s_loc2" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>스터디 시작일</label>
					<input type="text" name="s_date1" id="s_date1" class="form-control" autocomplete="off" placeholder="날짜선택">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>스터디 종료일</label>
					<input type="text" name="s_date2" id="s_date2" class="form-control" autocomplete="off" placeholder="날짜선택">
				</div>
			</div>
			
			<div class="form-group">
					<label>주 스터디 횟수</label>
					<select name="s_count" id="s_count" class="custom-select">
					<c:forEach var="e" begin="1" end="5">
						<option>${e }</option>
					</c:forEach>
					</select>
			</div>
			
			<div class="form-group">
				<div>
					<label>스터디 인원 수</label>
					<select name="s_pnum" id="s_pnum" class="custom-select">
					<c:forEach var="e" begin="1" end="50">
						<option>${e }</option>
					</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>스터디 소개 / 설명</label>
					<textarea class="form-control" rows="5" id="s_comment" name="s_comment"></textarea>
				</div>
			</div>
			
			<div class="form-group">
			<label>이미지 파일</label>
				<div class="custom-file">
					 <!-- c_img -->
					<!-- <input class="custom-file-input" name="mf_img" id="mf_img" type="file">
					<label class="custom-file-label" for="customFile">Choose file</label> -->
					<input type="file" class="form-control-file border" name="mf_img" id="mf_img">
				</div>
			</div>
			
			<div class="form-group">
					<label>스터디 참가비</label>
					<select name="s_price" id="s_price" class="custom-select">
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
			<div class="form-group">
				<div>
					<label>결제 금액 선택</label>
					<select name="s_point" id="s_point" class="custom-select">
						<option value="1">5000원으로 일반 결제하기</option>
						<option value="2">10000원으로 추천게시물 결제하기</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="스터디생성">
				</div>
			</div>
		</div>
	</form>
</div>

<script>
	$(function() {
		$('#s_date1').datepicker({
			minDate: 0,
			dateFormat : 'yymmdd'
		});
		
		
		$('#s_date1').datepicker("option", "maxDate", $("#s_date2").val());
		$('#s_date1').datepicker("option", "onClose", function(selectedDate) {
			$("#s_date2").datepicker("option", "minDate", selectedDate);
		});

		$('#s_date2').datepicker({
			dateFormat : 'yymmdd'
		});
		$('#s_date2').datepicker("option", "minDate", $("#s_date1").val());
		$('#s_date2').datepicker("option", "onClose", function(selectedDate) {
			$("#s_date1").datepicker("option", "maxDate", selectedDate);
		});
	});
</script>