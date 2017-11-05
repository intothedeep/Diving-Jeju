<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
section.book_div {
	z-index: 100001; 
	position: fixed; 
	top: 0px;
	left: 0px; 
	background-color: white;
	width: 70%;
	max-width: 700px;
	height: 80%;
	border: 3px solid black;
	padding: 20px;
	display: ;
}
</style>

<script>
	$(document).ready(function () {
		var width = $(window).width();
		var height = $(window).height();
		//console.log(width + "   " + height);
		var bookWidth = parseInt($('.book_div').css("width"));
		var bookHeight = parseInt($('.book_div').css("height"));
		//console.log(bookWidth + "   " + bookHeight);
		
		var bookLeft = (width-bookWidth)/2;
		var bookTop = (height-bookHeight)/3;
		//console.log(bookTop + "   " + bookLeft);

		$('.book_div').css({"top":bookTop + "px", "left":bookLeft + "px"});
		
		//사이즈가 바뀌면 페이지 리로드 
		$(window).resize(function () {
			location.reload();
		});
		
		//누르면 예약 화면 보이기
		$('.booking').on("click", function () {
			$('.book_div').toggle();
			loadFullCal(370);
		});
		
		//var today = new Date(year + "-" + month + "-" + date);
		var today = new Date();
		var startBookDate = today;
		var endBookDate = today;
		console.log(new Date(startBookDate));
		
		var loadFullCal = function (height) {

			$('#calendar').fullCalendar("destroy");

			$('#calendar').fullCalendar({
	/* 		    dayClick: function(date, jsEvent, view) {
			        var $css = $(this).css("background-color");
			    	// change the day's background color just for fun
			        if($(this).css("background-color") === 'rgb(255, 30, 20)')
				        $(this).css('background-color', 'white');
			        else		        	
			        	$(this).css('background-color', 'rgb(255, 30, 20)');
			        
			        console.log(view.start + "    " + view.end);
			    },
	 */		    height: height,
			    events: [
			    	{
			    		title: "입실",
			    		start: startBookDate
			    	},
			    	{
			    		title: "퇴실",
			    		start: endBookDate
			    	}
			    ],
			    timezone: "local",
			    eventColor: "red",
			    eventBackgroundColor: "red",
	/* 		    eventClick: function(event, jsEvent, view) {
					alert(event.start.format());

			    }, */
	/* 		    selectable: false,
			    selectHelper: false,
				select: function(start, end, view) {
					var title = prompt('Event Title:');
					var eventData;
					if (title) {
						eventData = {
							title: title,
							start: start,
							end: end,
							backgroundColor: "red"
						};
						$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
					}
					$('#calendar').fullCalendar('unselect');
				}, */
				editable: true,
			    eventDrop: function ( event, delta, revertFunc, jsEvent, ui, view ) {
			    	var title = event.title;
			    	var moved = new Date(event.start.format());
			    	//console.log("============= " + title);
			    	//console.log("today  " + today);
			    	//console.log("startBookDate  " + startBookDate);
			    	//console.log("endBookDate  " + endBookDate);
			    	//console.log("moved  " + moved);
			    	
			    	if (moved < today){
		    			alert("지나간 날짜를 선택할 수 없습니다.");
		    			revertFunc();
			    	}
			    	
			    	//console.log(event.title + "의 이동한 날짜는 "  + event.start.format());
			    	if (title == '입실') {
			    		if(moved >= endBookDate) {
			    			alert(title + " 날짜를 다시 선택해 주세요!");
			    			revertFunc();
			    		} else {
			    			startBookDate = moved;
			    			//console.log("start " + startBookDate);

			    		}
			    	} else if (title == '퇴실'){
			    		if(moved <= startBookDate) {
			    			alert(title + " 날짜를 다시 선택해 주세요!");
			    			revertFunc();
			    		} else {
			    			endBookDate = moved;
			    			//console.log("end " + endBookDate);
			    		}
			    	}
			    	//console.log("drop 후 " +event.title + "의 이동한 날짜는 "  + event.start.format());
					var diffDates = getDifferrenceBtwTwoDates(startBookDate, endBookDate);
					$('.nights').val(diffDates);
					nights = diffDates;					
			    },
			    eventResize: function(event, delta, revertFunc) {

			        alert(event.title + "start is now " + event.start.format() + " end is now " + event.end.format());
					alert(event.end);
			        if (!confirm("is this okay?")) {
			            revertFunc();
			        }
			    }
			});
		};
		
		loadFullCal(370);
		
		$('.bookingStart').click(function() {
			if(!roomType || isNaN(numOfPersons) || !nights) {
				alert("방 인원수 예약일을 확인해 주시고 다시 시도해 주세요!");
				return false;
			}
			
			var d = new Date(startBookDate);
			var year = d.getFullYear();
			var date = d.getDate();
			var month = d.getMonth() + 1;
			d = year + "-" + month + "-" + date;
			startBookDate = d;
			
			d = endBookDate
			year = d.getFullYear();
			date = d.getDate();
			month = d.getMonth() + 1;
			d = year + "-" + month + "-" + date;
			endBookDate = d;
			
			var bookingConfirm = confirm(startBookDate + "부터 " + endBookDate + "까지 예약 하시겠습니까?" );
			
			if(bookingConfirm) {
				var query = 
					"startBookDate=" + startBookDate + 
					"&endBookDate=" + endBookDate + 
					"&roomType=" + roomType + 
					"&numOfPersons=" + numOfPersons + 
					"&nights=" + nights +
					"&guestSeq=" + "${guestSeq}";
				$(location).attr("href", root + "/book/bookstart?" + query);			
			} else {
				alert("취소했습니다.");
				return false;
			}
		});
		
		//select box 바뀔 때마다
		var roomType;
		$('.roomType').change(function (){
			roomType = $(this).val();
			//console.log(roomType);
		});
		
		//인원 수 바뀔 때마다
		var numOfPersons;
		$('.numOfPersons').change(function (){
			numOfPersons = $(this).val();
			//console.log(persons);
		});	
		
		//날짜 변경될 때마다
		var nights;
	});
	
	function getDifferrenceBtwTwoDates(start, end) {
		var d1 = new Date(start).getTime();
		var d2 = new Date(end).getTime();
		
		var diff = Math.abs(d1 - d2);// milliseconds
		var diffDates = Math.round(diff/(1000*60*60*24));
		//console.log(diffDates);
		return diffDates;
	}
</script>							

	<section class="book_div">
		<div style="text-align: right;">
			<span class="booking glyphicon glyphicon-remove" style="cursor: pointer;"></span>
		</div>
		<div class="container" style="width: 100%;">
			<div class="" id="calendar"></div>
			<div class="input-group col-xs-4" style="float:right; margin:3px; font-weight: bold;">
				<span class="input-group-addon">방종류</span>
				<select class="roomType form-control input-sm">
				  <option value="">방선택</option>
				  <option value="싱글">싱글</option>
				  <option value="더블">더블</option>
				  <option value="패밀리">패밀리</option>
				  <option value="도미토리">도미토리</option>
				</select>
			</div>
			<div class="input-group col-xs-3" style="float:left; margin:3px; font-weight: bold;">
				<span class="input-group-addon">투숙일</span>
				<input type="text" class="nights form-control input-sm" value="0" disabled>
			</div>
			<div class="input-group col-xs-2" style="float:right; margin:3px; font-weight: bold;">
				<input type="text" class="numOfPersons form-control input-sm" placeholder="인원수">
			</div>
			<div style="text-align: right; clear: both;">
				<button class="bookingStart btn btn-sm btn-primary" style="margin-top: 15px;">예약</button>		
			</div>
		</div>
	</section>
	