<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="width: 100%">
	<div class="container">
		<h1>강의 목록 보여주기</h1>
		<p id="time">2018-12-10</p>
	</div>
	<div class="container">
		<!-- <p>여기는 메인 컨텐츠</p> -->
		<div class="container" style="margin-top: 30px;">
			<table>
				<thead>
					<tr>
						<th colspan="13">강의 목록 예제</th>
					</tr>
<!-- 				1.강의 명
					2.강의 생성자
					3.강의 시작일
					4.강의 종료일
					5.강의 인원수
					6.강의 위치 도 주소 
					7.강의 위치 시 주소
					8.강의 위치 상세 주소
					9.강의 이미지
					10.강의 설명
					11.강의 분야
					12.강의 참가비
					13.강의 인원수 -->
					<tr>
						<td>강의 번호</td>
						<td>강의 명</td>
						<td>강의 생성자</td>
						<td>강의 시작일</td>
						<td>강의 종료일</td>
						<td>강의 인원수</td>
						<td>강의 위치 도/시 주소</td>
						<td>강의 위치 상세주소</td>
						<td>강의 이미지</td>
						<td>강의 설명</td>
						<td>강의 분야</td>
						<td>강의 참가비</td>
						<td>강의 인원 수</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listv" items="${list }">
						<tr>
							<td>${listv.c_num }</td>
							<td>
								<a href="selectoneclassc1?num=${listv.c_num }"
								style="color: gray;">${listv.c_title }</a>
							</td>
							<td>${listv.c_name }</td>
							<td>${listv.c_date1 }</td>
							<td>${listv.c_date2 }</td>
							<td>${listv.c_pnum }</td>
							<td>${listv.c_loc1 }</td>
							<td>${listv.c_loc2}</td>
							<td>${listv.c_img}</td>
							<td>${listv.c_comment}</td>
							<td>${listv.c_category}</td>
							<td>${listv.c_price }</td>
							<td>${listv.c_count}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
			    	<tr>
			     		<td colspan="13" id="pageTd">
				      	<%--Page 이전 페이지 구현 --%> 
					      	<c:choose>
					       		<c:when test="${searchType == null}">
					        		<c:choose>
					         			<c:when test="${pageInfo.currentBlock eq 1}">
				          					<img src="resources/img/prev.png">
				         				</c:when>
						         		<c:otherwise>
							          		<a href="showclasslist.kosta?page=
							          		${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
							           			<img src="resources/img/prev.png">
							          		</a>
				         				</c:otherwise>
					        		</c:choose>
							        <%--Page  페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
					          				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
					          				 varStatus="num">
						                        [<a href="showclasslist?page=
						                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
									            ${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       	</c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach
					           				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showclasslist?page=
					          					${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                    	</c:forEach>
					         			</c:otherwise>
					        		</c:choose>
					
							        <%--Page 다음 페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
					          				<img src="resources/img/next.png">
					         			</c:when>
						         		<c:otherwise>
						          			<a href="showclasslist?page=
						         			${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
						           				<img src="resources/img/next.png">
						          			</a>
						         		</c:otherwise>
					        		</c:choose>
				       			</c:when>
					       		<c:otherwise>
					        		<c:choose>
					         			<c:when test="${pageInfo.currentBlock eq 1}">
					          				<img src="resources/img/prev.png">
					         			</c:when>
						         		<c:otherwise>
						          			<a href="showclasslist.kosta?searchType=${searchType}&searchValue=${searchValue}&page=
						         			${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
						           				<img src="resources/img/prev.png">
						          			</a>
						         		</c:otherwise>
					        		</c:choose>
					
							        <%--Page  페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
					          				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
					           				varStatus="num">
					                        	[<a href="showclasslist?searchType=${searchType}
					                        	&searchValue=${searchValue}&page=
					                        	${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       </c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach 
					          				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showclasslist?searchType=${searchType}
					                        	&searchValue=${searchValue}&page=
					          					${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                    	</c:forEach>
					         			</c:otherwise>
					        		</c:choose>
					
					
							        <%--Page 다음 페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
					          				<img src="resources/img/next.png">
					         			</c:when>
					         			<c:otherwise>
					          				<a href="showclasslist?searchType=${searchType}
					          				&searchValue=${searchValue}&page=
					         				${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
					           					<img src="resources/img/next.png">
					          				</a>
					         			</c:otherwise>
					        		</c:choose>
					       		</c:otherwise>
				      		</c:choose>
			     		</td>
			  		</tr>
				    <tr>
			     		<th colspan="13"><input type="button" value="writer" 
			     		onclick="location='createclass'"></th>
				    </tr>
				    <tr>
				    	<th colspan="13" style="text-align: center;" >
				    		<a href="downloadExcel" style="color: black;">download Excel</a>
				    	</th>
				    </tr>
		   		</tfoot>
			</table>
		</div>
	</div>
</div>
<style type="text/css">
	#cont {
	 width: 100%;
	 margin: auto;
	}

	#cont table {
	 width: 100%;
	 border: 1px dotted #000
	}

	#cont table thead th {
	 font-size: 30px;
	 color: orange
	}
	
	#cont table thead td {
	 text-align: center;
	 background-color: skyblue
	}
	
	#cont tbody img {
	 width: 80px;
	 border: 0px
	}
	#pageTd img {
	 width: 15px;
	 
	}
	#pageTd a{
	color: #000000;
	}
</style>