<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="form-group"
		style="border: 1px solid black; padding: 50px; margin: 100px;">
		

			<c:forEach var="listv" items="${svo}">
				<div class="container"
					style="font-family: sans-serif; font-size: 20px; margin-top: 20px;">

				<div class="row">
					<div class="col-sm-6">
						<h3>���͵� �󼼺���</h3>
					</div>

					<%-- 2019�� 1�� 2�� ���ǿ� ���� �����ϱ� & ���͵������ư ���� --%>
					<c:if test="${sessionScope.ms_id == listv.ms_id }">
						<div class="col-sm-6" style="margin-bottom: 10px; float: right">
							<a href="updateStudyForm?s_num=${listv.s_num}">
							<button type="button" id="rewriteBtn"
								class="btn btn-primary btn-block">�����ϱ�</button>
							</a>
							
							<a href="deleteStudy?num=${listv.s_num}&page=1">
							<button type="button" id="deleteBtn"
								class="btn btn-primary btn-block">���͵����</button>
							</a>
						</div>
					</c:if>
					<%-- 2019�� 1�� 2�� ���ǿ� ���� �����ϱ� & ���͵������ư ���� --%>
					<%-- 2019�� 1�� 2�� ���ǿ� ���� �����ϱ� & ���ǻ�����ư ���� --%>
				</div>
				<%-- 2019�� 1�� 2�� ���� --%>

					<div class="container">
						<img src="resources/images/${listv.s_img}" class="img-fluid">
					</div>
					<p>
						��ȣ : ${listv.s_num } <input type="hidden" id="study_num_key"
							value="${listv.s_num}">
					</p>
					<p>
						���̵� : ${listv.ms_id } <input type="hidden" id="ms_id"
							value="${listv.ms_id }">
					</p>
					<p>���� : ${listv.s_title }</p>
					<p>�з� : ${listv.s_category }</p>
					<p>����1 : ${listv.s_loc1 }</p>
					<p>����2 : ${listv.s_loc2 }</p>
					<p>������ - ������ : ${listv.s_date1 } - ${listv.s_date2 }</p>
					<p>Ƚ�� : ${listv.s_count }</p>
					<p>�ο� : ${listv.s_pnum }</p>
					<p>���� : ${listv.s_comment }</p>
					<p>���� : ${listv.s_price }</p>

					<%-- 2019�� 1�� 2�� ����  : �л��� ���½�û ���� --%>
					<c:if test="${sessionScope.ms_id != null }">
					<button type="button" id="studyBuyBtn"
						class="btn btn-primary btn-block">���͵� ��û</button>
					<button type="button" id="studyBagBtn"
						class="btn btn-primary btn-block">���͵� ���</button>
					</c:if>

				</div>
				<hr />

				<div class="container"
					style="font-family: sans-serif; font-size: 20px; margin-top: 20px;">
					<c:if test="${sessionScope.ms_id != null }">
					<h4>* ��� �ۼ�â *</h4>
						<%-- <form action="creates1_review?s_num=${listv.s_num }&num=${listv.s_num }" method="post"> --%>
						<form action="creates1_review" method="post">
							<label>��� �ۼ��� ���̵�</label>
							<input type="hidden" name="s_num"
								value="${listv.s_num }">
								
							<%-- 2018�� 1�� 2�� ������ : ��� �ۼ��� ���̵� �������� ���� --%>
								<input type="text"
								class="form-control form-control" name="s1_id"
								value="${ms_id}" readonly="readonly" style="margin-bottom: 20px;">
								<%-- 2018�� 1�� 2�� ������ : ��� �ۼ��� ���̵� �������� ���� --%>

							<label>��� ����</label>
							<textarea class="form-control" rows="5" name="s1_text"></textarea>
							<input type="hidden" name="ms_id" value="${listv.ms_id }">
							<br /> <input type="submit" class="btn btn-primary btn-block"
								value="��� �ۼ�">
							<!-- <input type="submit" value="��� �ۼ�"> -->
						</form>
					</c:if>
				</div>

				<div class="container">
					<c:forEach var="e" items="${listv.s1rvo }">
					<%-- ����� �ۼ��Ǹ� �߰��Ǵ� �κ� --%>
				<%-- 2019�� 1�� 2�� ���� : ��۳����� �߰��� �κ��� ������ ��� ���� ���� ���� --%>
					<c:if test="${e.s1_text != null }">
						<%-- <div class="row"
								style="border-bottom: 2px solid blue; margin-bottom: 0px;">
								<div class="col-sm-4">
									<label>��� ��ȣ</label>
								</div>
								<div class="col-sm-8">
									<p style="margin-bottom: 20px;">${e.s1_num }</p>
								</div>
								<div class="col-sm-4">
									<label>���͵� ��ȣ</label>
								</div>
								<div class="col-sm-4">
									<p style="margin-bottom: 20px;">${e.s_num }</p>
								</div> 
								<div class="col-sm-4">
									<!-- Button to Open the Modal -->
									--%>

						<!-- The Modal -->

						<div class="modal" id="myModal">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="container">
										<div class="modal-header">
											<h4 class="modal-title">���͵� ��� ����â</h4>
											<button type="button" class="close" data-dismiss="modal">â�ݱ�</button>
										</div>


										<!-- Modal body -->
										<form action="updates1_review" method="post">
											<div class="modal-body">

												<div class="row"
													style="border-bottom: 2px solid blue; margin-bottom: 0px;">

													<!-- ��۹�ȣ -->
													<input type="hidden" name="s1_num" id="s1_num"
														value="${e.s1_num }">
													<!-- ���͵��ȣ -->
													<input type="hidden" name="s_num" id="s_num"
														value="${e.s_num }">

													<div class="col-sm-4">
														<label>���̵�</label>
													</div>
													<div class="col-sm-8">
														<input type="hidden" name="s1_id" id="s1_id"
															value="${e.s1_id }">
														<p style="margin-bottom: 20px;">${e.s1_id }</p>
													</div>

													<div class="col-sm-4">
														<label>�ۼ� ��¥</label>
													</div>
													<div class="col-sm-8">
														<p style="margin-bottom: 20px;">${e.s1_date }</p>
													</div>

												</div>

												<p style="margin-top: 20px;">��� ����â</p>
												<textarea class="form-control" rows="5" id="s1_text"
													name="s1_text" style="margin-bottom: 20px;">${e.s1_text }</textarea>

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




						<div class="row">
							<div class="col-sm-5">
								<label>1) ��� �ۼ��� ���̵�</label>
							</div>
							<div class="col-sm-7">
								<p style="margin-bottom: 20px;">${e.s1_id }</p>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<label>2) �ۼ� ��¥</label>
							</div>
							<div class="col-sm-7">
								<p style="margin-bottom: 20px;">${e.s1_date }</p>
							</div>
						</div>

						<p style="margin-top: 20px;">3) ��� ����</p>
						<input type="hidden" name="s1_id" size="10" value="${e.s1_id }"
							id="s1_id">
						<textarea class="form-control" rows="3" id="s1_text"
							name="s1_text" readonly="readonly">${e.s1_text }</textarea>
						<%--<input type="text" style="height:200px;" class="form-control form-control" value="${e.c1_reply }"> --%>
						<%-- <input type="text" name="c1_reply1" value="${e.c1_reply }"> --%>
						<%-- <c:if test="${not empty ms_id}"> --%>

						<%-- 2019�� 1�� 2�� ���ǿ� ���� ���� & ������ư ���� --%>
						<c:if test="${sessionScope.ms_id == e.s1_id }">
						<%--// �����Ǿ��� (����ȣ) --%>
						<%-- 2019�� 1�� 2�� ��� ���� �۵��� --%>
						<!-- <form action="deletes1_review">  �־���� �ʿ伺?-->
						<button type="button" class="btn btn-primary btn-block"
							data-toggle="modal" data-target="#myModal"
							style="margin-top: 10px;">��� ����</button>
							
							
						<%-- 2019�� 1�� 2�� ��� ���� �۵��� --%>
						<a href="deletes1_review?s_num=${e.s_num }&s1_num=${e.s1_num }">
						<input type="button" id="reviewdelBtn"
							class="btn btn-primary btn-block" style="margin-top: 10px;"
							value="��� ����">
						</a>
						<%-- 2019�� 1�� 2�� ��� ���� �۵��� --%>
						</c:if>



						<%-- <input type="hidden" id="riview_s_num" name="riview_s_num"
							value="${e.s_num }">
						<input type="hidden" id="riview_s1_num" name="riview_s1_num"
							value="${e.s1_num }"> --%>
						<!-- </form> �־���� �ʿ伺?-->
						<%--// �����Ǿ��� (����ȣ) --%>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	// ��� �������� �ε��� �� �Ŀ� ȣ��Ǵ� �޼���
	$(function() {
		/*  ���ϴ� ����?
		$('#cancleBtn').click(function() {
			location.href = 'selectListStudy?page=1';
		});
		 */
		// ���͵� ����
		$('#rewriteBtn').click(function() {
			console.log($('#s_num').val());
			var num = $('#s_num').val();
			location.href = 'updateStudyForm?s_num=' + num;
		});

		// ���͵� ����
		$('#deleteBtn').click(function() {
			if (confirm("�����Ͻðڽ��ϱ�?")) {
				var num = $('#study_num_key').val();
				location.href = 'deleteStudy?num=' + num + '&page=' + 1;
			}
		});

		// ���͵� ��� ����
		$('#reviewdelBtn').each(
				function(index, item) {
					$(this).click(
							function() {
								var result = confirm('����?');
								if (result) { //yes 
									var s1_num = $('#riview_s1_num').val();
									var s_num = $('#riview_s_num').val();
									location.href = 'deletes1_review?s1_num='
											+ s1_num + '&s_num=' + s_num;
								}
							});
				});
		/*
		// ���ϴ� ��??222222
		$('.reviewreBtn').each(
				function(index, item) {
					$(this).click(
							function() {
								var s1_num = $(this).next().next().val();
								var s_num = $('#riview_s_num').val();
								var s1_text = $(this).prev().val();
								location.href = 'updates1_review?s1_num='
										+ s1_num + '&s_num=' + s_num
										+ '&s1_text=' + s1_text;
							});
				});
		 */
		// ���͵� ��û
		$('#studyBuyBtn').click(
				function() {
					var s_num = $('#study_num_key').val();
					console.log($('#study_num_key').val());
					var ms_id = $('#ms_id').val();
					location.href = 'insertStudyList_l?num=' + s_num + '&msid='
							+ ms_id + '&buynum=' + 2;
				});
		// ���͵� ��ٱ��� ���
		$('#studyBagBtn').click(
				function() {
					var s_num = $('#study_num_key').val();
					console.log($('#study_num_key').val());
					var ms_id = $('#ms_id').val();
					location.href = 'insertStudyList_l?num=' + s_num + '&msid='
							+ ms_id + '&buynum=' + 1;
				});
	});
</script>





