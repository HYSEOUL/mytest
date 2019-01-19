<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<div class="container">
	<div class="form-group" style="border: 1px solid black; padding:100px; margin:100px;">
		<div class="row">
			<div class="col-sm-8">
				<h3>강의 상세보기</h3>
			</div>
			<div class="col-sm-4" style="margin-bottom:10px; float: right">			
				<%-- <a href="updateview?c_num=${cvo.c_num}">
					<input id="updateview" type="submit" class="btn btn-primary btn-block" value="수정하기">
				</a> --%>
			</div>
		</div>
		<div class="container text-center">
			<img src="resources/img/${cvo.c_img }" class="img-fluid" style="width:700px; height:300px;">
		</div>
	<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		<p>강의 번호 : ${cvo.c_num }</p>
		<p>강의 명 : ${cvo.c_title }</p>
		<p>강의 생성자 : ${cvo.c_name }</p>
		<p>강의 시작일 : ${cvo.c_date1 }</p>
		<p>강의 종료일 : ${cvo.c_date2 }</p>
		<p>강의 인원 수 : ${cvo.c_pnum }</p>
		<p>강의 위치 도 주소 : ${cvo.c_loc1 }</p>
		<p>강의 위치 시 주소 : ${cvo.c_loc2 }</p>
		<p>강의 설명 : ${cvo.c_comment }</p>
		<p>강의 분야 : ${cvo.c_category }</p>
		<p>강의 참가비 : ${cvo.c_price }</p>
		<p>강의 주 횟수 : ${cvo.c_count }</p>
		<p>
			<!-- <input type="button" id="cancleBtn" value="목록으로"> -->
			<%-- <c:if test="${not empty mt_id}"> --%>
			<%-- <button type="submit" id="deleteBtn" class="btn btn-primary btn-block" >
							강의 삭제</button> --%>
			<%-- </c:if> --%>
			<!-- <input type="button" id="rewriteBtn" value="수정하기">		
			<input type="button" id="deleteBtn" value="삭제하기">	 -->	
		</p>
	</div>
	</div>
</div>