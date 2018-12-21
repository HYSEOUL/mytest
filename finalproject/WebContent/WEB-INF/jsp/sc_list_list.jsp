<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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