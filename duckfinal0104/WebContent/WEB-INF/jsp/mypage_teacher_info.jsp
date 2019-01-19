<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu-selected" id="myinfoBtn">내 정보</button>
	   <button class="btn-menu" id="natureBtn">성향관리</button>
	   <button class="btn-menu" id="mileageBtn">포인트</button>
	   <button class="btn-menu" id="tc_list_Btn">개설강의목록</button>
   </nav>
</div>
<script> /* 여기여기 */
	$('#myinfoBtn').on('click',function(){
		console.log($('#myinfoBtn').html());
		location.href = "mypage_teacher_info";
	});
	$('#natureBtn').on('click',function(){
		console.log($('#natureBtn').html());
		location.href = "mypage_teacher_nature";
	});
	$('#mileageBtn').on('click',function(){
		console.log($('#mileageBtn').html());
		location.href = "mileageForm_teacher";
	});
	$('#tc_list_Btn').on('click',function(){
		console.log($('#tc_list_Btn').html());
		location.href = "mypage_teacher_Tc_list";
	});
</script>

<div class="container" style="padding: 5px;">
	<div class="mypageInfo-box" >
	<div class="mypageInfo-left" >
		<img src="resources/img/${mtvo.mt_img}" class="mypageInfo-img">
		<nav>
		<br>
		<p>회   원   명 : ${mtvo.mt_name}<br></p>
		<c:if test="${not empty tnvo }">
			<p>나의 성향 : ${tnvo.tn_my}<br></p>
			<p>관심 분야 : ${tnvo.tn_category}<br></p>
		</c:if>
		<c:if test="${empty tnvo }">
			<a href="teacher_natureInsert">성향을 입력해 주세요</a>
		</c:if>	
		<c:if test="${not empty tmvo }">
			<p>포    인    트 : ${tmvo.tm_point}원<br></p>
		</c:if>
		<c:if test="${empty tmvo }">
			<p><a href="creatS_mileage">포인트 생성하기</a></p>
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
		location.href = 'm_teacher_selectOne';
	   });
	
	$('#myInfoupdate').click(function(){
		location.href = 'modify_m_teacher_update'; // 수정해야함
	   });
	/* 다혜부분 끝 */
});
</script>

