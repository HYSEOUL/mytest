<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
figure {
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
  /* IE 8 */
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
  /* IE 5-7 */
  filter: alpha(opacity=50);
  /* Netscape */
  -moz-opacity: 0.5;
  /* Safari 1.x */
  -khtml-opacity: 0.5;
  /* Good browsers */
  opacity: 0.5;
}
</style>
<!-- <div class="container" style="padding-top: 10px; padding-bottom: 10px;">
	<div class="row">
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/language.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/sports.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/music.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/art.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/dance.jpg" class="img-fluid">
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/acting.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/certificate.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/hobby.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/beauty.jpg" class="img-fluid">
			</p>
		</div>
		<div class="col" style="width: 20%">
			<p>
				<img src="resources/images/programming.jpg" class="img-fluid">
			</p>
		</div>
	</div>
</div> -->

<!-- https://wlada.github.io/vue-carousel-3d/ -->
<!-- Vue.js API 참고 홈페이지 -->
<div class="container">
<p style="text-align:center"><img src="resources/img/fclasstext.jpg"></p>
	<div id="lecture">
	  <carousel-3d 
	  :autoplay="true" 
	  :autoplayTimeout="5000"
	  :width="360" 
	  :height="270">
	  
	    <slide v-for="(slide, i) in slides" :index="i" :key="i">
	    
	      <figure>
	          <img v-bind:src="slide.src" />
	          <figcaption>
	            <h2>{{slide.title}}</h2>
	            <p>{{slide.desc}}</p>
	          </figcaption>
	      </figure>
	      
	    </slide>
	    
	  </carousel-3d>
	</div>
	
	<hr/>
</div>

<div class="container">
<p style="text-align:center"><img src="resources/images/fstudytext.jpg"></p>
	<div id="example">
	  <carousel-3d 
	  :disable3d="true" 
	  :space="365" 
	  :clickable="false" 
	  :controls-visible="true"
	  :width="360" 
	  :height="270">
	  
	    <slide v-for="(slide, i) in slides" :index="i">
	      <span class="title">You 1</span>
	      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
	      <span class="title">You 2</span>
	      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
	      <span class="title">You 2</span>
	      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
	      <span class="title">You 2</span>
	      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
	      <span class="title">You 2</span>
	      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
	      <span class="title">You 2</span>
	      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
	      <span class="title">You 2</span>
	      <p>You know, being a test pilot isn't always the healthiest business in the world.</p>
	    </slide>
	    
	    
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
})
</script>
