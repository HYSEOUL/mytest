<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="form-group"
		style="border: 1px solid black; padding: 50px; margin: 100px;">
		

			<c:forEach var="listv" items="${svo}">
				<div class="container" style="margin-top: 20px;">

				<div class="container row" style="margin-left:5px;">
					<div class="col-sm-6" style="margin-bottom:20px;">
						<h3>스터디 상세보기</h3>
					</div>

					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 스터디삭제버튼 생성 --%>
					<c:if test="${sessionScope.ms_id == listv.ms_id }">
					<div class="col-sm-3" style="margin-bottom: 10px; float: right">
							<a href="updateStudyForm?s_num=${listv.s_num}">
							<button type="button" id="rewriteBtn"
								class="btn btn-primary btn-block">스터디 수정</button>
							</a>
					</div>
					
					<div class="col-sm-3" style="margin-bottom: 10px; float: right">
							<a href="deleteStudy?num=${listv.s_num}&page=1">
							<button type="button" id="deleteBtn"
								class="btn btn-primary btn-block">스터디 삭제</button>
							</a>
					</div>
					</c:if>
					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 스터디삭제버튼 생성 --%>
					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 강의삭제버튼 생성 --%>
				</div>
				<%-- 2019년 1월 2일 수정 --%>

					<div class="container" style="margin-top:30px;">
						<img src="resources/images/${listv.s_img}" class="img-fluid" 
						style="width:100%; height:400px;">
					<input type="hidden" id="study_num_key" value="${listv.s_num}">
					<p style="margin-top:30px;">
						<b>스터디 생성자</b> : ${listv.ms_id }
						<input type="hidden" id="ms_id"
							value="${listv.ms_id }">
					</p>
					<p><b>스터디 명</b> : ${listv.s_title }</p>
					<p><b>스터디 분야</b> : ${listv.s_category }</p>
					<p><b>스터디 시/도 주소</b> : ${listv.s_loc1 }</p>
					<p><b>상세 주소</b> : ${listv.s_loc2 }</p>
					<p><b>시작일 - 종료일</b> : ${listv.s_date1 } - ${listv.s_date2 }</p>
					<p><b>주간 스터디 횟수</b> : ${listv.s_count }</p>
					<p><b>스터디 인원</b> : ${listv.s_pnum }</p>
					<p><b>스터디 내용</b> : ${listv.s_comment }</p>
					<p><b>스터디 참가비</b> : ${listv.s_price }</p>
					<br/>
					<%-- 2019년 1월 2일 수정  : 학생만 강좌신청 가능 --%>
					<c:if test="${sessionScope.ms_id != null }">
					<button type="button" id="studyBuyBtn"
						class="btn btn-primary btn-block">스터디 신청</button>
					<button type="button" id="studyBagBtn"
						class="btn btn-primary btn-block">스터디 담기</button>
					</c:if>
					</div>

				
				

				<div class="container" style="margin-top: 20px;">
				<hr />
					<c:if test="${sessionScope.ms_id != null }">
					<h5>스터디 댓글 작성창</h5>
						<%-- <form action="creates1_review?s_num=${listv.s_num }&num=${listv.s_num }" method="post"> --%>
						<form action="creates1_review" method="post">
							<label><b>댓글 작성자 아이디</b></label>
							<input type="hidden" name="s_num"
								value="${listv.s_num }">
								
							<%-- 2018년 1월 2일 수요일 : 댓글 작성자 아이디 고정값을 수정 --%>
								<input type="text"
								class="form-control form-control" name="s1_id"
								value="${ms_id}" readonly="readonly" style="margin-bottom: 20px;">
								<%-- 2018년 1월 2일 수요일 : 댓글 작성자 아이디 고정값을 수정 --%>

							<label><b>댓글 내용</b></label>
							<textarea class="form-control" rows="5" name="s1_text"></textarea>
							<input type="hidden" name="ms_id" value="${listv.ms_id }">
							<br /> <input type="submit" class="btn btn-primary btn-block"
								value="댓글 작성">
							<!-- <input type="submit" value="댓글 작성"> -->
						</form>
					</c:if>
					</div>
				</div>

				<div class="container">
					<c:forEach var="e" items="${listv.s1rvo }">
					<%-- 댓글이 작성되면 추가되는 부분 --%>
				<%-- 2019년 1월 2일 수정 : 댓글내용이 추가된 부분이 있으면 댓글 수정 내용 생성 --%>
					<c:if test="${e.s1_text != null }">

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












						<hr/>
						<div class="container" style="margin-top:40px;">
							<h5>스터디 댓글</h5>
						</div>
						
						<div class="container row">
							<div class="col-sm-5">
								<label><b>댓글 작성자 아이디</b></label>
							</div>
							<div class="col">
								<p style="margin-bottom: 20px; text-align: left;">${e.s1_id }</p>
							</div>
						</div>

						<div class="container row">
							<div class="col-sm-5">
								<label><b>작성 날짜</b></label>
							</div>
							<div class="col">
								<p style="margin-bottom: 20px; text-align: left;">${e.s1_date }</p>
							</div>
						</div>




						<div class="container">
						<label><b>댓글 내용</b></label>
						<input type="hidden" name="s1_id" size="10" value="${e.s1_id }"
							id="s1_id">
						<textarea class="form-control" rows="3" id="s1_text"
							name="s1_text" readonly="readonly">${e.s1_text }</textarea>
						</div>
						<%--<input type="text" style="height:200px;" class="form-control form-control" value="${e.c1_reply }"> --%>
						<%-- <input type="text" name="c1_reply1" value="${e.c1_reply }"> --%>
						<%-- <c:if test="${not empty ms_id}"> --%>

						<%-- 2019년 1월 2일 세션에 따라 수정 & 삭제버튼 생성 --%>
						<c:if test="${sessionScope.ms_id == e.s1_id }">
						<%--// 수정되었음 (박준호) --%>
						<%-- 2019년 1월 2일 댓글 수정 작동됨 --%>
						<!-- <form action="deletes1_review">  있어야할 필요성?-->
						
						<div class="container row">
						
						
						<div class="col-sm-6">
						<button type="button" class="btn btn-primary btn-block"
							data-toggle="modal" data-target="#myModal"
							style="margin-top: 10px;">댓글 수정</button>
						</div>
						
							
							<div class="col-sm-6">
						<%-- 2019년 1월 2일 댓글 삭제 작동됨 --%>
						<a href="deletes1_review?s_num=${e.s_num }&s1_num=${e.s1_num }">
						<input type="button" id="reviewdelBtn"
							class="btn btn-primary btn-block" style="margin-top: 10px;"
							value="댓글 삭제">
						</a>
						</div>
						
						<%-- 2019년 1월 2일 댓글 삭제 작동됨 --%>
						</c:if>
						</div>
						
						



						<%-- <input type="hidden" id="riview_s_num" name="riview_s_num"
							value="${e.s_num }">
						<input type="hidden" id="riview_s1_num" name="riview_s1_num"
							value="${e.s1_num }"> --%>
						<!-- </form> 있어야할 필요성?-->
						<%--// 수정되었음 (박준호) --%>
						</c:if>
					</c:forEach>
				</div>
				</div>
			</c:forEach>
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





