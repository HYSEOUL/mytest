<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="container text-center" style="margin-top:30px;">
	<h3>����������</h3>
</div>
<div class="container" >
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_student">���� ����</a></li>
				<li class="nav-item"><a class="nav-link"
					href="characterInsert">������� (�Է�/����)</a></li>
				<li class="nav-item"><a class="nav-link" href="tmileage">���ϸ���
						����</a></li>
				<li class="nav-item"><a class="nav-link" href="#">���Ǹ��
						����</a></li>
			</ul>
		</div>
	</nav>
</div>    

<div class="container">
<div id="article">
   <div id="header2">
      <h1> ���ϸ��� ����Ʈ </h1>
      <p id="time">2018-11-20</p>
   </div>
   <!-- 
   <div>�Է��ϱ�
      <form action="mt_creatS_mileage" method="post">
      ID : <input type="text" name="mt_id" id="mt_id">
      Point : <input type="text" name="tm_point" id="tm_point">
      <input type="submit" name="" id="" value="���ϸ��� �Է�" >
      </form>
   </div>
    -->
   <div>��ȸ�ϱ�
      <form action="tm_point_s" method="post">
      ID : <input type="text" name="mt_id" id="mt_id">
      <input type="submit" name="" id="" value="���̵�� ��ȸ�ϱ�" >
      </form>
   </div>
   <div>�����ϱ� 
      <form action="t_mileageupdate" method="post">
      ID : <input type="text" name="mt_id" id="mt_id">
      math_point : <input type="text" name="math_point" id="math_point">
      <input type="submit" name="" id="" value="����Ʈ update" >
      </form>
   </div>
</div>
</div>
