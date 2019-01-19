<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.row {
	text-align: center;
}

.rate {
	display: inline-block;
	margin: 0;
	padding: 0;
	border: none;
}

#star {
	float: right;
	font-size: 0;
	color: #d9d9d9;
}

input {
	display : none;
}

#star:before {
	content: "\f005";
	font-family: FontAwesome;
	font-size: 40px;
}

#star:hover, #star:hover ~ #star {
	color: #fcd000;
	transition: 0.2s;
}

input:checked ~ #star {
	color: #ccac00;
}

input:checked ~ #star:hover, input:checked ~ #star:hover ~ #star {
	color: #fcd000;
	transition: 0.2s;
}
</style>
<div class="container">
	<div class="form-group"
		style="border: 1px solid black; padding: 50px; margin: 100px;">
		
		<c:forEach var="listv" items="${cvo}">
				<div class="container"
					style="font-family: sans-serif; font-size: 20px; margin-top: 20px;">

				<%-- 2019�� 1�� 2�� ���� --%>
				<div class="row">
					<div class="col-sm-6">
						<h3>���� �󼼺���</h3>
						
					</div>

					<%-- 2019�� 1�� 2�� ���ǿ� ���� �����ϱ� & ���ǻ�����ư ���� --%>
					<c:if test="${sessionScope.mt_name == listv.c_name && sessionScope.ms_id == null}">
						<div class="col-sm-6" style="margin-bottom: 10px; float: right">
							<button type="button" id="rewriteBtn"
								class="btn btn-primary btn-block" style="margin-bottom:5px;">�����ϱ�</button>
							<%--2019�� 1�� 2�� ���� --%>
							<form action="deleteclass" method="get">
								<button type="button" id="deleteBtn"
									class="btn btn-primary btn-block">���ǻ���</button>
							</form>
							<%--2019�� 1�� 2�� ���� --%>

						</div>
					</c:if>
					<%-- 2019�� 1�� 2�� ���ǿ� ���� �����ϱ� & ���ǻ�����ư ���� --%>
				</div>
				<%-- 2019�� 1�� 2�� ���� --%>
		
					<div class="container">
						<img src="resources/img/${listv.c_img}" class="img-fluid">
					</div>
					<p>���� ��ȣ : ${listv.c_num }
						<input type="hidden" id="class_num" value="${listv.c_num}"> 
					</p>
					<p>���� �� : ${listv.c_title }
						<input type="hidden" id="c_title" value="${listv.c_title }"> </p>
					<p>���� ������ : ${listv.c_name }</p>
					<p>������ - ������ : ${listv.c_date1 } - ${listv.c_date2 }</p>
					<p>���� �ο� �� : ${listv.c_pnum }</p>
					<p>���� ��ġ �� �ּ� : ${listv.c_loc1 }</p>
					<p>���� ��ġ �� �ּ� : ${listv.c_loc2 }</p>
					<p>���� ���� : ${listv.c_comment }</p>
					<p>���� �о� : ${listv.c_category }</p>
					<p>���� ������ : ${listv.c_price }
						<input type="hidden" id="c_price" value="${listv.c_price }"></p>
					<p>���� �� Ƚ�� : ${listv.c_count }</p>
					<c:if test="${listv.c_point eq 1}">
						<p>�Ϲ�</p>
					</c:if>
					<c:if test="${listv.c_point eq 2}">
						<p>����</p>
					</c:if>
					
					<%-- 2019�� 1�� 2�� ����  : �л��� ���½�û ���� --%>
					<c:if test="${sessionScope.ms_id != null }">
					<button type="button" id="classBuyBtn" class="btn btn-primary btn-block">���½�û</button>
					<button type="button" id="classBagBtn" class="btn btn-primary btn-block">���´��</button>
					</c:if>
					<%-- 2019�� 1�� 2�� ���� --%>
					
				</div>
				<hr />



				<div class="container"
					style="font-family: sans-serif; font-size: 20px; margin-top: 20px;">

					<c:if test="${sessionScope.ms_id != null }">
						<form
							action="createc1_review?c_num=${listv.c_num }&num=${listv.c_num }"
							method="post">
							<label>��� �ۼ��� ���̵�</label>
							<%-- 2018�� 1�� 2�� ������ : ��� �ۼ��� ���̵� �������� ���� --%>
								<input type="text"
								class="form-control form-control" name="c1_writer"
								value="${ms_id}" readonly="readonly" style="margin-bottom: 20px;">
								<%-- 2018�� 1�� 2�� ������ : ��� �ۼ��� ���̵� �������� ���� --%>
							<!-- <input type="text"
								class="form-control form-control" name="c1_writer"
								placeholder="�г����� �Է��ϼ���." style="margin-bottom: 20px;"> -->


							<%-- <label>����</label>
							���� üũ�ϴ� �κ�
							<div class="row" style="margin-left: 0px; margin-top: -10px;">
								<div class="rate">
									<!-- <input type="text" class="form-control form-control" name="c1_stars"
							placeholder="������ �Է��ϼ���."> -->
									<input id="rate1-star5" type="radio" name="c1_stars" value="5" />
									<label for="rate1-star5" id="star" title="Excellent">5</label>
									<input id="rate1-star4" type="radio" name="c1_stars" value="4" />
									<label for="rate1-star4" id="star" title="Good">4</label> 
									<input id="rate1-star3" type="radio" name="c1_stars" value="3" /> 
									<label for="rate1-star3" id="star" title="Satisfactory">3</label> 
									<input id="rate1-star2" type="radio" name="c1_stars" value="2" /> 
									<label for="rate1-star2" id="star" title="Bad">2</label> 
									<input id="rate1-star1" type="radio" name="c1_stars" value="1" /> 
									<label for="rate1-star1" id="star" title="Very bad">1</label>
								</div>
							</div> --%>
							
							<label>����</label>
							<%--���� üũ�ϴ� �κ� --%>
							<div class="row" style="margin-left: 0px; margin-top: -10px;">
								<div class="rate">
									<!-- <input type="text" class="form-control form-control" name="c1_stars"
							placeholder="������ �Է��ϼ���."> -->
									<input id="rate1-star5" type="radio" name="c1_stars" value="5" />
									<label for="rate1-star5" id="star" title="Excellent">5</label>

									<input id="rate1-star4" type="radio" name="c1_stars" value="4" />
									<label for="rate1-star4" id="star" title="Good">4</label> <input
										id="rate1-star3" type="radio" name="c1_stars" value="3" /> <label
										for="rate1-star3" id="star" title="Satisfactory">3</label> <input
										id="rate1-star2" type="radio" name="c1_stars" value="2" /> <label
										for="rate1-star2" id="star" title="Bad">2</label> <input
										id="rate1-star1" type="radio" name="c1_stars" value="1" /> <label
										for="rate1-star1" id="star" title="Very bad">1</label>
								</div>
							</div>


							<label>��� ����</label>
							<textarea class="form-control" rows="5" id="comment"
								name="c1_reply"></textarea>
							<br />

							<button type="submit" class="btn btn-primary btn-block">
								��� �ۼ�</button>
							<!-- <input type="submit" value="��� �ۼ�"> -->

						</form>
					</c:if>


					<hr style="border: 2px solid blue;" />
					<div class="container">
						<c:forEach var="e" items="${listv.c1vo }">
						<%-- ����� �ۼ��Ǹ� �߰��Ǵ� �κ� --%>
				<%-- 2019�� 1�� 2�� ���� : ��۳����� �߰��� �κ��� ������ ��� ���� ���� ���� --%>
						<c:if test="${e.c1_reply != null }">
							<div class="container"
								style="border: 2px solid blue; padding-bottom: 25px;">
								<div class="row"
									style="border-bottom: 2px solid blue; margin-bottom: 0px;">
									<div class="col-sm-4">
										<label>��� ��ȣ</label>
									</div>
									<div class="col-sm-8">
										<p style="margin-bottom: 20px;">${e.c1_num }</p>
									</div>
									<div class="col-sm-4">
										<label>���� ��ȣ</label>
									</div>
									<div class="col-sm-4">
										<p style="margin-bottom: 20px;">${e.c_num }</p>
									</div>


									<div class="col-sm-4">

										<!-- Button to Open the Modal -->
										<c:if test="${sessionScope.ms_id == e.c1_writer}">
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#myModal">��� ���� Ȱ��ȭ
										</button>
										</c:if>

										<!-- The Modal -->

										<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="container">
														<div class="modal-header">
															<h4 class="modal-title">��� ����â</h4>
															<button type="button" class="close" data-dismiss="modal">â�ݱ�</button>
														</div>


														<!-- Modal body -->
														<form action="updatec1_review" method="post">
															<div class="modal-body">

																<div class="row"
																	style="border-bottom: 2px solid blue; margin-bottom: 0px;">

																	<div class="col-sm-4">
																		<label>��� ��ȣ</label>
																	</div>
																	<div class="col-sm-8">
																		<input type="hidden" name="c1_num" id="c1_num"
																			value="${e.c1_num }">
																		<p style="margin-bottom: 20px;">${e.c1_num }</p>
																	</div>

																	<div class="col-sm-4">
																		<label>���� ��ȣ</label>
																	</div>
																	<div class="col-sm-8">
																		<input type="hidden" name="c_num" id="c_num"
																			value="${e.c_num }"> <input type="hidden"
																			name="class_num" id="class_num" value="${e.c_num }">
																		<p style="margin-bottom: 20px;">${e.c_num }</p>
																	</div>

																	<div class="col-sm-4">
																		<label>���̵�</label>
																	</div>
																	<div class="col-sm-8">
																		<input type="hidden" name="c1_writer" id="c1_writer"
																			value="${e.c1_writer }">
																		<p style="margin-bottom: 20px;">${e.c1_writer }</p>
																	</div>

																	<div class="col-sm-4">
																		<label>�ۼ� ��¥</label>
																	</div>
																	<div class="col-sm-8">
																		<p style="margin-bottom: 20px;">${e.c1_date }</p>
																	</div>

																	<div class="col-sm-4">
																		<label>����</label>
																	</div>
																	<div class="col-sm-8">
																		<div class="row"
																			style="margin-left: 0px; margin-top: 5px;">
																			<input type="hidden" name="c1_stars" id="c1_stars"
																				value="${e.c1_stars }">
																			<c:forEach var="rate" varStatus="status" begin="1"
																				end="${e.c1_stars }">
																				<span class="fa fa-star checked"
																					style="color: orange;"></span>
																				<!-- �� -->
																			</c:forEach>
																		</div>
																	</div>
																</div>

																<p style="margin-top: 20px;">��� ����â</p>
																<textarea class="form-control" rows="5" id="c1_reply"
																	name="c1_reply" style="margin-bottom: 20px;">${e.c1_reply }</textarea>

																<input type="submit" class="btn btn-primary btn-block"
																	value="��ۼ���">
															</div>
														</form>
														<!-- Modal footer -->
														<div class="modal-footer"></div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>


								<div class="row">
									<div class="col-sm-5">
										<label>1) ��� �ۼ��� ���̵�</label>
									</div>
									<div class="col-sm-7">
										<p style="margin-bottom: 20px;">${e.c1_writer }</p>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-5">
										<label>2) �ۼ� ��¥</label>
									</div>
									<div class="col-sm-7">
										<p style="margin-bottom: 20px;">${e.c1_date }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-5">
										<label>3) ����</label>
									</div>
									<div class="col-sm-7">
										<%--���� üũ�ϴ� �κ� --%>
										<div class="row" style="margin-left: 0px; margin-top: 5px;">
											<c:forEach var="rate" varStatus="status" begin="1"
												end="${ e.c1_stars }">
												<span class="fa fa-star checked" style="color: orange;"></span>
												<!-- �� -->
											</c:forEach>
										</div>
									</div>
								</div>



								<p style="margin-top: 20px;">4) ��� ����</p>
								<input type="hidden" name="c1_writer" size="10" value="${e.c1_writer }" id="c1_writer">
								<textarea class="form-control" rows="3" id="c1_reply" name="c1_reply" readonly="readonly">${e.c1_reply }</textarea>


								<%-- 2019�� 1�� 2�� ���ǿ� ���� ���� & ������ư ���� --%>
								<c:if test="${sessionScope.ms_id == e.c1_writer}">
									<%--// �����Ǿ��� (����ȣ) --%>
									<%-- 2019�� 1�� 2�� ��� ���� �۵��� --%>
									<!-- <form action="deletes1_review">  �־���� �ʿ伺?-->
									<button type="button" class="btn btn-primary btn-block"
										data-toggle="modal" data-target="#myModal"
										style="margin-top: 10px;">��� ����</button>


									<%-- 2019�� 1�� 2�� ��� ���� �۵��� --%>
									<a href="deletec1_review?c_num=${e.c_num }&c1_num=${e.c1_num }">
										<input type="button" id="reviewdelBtn"
										class="btn btn-primary btn-block" style="margin-top: 10px;"
										value="��� ����">
									</a>
									<%-- 2019�� 1�� 2�� ��� ���� �۵��� --%>
								</c:if>




								<%-- <button type="submit" id="reviewdelBtn" class="btn btn-primary btn-block" style="margin-top: 10px;">
										��� ����</button>
									<input type="hidden" id="riview_c_num" name="riview_c_num" value="${e.c_num }"> 
									<input type="hidden" id="riview_c1_num" name="riview_c1_num" value="${e.c1_num }"> --%>
									
									
									
									
							</div>
							<hr style="border: 2px solid blue;" />
							</c:if>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


<script>
	// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
	$(function() {
		/* ���ϴ� ���ϱ��??
		$('#cancleBtn').click(function() {
			location.href = 'showclasslist?page=1';
		});
		 */
		 	/* 
		 <div style="margin-top: 30px; margin-bottom: 5px;">
			<form action="updateview?num=${num }">
				<input id="rewriteBtn" type="button"
					class="btn btn-primary btn-block" value="�����ϱ�"> <input
					type="hidden" id="num" value="${num }">
			</form>
		</div>

		<button type="submit" id="deleteBtn"
			class="btn btn-primary btn-block">���ǻ���</button>
		  */
		 // ���� ����
		$('#rewriteBtn').click(function() {
			console.log($('#class_num').val());
			var num = $('#class_num').val();
			location.href = 'updateview?num=' + num;
		});
		 // ���� ����
		$('#deleteBtn').click(function() {
			if (confirm("�����Ͻðڽ��ϱ�?")) {
				var num = $('#class_num').val();
				location.href = 'delclassandc1?num=' + num + '&page=' + 1;
			}
		});
		 
		 // ���� ��� ����
		$('#reviewdelBtn').each(
				function(index, item) {
					$(this).click(
							function() {
								var result = confirm('����?');
								if (result) { //yes 
									var c1_num = $('#riview_c1_num').val();
									var c_num = $('#riview_c_num').val();
									location.href = 'deletec1_review?c1_num='
											+ c1_num + '&c_num=' + c_num;
								}
							});
				});
		 	/*  ���ϴ�????
		$('.reviewreBtn').each(
				function(index, item) {
					$(this).click(
							function() {

								var c1_num = $(this).next().next().val();
								var c_num = $('#c_num').val();
								var c1_reply = $(this).prev().val();
								var c1_stars = $(this).prev().prev().prev()
										.val();
								console.log('��� �ε��� Ȯ��: '+c1_num);
								console.log('�� �ε��� Ȯ��: '+c_num);
								console.log('��� ���� Ȯ��: '+c1_reply);
								console.log('��� ���� Ȯ��: '+c1_stars);  
								location.href = 'updatec1_review?c1_num='
										+ c1_num + '&c_num=' + c_num
										+ '&c1_reply=' + c1_reply
										+ '&c1_stars=' + c1_stars;
							});
				});
 */
		/* �����κ� */
		// ������û
		$('#classBuyBtn').click(function() {
			if (confirm("������û �Ͻðڽ��ϱ�?")) {
				let title = $('#c_title').val();
				console.log(title);
				title = encodeURI(title, 'EUC-KR');
				var price = $('#c_price').val();
				console.log(price);
				location.href = 'insertClassonebuy?title='+title+'&buynum='+2+'&price='+price;
			}
		});
		// ���� ��ٱ���
		$('#classBagBtn').click(function() {
			if (confirm("�ش� ���¸� ��ٱ��Ͽ� �����ðڽ��ϱ�?")) {
				let title = $('#c_title').val();
				console.log(title);
				title = encodeURI(title, 'EUC-KR');
				location = 'insertClassList?title='+title+'&buynum='+1;
			}
		});

		/* �����κ� �� */

	});
</script>

<%--���� ��ũ��Ʈ --%>
<script>
	$('.star-input').click(function() {
		$(this).parent()[0].reset();
		var prevStars = $(this).prevAll();
		var nextStars = $(this).nextAll();
		prevStars.attr('checked', true);
		nextStars.attr('checked', false);
		$(this).attr('checked', true);
	});

	$('.star-input-label').on('mouseover', function() {
		var prevStars = $(this).prevAll();
		prevStars.addClass('hovered');
	});
	$('.star-input-label').on('mouseout', function() {
		var prevStars = $(this).prevAll();
		prevStars.removeClass('hovered');
	})
</script>
