//$(document).ready(function() {
//    $('#summernote').summernote({
//  	  height: 300,
//	  minHeight: 200,
//	  maxHeight: null,
//	  focus: true
//    });
//    
//    $('#modifySummernote').summernote({
//		height: 300,
//		minHeight: 200,
//		maxHeight: null,
//		focus: true
//    });
//    
//    $('#replySummernote').summernote({
//		height: 300,
//		minHeight: 200,
//		maxHeight: null,
//		focus: true
//    });
//});

/////////// view modal btn control
//$('#view-modifybtn').on('click', function () {
//	$('#modal-modifybtn').css("display", "");
//	$('#modal-replybtn').css("display", "none");
//})
//$('#view-replybtn').on('click', function () {
//	$('#modal-replybtn').css("display", "");
//	$('#modal-modifybtn').css("display", "none");
//})
//
//
//
////updateUP
//function plusUp(seq) {
//	$.ajax({
//		url: root + "/hotlist",
//		type: "post",
//		data: {"act" : "up", "seq" : seq},
//		dataType: "text",
//		success: updateUp
//	});
//}
//
//function updateUp(text) {
//	$('#view-up').empty();
//	$('#view-up').text(text);
//}
//
//
////updateDown
//function plusDown(seq) {
//	$.ajax({
//		url: root + "/hotlist",
//		type: "post",
//		data: {"act" : "down", "seq" : seq},
//		dataType: "text",
//		success: updateDown
//	});
//}
//function updateDown(text) {
//	$('#view-down').empty();
//	$('#view-down').text(text);
//}