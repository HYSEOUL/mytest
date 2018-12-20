<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="padding:50px;">
	<div class="form-group">
		<div class="col-sm-8">
			<h3>���͵� �����ϱ�</h3>
		</div>
	</div>
	<form class="form-horizontal" method="post" class="register" action="createStudy" id="createStudy"
		enctype="multipart/form-data">
		<div class="container">
			<div class="form-group">
				<div>
				<label>���͵� ������</label>
				<input type="text" name="ms_id" id="ms_id" class="form-control">
				</div>
			</div>
		
			<div class="form-group">
				<div>
					<label>���͵��</label>
					<input type="text" name="s_title" id="s_title" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
			<div>
					<label>���͵� �о�</label>
					<select name="s_category" id="s_category" class="custom-select">
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
					<label>���͵� ��ġ ��/�� �ּ�</label>
					<select name="s_loc1" id="s_loc1" class="custom-select">
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
			
			<div class="form-group">
				<div>
					<label>�� �ּ�</label>
					<input type="text" name="s_loc2" id="s_loc2" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���� ������</label>
					<input type="text" name="s_date1" id="s_date1" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���͵� ������</label>
					<input type="text" name="s_date2" id="s_date2" class="form-control">
				</div>
			</div>
			
			<div class="form-group">
					<label>�� ���͵� Ƚ��</label>
					<select name="s_count" id="s_count" class="custom-select">
					<c:forEach var="e" begin="1" end="5">
						<option>${e }</option>
					</c:forEach>
					</select>
			</div>
			
			<div class="form-group">
				<div>
					<label>���͵� �ο� ��</label>
					<select name="c_pnum" id="c_pnum" class="custom-select">
					<c:forEach var="e" begin="1" end="50">
						<option>${e }</option>
					</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div>
					<label>���͵� �Ұ� / ����</label>
					<textarea class="form-control" rows="5" id="c_comment" name="c_comment"></textarea>
				</div>
			</div>
			
			<div class="form-group">
			<label>�̹��� ����</label>
				<div class="custom-file">
					 <!-- c_img -->
					<input class="custom-file-input" name="mf_img" id="mf_img" type="file">
					<label class="custom-file-label" for="customFile">Choose file</label>
				</div>
			</div>
			
			<div class="form-group">
					<label>���͵� ������</label>
					<select name="s_price" id="s_price" class="custom-select">
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
			
			<div class="form-group">
				<div>
					<input type="submit" class="btn btn-primary btn-block" value="���͵����">
				</div>
			</div>
		</div>
	</form>
</div>