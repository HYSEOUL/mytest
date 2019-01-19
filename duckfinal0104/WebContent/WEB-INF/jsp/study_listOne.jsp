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
						<h3>스터디 상세보기</h3>
					</div>

					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 스터디삭제버튼 생성 --%>
					<c:if test="${sessionScope.ms_id == listv.ms_id }">
						<div class="col-sm-6" style="margin-bottom: 10px; float: right">
							<a href="updateStudyForm?s_num=${listv.s_num}">
							<button type="button" id="rewriteBtn"
								class="btn btn-primary btn-block">수정하기</button>
							</a>
							
							<a href="deleteStudy?num=${listv.s_num}&page=1">
							<button type="button" id="deleteBtn"
								class="btn btn-primary btn-block">스터디삭제</button>
							</a>
						</div>
					</c:if>
					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 스터디삭제버튼 생성 --%>
					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 강의삭제버튼 생성 --%>
				</div>
				<%-- 2019년 1월 2일 수정 --%>

					<div class="container">
						<img src="resources/images/${listv.s_img}" class="img-fluid">
					</div>
					<p>
						번호 : ${listv.s_num } <input type="hidden" id="study_num_key"
							value="${listv.s_num}">
					</p>
					<p>
						아이디 : ${listv.ms_id } <input type="hidden" id="ms_id"
							value="${listv.ms_id }">
					</p>
					<p>제목 : ${listv.s_title }</p>
					<p>분류 : ${listv.s_category }</p>
					<p>지역1 : ${listv.s_loc1 }</p>
					<p>지역2 : ${listv.s_loc2 }</p>
					<p>시작일 - 종료일 : ${listv.s_date1 } - ${listv.s_date2 }</p>
					<p>횟수 : ${listv.s_count }</p>
					<p>인원 : ${listv.s_pnum }</p>
					<p>내용 : ${listv.s_comment }</p>
					<p>가격 : ${listv.s_price }</p>

					<%-- 2019년 1월 2일 수정  : 학생만 강좌신청 가능 --%>
					<c:if test="${sessionScope.ms_id != null }">
					<button type="button" id="studyBuyBtn"
						class="btn btn-primary btn-block">스터디 신청</button>
					<button type="button" id="studyBagBtn"
						class="btn btn-primary btn-block">스터디 담기</button>
					</c:if>

				</div>
				<hr />

				<div class="container"
					style="font-family: sans-serif; font-size: 20px; margin-top: 20px;">
					<c:if test="${sessionScope.ms_id != null }">
					<h4>* 댓글 작성창 *</h4>
						<%-- <form action="creates1_review?s_num=${listv.s_num }&num=${listv.s_num }" method="post"> --%>
						<form action="creates1_review" method="post">
							<label>댓글 작성자 아이디</label>
							<input type="hidden" name="s_num"
								value="${listv.s_num }">
								
							<%-- 2018년 1월 2일 수요일 : 댓글 작성자 아이디 고정값을 수정 --%>
								<input type="text"
								class="form-control form-control" name="s1_id"
								value="${ms_id}" readonly="readonly" style="margin-bottom: 20px;">
								<%-- 2018년 1월 2일 수요일 : 댓글 작성자 아이디 고정값을 수정 --%>

							<label>댓글 내용</label>
							<textarea class="form-control" rows="5" name="s1_text"></textarea>
							<input type="hidden" name="ms_id" value="${listv.ms_id }">
							<br /> <input type="submit" class="btn btn-primary btn-block"
								value="댓글 작성">
							<!-- <input type="submit" value="댓글 작성"> -->
						</form>
					</c:if>
				</div>

				<div class="container">
					<c:forEach var="e" items="${listv.s1rvo }">
					<%-- 댓글이 작성되면 추가되는 부분 --%>
				<%-- 2019년 1월 2일 수정 : 댓글내용이 추가된 부분이 있으면 댓글 수정 내용 생성 --%>
					<c:if test="${e.s1_text != null }">
						<%-- <div class="row"
								style="border-bottom: 2px solid blue; margin-bottom: 0px;">
								<div class="col-sm-4">
									<label>댓글 번호</label>
								</div>
								<div class="col-sm-8">
									<p style="margin-bottom: 20px;">${e.s1_num }</p>
								</div>
								<div class="col-sm-4">
									<label>스터디 번호</label>
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
											<h4 class="modal-title">스터디 댓글 수정창</h4>
											<button type="button" class="close" data-dismiss="modal">창닫기</button>
										</div>


										<!-- Modal body -->
										<form action="updates1_review" method="post">
											<div class="modal-body">

												<div class="row"
													style="border-bottom: 2px solid blue; margin-bottom: 0px;">

													<!-- 댓글번호 -->
													<input type="hidden" name="s1_num" id="s1_num"
														value="${e.s1_num }">
													<!-- 스터디번호 -->
													<input type="hidden" name="s_num" id="s_num"
														value="${e.s_num }">

													<div class="col-sm-4">
														<label>아이디</label>
													</div>
													<div class="col-sm-8">
														<input type="hidden" name="s1_id" id="s1_id"
															value="${e.s1_id }">
														<p style="margin-bottom: 20px;">${e.s1_id }</p>
													</div>

													<div class="col-sm-4">
														<label>작성 날짜</label>
													</div>
													<div class="col-sm-8">
														<p style="margin-bottom: 20px;">${e.s1_date }</p>
													</div>

												</div>

												<p style="margin-top: 20px;">댓글 수정창</p>
												<textarea class="form-control" rows="5" id="s1_text"
													name="s1_text" style="margin-bottom: 20px;">${e.s1_text }</textarea>

												<input type="submit" class="btn btn-primary btn-block"
													value="댓글수정">
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
								<label>1) 댓글 작성자 아이디</label>
							</div>
							<div class="col-sm-7">
								<p style="margin-bottom: 20px;">${e.s1_id }</p>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-5">
								<label>2) 작성 날짜</label>
							</div>
							<div class="col-sm-7">
								<p style="margin-bottom: 20px;">${e.s1_date }</p>
							</div>
						</div>

						<p style="margin-top: 20px;">3) 댓글 내용</p>
						<input type="hidden" name="s1_id" size="10" value="${e.s1_id }"
							id="s1_id">
						<textarea class="form-control" rows="3" id="s1_text"
							name="s1_text" readonly="readonly">${e.s1_text }</textarea>
						<%--<input type="text" style="height:200px;" class="form-control form-control" value="${e.c1_reply }"> --%>
						<%-- <input type="text" name="c1_reply1" value="${e.c1_reply }"> --%>
						<%-- <c:if test="${not empty ms_id}"> --%>

						<%-- 2019년 1월 2일 세션에 따라 수정 & 삭제버튼 생성 --%>
						<c:if test="${sessionScope.ms_id == e.s1_id }">
						<%--// 수정되었음 (박준호) --%>
						<%-- 2019년 1월 2일 댓글 수정 작동됨 --%>
						<!-- <form action="deletes1_review">  있어야할 필요성?-->
						<button type="button" class="btn btn-primary btn-block"
							data-toggle="modal" data-target="#myModal"
							style="margin-top: 10px;">댓글 수정</button>
							
							
						<%-- 2019년 1월 2일 댓글 삭제 작동됨 --%>
						<a href="deletes1_review?s_num=${e.s_num }&s1_num=${e.s1_num }">
						<input type="button" id="reviewdelBtn"
							class="btn btn-primary btn-block" style="margin-top: 10px;"
							value="댓글 삭제">
						</a>
						<%-- 2019년 1월 2일 댓글 삭제 작동됨 --%>
						</c:if>



						<%-- <input type="hidden" id="riview_s_num" name="riview_s_num"
							value="${e.s_num }">
						<input type="hidden" id="riview_s1_num" name="riview_s1_num"
							value="${e.s1_num }"> --%>
						<!-- </form> 있어야할 필요성?-->
						<%--// 수정되었음 (박준호) --%>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	// 모든 컨텐츠가 로딩이 된 후에 호출되는 메서드
	$(function() {
		/*  뭐하는 애임?
		$('#cancleBtn').click(function() {
			location.href = 'selectListStudy?page=1';
		});
		 */
		// 스터디 수정
		$('#rewriteBtn').click(function() {
			console.log($('#s_num').val());
			var num = $('#s_num').val();
			location.href = 'updateStudyForm?s_num=' + num;
		});

		// 스터디 삭제
		$('#deleteBtn').click(function() {
			if (confirm("삭제하시겠습니까?")) {
				var num = $('#study_num_key').val();
				location.href = 'deleteStudy?num=' + num + '&page=' + 1;
			}
		});

		// 스터디 댓글 삭제
		$('#reviewdelBtn').each(
				function(index, item) {
					$(this).click(
							function() {
								var result = confirm('삭제?');
								if (result) { //yes 
									var s1_num = $('#riview_s1_num').val();
									var s_num = $('#riview_s_num').val();
									location.href = 'deletes1_review?s1_num='
											+ s1_num + '&s_num=' + s_num;
								}
							});
				});
		/*
		// 뭐하는 애??222222
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
		// 스터디 신청
		$('#studyBuyBtn').click(
				function() {
					var s_num = $('#study_num_key').val();
					console.log($('#study_num_key').val());
					var ms_id = $('#ms_id').val();
					location.href = 'insertStudyList_l?num=' + s_num + '&msid='
							+ ms_id + '&buynum=' + 2;
				});
		// 스터디 장바구니 담기
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





