<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<div class="container">
	<div class="form-group" style="border: 1px solid black; padding:100px; margin:100px;">
		<div class="row">
			<div class="col-sm-8">
				<h3>���� �󼼺���</h3>
			</div>
			<div class="col-sm-4" style="margin-bottom:10px; float: right">			
				<%-- <a href="updateview?c_num=${cvo.c_num}">
					<input id="updateview" type="submit" class="btn btn-primary btn-block" value="�����ϱ�">
				</a> --%>
			</div>
		</div>
		<div class="container text-center">
			<img src="resources/img/${cvo.c_img }" class="img-fluid" style="width:700px; height:300px;">
		</div>
	<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		<p>���� ��ȣ : ${cvo.c_num }</p>
		<p>���� �� : ${cvo.c_title }</p>
		<p>���� ������ : ${cvo.c_name }</p>
		<p>���� ������ : ${cvo.c_date1 }</p>
		<p>���� ������ : ${cvo.c_date2 }</p>
		<p>���� �ο� �� : ${cvo.c_pnum }</p>
		<p>���� ��ġ �� �ּ� : ${cvo.c_loc1 }</p>
		<p>���� ��ġ �� �ּ� : ${cvo.c_loc2 }</p>
		<p>���� ���� : ${cvo.c_comment }</p>
		<p>���� �о� : ${cvo.c_category }</p>
		<p>���� ������ : ${cvo.c_price }</p>
		<p>���� �� Ƚ�� : ${cvo.c_count }</p>
		<p>
			<!-- <input type="button" id="cancleBtn" value="�������"> -->
			<%-- <c:if test="${not empty mt_id}"> --%>
			<%-- <button type="submit" id="deleteBtn" class="btn btn-primary btn-block" >
							���� ����</button> --%>
			<%-- </c:if> --%>
			<!-- <input type="button" id="rewriteBtn" value="�����ϱ�">		
			<input type="button" id="deleteBtn" value="�����ϱ�">	 -->	
		</p>
	</div>
	</div>
</div>