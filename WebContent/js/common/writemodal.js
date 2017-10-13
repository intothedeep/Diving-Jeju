$(document).ready(function(){
	$('#writeBtn').click(function() {
		var content = $('#summernote').summernote('code');
		if($('#subject').val() == "") {
			alert("제목입력!!!");
			return;
		} else if(content == "") {
			alert("내용입력!!!");
			return;
		} else {
			$('#content').val(content);
			$('#writeForm').attr('method', 'post').attr('action', root + '/freeboard/write.html').submit();
		}
	});
});