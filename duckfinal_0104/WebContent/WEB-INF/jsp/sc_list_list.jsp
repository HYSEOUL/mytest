<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <div class="container text-center" style="margin-top:30px;">
	<h3>수강생페이지</h3>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-white justify-content-center" style="border-bottom: 1px solid black;">
		<!-- <a class="navbar-brand" href="#">Navbar</a> -->
		<div class="nav justify-content-center" id="updateDiv">
			<ul class="nav justify-content-center">
				<li class="nav-item"><a class="nav-link"
					href="modify_m_student">수강생 수정</a></li>
				<li class="nav-item"><a class="nav-link"
					href="natureInsert">성향관리 (입력/수정)</a></li>
				<li class="nav-item"><a class="nav-link" href="smileage">마일리지
						관리</a></li>
				<li class="nav-item"><a class="nav-link" href="sc_list">스터디목록
						관리</a></li>
			</ul>
		</div>
	</nav>
</div>

    <div>
   <fieldset>
         <legend> 학생 개설(수강) 목록</legend>
         <table>
            <thead>
            <tr>
               <th>강의명</th>
               <th>강사명</th>
               <th>시작일</th>
               <th>종료일</th>
               <th>분류</th>
               <th>가격</th>
            </tr>
            </thead>

            <tfoot>
               <tr><td colspan="6">
               </td></tr>
            </tfoot>

             <tbody>
             <c:forEach var="e" items="${scvo}">
             <tr>
                <td> <a class="test"> ${e.c_title} </a>
                <input type="hidden" class="c_num" name="c_num" value=${e.c_num }>
                </td>
                <td> ${e.c_name} </td>
                <td> ${e.c_date1} </td>
                <td> ${e.c_date2} </td>
                <td> ${e.c_category} </td>
                <td> ${e.c_price} </td>
              </c:forEach>
             </tbody>
   
     </table>
     </fieldset>
    </div>
    
<script>
//모든 컨텐츠가 로딩이 된 후에 호출되는 메서드

   $(function(){
      $('.test').each(function(index,item){
         $(this).click(function(){
            var c_num=$(this).next().val();
            location.href="selectoneclass?num="+c_num;
            
            
         });
      });
   });
   


</script>