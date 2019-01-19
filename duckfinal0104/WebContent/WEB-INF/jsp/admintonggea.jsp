<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>������ ��� ������</title>
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
		<h3>��� ī�װ�</h3>
      	<p>ī�װ� ����</p>
      	<select id="category">
      		<option>�ݾ�</option>
      		<option>�ο�</option>
      		<option value="study">����/���͵�</option>
      	</select>
      	<button id="moneybtn" value="�ݾ׺���">�ݾ׺���</button> <br>
      	<button id="peoplebtn" value="�ο�����">�ο�����</button> <br>
      	<button id="studybtn" value="����/���͵𺸱�">����/���͵𺸱�</button>
	</div> -->
    <div class="col-sm-12">
      <h2>��� �з�</h2> <hr/> 
      <p>ī�װ� ����</p>
      <div class="row">
      	<button id="moneybtn" value="�ݾ׺���">�ݾ׺���</button>  
      	<button id="studybtn" value="����/���͵𺸱�">����/���͵𺸱�</button>
      </div>
      <div>
		  <!-- <label style="margin-right: 20px;">�Ⱓ ����</label>
		  <div> 
		      <select id="date">
		  	    <option>�����ϼ���</option>
		      	<option value="year">�⵵��</option>
		      	<option value="month">����</option>
		      	<option value="week">�ְ���</option>
		      	<option value="self">��������</option>
		      </select>		       	 
	      </div> -->
	      <!-- <div class="row">
            <div class="col-sm-4">
               <label>������</label> 
               <input type="text" id="c_date1" name="c_date1" class="form-control" placeholder="��¥����" autocomplete="off">
            </div>
            <div class="col-sm-4">
               <label>������</label> 
               <input type="text" id="c_date2" name="c_date2" class="form-control" placeholder="��¥����" autocomplete="off">
            </div> 
       	  </div> <br> -->
	      <h5>���ó�¥: ${today }</h5>
      </div>
      		<div id ="chart1">
      			<div id="e"></div>
      		</div>      
      <br/>
      <!-- <p>
      	<label>������</label>       	
      	<select id="loc">
      		<option value="����">����</option>
      		<option value="����Ư����">����Ư����</option>
			<option value="�λ걤����">�λ걤����</option>
			<option value="�뱸������">�뱸������</option>
			<option value="��õ������">��õ������</option>
			<option value="���ֱ�����">���ֱ�����</option>
			<option value="����������">����������</option>
			<option value="��걤����">��걤����</option>
			<option value="����Ư����ġ��">����Ư����ġ��</option>
			<option value="��⵵">��⵵</option>
			<option value="������">������</option>
			<option value="��û�ϵ�">��û�ϵ�</option>
			<option value="��û����">��û����</option>
			<option value="����ϵ�">����ϵ�</option>
			<option value="���󳲵�">���󳲵�</option>
			<option value="���ϵ�">���ϵ�</option>
			<option value="��󳲵�">��󳲵�</option>
			<option value="����Ư����ġ��">����Ư����ġ��</option>
      	</select>
      	<label>���� �з� ��</label> 
      	<select id="bun">
      		<option value="���">��� ī�װ�</option>
      		<option value="�ܱ���">�ܱ���</option>
			<option value="������">������</option>
			<option value="����">����</option>
			<option value="�̼�">�̼�</option>
			<option value="��">��</option>
			<option value="����">����</option>
			<option value="�ڰ���">�ڰ���</option>
			<option value="���">���</option>
			<option value="��Ƽ">��Ƽ</option>
			<option value="���α׷���">���α׷���</option>
      	</select>
      	<label>�߰�����</label>    
      	<button id="showres">��躸��</button>
      	<button>�����ٿ�</button>   	 
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
		             show: true,            //Ŀ�� ��� ��� ����
		             showTooltip: true   //ȭ�� �ϴܿ� tooltip ��� ��� ����	
		         },
				title: '���� �׷���',
				axes:{
					xaxis:{
						label: "x  - �� ��"
					},
					yaxis: {
						label: "Y - �ݾ�",
						max: 10000000
					}
				}
			}
		 );
		$('#comment').text();
		$('#comment').text('1��: '+ mo[0] + '��' +
				'2��: '+ mo[1] + '��' + 
				'3��: '+ mo[2] + '��' +
				'4��: '+ mo[3] + '��' +
				'5��: '+ mo[4] + '��' +
				'6��: '+ mo[5] + '��' +
				'7��: '+ mo[6] + '��' +
				'8��: '+ mo[7] + '��' +
				'9��: '+ mo[8] + '��' +
				'10��: '+ mo[9] + '��' +
				'11��: '+ mo[10] + '��' +
				'12��: '+ mo[11] + '��');
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
	             show: true,            //Ŀ�� ��� ��� ����
	             showTooltip: true   //ȭ�� �ϴܿ� tooltip ��� ��� ����	
	         },
			title: '���� �׷���',
			axes:{
				xaxis:{
					label: "x  - �� ��"
				},
				yaxis: {
					label: "Y - �ݾ�",
					max: 10000000
				}
			}
		}
	 );
	$('#comment').text('1��: '+ mo[0] + '��  /' +
			'2��: '+ mo[1] + '��  /' + 
			'3��: '+ mo[2] + '��  /' +
			'4��: '+ mo[3] + '��  /' +
			'5��: '+ mo[4] + '��  /' +
			'6��: '+ mo[5] + '��  /' +
			'7��: '+ mo[6] + '��  /' +
			'8��: '+ mo[7] + '��  /' +
			'9��: '+ mo[8] + '��  /' +
			'10��: '+ mo[9] + '��  /' +
			'11��: '+ mo[10] + '��  /' +
			'12��: '+ mo[11] + '��');
	ress = ress - (lan+sports+music+art+dance+theme+licence+hoddy+beauty+program);
	
	$('#category').mouseup(function(){
		 cateval = $('#category option:selected').val(); 		 
	});	
 	$('#date').mouseup(function(){
 		date = $('#date option:selected').val(); 	
 		console.log("���ó�¥: "+date);
	});  	
 	$('#loc').mouseup(function(){
 		loc = $('#loc option:selected').val(); 		
 		console.log("��������: "+loc);
	});
 	$('#bun').mouseup(function(){
 		bun = $('#bun option:selected').val(); 		
 		console.log("���úо�: "+bun);
	}); 
 	
 	$('#studybtn').click(function(){
 		$('#chart1').empty();
 		$.jqplot('chart1',[[['�ܱ���', lan],['������', sports],['����', music],
			['�̼�', art],['��', dance],['����', theme],['�ڰ���', licence],['���', hoddy],
			['��Ƽ', beauty],['���α׷���', program],['��Ÿ',ress]]], {
					seriesDefaults:{
			            renderer: $.jqplot.PieRenderer, 	//�������� ������			           
			            rendererOptions: { 	//������ܿ� �������ֱ�(�˾Ƽ� %������ ��ȯ)
			              showDataLabels: true
			            }
			          },
				legend: {show:true, location:'e'}
			});
 		
 		$('#comment').text();
		$('#comment').text('�ܱ���: '+ $('#1').val() + '��  /' +
				'������: '+ $('#2').val() + '��  /' + 
				'����: '+ $('#3').val() + '��  /' +
				'�̼�: '+ $('#4').val() + '��  /' +
				'��: '+ $('#5').val() + '��  /' +
				'����: '+ $('#6').val() + '��  /' +
				'�ڰ���: '+ $('#7').val() + '��  /' +
				'���: '+ $('#8').val() + '��  /' +
				'��Ƽ: '+ $('#9').val() + '��  /' +
				'���α׷���: '+ $('#10').val() + '��  /' +
				'��Ÿ: '+ $('#ress').val() + '��');
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


