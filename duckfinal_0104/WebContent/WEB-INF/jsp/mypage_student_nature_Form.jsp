<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 검색 카테고리 메뉴 -->
<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<form method="post" action="characterCreate"> 
					<h3>학생 성향 입력 폼</h3>
					
					<div class="form-group">
					<div>
						<label>1) 자기 성향 선택</label> <select name="sn_my" id="sn_my" class="custom-select">
							<option value="성실">성실</option>
							<option value="적극">적극</option>
							<option value="논쟁">논쟁</option>
							<option value="대담">대담</option>
							<option value="사교">사교</option>
							<option value="열정">열정</option>
							<option value="호기심">호기심</option>
							<option value="모험">모험</option>
							<option value="자유">자유</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<div>
						<label>2) 상대방 매칭 성향 선택</label> <select name="sn_you" id="sn_you"
							class="custom-select">
							<option value="성실">성실</option>
							<option value="적극">적극</option>
							<option value="논쟁">논쟁</option>
							<option value="대담">대담</option>
							<option value="사교">사교</option>
							<option value="열정">열정</option>
							<option value="호기심">호기심</option>
							<option value="모험">모험</option>
							<option value="자유">자유</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<div>
						<label>3) 학습 서비스 분야 선택</label> <select name="sn_category" id="sn_category" class="custom-select">
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
							<input type="submit" class="btn btn-primary btn-block" value="선택완료">
						</div>
					</div>
			</form>
		</div>
	</div>
</div>