<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div>
	<fieldset>
			<legend>스터디 목록</legend>
			<table>
			<tr><td colspan="6">
					<p><label>댓글등록</label>
					<form method="post" action="s_reviewInsert">
					스터디번호
					<input type="text" id="s_num" name="s_num" value="스터디번호"/><br>
					개설자아이디
					<input type="text" id="ms_id" name="ms_id" value="개설자아이디"/><br>
					사용자아이디
					<input type="text" id="s1_id" name="s1_id" value="사용자아이디"/><br>
					내용
					<textarea rows="1" cols="10" name="s1_text" id="s1_text" ></textarea>
					<input type="submit" value="댓글입력">
					</form>
					</td></tr>
				<thead>
				
				<tr>
					<th>스터디명</th>
					<th>댓글입력 人</th>
					<th>아이디</th>
					<th>내용</th>
					<th>입력일시</th>
					<th>개설자 아이디</th>
				</tr>
				</thead>

					

	 			<tbody>
	 			<c:forEach var="e" items="${list}">
	 			<tr>
	 				<td> ${e.s_title} </td>
    				<td> ${e.ms_name} </td>
    				<td> ${e.s1_id} </td>
    				<td> ${e.s1_text} </td>
    				<td> ${e.s1_date} </td>
    				<td> ${e.ms_id} </td>
    				<td><a href="s_reviewDelete?s1_num=${e.s1_num}">삭제 ${e.s1_num}</a></td>
    				<td><a href="reviewDelete?s1_num=${e.s1_num}">수정</a></td>
  				</c:forEach>
	 			</tbody>
	
  	</table>
  	</fieldset>
    </div>
    
