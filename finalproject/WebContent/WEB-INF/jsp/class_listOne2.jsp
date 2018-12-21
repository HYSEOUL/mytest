<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="form-group" style="border: 1px solid black; padding:100px; margin:100px;">
		<div class="row">
			<div class="col-sm-8">
				<h3>���� �󼼺���</h3>
			</div>
			<div class="col-sm-4" style="margin-bottom:10px; float: right">			
					<input id="rewriteBtn" type="button" class="btn btn-primary btn-block" value="�����ϱ�">
					<input type="hidden" id="c_num" value="${num }">
			</div>
		</div>
		<div class="container">
			<img src="resources/img/iu5.PNG" class="img-fluid">
		</div>
	<c:forEach var="listv" items="${cvo}">
	<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		���� �̹��� : <p>${listv.c_img }</p>
		���� ��ȣ : <p id="c_num">${listv.c_num }</p>
		���� �� : <p id="c_title" >${listv.c_title }</p>
		���� ������ : <p>${listv.c_name }</p>
		���� ������ : <p>${listv.c_date1 }</p>
		���� ������ : <p>${listv.c_date2 }</p>
		���� �ο� �� : <p>${listv.c_pnum }</p>
		���� ��ġ �� �ּ� : <p>${listv.c_loc1 }</p>
		���� ��ġ �� �ּ� : <p>${listv.c_loc2 }</p>
				
		���� ���� : <p>${listv.c_comment }</p>
		���� �о� : <p>${listv.c_category }</p>
		���� ������ : <p id="c_price">${listv.c_price }</p>
		���� �� Ƚ�� : <p>${listv.c_count }</p>
		<c:if test="${listv.c_point eq 1}">
			<p>�Ϲ�</p>
		</c:if>
		<c:if test="${listv.c_point eq 2}">
			<p>����</p>
		</c:if>
		<p>
			<!-- <input type="button" id="cancleBtn" value="�������"> -->
			<%-- <c:if test="${not empty mt_id}"> --%>
			
			<button type="submit" id="deleteBtn" class="btn btn-primary btn-block" >
				���� ����
			</button>
			<button type="button" id="classBuyBtn" class="btn btn-primary btn-block">
			 ���� ��û
			</button>
			<button type="button" id="classBagBtn" class="btn btn-primary btn-block">
			 ���� ���
			</button>
			
			<%-- </c:if> --%>
			
		</p>
	</div>
	<hr/>
	<div class="container" style="font-family:sans-serif; font-size:20px; margin-top:20px;">
		<form action="createc1_review" method="post">
		<fieldset>
			<p>
				<label>��� �ۼ��� �г���</label>
				<input type="text" class="form-control form-control" name="c1_writer"
							placeholder="�г����� �Է��ϼ���.">
				<label>���� ����</label>
				<input type="text" class="form-control form-control" name="c1_stars"
							placeholder="������ �Է��ϼ���.">
				<label>��� ����</label>
				<textarea class="form-control" rows="5" id="comment" name="c1_reply"></textarea>
				<br/>
				<button type="submit" class="btn btn-primary btn-block" >
							��� �ۼ�</button>
				<!-- <input type="submit" value="��� �ۼ�"> -->
			</p>
		</fieldset>
		</form>
	<hr/>
		<fieldset>	
			<c:forEach var="e" items="${listv.c1vo }">
			<p>
				<label>��� �ۼ��� �г���</label>
				<input type="text" class="form-control form-control" name="c1_writer"
							readonly="readonly" value="${e.c1_writer  }">
				<label>�ۼ� ��¥</label>
				<input type="text" class="form-control form-control" name="c1_date"
							readonly="readonly" value="${e.c1_date }">
				<label>����</label>
				<input type="text" class="form-control form-control" name="c1_stars"
							readonly="readonly" value="${e.c1_stars }">
				<label>��� ����: </label>
				<textarea class="form-control" rows="5" id="comment" name="c1_reply1" placeholder="${e.c1_reply }">
				</textarea>
				<%-- <input type="text" name="c1_reply1" value="${e.c1_reply }"> --%>
				<%-- <c:if test="${not empty ms_id}"> --%>
				<button type="submit" id="reviewreBtn" class="btn btn-primary btn-block" >
							��� ����</button>
				<button type="submit" id="reviewdelBtn" class="btn btn-primary btn-block" >
							��� ����</button>
				<!-- <input type="button" class="reviewreBtn" id="reviewreBtn" value="����">
				<input type="button" class="reviewdelBtn" id="reviewdelBtn" value="����"> -->
				<input type="hidden" class="c1_num" value="${e.c1_num }" >
			</p>			
			</c:forEach>
		</fieldset>
	</div>
	</c:forEach> 
</div>
<script>
// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
$(function(){
	$('#cancleBtn').click(function(){
		location.href = 'showclasslist?page=1';
	});
	$('#rewriteBtn').click(function(){
		console.log($('#c_num').val());
		var num = $('#c_num').val();
		location.href = 'updateview?num='+num; 
	});	
	$('#deleteBtn').click(function(){
		if(confirm("�����Ͻðڽ��ϱ�?")){
			var num = $('#c_num').val();
			location.href = 'delclassandc1?num='+num;
		}		
	});
	$('.reviewdelBtn').each(function(index, item){
	    $(this).click(function() {
	       var result = confirm('����?'); 
	       if(result) { //yes 
	          var c1_num = $(this).next().val();
	       	  var c_num = $('#c_num').val();
	          location.href='deletec1_review?c1_num='+c1_num+'&c_num='+c_num;
	       }
	    }); 
	 });
	$('.reviewreBtn').each(function(index, item){
	    $(this).click(function() {
	    	
	          var c1_num = $(this).next().next().val();
	       	  var c_num = $('#c_num').val();
	       	  var c1_reply = $(this).prev().val();
	       	  var c1_stars = $(this).prev().prev().prev().val();
	       	  /* console.log('��� �ε��� Ȯ��: '+c1_num);
	       	  console.log('�� �ε��� Ȯ��: '+c_num);
	       	  console.log('��� ���� Ȯ��: '+c1_reply);
	       	  console.log('��� ���� Ȯ��: '+c1_stars);  */
	          location.href='updatec1_review?c1_num='+c1_num+'&c_num='+c_num+'&c1_reply='+c1_reply+'&c1_stars='+c1_stars;  
	    }); 
	 });
	
	/* �����κ� */
	$('#classBuyBtn').click(function(){
		      if(confirm("������û �Ͻðڽ��ϱ�?")){
		         let title = $('#c_title').text();
		         console.log(title);
		         title = encodeURI(title,'EUC-KR');
		         let price = $('#c_price').text();
		         location = 'insertClassonebuy?title='+title+'&buynum='+2+'&price='+price;
		      }      
		   });
	
	 // ���� ��ٱ���
	$('#classBagBtn').click(function(){
	      if(confirm("�ش� ���¸� ��ٱ��Ͽ� �����ðڽ��ϱ�?")){
	         let title = $('#c_title').text();
	         console.log(title);
	         title = encodeURI(title,'EUC-KR');
	         //location = 'insertClassList?title='+title+'&buynum='+1;
	     }      
	   });
	/* �����κ� �� */
});
</script>