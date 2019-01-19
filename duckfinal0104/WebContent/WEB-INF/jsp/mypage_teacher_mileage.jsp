<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu" id="myinfoBtn">내 정보</button>
	   <button class="btn-menu" id="natureBtn">성향관리</button>
	   <button class="btn-menu-selected" id="mileageBtn">포인트</button>
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
</script>


<div class="container" style="padding: 5px; ">
<div class="mypageInfo-box" >
		<div class="mypageInfo-left">
			<h4>
				보유 포인트 : <a id="sendPoint">${tmvo.tm_point }</a>
			</h4>
		<div style="margin: 20px;">
			<button class="btn-point" id="chargeBtn">포인트 충전하기</button>
			<button class="btn-point" id="exchangeBtn">포인트 환전하기</button>
		</div>
		</div>
		<div class="mypageInfo-right-point" id="mypage_teacher_target">
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#chargeBtn').on("click", function() {
			var urlPath = "mypage/updateForm_charge_teacher.jsp";
			$('#mypage_teacher_target').load(urlPath,'.teacher_mileage_updateForm_charge');
		});
		$('#exchangeBtn').on("click", function() {
			var urlPath = "mypage/updateForm_exchange_teacher.jsp";
			$('#mypage_teacher_target').load(urlPath,".teacher_mileage_updateForm_exchange");
		});
	});
</script> 
