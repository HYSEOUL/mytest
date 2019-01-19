<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.bg-primary.align-middle{
	color:white;
	text-align: center;
}
.align-middle{
	text-align: center;
}
</style>
<div class="container" id="article" style="width: 100%">
	<div id="content">
		<!-- <p>여기는 메인 컨텐츠</p> -->
		<div class="table-responsive-sm" style="margin-top:30px;">
			<table class="table table-sm table-hover">
				<thead class="align-middle">
					<tr>
						<th colspan="16"><h4>강좌 리스트</h4></th>
					</tr>
					<tr>
						<!-- <td class="bg-primary align-middle">번호</td> -->
						<td class="bg-primary align-middle">강의명</td>
						<td class="bg-primary align-middle">강사이름</td>
						<td class="bg-primary align-middle">강의시작일</td>
						<td class="bg-primary align-middle">강의종료일</td>
						<td class="bg-primary align-middle">수강인원</td>
						<td class="bg-primary align-middle">시/도주소</td>
						<td class="bg-primary align-middle">서비스분야</td>
						<td class="bg-primary align-middle">강의료</td>
						<td class="bg-primary align-middle">주강의횟수</td>
						<td class="bg-primary align-middle">수정</td>
						<td class="bg-primary align-middle">삭제</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listv" items="${cvo }">
						<tr>
							<%-- <td class="align-middle">${listv.c_num }</td> --%>
							<td class="align-middle">${listv.c_title }</td>
							<td class="align-middle">${listv.c_name }</td>
							<td class="align-middle">${listv.c_date1 }</td>
							<td class="align-middle">${listv.c_date2 }</td>
							<td class="align-middle">${listv.c_pnum }명</td>
							<td class="align-middle">${listv.c_loc1 }</td>
							<td class="align-middle">${listv.c_category}</td>
							<td class="align-middle">${listv.c_price}</td>
							<td class="align-middle">${listv.c_count}회
							<%--<c:if test="${listv.c_point eq 1}">
								<td>일반</td>
							</c:if>
							<c:if test="${listv.c_point eq 2}">
								<td>과금</td>
							</c:if> --%>
							<td><a href="updateview?num=${listv.c_num }">수정</a></td>
							<td><a href="delclassone?num=${listv.c_num }">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
			    	<tr>
			     		<td class="align-middle" colspan="16" id="pageTd">
				      	<%--Page 이전 페이지 구현 --%> 
					      	<c:choose>
					       		<c:when test="${searchType == null}">
					        		<c:choose>
					         			<c:when test="${pageInfo.currentBlock eq 1}">
				          					<img src="resources/img/prev.png">
				         				</c:when>
						         		<c:otherwise>
							          		<a href="showclassall.kosta?page=
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
						                        [<a href="showclassall?page=
						                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
									            ${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       	</c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach
					           				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showclassall?page=
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
						          			<a href="showclassall?page=
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
						          			<a href="showclassall.kosta?searchType=${searchType}&searchValue=${searchValue}&page=
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
					                        	[<a href="showclassall?searchType=${searchType}
					                        	&searchValue=${searchValue}&page=
					                        	${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       </c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach 
					          				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showclassall?searchType=${searchType}
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
					          				<a href="showclassall?searchType=${searchType}
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
				    	<th colspan="16" style="text-align: center;" >
				    		<a href="downloadExcel" style="color: black;">Excel 파일 변환 다운로드</a>
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
	 background-color: black;
	 border: 1px solid white;
	 color: white
	}
	#cont table tbody td{	
	 text-align: center;
	 border: 1px solid #000
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
