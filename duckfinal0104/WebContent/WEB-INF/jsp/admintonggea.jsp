<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>관리자 통계 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script type="text/javascript" src="resources/plugin/jquery.jqplot.js"></script>
  <script type="text/javascript" src="resources/plugin/plugins/jqplot.barRenderer.js"></script> 
  <script type="text/javascript" src="resources/plugin/plugins/jqplot.highlighter.js"></script> 
  <script type="text/javascript" src="resources/plugin/plugins/jqplot.cursor.js"></script>
  <script type="text/javascript" src="resources/plugin/plugins/jqplot.pointLabels.js"></script>
  <script type="text/javascript" src="resources/plugin/plugins/jqplot.pieRenderer.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/plugin/jquery.jqplot.css" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
</head>
<body>
	
<div class="container" style="margin-top:30px">
  <div class="row">
  	<!-- <div class="col-sm-3">
		<h3>통계 카테고리</h3>
      	<p>카테고리 선택</p>
      	<select id="category">
      		<option>금액</option>
      		<option>인원</option>
      		<option value="study">강의/스터디</option>
      	</select>
      	<button id="moneybtn" value="금액보기">금액보기</button> <br>
      	<button id="peoplebtn" value="인원보기">인원보기</button> <br>
      	<button id="studybtn" value="강의/스터디보기">강의/스터디보기</button>
	</div> -->
    <div class="col-sm-12">
      <h2>통계 분류</h2> <hr/> 
      <p>카테고리 선택</p>
      <div class="row">
      	<button id="moneybtn" value="금액보기">금액보기</button>  
      	<button id="studybtn" value="강의/스터디보기">강의/스터디보기</button>
      </div>
      <div>
		  <!-- <label style="margin-right: 20px;">기간 단위</label>
		  <div> 
		      <select id="date">
		  	    <option>선택하세요</option>
		      	<option value="year">년도별</option>
		      	<option value="month">월별</option>
		      	<option value="week">주간별</option>
		      	<option value="self">직접선택</option>
		      </select>		       	 
	      </div> -->
	      <!-- <div class="row">
            <div class="col-sm-4">
               <label>시작일</label> 
               <input type="text" id="c_date1" name="c_date1" class="form-control" placeholder="날짜선택" autocomplete="off">
            </div>
            <div class="col-sm-4">
               <label>종료일</label> 
               <input type="text" id="c_date2" name="c_date2" class="form-control" placeholder="날짜선택" autocomplete="off">
            </div> 
       	  </div> <br> -->
	      <h5>오늘날짜: ${today }</h5>
      </div>
      		<div id ="chart1">
      			<div id="e"></div>
      		</div>      
      <br/>
      <!-- <p>
      	<label>지역별</label>       	
      	<select id="loc">
      		<option value="전국">전국</option>
      		<option value="서울특별시">서울특별시</option>
			<option value="부산광역시">부산광역시</option>
			<option value="대구광역시">대구광역시</option>
			<option value="인천광역시">인천광역시</option>
			<option value="광주광역시">광주광역시</option>
			<option value="대전광역시">대전광역시</option>
			<option value="울산광역시">울산광역시</option>
			<option value="세종특별자치시">세종특별자치시</option>
			<option value="경기도">경기도</option>
			<option value="강원도">강원도</option>
			<option value="충청북도">충청북도</option>
			<option value="충청남도">충청남도</option>
			<option value="전라북도">전라북도</option>
			<option value="전라남도">전라남도</option>
			<option value="경상북도">경상북도</option>
			<option value="경상남도">경상남도</option>
			<option value="제주특별자치도">제주특별자치도</option>
      	</select>
      	<label>강의 분류 별</label> 
      	<select id="bun">
      		<option value="모든">모든 카테고리</option>
      		<option value="외국어">외국어</option>
			<option value="스포츠">스포츠</option>
			<option value="음악">음악</option>
			<option value="미술">미술</option>
			<option value="댄스">댄스</option>
			<option value="연기">연기</option>
			<option value="자격증">자격증</option>
			<option value="취미">취미</option>
			<option value="뷰티">뷰티</option>
			<option value="프로그래밍">프로그래밍</option>
      	</select>
      	<label>추가예정</label>    
      	<button id="showres">통계보기</button>
      	<button>엑셀다운</button>   	 
      </p>      
      <br> -->
      <p id="comment"></p>
      <p>
      	<%-- <c:forEach var="e" items="money">
      		${e }
      	</c:forEach> --%>
      	<c:forEach var="e" items="${ rescate}" varStatus="status">
 	     	<input type="hidden" id="${status.count }" value="${e}">
      	</c:forEach>
		<c:forEach var="e" items="${money }" varStatus="status">
			<input type="hidden" id="mo${status.count }" value="${e }">
		</c:forEach>
		<input type="hidden" id="ress" value="${ress }">
      </p>
    </div>
  </div>
</div>


<script>
$(document).ready(function () {
	
	 var mo = [$('#mo2').val(), $('#mo3').val(), $('#mo4').val(), $('#mo5').val(), $('#mo6').val(), $('#mo7').val(), 
		 $('#mo8').val(), $('#mo9').val(), $('#mo10').val(), $('#mo11').val(), $('#mo12').val(), $('#mo13').val()];
	
	//---------------------------------
	var cateval;
	var date;
	var loc;
	var bun;
	var ress = ($('#ress').val())*10;
	var lan = ($('#1').val())*10;
	var sports = ($('#2').val())*10;
	var music = ($('#3').val())*10;
	var art = ($('#4').val())*10;
	var dance = ($('#5').val())*10;
	var theme = ($('#6').val())*10;
	var licence = ($('#7').val())*10;
	var hoddy = ($('#8').val())*10;
	var beauty = ($('#9').val())*10;
	var program = ($('#10').val())*10;
	
	$('#moneybtn').click(function(){
		$('#chart1').empty();
		$.jqplot('chart1',[[mo[0],mo[1],mo[2],
	   		mo[3],mo[4],mo[5],mo[6],
	   		mo[7],mo[8],mo[9],
	   		mo[10],mo[11]]],{
				cursor: {	
		             show: true,            //커서 기능 사용 유무
		             showTooltip: true   //화면 하단에 tooltip 기능 사용 유무	
		         },
				title: '수익 그래프',
				axes:{
					xaxis:{
						label: "x  - 월 별"
					},
					yaxis: {
						label: "Y - 금액",
						max: 10000000
					}
				}
			}
		 );
		$('#comment').text();
		$('#comment').text('1월: '+ mo[0] + '원' +
				'2월: '+ mo[1] + '원' + 
				'3월: '+ mo[2] + '원' +
				'4월: '+ mo[3] + '원' +
				'5월: '+ mo[4] + '원' +
				'6월: '+ mo[5] + '원' +
				'7월: '+ mo[6] + '원' +
				'8월: '+ mo[7] + '원' +
				'9월: '+ mo[8] + '원' +
				'10월: '+ mo[9] + '원' +
				'11월: '+ mo[10] + '원' +
				'12월: '+ mo[11] + '원');
 	});
	
	$('#c_date1').datepicker({
		dateFormat : 'yymmdd'
	});
	
	$('#c_date1').datepicker("option", "maxDate", $("#c_date2").val());
	$('#c_date1').datepicker("option", "onClose", function(selectedDate) {
		$("#c_date2").datepicker("option", "minDate", selectedDate);
	});

	$('#c_date2').datepicker({
		dateFormat : 'yymmdd'
	});
	
	$('#c_date2').datepicker("option", "minDate", $("#c_date1").val());
	$('#c_date2').datepicker("option", "onClose", function(selectedDate) {
		$("#c_date1").datepicker("option", "maxDate", selectedDate);
	});
	
   	$.jqplot('chart1',[[mo[0],mo[1],mo[2],
   		mo[3],mo[4],mo[5],mo[6],
   		mo[7],mo[8],mo[9],
   		mo[10],mo[11]]],{
			cursor: {	
	             show: true,            //커서 기능 사용 유무
	             showTooltip: true   //화면 하단에 tooltip 기능 사용 유무	
	         },
			title: '수익 그래프',
			axes:{
				xaxis:{
					label: "x  - 월 별"
				},
				yaxis: {
					label: "Y - 금액",
					max: 10000000
				}
			}
		}
	 );
	$('#comment').text('1월: '+ mo[0] + '원  /' +
			'2월: '+ mo[1] + '원  /' + 
			'3월: '+ mo[2] + '원  /' +
			'4월: '+ mo[3] + '원  /' +
			'5월: '+ mo[4] + '원  /' +
			'6월: '+ mo[5] + '원  /' +
			'7월: '+ mo[6] + '원  /' +
			'8월: '+ mo[7] + '원  /' +
			'9월: '+ mo[8] + '원  /' +
			'10월: '+ mo[9] + '원  /' +
			'11월: '+ mo[10] + '원  /' +
			'12월: '+ mo[11] + '원');
	ress = ress - (lan+sports+music+art+dance+theme+licence+hoddy+beauty+program);
	
	$('#category').mouseup(function(){
		 cateval = $('#category option:selected').val(); 		 
	});	
 	$('#date').mouseup(function(){
 		date = $('#date option:selected').val(); 	
 		console.log("선택날짜: "+date);
	});  	
 	$('#loc').mouseup(function(){
 		loc = $('#loc option:selected').val(); 		
 		console.log("선택지역: "+loc);
	});
 	$('#bun').mouseup(function(){
 		bun = $('#bun option:selected').val(); 		
 		console.log("선택분야: "+bun);
	}); 
 	
 	$('#studybtn').click(function(){
 		$('#chart1').empty();
 		$.jqplot('chart1',[[['외국어', lan],['스포츠', sports],['음악', music],
			['미술', art],['댄스', dance],['연기', theme],['자격증', licence],['취미', hoddy],
			['뷰티', beauty],['프로그래밍', program],['기타',ress]]], {
					seriesDefaults:{
			            renderer: $.jqplot.PieRenderer, 	//원형으로 렌더링			           
			            rendererOptions: { 	//원형상단에 값보여주기(알아서 %형으로 변환)
			              showDataLabels: true
			            }
			          },
				legend: {show:true, location:'e'}
			});
 		
 		$('#comment').text();
		$('#comment').text('외국어: '+ $('#1').val() + '개  /' +
				'스포츠: '+ $('#2').val() + '개  /' + 
				'음악: '+ $('#3').val() + '개  /' +
				'미술: '+ $('#4').val() + '개  /' +
				'댄스: '+ $('#5').val() + '개  /' +
				'연기: '+ $('#6').val() + '개  /' +
				'자격증: '+ $('#7').val() + '개  /' +
				'취미: '+ $('#8').val() + '개  /' +
				'뷰티: '+ $('#9').val() + '개  /' +
				'프로그래밍: '+ $('#10').val() + '개  /' +
				'기타: '+ $('#ress').val() + '개');
		});
 	});
</script>
</body>
<style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
</style>
</html>


