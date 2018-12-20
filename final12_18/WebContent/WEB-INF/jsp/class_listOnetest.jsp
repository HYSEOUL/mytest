<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="article">
	<div id="header2">
		<h1> 선택 강의 상세보기</h1>
		<p id="time">2018-12-10</p>
	</div>
	<div id="content">
		<p>여기는 강의 생성 컨텐츠 </p>
			<fieldset>
				<p>
					<label>강의 번호:</label>
					<%-- <input type="text" id="c_num" name="c_num1" readonly="readonly" value="${cvo.c_num }"> --%>
				</p>
				<p>
					<label>강의 명:</label>
					<%-- <input type="text" name="c_title" readonly="readonly" value="${cvo.c_title }"> --%>
				</p>
				<p>
					<input type="button" id="cancleBtn" value="목록으로">
					<input type="button" id="rewriteBtn" value="수정하기">		
					<input type="button" id="deleteBtn" value="삭제하기">		
				</p>
			</fieldset>
		<form action="createc1_review" method="post">
		<fieldset>
			<p>
				<label>댓글 작성자 닉네임: </label>
				<input type="text" name="c1_writer">
				<label>댓글 내용: </label>
				<input type="text" name="c1_reply">
				<label>강의 별점: </label>
				<input type="text" name="c1_stars">
				<input type="submit" value="댓글 작성">
				<%-- <input type="hidden" name="c_num" value="${cvo.c_num }"> --%>
			</p>
		</fieldset>
		</form>
		<fieldset>	
		<c:forEach var="listv" items="${cvo}">
			<%-- <p>
				<label>댓글 작성자 닉네임: </label>
				<input type="text" name="c1_writer1" readonly="readonly" value="${listv.c1vo.c1_writer }">
				
				<input type="text" name="c1_reply1" value="${listv.c1vo.c1_reply }">
			</p> --%>
			<c:forEach var="e" items="${listv.c1vo }">
				<%-- ${e.c1_num }/ --%>${e.c1_writer }
			</c:forEach>
		</c:forEach> 
		</fieldset>
	</div>
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
			location.href = 'delclassandc1?num='+num+'&page='+1;
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
});
</script>