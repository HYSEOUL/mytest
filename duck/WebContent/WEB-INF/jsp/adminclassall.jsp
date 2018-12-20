<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="article" style="width: 100%">
	<div id="header2">
		<h1>���� ���� ����</h1>
	</div>	
	<div id="content">
		<!-- <p>����� ���� ������</p> -->
		<div id="cont" style="margin-top: 30px;">
			<table>
				<thead>
					<tr>
						<th colspan="16">���� ����Ʈ</th>
					</tr>
					<tr>
						<td>���� ��ȣ</td>
						<td>���� ��</td>
						<td>������ �̸�</td>
						<td>������</td>
						<td>������</td>
						<td>�����ο�</td>
						<td>��/�� �ּ�</td>
						<td>���ּ�</td>
						<td>�����̹���</td>
						<td>���ǼҰ�</td>
						<td>���� ī�װ�</td>
						<td>���°���</td>
						<td>1�� ���� Ƚ��</td>
						<td>��� ����Ʈ</td>
						<td>����</td>
						<td>����</td>
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
							<td>${listv.c_pnum }</td>
							<td>${listv.c_loc1 }</td>
							<td>${listv.c_loc2}</td>
							<td>${listv.c_img}</td>
							<td>${listv.c_comment}</td>
							<td>${listv.c_category}</td>
							<td>${listv.c_price}</td>
							<td>${listv.c_count}</td>
							<td>${listv.c_point}</td>
							<td><a href="updateview?num=${listv.c_num }">����</a></td>
							<td><a href="delclassone?num=${listv.c_num }">����</a></td>
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
							          		<a href="showclassall.kosta?page=
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
					
							        <%--Page ���� ������ ���� --%>
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
					
							        <%--Page  ������ ���� --%>
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
					
					
							        <%--Page ���� ������ ���� --%>
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
