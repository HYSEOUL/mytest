<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu-selected" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu" id="natureBtn">�������</button>
	   <c:if test="${not empty snvo }">
	   		<c:if test="${not empty smvo }">
	   <button class="btn-menu" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu" id="classBtn">�������</button>
	   <button class="btn-menu" id="cartBtn">��ٱ���</button>
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
		<p>ȸ   ��   �� : ${msvo.ms_name}<br></p>
		<c:if test="${not empty snvo }">
			<p>���� ���� : ${snvo.sn_my}<br></p>
			<p>���� �о� : ${snvo.sn_category}<br></p>
		</c:if>
		<c:if test="${empty snvo }">
			<button id="newStudent_nature" class="mypage-class-studentBtn">���� �Է�</button>
			<hr>
			<p>������ �Է� �� 3000����Ʈ ����</p>
		</c:if>	
		<c:if test="${not empty smvo }">
			<p>��    ��    Ʈ : ${smvo.sm_point}��<br></p>
		</c:if>
		<c:if test="${not empty snvo}">
			<c:if test="${empty smvo }">
			<button id="newStudent_point" class="mypage-class-studentBtn">����Ʈ ����</button>
			</c:if>
		</c:if>
		</nav>
		<br>
		<button type="submit" id="myInfo" class="btn btn-primary btn-block" >������</button>
		<button type="submit" id="myInfoupdate" class="btn btn-primary btn-block" >��������</button>
	</div>
	
	<div class="mypageInfo-right-calendar">
	<!-- �޷� -->
		<div id="pnlEventCalendar" style="border: 5px solid green; paddig:0px; margin-top:10px; width: 500px;">
		<script>
			$(function() {
				$('#pnlEventCalendar').calendar(
						{
							months : [ '1��', '2��', '3��', '4��', '5��',
									'6��', '7��', '8��', '9��', '10��', '11��',
									'12��' ],
							days : [ '������', 'ȭ����', '������', '�����', '�ݿ���', '�����',
									'�Ͽ���' ],
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
// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
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
	/* �����κ� �� */
});
</script>
