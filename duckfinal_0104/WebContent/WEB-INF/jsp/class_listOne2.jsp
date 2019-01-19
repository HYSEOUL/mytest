<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* .row {
	text-align: center;
} */

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
				<div class="container" style=" margin-top: 20px;">

				<%-- 2019년 1월 2일 수정 --%>
				<div class="container row" style="margin-left:5px;">
					<div class="col-sm-6" style="margin-bottom:20px;">
						<h3>강의 상세보기</h3>
					</div>

					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 강의삭제버튼 생성 --%>
					<c:if test="${sessionScope.mt_name == listv.c_name && sessionScope.ms_id == null}">
						<div class="col-sm-3" style="margin-bottom: 10px;" >
							
							<button type="button" id="rewriteBtn"
								class="btn btn-primary btn-block float-right" >강의 수정</button>
						</div>	
							<%--2019년 1월 2일 수정 --%>
						<div class="col-sm-3" style="margin-bottom: 10px;">
							<form action="deleteclass" method="get">
								<button type="button" id="deleteBtn"
									class="btn btn-primary btn-block float-right">강의 삭제</button>
							</form>
							<%--2019년 1월 2일 수정 --%>

						</div>
					</c:if>
					<%-- 2019년 1월 2일 세션에 따라 수정하기 & 강의삭제버튼 생성 --%>
				</div>
				<%-- 2019년 1월 2일 수정 --%>
		
					<div class="container" style="margin-top:30px;">
						<img src="resources/images/${listv.c_img}" class="img-fluid" 
						style="width:100%; height:400px;">
						<input type="hidden" id="class_num" value="${listv.c_num}"> 
					<p style="margin-top:30px;">
					<b>강사</b> : ${listv.c_name }</p>
					<p><b>강의 명</b> : ${listv.c_title }
						<input type="hidden" id="c_title" value="${listv.c_title }"> </p>
					<p><b>강의 분야</b> : ${listv.c_category }</p>
					<p><b>강의 시/도 주소</b> : ${listv.c_loc1 }</p>
					<p><b>상세 주소</b> : ${listv.c_loc2 }</p>
					<p><b>시작일 - 종료일</b> : ${listv.c_date1 } - ${listv.c_date2 }</p>
					<p><b>주간 강의 횟수</b> : ${listv.c_count }</p>
					<p><b>강의 인원</b> : ${listv.c_pnum }</p>
					<p><b>강의 내용</b> : ${listv.c_comment }</p>
					<p><b>강의 참가비</b> : ${listv.c_price }
						<input type="hidden" id="c_price" value="${listv.c_price }"></p>
					
					<%-- 
					<c:if test="${listv.c_point eq 1}">
						<p>일반</p>
					</c:if>
					<c:if test="${listv.c_point eq 2}">
						<p>과금</p>
					</c:if> --%>
					
					<%-- 2019년 1월 2일 수정  : 학생만 강좌신청 가능 --%>
					<c:if test="${sessionScope.ms_id != null }">
					<button type="button" id="classBuyBtn" class="btn btn-primary btn-block">강의신청</button>
					<button type="button" id="classBagBtn" class="btn btn-primary btn-block">강의담기</button>
					</c:if>
					<%-- 2019년 1월 2일 수정 --%>
					</div>
					
					
				


				<div class="container" style="margin-top: 20px;">
					<hr />
					<c:if test="${sessionScope.ms_id != null }">
					
					<h5>강의 댓글 작성창</h5>
					<br/>
						<form
							action="createc1_review?c_num=${listv.c_num }&num=${listv.c_num }"
							method="post">
							<label><b>댓글 작성자 아이디</b></label>
							<%-- 2018년 1월 2일 수요일 : 댓글 작성자 아이디 고정값을 수정 --%>
								<input type="text"
								class="form-control form-control" name="c1_writer"
								value="${ms_id}" readonly="readonly" style="margin-bottom: 20px;">
								<%-- 2018년 1월 2일 수요일 : 댓글 작성자 아이디 고정값을 수정 --%>
							<!-- <input type="text"
								class="form-control form-control" name="c1_writer"
								placeholder="닉네임을 입력하세요." style="margin-bottom: 20px;"> -->

							
							<label><b>별점</b></label>
							<%--별점 체크하는 부분 --%>
							<div class="row" style="margin-left: 0px; margin-top: -10px;">
								<div class="rate">
									<!-- <input type="text" class="form-control form-control" name="c1_stars"
							placeholder="별점을 입력하세요."> -->
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


							<label><b>댓글 내용</b></label>
							<textarea class="form-control" rows="5" id="comment"
								name="c1_reply"></textarea>
							<br />

							<button type="submit" class="btn btn-primary btn-block">
								댓글 작성</button>
							<!-- <input type="submit" value="댓글 작성"> -->

						</form>
					</c:if>
					</div>


					<div class="container">
						<c:forEach var="e" items="${listv.c1vo }">
						<%-- 댓글이 작성되면 추가되는 부분 --%>
				<%-- 2019년 1월 2일 수정 : 댓글내용이 추가된 부분이 있으면 댓글 수정 내용 생성 --%>
						<c:if test="${e.c1_reply != null }">
							<div class="container" style="padding-bottom: 25px;">
								<div class="row">
									<%-- <div class="col-sm-4">
										<label>댓글 번호</label>
									</div>
									<div class="col-sm-8">
										<p style="margin-bottom: 20px;">${e.c1_num }</p>
									</div>
									<div class="col-sm-4">
										<label>강의 번호</label>
									</div>
									<div class="col-sm-4">
										<p style="margin-bottom: 20px;">${e.c_num }</p>
									</div> --%>


									<div class="col-sm-4">

										<%-- <!-- Button to Open the Modal -->
										<c:if test="${sessionScope.ms_id == e.c1_writer}">
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#myModal">댓글 수정 활성화
										</button>
										</c:if> --%>

										<!-- The Modal -->

										<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="container">
														<div class="modal-header">
															<h4 class="modal-title">강의 댓글 수정창</h4>
															<button type="button" class="close" data-dismiss="modal">창닫기</button>
														</div>


														<!-- Modal body -->
														<form action="updatec1_review" method="post">
															<div class="modal-body">

																<div class="row">

																	<%-- <div class="col-sm-4">
																		<label>댓글 번호</label>
																	</div>
																	<div class="col-sm-8">
																		<input type="hidden" name="c1_num" id="c1_num"
																			value="${e.c1_num }">
																		<p style="margin-bottom: 20px;">${e.c1_num }</p>
																	</div>

																	<div class="col-sm-4">
																		<label>강의 번호</label>
																	</div>
																	<div class="col-sm-8">
																		<input type="hidden" name="c_num" id="c_num"
																			value="${e.c_num }"> <input type="hidden"
																			name="class_num" id="class_num" value="${e.c_num }">
																		<p style="margin-bottom: 20px;">${e.c_num }</p>
																	</div> --%>

																	<div class="col-sm-4">
																		<label><b>아이디</b></label>
																	</div>
																	<div class="col-sm-8">
																		<input type="hidden" name="c1_writer" id="c1_writer"
																			value="${e.c1_writer }">
																		<p style="margin-bottom: 20px;">${e.c1_writer }</p>
																	</div>

																	<div class="col-sm-4">
																		<label><b>작성 날짜</b></label>
																	</div>
																	<div class="col-sm-8">
																		<p style="margin-bottom: 20px;">${e.c1_date }</p>
																	</div>

																	<div class="col-sm-4">
																		<label><b>별점</b></label>
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
																				<!-- ★ -->
																			</c:forEach>
																		</div>
																	</div>
																</div>

																<p style="margin-top: 20px;">댓글 수정창</p>
																<textarea class="form-control" rows="5" id="c1_reply"
																	name="c1_reply" style="margin-bottom: 20px;">${e.c1_reply }</textarea>

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
									</div>

								</div>
								
		
		
		
		
		
		
		
								
								<hr/>
								<div class="container" style="margin-top:40px;">
									<h5>강의 댓글</h5>
								</div>

								<div class="container row">
									<div class="col-sm-5">
										<label><b>댓글 작성자 아이디</b></label>
									</div>
									<div class="col">
										<p style="margin-bottom: 20px;">${e.c1_writer }</p>
									</div>
								</div>

								<div class="container row">
									<div class="col-sm-5">
										<label><b>작성 날짜</b></label>
									</div>
									<div class="col-sm-7">
										<p style="margin-bottom: 20px;">${e.c1_date }</p>
									</div>
								</div>
								
								
								
								<div class="container row">
									<div class="col-sm-5">
										<label><b>별점</b></label>
									</div>
									<div class="col-sm-7">
										<%--별점 체크하는 부분 --%>
										<div class="row" style="margin-left: 0px; margin-top: 5px;">
											<c:forEach var="rate" varStatus="status" begin="1"
												end="${ e.c1_stars }">
												<span class="fa fa-star checked" style="color: orange;"></span>
												<!-- ★ -->
											</c:forEach>
										</div>
									</div>
								</div>


								<div class="container">
								<p style="margin-top: 20px;"><b>댓글 내용</b></p>
								<input type="hidden" name="c1_writer" size="10" value="${e.c1_writer }" id="c1_writer">
								<textarea class="form-control" rows="3" id="c1_reply" name="c1_reply" readonly="readonly">${e.c1_reply }</textarea>
								</div>



								<%-- 2019년 1월 2일 세션에 따라 수정 & 삭제버튼 생성 --%>
								<c:if test="${sessionScope.ms_id == e.c1_writer}">
								
								
								<div class="container row">
									<%--// 수정되었음 (박준호) --%>
									<%-- 2019년 1월 2일 댓글 수정 작동됨 --%>
									<!-- <form action="deletes1_review">  있어야할 필요성?-->
									<div class="col-sm-6">
									<button type="button" class="btn btn-primary btn-block"
										data-toggle="modal" data-target="#myModal"
										style="margin-top: 10px;">댓글 수정</button>
									</div>

									<div class="col-sm-6">
									<%-- 2019년 1월 2일 댓글 삭제 작동됨 --%>
									<a href="deletec1_review?c_num=${e.c_num }&c1_num=${e.c1_num }">
										<input type="button" id="reviewdelBtn"
										class="btn btn-primary btn-block" style="margin-top: 10px;"
										value="댓글 삭제">
									</a>
									</div>
									<%-- 2019년 1월 2일 댓글 삭제 작동됨 --%>
								</c:if>
									
									
							</div>
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
		/* 뭐하는 애일까요??
		$('#cancleBtn').click(function() {
			location.href = 'showclasslist?page=1';
		});
		 */
		 	/* 
		 <div style="margin-top: 30px; margin-bottom: 5px;">
			<form action="updateview?num=${num }">
				<input id="rewriteBtn" type="button"
					class="btn btn-primary btn-block" value="수정하기"> <input
					type="hidden" id="num" value="${num }">
			</form>
		</div>

		<button type="submit" id="deleteBtn"
			class="btn btn-primary btn-block">강의삭제</button>
		  */
		 // 강좌 수정
		$('#rewriteBtn').click(function() {
			console.log($('#class_num').val());
			var num = $('#class_num').val();
			location.href = 'updateview?num=' + num;
		});
		 // 강좌 삭제
		$('#deleteBtn').click(function() {
			if (confirm("삭제하시겠습니까?")) {
				var num = $('#class_num').val();
				location.href = 'delclassandc1?num=' + num + '&page=' + 1;
			}
		});
		 
		 // 강좌 댓글 삭제
		$('#reviewdelBtn').each(
				function(index, item) {
					$(this).click(
							function() {
								var result = confirm('삭제?');
								if (result) { //yes 
									var c1_num = $('#riview_c1_num').val();
									var c_num = $('#riview_c_num').val();
									location.href = 'deletec1_review?c1_num='
											+ c1_num + '&c_num=' + c_num;
								}
							});
				});
		 	/*  뭐하는????
		$('.reviewreBtn').each(
				function(index, item) {
					$(this).click(
							function() {

								var c1_num = $(this).next().next().val();
								var c_num = $('#c_num').val();
								var c1_reply = $(this).prev().val();
								var c1_stars = $(this).prev().prev().prev()
										.val();
								console.log('댓글 인덱스 확인: '+c1_num);
								console.log('글 인덱스 확인: '+c_num);
								console.log('댓글 내용 확인: '+c1_reply);
								console.log('댓글 평점 확인: '+c1_stars);  
								location.href = 'updatec1_review?c1_num='
										+ c1_num + '&c_num=' + c_num
										+ '&c1_reply=' + c1_reply
										+ '&c1_stars=' + c1_stars;
							});
				});
 */
		/* 다혜부분 */
		// 수강신청
		$('#classBuyBtn').click(function() {
			if (confirm("수강신청 하시겠습니까?")) {
				let title = $('#c_title').val();
				console.log(title);
				title = encodeURI(title, 'EUC-KR');
				var price = $('#c_price').val();
				console.log(price);
				location.href = 'insertClassonebuy?title='+title+'&buynum='+2+'&price='+price;
			}
		});
		// 강좌 장바구니
		$('#classBagBtn').click(function() {
			if (confirm("해당 강좌를 장바구니에 담으시겠습니까?")) {
				let title = $('#c_title').val();
				console.log(title);
				title = encodeURI(title, 'EUC-KR');
				location = 'insertClassList?title='+title+'&buynum='+1;
			}
		});

		/* 다혜부분 끝 */

	});
</script>

<%--별점 스크립트 --%>
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
