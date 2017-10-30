$(document).ready(function (){
	
	$('.freeboardlist').click(function() {
		var mvlist = root + '/freeboard/list.html?bcode=1&pg=1&key=&word=&hot=';
		$(location).attr('href', mvlist).submit();
	});

	//키워드로 검색해서 지도로 이동
	$('#main_keyword').keypress(function (e) {
		var keypress = e.which;
	    var keyword = document.getElementById('main_keyword').value;
	    
		if(keypress === 13) {
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    } else {
				$('#main_nav_searchForm').attr("action", root + "/map/search.html").submit();			    	
		    }
		}
	});
	
	$('#main_searchBtn').click(function () {
	    var keyword = document.getElementById('main_keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    } else {
			$('#main_nav_searchForm').attr("action", root + "/map/search.html").submit();			    	
	    } 
	});
	
    $(window).resize(function(){
	    var width = $(document).innerWidth();
	    var height = $(document).scrollTop();
		    if(width < 700) {
	    	$('.main_header').css("height", "130px");
	    	$('.main_nav').attr("data-offset-top", "128px");
	    } else {
	    	$('.main_header').css("height", "80px");
	    	$('.main_nav').attr("data-offset-top", "78px");			    
	    }
    });
    
/* 		    //회원정보
	    $('.memberInfo').click(function () {
	    	//$(location).attr({"href": root +"/member/memberinfo.html"});
	    	$(location).attr("href", root +"/member/memberinfo.html");
	    }); */
});