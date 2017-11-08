$(document).ready(function (){
	$('.plusUp').click(function (){
		var seq = $(this).attr('data-seq');
		$.ajax({
			url: root + "/freeboard/plusUp.html",
			type: "GET",
			data: {"seq" : seq},
			dataType: "text",
			success: updateUp,
			error: function (data) {
				alert("실패" + err); 
			}
		});
	});
	
	$('.plusDown').click(function (){
		var seq = $(this).attr('data-seq');
		$.ajax({
			url: root + "/freeboard/plusDown.html",
			type: "GET",
			data: {"seq" : seq},
			dataType: "text",
			success: updateDown,
			error: function (data) {
				alert("실패" + err); 
			}
		});
	});
	
});

function updateUp (data) {
	$('#view-up').empty();
	$('#view-up').text(data);
}

function updateDown (data) {
	$('#view-down').empty();
	$('#view-down').text(data);
}