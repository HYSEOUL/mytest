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
			<a href="advertising?ad_num=${e.ad_num}" >
				<slide :index="${e.ad_num}">
				<img src="resources/img/${e.ad_img}" style="width:360px; height:200px;">
				<span class="title">${e.ad_title }</span>
					<p>start date - end date : ${e.ad_date1 } - ${e.ad_date2 }</p>
					<p style="margin-top:-20px;">location : ${e.ad_loc1 }</p>
				</slide>
			</a>
			</c:forEach>
		</carousel-3d>
	</div>
	<hr />
</div>
 <!-- 
		<slide :index="1">
		<span class="title">Web Design</span>
		<p>11111Sed ut perspiciatis unde omnis iste natus error sit volupta tem
			accusantium dolorem</p>
		</slide>
		
		<slide :index="2">
		<span class="title">You know</span>
		<p>22222You know, being a test pilot isn't always the healthiest
			business in the world.</p>
		</slide>
		
		<slide :index="3">
		<span class="title">You know</span>
		<p>33333You know, being a test pilot isn't always the healthiest
			business in the world.</p>
		</slide>
		
		<slide :index="4">
		<span class="title">You know</span>
		<p>44444You know, being a test pilot isn't always the healthiest
			business in the world.</p>
		</slide>
		
		<slide :index="5">
		<span class="title">You know</span>
		<p>55555You know, being a test pilot isn't always the healthiest
			business in the world.</p>
		</slide> 
		
		<slide :index="6">
		<span class="title">You know</span>
		<p>66666You know, being a test pilot isn't always the healthiest
			business in the world.</p>
		</slide> -->
<div class="container">
<p style="text-align:center"><img src="resources/images/studyrecommend.jpg"></p>
	<div id="example">
	  <carousel-3d 
	  :disable3d="true" 
	  :space="365" 
	  :clickable="false" 
	  :controls-visible="true"
	  :width="360" 
	  :height="270">
	  <c:forEach var="e" items="${classadVO}">
			<a href="advertising?ad_num=${e.ad_num}" >
				<slide :index="${e.ad_num}">
				<img src="resources/img/${e.ad_img}" style="width:360px; height:200px;">
				<span class="title">${e.ad_title }</span>
					<p>start date - end date : ${e.ad_date1 } - ${e.ad_date2 }</p>
					<p style="margin-top:-20px;">location : ${e.ad_loc1 }</p>
				</slide>
			</a>
			</c:forEach>
	  <!-- 
	    
	    <slide :index="0">
      <span class="title">Web Development</span>
      <img src=resources/img/jisu.jpg">
      <p>Sed ut perspiciatis unde 
omnis iste natus error sit volupta
tem accusantium dolorem</p>
    </slide>
		<slide :index="1">

        <span class="title">Web Design</span>
        <p>Sed ut perspiciatis unde 
omnis iste natus error sit volupta
tem accusantium dolorem</p>
    </slide>
		<slide :index="2">
      <span class="title">You know</span>
      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
    </slide>
		<slide :index="3">
      <span class="title">You know</span>
      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
    </slide>
		<slide :index="4">
     <span class="title">You know</span>
      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
    </slide>
		<slide :index="5">
      <span class="title">You know</span>
      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
    </slide>
		<slide :index="6">
      <span class="title">You know</span>
      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
    </slide> -->
	    
	    
	  </carousel-3d>
	</div>
</div>

<script>
new Vue({
	  el: '#example',
	  data: {
	    slides: 7
	  },
	  components: {
	    'carousel-3d': Carousel3d.Carousel3d,
	    'slide': Carousel3d.Slide
	  }
	})
	
	
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

/* 
new Vue({
  el: '#lecture',
  data: {
    slides: [{
      title: 'Blackpink : jisu', // View에 나타나는 타이틀 이름
      src: 'resources/img/jisu.jpg', // 이미지 경로 지정 가능
      desc: 'dummy description text here...'
    }, {
      title: 'IU',
      src: 'resources/img/iu3.PNG',
      desc: 'dummy description text here...'
    }, {
      title: 'Kim Tae Hee',
      src: 'https://lh4.googleusercontent.com/jviHIWcTfGcI1eZbu9qPYDjEwkLXoDkqT_b_VDSXw6GXh1Ij_sUi6YuxG0TWd1QB9jkEt1MPU4qHcUiDUWHIdJK4v2qW7NcwQ6xLUj0_3KWwYASxX9UdVSA_R1fR7sljkg',
      desc: 'dummy description text here...'
    }, {
      title: 'Kate',
      src: 'http://img23.fansshare.com/media/content3/360x270_girl-of-the-day--romanian-model-beatrice-adochitei-5074.jpg',
      desc: 'dummy description text here...'
    }, {
      title: 'Sherry',
      src: 'http://cdn.koreaboo.com/wp-content/uploads/2017/02/bbanana4-360x270.png',
      desc: 'dummy description text here...'
    }]
  },
  components: {
    'carousel-3d': Carousel3d.Carousel3d,
    'slide': Carousel3d.Slide
  }
}) */
</script>
