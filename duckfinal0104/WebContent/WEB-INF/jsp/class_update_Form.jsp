<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->

<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>���� ���� ����</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" action="updateclass" id="updateclass" enctype="multipart/form-data">
		<div class="container">
			<div class="form-group">
				<div>
				<label>���� ������</label>
				<input type="text" name="c_name" id="c_name" class="form-control" readonly="readonly" value="${cvo.c_name}">
				</div>
			</div>
		
			<div class="form-group">
				<div>
					<label>���Ǹ�</label>
					<input type="text" name="c_title" id="c_title" class="form-control" value="${cvo.c_title}">
					<input type="hidden" name="c_num" id="c_num" value="${cvo.c_num}">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���� ������</label> 
					<input type="text" id="c_date1" name="c_date1" class="form-control" value="${cvo.c_date1}">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���� ������</label> 
					<input type="text" id="c_date2" name="c_date2" class="form-control" value="${cvo.c_date2}" >
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���� �ο� ��</label>
					<select name="c_pnum" id="c_pnum" class="custom-select" >
						<option value="${cvo.c_pnum}">���� : ${cvo.c_pnum}</option>
						<c:forEach var="e" begin="1" end="50">
							<option>${e }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���� ��ġ ��/�� �ּ�</label>
					<select name="c_loc1" id="c_loc1" class="custom-select">
					<option value="${cvo.c_loc1}">���� : ${cvo.c_loc1}</option>
					<option value="����Ư����">����Ư����</option>
					<option value="�λ걤����">�λ걤����</option>
					<option value="�뱸������">�뱸������</option>
					<option value="��õ������">��õ������</option>
					<option value="���ֱ�����">���ֱ�����</option>
					<option value="����������">����������</option>
					<option value="��걤����">��걤����</option>
					<option value="����Ư����ġ��">����Ư����ġ��</option>
					<option value="��⵵">��⵵</option>
					<option value="������">������</option>
					<option value="��û�ϵ�">��û�ϵ�</option>
					<option value="��û����">��û����</option>
					<option value="����ϵ�">����ϵ�</option>
					<option value="���󳲵�">���󳲵�</option>
					<option value="���ϵ�">���ϵ�</option>
					<option value="��󳲵�">��󳲵�</option>
					<option value="����Ư����ġ��">����Ư����ġ��</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div>
				<label>���� ���ּ�</label>
				<input type="text" name="c_loc2" id="c_loc2" class="form-control" value="${cvo.c_loc2}">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���� �Ұ� / ����</label>
					<textarea class="form-control" rows="5" id="c_comment" name="c_comment">${cvo.c_comment}</textarea>
				</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>���� �о�</label>
					<select name="c_category" id="c_category" class="custom-select">
					<option value="${cvo.c_category}">���� : ${cvo.c_category}</option>
					<option value="�ܱ���">�ܱ���</option>
					<option value="������">������</option>
					<option value="����">����</option>
					<option value="�̼�">�̼�</option>
					<option value="��">��</option>
					<option value="����">����</option>
					<option value="�ڰ���">�ڰ���</option>
					<option value="���">���</option>
					<option value="��Ƽ">��Ƽ</option>
					<option value="���α׷���">���α׷���</option>
					</select>
					</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>���� ������</label>
					<select name="c_price" id="c_price" class="custom-select">
					<option value="${cvo.c_price}">���� : ${cvo.c_price}</option>
					<option value="5000">5000</option>
					<option value="10000">10000</option>
					<option value="15000">15000</option>
					<option value="20000">20000</option>
					<option value="25000">25000</option>
					<option value="30000">30000</option>
					<option value="35000">35000</option>
					<option value="40000">40000</option>
					<option value="45000">45000</option>
					<option value="50000">50000</option>
					</select>
					</div>
			</div>
			
			<div class="form-group">
					<label>�� ���� Ƚ��</label>
					<select name="c_count" id="c_count" class="custom-select">
					<option value="${cvo.c_count}">���� : ${cvo.c_count}</option>
					<c:forEach var="e" begin="1" end="5">
						<option>${e }</option>
					</c:forEach>
					</select>
			</div>
			
			<div class="form-group">
			<label>�̹��� ����</label>
				<div class="custom-file">
					 <!-- c_img -->
					<input type="text" name="c_img" id="c_img" class="form-control" value="${cvo.c_img }">
				</div>
			</div>
			
			<div class="form-group">
					<label>���ϸ��� ��� �ɼ�</label>
					<select name="c_point" id="c_point" class="custom-select">					
						<option value="${cvo.c_point }">���� : ${cvo.c_point }</option>
						<option>1</option>
						<option>2</option>
					</select>
			</div>
			
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="���� ����">
				</div>
			</div>
		</div>
	</form>
</div>
<script>
<script>
$(function() {
	$('#c_date1').datepicker({
		minDate: 0,
		dateFormat : 'yymmdd'
	});
	
	
	$('#c_date1').datepicker("option", "maxDate", $("#c_date2").val());
	$('#c_date1').datepicker("option", "onClose", function(selectedDate) {
		$("#c_date2").datepicker("option", "minDate", selectedDate);
	});

	$('#c_date2').datepicker({
		dateFormat : 'yymmdd'
	});
	$('#c_date2').datepicker("option", "minDate", $("#c_date1").val());
	$('#c_date2').datepicker("option", "onClose", function(selectedDate) {
		$("#c_date1").datepicker("option", "maxDate", selectedDate);
	});
});
</script>

