<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="article" style="width: 100%">
	<div id="header2">
		<h1>���� ���͵� ����</h1>
	</div>	
	<div id="content">
		<!-- <p>����� ���� ������</p> -->
		<div id="cont" style="margin-top: 30px;">
			<table>
				<thead>
					<tr>
						<th colspan="16">���͵� ����Ʈ</th>
					</tr>
					<tr>
						<td>���͵� ��ȣ</td>
						<td>������ ���̵�</td>
						<td>���͵� �̸�</td>
						<td>�о�</td>
						<td>��/�� �ּ�</td>
						<td>���ּ�</td>
						<td>���۳�¥</td>
						<td>���ᳯ¥</td>
						<td>���͵� �� Ƚ��</td>
						<td>�ִ��ο�</td>
						<td>���͵� �Ұ�</td>
						<td>���͵� �̹���</td>
						<td>���͵� ���� ����</td>
						<td>���͵� �������Ʈ</td>
						<td>����</td>
						<td>����</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listv" items="${studyvo }">
						<tr>
							<td>${listv.s_num }</td>
							<td>
								<a href="selectoneclass?num=${listv.ms_id }"
								style="color: gray;">${listv.s_title }</a>
							</td>
							<td>${listv.s_title }</td>
							<td>${listv.s_category }</td>
							<td>${listv.s_loc1 }</td>
							<td>${listv.s_loc2 }</td>
							<td>${listv.s_date1 }</td>
							<td>${listv.s_date2}</td>
							<td>${listv.s_count}</td>
							<td>${listv.s_pnum}</td>
							<td>${listv.s_comment}</td>
							<td>${listv.s_img}</td>
							<td>${listv.s_price}</td>
							<td>${listv.s_point}</td>
							<td><a href="">����</a></td>
							<td><a href="deletestudyone?num=${listv.s_num }">����</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
			    	<tr>
			     		<td colspan="16" id="pageTd">
				      	<%--Page ���� ������ ���� --%> 
					      	<c:choose>
					       		<c:when test="${searchType == null}">
					        		<c:choose>
					         			<c:when test="${pageInfo.currentBlock eq 1}">
				          					<img src="resources/img/prev.png">
				         				</c:when>
						         		<c:otherwise>
							          		<a href="showstudyall.kosta?page=
							          		${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
							           			<img src="resources/img/prev.png">
							          		</a>
				         				</c:otherwise>
					        		</c:choose>
							        <%--Page  ������ ���� --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
					          				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
					          				 varStatus="num">
						                        [<a href="showstudyall?page=
						                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
									            ${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       	</c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach
					           				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showstudyall?page=
					          					${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                    	</c:forEach>
					         			</c:otherwise>
					        		</c:choose>
					
							        <%--Page ���� ������ ���� --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
					          				<img src="resources/img/next.png">
					         			</c:when>
						         		<c:otherwise>
						          			<a href="showstudyall?page=
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
						          			<a href="showstudyall.kosta?searchType=${searchType}&searchValue=${searchValue}&page=
						         			${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
						           				<img src="resources/img/prev.png">
						          			</a>
						         		</c:otherwise>
					        		</c:choose>
					
							        <%--Page  ������ ���� --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
					          				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
					           				varStatus="num">
					                        	[<a href="showstudyall?searchType=${searchType}
					                        	&searchValue=${searchValue}&page=
					                        	${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       </c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach 
					          				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showstudyall?searchType=${searchType}
					                        	&searchValue=${searchValue}&page=
					          					${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                    	</c:forEach>
					         			</c:otherwise>
					        		</c:choose>
					
					
							        <%--Page ���� ������ ���� --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
					          				<img src="resources/img/next.png">
					         			</c:when>
					         			<c:otherwise>
					          				<a href="showstudyall?searchType=${searchType}
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
