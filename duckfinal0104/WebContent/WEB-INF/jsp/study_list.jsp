<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container" style="padding:50px;">
	<div class="row">
	<div class="col-sm-8">
		<h3>������ ���͵� ��� ����</h3>
	</div>

		<div class="col-sm-4" style="float: right">
			<form action="create_study">
			
			<%--�л��� �α��� ���� ���� �۾��� ��ư Ȱ��ȭ --%>
			<c:if test="${sessionScope.ms_id != null }">
			<input id="create_study" type="submit"
			class="btn btn-primary btn-block" value="���͵� �����ϱ�">
			</c:if>
			<%--�л��� �α��� ���� ���� �۾��� ��ư Ȱ��ȭ --%>
					
			</form>
		</div>

	</div>
</div>
	
	<c:forEach begin="0" end="2" varStatus="i" >
		<div class="container">
        <div class="row" style="padding:10px;"><!-- 1�� -->
		<c:forEach begin="${i.index*3 }" end="${i.index*3+2 }" var="e" items="${list}">
		<div class="col" style="border: 1px solid black; margin:5px; padding-top:13px;">
	    	<div class="container-fluid">
	    	<img src="resources/img/${e.s_img}" class="img-fluid">
	    	</div>
	      			<div class="container" style="padding:10px;">
	      			<input type="hidden" id="s_num" name="s_num" value="${e.s_num}">
			        	<p>
			        	���͵� ������ ���̵� : ${e.ms_id}<!--  <input type="hidden" id="ms_id" name="ms_id" value="${e.ms_id}">-->
			        	</p>
			        	<p>���͵� �� : ${e.s_title}</p>
			        	<p>���� �о� : ${e.s_category}</p>
			        	<p>���͵����� : ${e.s_loc1}</p>
			        	<p>������ - ������ : ${e.s_date1} - ${e.s_date2}</p>
			       <%-- 2018.12.26 ������ �л��� �α��� ���� ����  ��ư Ȱ��ȭ --%>
						<c:if test="${sessionScope.ms_id != null }">
			        	<c:if test="${0 eq e.s_zcount }">
			        	<a href="selectOneStudy?s_num=${e.s_num}">
			        	<button id="studydetail" type="submit" class="btn btn-primary btn-block">
			        	���͵� ���� ����
			        	</button></a>
			        	</c:if>
			        	<c:if test="${1 eq e.s_zcount }">
			        	<button id="studydetail" type="submit" class="btn btn-secondary btn-block">
			        	���͵� ���� ����
			        	</button>
			        	</c:if>
			        	</c:if>
			        <%-- 2018.12.26 ������ �л��� �α��� ���� ����  ��ư Ȱ��ȭ --%>
	      			
	      			</div>
	    	</div>
    	</c:forEach>
    	</div>
    	</div>
    </c:forEach>
	
			<div class="container text-center">
						<%--Page ���� ������ ���� --%> <c:choose>
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

								<%--Page  ������ ���� --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
										<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
											varStatus="num">
	                        [<a
												href="selectListStudy?page=
	                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                       </c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num">
	                        [<a
												href="selectListStudy?page=
	          ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                    </c:forEach>
									</c:otherwise>
								</c:choose>


								<%--Page ���� ������ ���� --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
										<img src="resources/images/next.png" class="img-fluid" width="20" height="20">
									</c:when>
									<c:otherwise>
										<a
											href="selectListStudy?page=
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
											href="selectListStudy?searchType=${searchType}&searchValue=${searchValue}&page=
	         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
											<img src="resources/images/prev.png" class="img-fluid" width="20" height="20">
										</a>
									</c:otherwise>
								</c:choose>

								<%--Page  ������ ���� --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
										<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
											varStatus="num">
	                        [<a
												href="selectListStudy?searchType=${searchType}&searchValue=${searchValue}&page=
	                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                       </c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num">
	                        [<a
												href="selectListStudy?searchType=${searchType}&searchValue=${searchValue}&page=
	          ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
	                    </c:forEach>
									</c:otherwise>
								</c:choose>


								<%--Page ���� ������ ���� --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
										<img src="resources/images/next.png" class="img-fluid" width="20" height="20">
									</c:when>
									<c:otherwise>
										<a
											href="selectListStudy?searchType=${searchType}&searchValue=${searchValue}&page=
	         ${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
											<img src="resources/images/next.png" class="img-fluid" width="20" height="20">
										</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
				
					<div class="container" style="padding-top:30px; padding-bottom:30px;">
						<form method="post" action="selectSearchStudy?page=1">
							<input type="hidden" name="page" value="${param.page}">
							<select name="searchType" class="custom-select">
								<option value="1">���͵��</option>
								<option value="2">���� �з�</option>
								<option value="3">����</option>
							</select>
							<input type="text" class="form-control form-control" name="searchValue"
							placeholder="�˻�� �Է��ϼ���." value="" required="">
							<br>
							<button type="submit" class="btn btn-primary btn-block" >
							�˻�</button>
						</form>
					</div>
			</div>
