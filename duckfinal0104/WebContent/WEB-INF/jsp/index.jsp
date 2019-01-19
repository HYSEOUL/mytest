<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.row {
	text-align: center;
	margin-left: 170px;
	margin-right: 170px;
}

.col {
	border: 1px solid black;
}

/* carousel-3d silder css */
/* figure {
  padding: 0;
  margin: 0;
}

figure figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  text-align: center;
  color: #fff;
  padding: 10px;
  background-color: black;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
  filter: alpha(opacity=50);
  -moz-opacity: 0.5;
  -khtml-opacity: 0.5;
  opacity: 0.5;
} */
</style>
<style class="cp-pen-styles">
#lecture .carousel-3d-slide {

  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-flex: 1;
      -ms-flex: 1;
          flex: 1;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  text-align: center;
  background-color: #fff;
  -webkit-transition: all .4s;
  transition: all .4s;
}
#lecture .carousel-3d-slide.current {
  background-color: #333;
  color: #fff;
}
#lecture .carousel-3d-slide.current span {
  font-size: 20px;
  font-weight: 600;
}

#study .carousel-3d-slide {

  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-flex: 1;
      -ms-flex: 1;
          flex: 1;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
      -ms-flex-direction: column;
          flex-direction: column;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  text-align: center;
  background-color: #fff;
  -webkit-transition: all .4s;
  transition: all .4s;
}
#study .carousel-3d-slide.current {
  background-color: #333;
  color: #fff;
}
#study .carousel-3d-slide.current span {
  font-size: 20px;
  font-weight: 600;
}
</style>

<!-- https://wlada.github.io/vue-carousel-3d/ -->
<!-- Vue.js API 참고 홈페이지 -->
<div class="container">
	<p style="text-align: center">
		<img src="resources/images/classrecommend.jpg">
	</p>
	<div id="lecture">
		<carousel-3d :autoplay="true" :autoplayTimeout="5000" :width="360"
			:height="270" >
			<c:forEach var="e" items="${classadVO}">
			<c:if test="${empty ms_id && empty mt_id }"> 	 			
				<slide :index="${e.c_num}">
				<img src="resources/img/${e.c_img}" style="width:360px; height:200px;">
				<span class="title">${e.c_title }</span>
					<p>start date - end date : ${e.c_date1 } - ${e.c_date2 }</p>
					<p style="margin-top:-20px;">location : ${e.c_loc1 }</p>
				</slide>			
			</c:if>
			<c:if test="${not empty ms_id || not empty mt_id}">
				<a href="classadd?c_num=${e.c_num}" >
				<slide :index="${e.c_num}">
				<img src="resources/img/${e.c_img}" style="width:360px; height:200px;">
				<span class="title">${e.c_title }</span>
					<p>start date - end date : ${e.c_date1 } - ${e.c_date2 }</p>
					<p style="margin-top:-20px;">location : ${e.c_loc1 }</p>
				</slide>
			</a>
			</c:if>
			
			</c:forEach>
		</carousel-3d>
	</div>
	<hr />
</div>
 
<div class="container">
<p style="text-align:center">
<img src="resources/images/studyrecommend.jpg"></p>
	<div id="study">
	  <carousel-3d 
	  :disable3d="true" 
	  :space="365" 
	  :clickable="false" 
	  :controls-visible="true"
	  :width="360" 
	  :height="270">
	  <c:forEach var="e" items="${studyadVO}">
	  <%-- 학생의 아이디가 비어있으면 링크로 가면 안되고 학생으로 로그인 되어있을 때 가져야 한다. --%>
	  		<c:if test="${empty ms_id}"> 	 			
				<slide :index="${e.s_num}">
				<img src="resources/img/${e.s_img}" style="width:360px; height:200px;">
				<span class="title">${e.s_title}</span>
					<p>start date - end date : ${e.s_date1} - ${e.s_date2}</p>
					<p style="margin-top:-20px;">location : ${e.s_loc1}</p>
				</slide>			
			</c:if>
			<c:if test="${not empty ms_id}"> 	 			
				<a href="studyadd?s_num=${e.s_num}" >
					<slide :index="${e.s_num}">
					<img src="resources/img/${e.s_img}" style="width:360px; height:200px;">
					<span class="title">${e.s_title}</span>
						<p>start date - end date : ${e.s_date1} - ${e.s_date2}</p>
						<p style="margin-top:-20px;">location : ${e.s_loc1}</p>
					</slide>
				</a>			
			</c:if>			
			</c:forEach>
			</carousel-3d>
	</div>
</div>
	
<script>
new Vue({
	  el: '#lecture',
	  data: {
	    slides: 7
	  },
	  components: {
	    'carousel-3d': Carousel3d.Carousel3d,
	    'slide': Carousel3d.Slide
	  }
	})
	
new Vue({
	  el: '#study',
	  data: {
	    slides: 7
	  },
	  components: {
	    'carousel-3d': Carousel3d.Carousel3d,
	    'slide': Carousel3d.Slide
	  }
	})
</script>
