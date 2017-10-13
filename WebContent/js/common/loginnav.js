$(document).ready(function () {
	$('.tour').click(function (){
		$(location).attr("href", root + "/store/tour.html");			
	});
	
	$('#guesthouse').click(function(){
		$(location).attr("href", root + "/guesthouse/blog_guesthouse.html?guestSeq=15");
	});
	
	$('.stat').click(function (){
		var mvStat = root + '/stat/stat.html';
		$(location).attr('href', mvStat).submit();
	});
	
	$('.bookinfo').click(function () {
		$(location).attr('href', root + "/member/bookinfo.html");
	});
	
//	$('.manage').click(function (){
//		var mvManage = root + '/admin/management.html';
//		$(location).attr('href', mvStat).submit();
//	});	
});