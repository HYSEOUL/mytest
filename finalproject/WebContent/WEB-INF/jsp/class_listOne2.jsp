<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="form-group" style="border: 1px solid black; padding:100px; margin:100px;">
		<div class="row">
			<div class="col-sm-8">
				<h3>강의 상세보기</h3>
			</div>
			<div class="col-sm-4" style="margin-bottom:10px; float: right">			
					<input id="rewriteBtn" type="button" class="btn btn-primary btn-block" value="수정하기">
					<input type="hidden" id="c_num" value="${num }">
			</div>
		</div>
		<div class="container">
			<img src="resources/img/iu5.PNG" class="img-fluid">
		</div>
	<c:forEach var="listv" items="${cvo}">
	<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		강의 이미지 : <p>${listv.c_img }</p>
		강의 번호 : <p id="c_num">${listv.c_num }</p>
		강의 명 : <p id="c_title" >${listv.c_title }</p>
		강의 생성자 : <p>${listv.c_name }</p>
		강의 시작일 : <p>${listv.c_date1 }</p>
		강의 종료일 : <p>${listv.c_date2 }</p>
		강의 인원 수 : <p>${listv.c_pnum }</p>
		강의 위치 도 주소 : <p>${listv.c_loc1 }</p>
		강의 위치 시 주소 : <p>${listv.c_loc2 }</p>
				
		강의 설명 : <p>${listv.c_comment }</p>
		강의 분야 : <p>${listv.c_category }</p>
		강의 참가비 : <p id="c_price">${listv.c_price }</p>
		강의 주 횟수 : <p>${listv.c_count }</p>
		<c:if test="${listv.c_point eq 1}">
			<p>일반</p>
		</c:if>
		<c:if test="${listv.c_point eq 2}">
			<p>과금</p>
		</c:if>
		<p>
			<!-- <input type="button" id="cancleBtn" value="목록으로"> -->
			<%-- <c:if test="${not empty mt_id}"> --%>
			
			<button type="submit" id="deleteBtn" class="btn btn-primary btn-block" >
				강의 삭제
			</button>
			<button type="button" id="classBuyBtn" class="btn btn-primary btn-block">
			 강의 신청
			</button>
			<button type="button" id="classBagBtn" class="btn btn-primary btn-block">
			 강의 담기
			</button>
			
			<%-- </c:if> --%>
			
		</p>
	</div>
	<hr/>
	<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		<form action="createc1_review" method="post">
		<fieldset>
			<p>
				<label>댓글 작성자 닉네임</label>
				<input type="text" class="form-control form-control" name="c1_writer"
							placeholder="닉네임을 입력하세요.">
				<label>강의 별점</label>
				<input type="text" class="form-control form-control" name="c1_stars"
							placeholder="별점을 입력하세요.">
				<label>댓글 내용</label>
				<textarea class="form-control" rows="5" id="comment" name="c1_reply"></textarea>
				<br/>
				<button type="submit" class="btn btn-primary btn-block" >
							댓글 작성</button>
				<!-- <input type="submit" value="댓글 작성"> -->
			</p>
		</fieldset>
		</form>
	<hr/>
		<fieldset>	
			<c:forEach var="e" items="${listv.c1vo }">
			<p>
				<label>댓글 작성자 닉네임</label>
				<input type="text" class="form-control form-control" name="c1_writer"
							readonly="readonly" value="${e.c1_writer  }">
				<label>작성 날짜</label>
				<input type="text" class="form-control form-control" name="c1_date"
							readonly="readonly" value="${e.c1_date }">
				<label>별점</label>
				<input type="text" class="form-control form-control" name="c1_stars"
							readonly="readonly" value="${e.c1_stars }">
				<label>댓글 내용: </label>
				<textarea class="form-control" rows="5" id="comment" name="c1_reply1" placeholder="${e.c1_reply }">
				</textarea>
				<%-- <input type="text" name="c1_reply1" value="${e.c1_reply }"> --%>
				<%-- <c:if test="${not empty ms_id}"> --%>
				<button type="submit" id="reviewreBtn" class="btn btn-primary btn-block" >
							댓글 수정</button>
				<button type="submit" id="reviewdelBtn" class="btn btn-primary btn-block" >
							댓글 삭제</button>
				<!-- <input type="button" class="reviewreBtn" id="reviewreBtn" value="수정">
				<input type="button" class="reviewdelBtn" id="reviewdelBtn" value="삭제"> -->
				<input type="hidden" class="c1_num" value="${e.c1_num }" >
			</p>			
			</c:forEach>
		</fieldset>
	</div>
	</c:forEach> 
</div>
<script>
// 모든 컨텐츠가 로딩이 된 후에 호출되는 메서드
$(function(){
	$('#cancleBtn').click(function(){
		location.href = 'showclasslist?page=1';
	});
	$('#rewriteBtn').click(function(){
		console.log($('#c_num').val());
		var num = $('#c_num').val();
		location.href = 'updateview?num='+num; 
	});	
	$('#deleteBtn').click(function(){
		if(confirm("삭제하시겠습니까?")){
			var num = $('#c_num').val();
			location.href = 'delclassandc1?num='+num;
		}		
	});
	$('.reviewdelBtn').each(function(index, item){
	    $(this).click(function() {
	       var result = confirm('삭제?'); 
	       if(result) { //yes 
	          var c1_num = $(this).next().val();
	       	  var c_num = $('#c_num').val();
	          location.href='deletec1_review?c1_num='+c1_num+'&c_num='+c_num;
	       }
	    }); 
	 });
	$('.reviewreBtn').each(function(index, item){
	    $(this).click(function() {
	    	
	          var c1_num = $(this).next().next().val();
	       	  var c_num = $('#c_num').val();
	       	  var c1_reply = $(this).prev().val();
	       	  var c1_stars = $(this).prev().prev().prev().val();
	       	  /* console.log('댓글 인덱스 확인: '+c1_num);
	       	  console.log('글 인덱스 확인: '+c_num);
	       	  console.log('댓글 내용 확인: '+c1_reply);
	       	  console.log('댓글 평점 확인: '+c1_stars);  */
	          location.href='updatec1_review?c1_num='+c1_num+'&c_num='+c_num+'&c1_reply='+c1_reply+'&c1_stars='+c1_stars;  
	    }); 
	 });
	
	/* 다혜부분 */
	$('#classBuyBtn').click(function(){
		      if(confirm("수강신청 하시겠습니까?")){
		         let title = $('#c_title').text();
		         console.log(title);
		         title = encodeURI(title,'EUC-KR');
		         let price = $('#c_price').text();
		         location = 'insertClassonebuy?title='+title+'&buynum='+2+'&price='+price;
		      }      
		   });
	
	 // 강좌 장바구니
	$('#classBagBtn').click(function(){
	      if(confirm("해당 강좌를 장바구니에 담으시겠습니까?")){
	         let title = $('#c_title').text();
	         console.log(title);
	         title = encodeURI(title,'EUC-KR');
	         //location = 'insertClassList?title='+title+'&buynum='+1;
	     }      
	   });
	/* 다혜부분 끝 */
});
</script>