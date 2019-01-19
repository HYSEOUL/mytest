<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">내 정보</button>
	   <button class="btn-menu" id="natureBtn">성향관리</button>
	   <button class="btn-menu" id="mileageBtn">포인트</button>
	   <button class="btn-menu-selected" id="classBtn">수강목록</button>
	   <button class="btn-menu" id="cartBtn">장바구니</button>
   </nav>
</div>
<script>
$('#myinfoBtn').on('click',function(){
	console.log($('#myinfoBtn').html());
	location.href = "mypage_student_info";
});
	$('#natureBtn').on('click',function(){
		console.log($('#natureBtn').html());
		location.href = "mypage_student_nature";
	});
	$('#mileageBtn').on('click',function(){
		console.log($('#mileageBtn').html());
		location.href = "mileageForm?ms_id=${ms_id }";
	});
	$('#classBtn').on('click',function(){
		console.log($('#classBtn').html());
		location.href = "mypage_class_study_list";
	});
	$('#cartBtn').on('click',function(){
		console.log($('#cartBtn').html());
		location.href = "shopbag";
	});
</script>
<div class="container" style="padding: 5px; ">
		<div class="mypageInfo-box">
<div class="container" style="margin-top: 30px; padding: 10px;">
		<h3>스터디 참여 목록</h3>
		<table class="table" style="margin-bottom: 30px;">
			<thead class="thead-dark">
				<tr>
					<th colspan="14"> 스터디 참여 목록 </th>
				</tr>
				<tr>
					<td></td>
					<td class="table-head-st">스터디명</td>
					<td class="table-head-st">작성자</td>
					<td class="table-head-st">분류</td>
					<td class="table-head-st">주소</td>
					<td class="table-head-st">시작일</td>
					<td class="table-head-st">종료일</td>
					<td class="table-head-st">횟수</td>
					<td class="table-head-st">인원</td>
					<td class="table-head-st">금액</td>
				</tr>
			</thead>
			<tbody>
			<%-- <c:set var="amt" value="${bagnum}"/> --%>
				<c:forEach var="e" items="${slvolist}">
					<tr>
						<td><a href=""> 
						<img src="resources/images/${e.s_img }" style="width:50px; height:50px;">
						</a></td>
						<td><a href="selectOneStudy?s_num=${e.s_num }">${e.s_title}</a></td>
						<td>${e.ms_name}</td>
						<td>${e.s_category}</td>
						<td>${e.s_loc1}</td>
						<td>${e.s_date1}</td>
						<td>${e.s_date2}</td>
						<td>${e.s_count}</td>
						<td>${e.s_pnum}</td>
						<td>${e.s_price}</td>
					</tr>
				</c:forEach>
<!-- 다혜 추가 개발 예상 사항 	
				<tr>
             		<td colspan="5" width="100%">총 상품가격 <strong id="tot_price"></strong>원 </td>
            	</tr>
            	
          		<tr>
             		<td colspan="5">총 주문 상품수 <strong id="tot_amount"></strong>권(개)</td>
          		</tr> -->
			</tbody>
		</table>
	</div>
	
<div class="container" style="margin-top: 30px; padding: 10px;">
	<h3>강의  참여 목록</h3>
	<table class="table">
		<thead class="thead-dark">
				<tr>
					<th colspan="15"> 강의  참여 목록 </th>
				</tr>
				<tr>
						<td></td>
						<td>강의명</td>
						<td>강사명</td>
						<td>분야</td>
						<td>위치</td>
						<td>시작일</td>
						<td>종료일</td>
						<td>횟수</td>
						<td>인원</td>
						<td>비용</td>
					</tr>
				</thead>
				<tbody>
				<c:set var="amt" value="${bagnum}"/>
					<c:forEach var="listv" items="${scvolist }">
						<tr>
							<td><a href=""> 
							<img src="resources/images/${listv.c_img}" style="width:50px; height:50px;">
							</a></td>
							<td>
								<a href="selectoneclassc1?num=${listv.c_num }"
								style="color: gray;">${listv.c_title }</a>
							</td>
							<td>${listv.c_name }</td>
							<td>${listv.c_category}</td>
							<td>${listv.c_loc1 }</td>
							<td>${listv.c_date1 }</td>
							<td>${listv.c_date2 }</td>
							<td>${listv.c_count}</td>
							<td>${listv.c_pnum }</td>
							<td>${listv.c_price }</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</div>
</div>

<script>
// 모든 컨텐츠가 로딩이 된 후에 호출되는 메서드
$(function(){
	    
});
</script>
