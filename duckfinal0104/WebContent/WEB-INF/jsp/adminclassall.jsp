<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="article" style="width: 100%">
	<div id="header2">
		<h1>개설 강좌 관리</h1>
	</div>	
	<div id="content">
		<!-- <p>여기는 메인 컨텐츠</p> -->
		<div id="cont" style="margin-top: 30px;">
			<table>
				<thead>
					<tr>
						<th colspan="16">강좌 리스트</th>
					</tr>
					<tr>
						<td>Cno</td>
						<td>Title</td>
						<td>Name</td>
						<td>Start</td>
						<td>End</td>
						<td>People</td>
						<td>Address1</td>
						<td>Address2</td>
						<td>Img</td>
						<td>Introduce</td>
						<td>Category</td>
						<td>Price</td>
						<td>Number of times</td>
						<td>Point</td>
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listv" items="${cvo }">
						<tr>
							<td>${listv.c_num }</td>
							<td>${listv.c_title }</td>
							<td>${listv.c_name }</td>
							<td>${listv.c_date1 }</td>
							<td>${listv.c_date2 }</td>
							<td>${listv.c_pnum }명</td>
							<td>${listv.c_loc1 }</td>
							<td>${listv.c_loc2}</td>
							<td>${listv.c_img}</td>
							<td>${listv.c_comment}</td>
							<td>${listv.c_category}</td>
							<td>${listv.c_price}</td>
							<td>${listv.c_count}회</td>
							<c:if test="${listv.c_point eq 1}">
								<td>일반</td>
							</c:if>
							<c:if test="${listv.c_point eq 2}">
								<td>과금</td>
							</c:if>
							<td><a href="updateview?num=${listv.c_num }">수정</a></td>
							<td><a href="delclassone?num=${listv.c_num }">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
			    	<tr>
			     		<td colspan="16" id="pageTd">
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
				    		<a href="downloadExcel" style="color: black;">리스트 문서 다운</a>
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
