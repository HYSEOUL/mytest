2018.12.21 header.jsp의 분야 아이콘 박스 삭제 및 변경 사항

인클루드 폴더 자체를 jsp에 넣고
 template/header.jsp의 
<div class="container" style="padding-top: 10px; padding-bottom: 10px;">
를 포함한 밑 부분(분야 아이콘 박스)을 지우시면 됩니다. (약, 130번째 라인쯤에 있음.)


<%@include file="include/headerBox.jsp" %>
추가적으로 
분야 아이콘 박스를 추가하고 싶은 각 jsp의 상단에 위의 액션스크립트를 추가해주쇼.

끝