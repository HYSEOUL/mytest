<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu-selected" id="myinfoBtn">내 정보</button>
	   <button class="btn-menu" id="natureBtn">성향관리</button>
	   <c:if test="${not empty snvo }">
	   		<c:if test="${not empty smvo }">
	   <button class="btn-menu" id="mileageBtn">포인트</button>
	   <button class="btn-menu" id="classBtn">수강목록</button>
	   <button class="btn-menu" id="cartBtn">장바구니</button>
	   	</c:if>
	   </c:if>
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

<div class="container" style="padding: 5px;">
	<div class="mypageInfo-box" >
	<div class="mypageInfo-left" >
		<img src="resources/img/${msvo.ms_img}" class="mypageInfo-img">
		<nav>
		<br>
		<p>회   원   명 : ${msvo.ms_name}<br></p>
		<c:if test="${not empty snvo }">
			<p>나의 성향 : ${snvo.sn_my}<br></p>
			<p>관심 분야 : ${snvo.sn_category}<br></p>
		</c:if>
		<c:if test="${empty snvo }">
			<button id="newStudent_nature" class="mypage-class-studentBtn">성향 입력</button>
			<hr>
			<p>성향을 입력 시 3000포인트 지급</p>
		</c:if>	
		<c:if test="${not empty smvo }">
			<p>포    인    트 : ${smvo.sm_point}원<br></p>
		</c:if>
		<c:if test="${not empty snvo}">
			<c:if test="${empty smvo }">
			<button id="newStudent_point" class="mypage-class-studentBtn">포인트 생성</button>
			</c:if>
		</c:if>
		</nav>
		<br>
		<button type="submit" id="myInfo" class="btn btn-primary btn-block" >상세정보</button>
		<button type="submit" id="myInfoupdate" class="btn btn-primary btn-block" >정보수정</button>
	</div>
	
	<div class="mypageInfo-right-calendar">
	<!-- 달력 -->
		<div id="pnlEventCalendar" style="border: 5px solid green; paddig:0px; margin-top:10px; width: 500px;">
		<script>
			$(function() {
				$('#pnlEventCalendar').calendar(
						{
							months : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월',
									'12월' ],
							days : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일',
									'일요일' ],
							/* onSelect : function(event) {
								$('#c_date').val(event.label);
							} */
						});
			});
		</script> 
	<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
	_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
</div>
	</div>
	</div>
	</div>
	
<script>
// 모든 컨텐츠가 로딩이 된 후에 호출되는 메서드
$(function(){	
	$('#myInfo').click(function(){
		location.href = 'm_student_selectOne';
	   });
	
	$('#myInfoupdate').click(function(){
		location.href = 'modify_m_student_update';
	   });
	$('#newStudent_nature').on('click',function(){
		location.href = "student_nature_Insert";
	});
	$('#newStudent_point').on('click',function(){
		location.href = "creatS_mileage";
	});
	/* 다혜부분 끝 */
});
</script>
