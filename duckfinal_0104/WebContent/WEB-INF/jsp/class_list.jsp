<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 상세 카테고리 메뉴 -->
<%@include file="include/headerBox.jsp" %>

<div class="container" style="margin-top:50px;">
	<div class="row">
	<div class="col-sm-8">
		<h3 style="margin-left:30px;">개설된 강의 목록</h3>
	</div>
	
	<div class="col-sm-4">
		<form action="createclass">
		
		<%--강사가 로그인 했을 때만 글쓰기 버튼 활성화 --%>
		<c:if test="${sessionScope.mt_id != null }">
			<input id="createclass" type="submit" 
			class="btn btn-primary btn-block" value="강의개설하기" >
		</c:if>
		<%--강사가 로그인 했을 때만 글쓰기 버튼 활성화 --%>
		
		</form>
	</div>
	</div>
</div>
	
	<c:forEach begin="0" end="2" varStatus="i" >
		<div class="container">
        <div class="row"><!-- 1행 -->		
		<c:forEach begin="${i.index*3 }" end="${i.index*3+2 }" var="e" items="${list}">
		<div class="col-sm-4" style="margin-top:3%; margin-bottom:3%;">
	    	
	    	<%-- 2019년 1월 2일 수정 --%>
	    	<img src="resources/images/${e.c_img}" class="rounded-circle" style="width:100%; height:350px;">
	      			<div class="container">
	      			<input type="hidden" id="c_num" name="c_num" value="${e.c_num}">
			        	<p style="margin-top:15px;">
			        	<b>강의명</b> : ${e.c_title}<br/>
			        	<b>강사 이름</b> : ${e.c_name}<br/>
			        	<b>강의 분야</b> : ${e.c_category}<br/>
			        	<b>강의지역</b> : ${e.c_loc1}<br/>
			        	<b>시작일 - 종료일</b> : ${e.c_date1} - ${e.c_date2}</p>
			        	
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
				
					<div class="container" style="padding-top:30px; padding-bottom:30px; margin-bottom:50px;">
						
						
						<form method="post" action="selectSearchClass?page=1">
						<div class="row">
						
							<div class="col-sm-9">
							<input type="hidden" name="page" value="${param.page}">
							<select name="searchType" class="custom-select">
								<option value="1">강의명</option>
								<option value="2">강의분야</option>
								<option value="3">강의지역</option>
							</select>
							<input type="text" class="form-control form-control" name="searchValue"
							placeholder="검색어를 입력하세요." value="" required="">
							</div>
							
							<div class="col-sm-3">
							<button type="submit" class="btn btn-primary btn-block" style="height:75px;" >강의검색</button>
							</div>
							
							</div>
							
						</form>
					</div>
			</div>
