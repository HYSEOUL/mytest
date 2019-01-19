<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
   <nav class="mypage-menu-bar">
   	   <button class="btn-menu-selected" id="myinfoBtn">�� ����</button>
	   <button class="btn-menu" id="natureBtn">�������</button>
	   <button class="btn-menu" id="mileageBtn">����Ʈ</button>
	   <button class="btn-menu" id="tc_list_Btn">�������Ǹ��</button>
   </nav>
</div>
<script> /* ���⿩�� */
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
		<p>ȸ   ��   �� : ${mtvo.mt_name}<br></p>
		<c:if test="${not empty tnvo }">
			<p>���� ���� : ${tnvo.tn_my}<br></p>
			<p>���� �о� : ${tnvo.tn_category}<br></p>
		</c:if>
		<c:if test="${empty tnvo }">
			<a href="teacher_natureInsert">������ �Է��� �ּ���</a>
		</c:if>	
		<c:if test="${not empty tmvo }">
			<p>��    ��    Ʈ : ${tmvo.tm_point}��<br></p>
		</c:if>
		<c:if test="${empty tmvo }">
			<p><a href="creatS_mileage">����Ʈ �����ϱ�</a></p>
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
		location.href = 'm_teacher_selectOne';
	   });
	
	$('#myInfoupdate').click(function(){
		location.href = 'modify_m_teacher_update'; // �����ؾ���
	   });
	/* �����κ� �� */
});
</script>

