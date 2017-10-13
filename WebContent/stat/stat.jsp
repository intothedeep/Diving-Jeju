<%@page import="com.free.member.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/root.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${root}/js/bootstrap.min.js"></script>	
	<link rel="stylesheet" href="${root}/css/bootstrap readable.min.css">
	<link rel="stylesheet" href="${root}/css/bootstrap readable.css">
	<link rel="stylesheet" href="${root}/fonts/font-awesome.min.css">
	
	<!-- chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	
	<!-- fullcalendar -->
	<script src='${root}/fullcal/lib/moment.min.js'></script>
	<link rel='stylesheet' href='${root}/fullcal/fullcalendar.css' />
	<script src='${root}/fullcal/fullcalendar.js'></script>
	
	<title>관리-통계</title>
	
	<style>
		html, body {
		  height:100%;
		  margin:0;
		  padding:0;
		  font-size:14px;
		  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
		}	
	</style>
	
</head>
<style>
	div {
		border:1px solid green;
	}
	
	#check2btn
</style>
	
<script>

var chart;
var data = [];
var ctx;

$(document).ready(function () {
	drawChart();
	$('#check1btn').click(function () {
		data = $('#check1').val();
		drawChart($(this));
	});
	$('#check2btn').click(function () {
		drawChart($(this));
	});
	$('#chartBtn').click(function () {
		drawChart();
	});
	
	function drawChart(what) {
		ctx = document.getElementById('myChart').getContext('2d');
	 	data = [
			2, 10, 5,
			2, 20, 30, 
			45, 3, 5, 
			15, 8, 9];
	 	if(what != null) {	 		
			if (what.is($('#check1btn'))) {
				//data = $('#check1').val();
				data = [10, 3, 5, 9, 5, 15, 21, 30, 25, 33, 12, 5];
				//alert('1   -----' + data);
			} else if (what.is($('#check2btn'))) {
				//data = $('#check2').val();
				data = [10, 3, 5, 0, 0, 0, 0, 30, 25, 33, 55, 90];
				//alert('2 ------' + data);
			}
	 	}
	 	
		var lables = [
			"January", "February", "March", 
			"April", "May", "June", 
			"July", "August", "September",
			"October", "November", "December"];
		
		chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'line',
		
		    // The data for our dataset
		    data: {
		        labels: lables,
		        datasets: [{
		            label: "유저가입현황",
		            backgroundColor: 'rgb(255, 99, 132)',
		            borderColor: 'rgb(255, 99, 132)',
		            data: data,
		        }]
		    },
		
		    // Configuration options go here
		    options: {}
		});
	}
});


</script>
<body>
	<%@ include file="/WEB-INF/management/managementnav.jsp"%>

	
	<div class="container" style="margin-top: 100px;">
		<ul class="nav nav-tabs">
		  <li class="active"><a href="#home" data-toggle="tab" aria-expanded="true">유저가입현황</a></li>
		  <li class=""><a href="#profile" data-toggle="tab" aria-expanded="false">통계-차트</a></li>
		  <li class="disabled"><a>Disabled</a></li>
		  <li class="dropdown">
		    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		      Dropdown <span class="caret"></span>
		    </a>
		    <ul class="dropdown-menu">
		      <li><a href="#dropdown1" data-toggle="tab">Action</a></li>
		      <li class="divider"></li>
		      <li><a href="#dropdown2" data-toggle="tab">Another action</a></li>
		    </ul>
		  </li>
		</ul>
		
		<div id="myTabContent" class="tab-content">
			
			<div class="tab-pane fade" id="home">

			</div>
			
			<div class="tab-pane fade active in" id="profile">
				<div class="col-sm-6">
					<div class="chart-container">
						<canvas id="myChart"></canvas>
					</div>	
				</div>
				
				<div class="col-sm-4">
					<div class="">
						<select id="searchKey" name="searchKey" class="form-control">
							<option value='id'>아이디</option>
							<option value='seq'>글번호</option>											
							<option value='subject' selected>제목</option>
							<option value='content'>내용</option>
							<option value='subject||content'>제목+내용</option>
						</select>
					</div>	
						
					<div class="form-group">
					  <div class="input-group">
					    <input type="text" class="form-control">
					    <span class="input-group-btn">
					      <button class="btn btn-default" type="button" id="chartBtn">검색</button>
					    </span>
					  </div>
					</div>
				</div>
				
			</div>
			
			<div>
				<input type="text" id="check1" value=""/>
				<button type="submit" id="check1btn">체크1</button>
			</div>
			<div>
				<input type="text" id="check2" value=""/>
				<button type="submit" id="check2btn">체크2</button>
			</div>
						
			<div class="tab-pane fade" id="dropdown1">
			  <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
			</div>
			<div class="tab-pane fade" id="dropdown2">
			  <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater.</p>
			</div>
			
			<div>
				
			</div>
			
		</div>			
	</div>
	
	<div>
		<input type="date" >
	</div>
	
</body>
</html>