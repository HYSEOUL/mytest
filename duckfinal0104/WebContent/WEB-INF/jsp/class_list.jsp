<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 상세 카테고리 메뉴 -->
<%@include file="include/headerBox.jsp" %>

<div class="container" style="padding:50px;">
	<div class="row">
	<div class="col-sm-8">
		<h3>개설된 강의 목록 보기</h3>
	</div>
	<div class="col-sm-4" style="float: right">
		<form action="createclass">
		<!-- <input id="createclass" type="submit" class="btn btn-primary btn-block"
			value="강의개설하기" > -->
		
		<%--강사가 로그인 했을 때만 글쓰기 버튼 활성화 --%>
		<c:if test="${sessionScope.mt_id != null }">
			<input id="createclass" type="submit" class="btn btn-primary btn-block"
			value="강의개설하기" >
		</c:if>
		<%--강사가 로그인 했을 때만 글쓰기 버튼 활성화 --%>
		
		</form>
	</div>
	</div>
</div>
	
	<c:forEach begin="0" end="2" varStatus="i" >
		<div class="container">
        <div class="row" style="padding:10px;"><!-- 1행 -->
		<c:forEach begin="${i.index*3 }" end="${i.index*3+2 }" var="e" items="${list}">
		<div class="col" style="border: 1px solid black; margin:5px; padding-top:13px;">
	    	<div class="container-fluid">
	    	
	    	<%-- 2019년 1월 2일 수정 --%>
	    	<img src="resources/images/${e.c_img}" class="img-fluid" style="width:300px; height:300px;">
	    	</div>
	      			<div class="container" style="padding:10px;">
	      			<input type="hidden" id="c_num" name="c_num" value="${e.c_num}">
			        	<label>
			        	강의명 : ${e.c_title}
			        	</label>
			        	<p>강의번호 : ${e.c_num}</p>
			        	<p>강사 이름 : ${e.c_name}</p>
			        	<p>서비스 분야 : ${e.c_category}</p>
			        	<p>강의지역 : ${e.c_loc1}</p>
			        	<p>시작일 - 종료일 : ${e.c_date1} - ${e.c_date2}</p>
			        	<%-- 2018.12.26 이지수 강사가 로그인 했을 때만 버튼 활성화 --%>
			        	<c:if test="${sessionScope.mt_id != null }">
			        	<c:if test="${0 eq e.c_zcount }">
			        	<a href="selectoneclassc1?num=${e.c_num}">
			        	<button id="studydetail" type="submit" class="btn btn-primary btn-block">
			        	강의 세부 정보
			        	</button></a>
			        	</c:if>
			        	<c:if test="${1 eq e.c_zcount }">
			        	<button id="studydetail" type="submit" class="btn btn-secondary btn-block">
			        	강의 세부 정보
			        	</button>
			        	</c:if>
			        	</c:if>
			        	
			        	
			        	<%-- 2018.12.26 이지수 학생 로그인 했을 때만 버튼 활성화 --%>
			        	<c:if test="${sessionScope.ms_id != null }">
			        	<c:if test="${0 eq e.c_zcount }">
			        	<a href="selectoneclassc1?num=${e.c_num}">
			        	<button id="studydetail" type="submit" class="btn btn-primary btn-block">
			        	강의 세부 정보
			        	</button></a>
			        	</c:if>
			        	<c:if test="${1 eq e.c_zcount }">
			        	<button id="studydetail" type="submit" class="btn btn-secondary btn-block">
			        	강의 세부 정보
			        	</button>
			        	</c:if>
			        	</c:if>
			         <%-- 2018.12.26 이지수 학생이 로그인 했을 때만 버튼 활성화 --%>
	      			</div>
	    	</div>
    	</c:forEach>
    	</div>
    	</div>
    </c:forEach>
	
			<div class="container text-center">
						<%--Page 이전 페이지 구현 --%> <c:choose>
							<c:when test="${searchType == null}">
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq 1}">
										<img src="resources/images/prev.png" class="img-fluid" width="20" height="20">
									</c:when>
									<c:otherwise>
										<a
											href="selectListStudy?page=
	         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
											<img src="resources/images/prev.png" class="img-fluid" width="20" height="20">
										</a>
									</c:otherwise>
								</c:choose>

								<%--Page  페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
										<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
											varStatus="num">
	                        [<a
												href="showclasslist?page=
	                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                       </c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num">
	                        [<a
												href="showclasslist?page=
	          ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                    </c:forEach>
									</c:otherwise>
								</c:choose>


								<%--Page 다음 페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
										<img src="resources/images/next.png" class="img-fluid" width="20" height="20">
									</c:when>
									<c:otherwise>
										<a
											href="showclasslist?page=
	         ${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
											<img src="resources/images/next.png" class="img-fluid" width="20" height="30">
										</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>

								<c:choose>
									<c:when test="${pageInfo.currentBlock eq 1}">
										<img src="resources/images/prev.png" class="img-fluid" width="20" height="20">
									</c:when>
									<c:otherwise>
										<a
											href="showclasslist?searchType=${searchType}&searchValue=${searchValue}&page=
	         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
											<img src="resources/images/prev.png" class="img-fluid" width="20" height="20">
										</a>
									</c:otherwise>
								</c:choose>

								<%--Page  페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
										<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
											varStatus="num">
	                        [<a
												href="showclasslist?searchType=${searchType}&searchValue=${searchValue}&page=
	                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                       </c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num">
	                        [<a
												href="showclasslist?searchType=${searchType}&searchValue=${searchValue}&page=
	          ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                    </c:forEach>
									</c:otherwise>
								</c:choose>


								<%--Page 다음 페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
										<img src="resources/images/next.png" class="img-fluid" width="20" height="20">
									</c:when>
									<c:otherwise>
										<a
											href="showclasslist?searchType=${searchType}&searchValue=${searchValue}&page=
	         ${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
											<img src="resources/images/next.png" class="img-fluid" width="20" height="20">
										</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
				
					<div class="container" style="padding-top:30px; padding-bottom:30px;">
						<form method="post" action="selectSearchClass?page=1">
							<input type="hidden" name="page" value="${param.page}">
							<select name="searchType" class="custom-select">
								<option value="1">강의명</option>
								<option value="2">서비스 분야</option>
								<option value="3">지역</option>
							</select>
							<input type="text" class="form-control form-control" name="searchValue"
							placeholder="검색어를 입력하세요." value="" required="">
							<br>
							<button type="submit" class="btn btn-primary btn-block" >
							검색</button>
						</form>
					</div>
			</div>
