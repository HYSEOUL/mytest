<%@page import="javax.validation.constraints.Size"%>
<%@page import="org.hibernate.validator.constraints.Length"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("euc-kr");%> 

<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">내 정보</button>
	   <button class="btn-menu" id="natureBtn">성향관리</button>
	   <button class="btn-menu" id="mileageBtn">포인트</button>
	   <button class="btn-menu-selected" id="tc_list_Btn">개설강의목록</button>
   </nav>
</div>


    <div class="container" style="margin-top: 30px; padding: 10px;">
	<h3>강사 개설(수강) 목록 </h3>
		<table class="table" style="margin-bottom: 30px;">
			<thead class="thead-dark">
				<tr>
					<th colspan="14"> 강사 개설(수강) 목록</th>
				</tr>
				<tr>
					<th>강의명</th>
					<th>강사명</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>분류</th>
					<th>가격</th>
					<th></th>
				</tr>
				</thead>
	 			<tbody>
		 			<c:forEach var="tc" items="${tclist}">
	 					<tr>
	 					 <c:forEach var="c" items="${tc.cvo}">
    						<td>
    						<a href="selectoneclass?num=${c.c_num }" class="c_title_role" > 
    								${tc.c_title}</a> </td>
		    				<td>${c.c_name }</td>
		    				<td>${c.c_date1 }</td>
		    				<td>${c.c_date2 }</td>
		    				<td>${c.c_category }</td>
		    				<td>${c.c_price }</td>
		    				<input type="hidden" class="title_copy" value="${tc.c_title}">
		    				<td>
		    				<input type="button" class="mypage-class-studentBtn" id="studentBtn" value="학생정보">
		    				</td>
		    				</c:forEach> 
	    				 </tr>
    				
  				</c:forEach>
	 			</tbody>
				<tfoot>
						<tr>
						<c:if test="${sclist==null}">
							<td colspan="9">* 수업에 참여한 학생 정보를 확인해 보세요.</td>
						</c:if>
						<c:if test="${sclist!=null}">
							<td colspan="9">* [${sNum}]명의 학생이 강의를 들었습니다.</td>
						</c:if>
						</tr>
				</tfoot>
  	</table>
    </div >
    
    
        <!-- 학생회원정보 -->
    <c:if test="${sclist!=null}">
    <div class="container">
    <table class="table" style="margin-bottom: 30px;">
		<thead class="thead-dark">
			<tr>
				<th colspan="14">총[${sNum}]명의 수강생 목록</th>
			</tr>
			<tr>
				<th>학생명</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			
				<c:forEach var="sc" items="${sclist}">
					<c:forEach var="c" items="${sc.msvo}">
					<tr>
						<td>${c.ms_name }</td>
						<td>${c.ms_id }</td>
						<td>${c.ms_email }</td>
						<td>${c.ms_birth }</td>
						<td>${c.ms_gender }</td>
						<td>${c.ms_phone }</td>
						<td>${c.ms_loc1 }</td>
						
						</tr>
			</c:forEach>
			</c:forEach>
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="8"></td>
			</tr>
		</tfoot>
	</table>
  	</div>
    </c:if>

		<script> /* 여기여기 */
		$(function(){
$('#myinfoBtn').on('click',function(){
	console.log($('#myinfoBtn').html());
	location.href = "mypage_teacher_info";
});
	$('#natureBtn').on('click',function(){
		console.log($('#natureBtn').html());
		location.href = "mypage_teacher_nature";/* modify_m_teacher */
	});
	$('#mileageBtn').on('click',function(){
		console.log($('#mileageBtn').html());
		location.href = "mileageForm_teacher";
	});
	$('#tc_list_Btn').on('click',function(){
		console.log($('#tc_list_Btn').html());
		location.href = "mypage_teacher_Tc_list";
	});
	
		$('#studentBtn').on('click',function(){    
			let title = $('.title_copy').val();
			console.log("1"+title);
			title = encodeURI(title,'EUC-KR');
	      location = 'tc_list_studentRead?c_title='+title;
	   });
	});
	
</script>
