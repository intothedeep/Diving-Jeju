// reply modal
function mvreplyArticle(seq) {
	getReplyArticleData(seq);
}

function getReplyArticleData(seq) {
	var replyArticleInfo = "act=mvreply&seq=" + seq;
	sendRequest("/bipbip1/freeboard", replyArticleInfo, receiveReplyArticleData, "GET");
}

function receiveReplyArticleData() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			var data = httpRequest.responseText;
			viewReplyArticleData(data);
		} else {
			alert("문제발생: " + httpRequest.status);
		}
	}
}

function viewReplyArticleData(data) {
	var strArray = data.split('###');
	var subject = strArray[0];
	var content = strArray[1];
	document.getElementById("subject").value = subject;
	$('#summernote').summernote('code', content);

	$("#mymodal").modal("show");

	$(document).ready(function() {
		$("#view-replybtn").click(function() {
			$("#mymodal").modal({
				backdrop : "static"
			});
		});
	});
}

// modify modal
function mvmodifyArticle(seq) {
	getModifyArticleData(seq);
}

function getModifyArticleData(seq) {
	var modifyArticleInfo = "act=mvmodify&seq=" + seq;
	sendRequest("/bipbip1/freeboard", modifyArticleInfo, receiveModifyArticleData, "GET");
}

function receiveModifyArticleData() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			// var data = httpRequest.responseText;
			var data = httpRequest.responseText;
			viewModifyArticleData(data);
		} else {
			alert("문제발생: " + httpRequest.status);
		}
	}
}

function viewModifyArticleData(data) {
	// xml
	// var subject = data.getElementsByTagName("subject")[0].firstChild.data;
	// var content = data.getElementsByTagName("content")[0].childNodes;

	// plain으로 받아올 때!
	var strArray = data.split('###');
	var subject = strArray[0];
	var content = strArray[1];
	document.getElementById("subject").value = subject;
	$('#summernote').summernote('code', content);

	$("#mymodal").modal("show");

	$(document).ready(function() {
		$("#view-modifybtn").click(function() {
			$("#mymodal").modal({
				backdrop : "static"
			});
		});
	});
}


// hotlist ajax
function hotlist(xhr) {
	$('#hotlist').empty();

	var seq;
	var subject;
	var reply;
	var id;
	var up;
	
	if($(xhr).find("status").text() == "true") {
		$(xhr).find("listhot").each(function(idx, listhot) {
			hit = $(listhot).find("hit").text();
			subject = $(listhot).find("subject").text();
			seq = $(listhot).find("seq").text();
			id = $(listhot).find("id").text()
			reply = $(listhot).find("reply").text()
			up = $(listhot).find("up").text()

			var listLi = $("<li>");
				var n_contentWrapDiv = $('<div>').attr("class","n_contentWrap");
					var n_contentsDiv = $('<div>').attr("class","n_contents");
						var titleDiv = $('<div>').attr("class",'title');
							var hrefA = $('<a>').attr("href", "javascript:viewArticle('" + seq +"');").text(subject);
						var regdateDiv = $('<div>').attr("class","regdate");
							var spanId = $('<span>').text(id);
							var spanBar1 = $('<span>').attr("class","bar").text('| like:');
							var spanHit = $('<span>').append($('<i>').attr("class","fa fa-comment-o")).text(up);
							var spanBar2 = $('<span>').attr("class","bar").text('| hit:');
							var spanReply = $('<span>').append($('<i>').attr("class","fa fa-comment-o")).text(hit);
				var clearDiv = $("<div>").attr("class", "clear");
			
			listLi.append(n_contentWrapDiv);	
				n_contentWrapDiv.append(n_contentsDiv);
					n_contentsDiv.append(titleDiv);
						titleDiv.append(hrefA);
					n_contentsDiv.append(regdateDiv);
						regdateDiv.append(spanId);
						regdateDiv.append(spanBar1);
						regdateDiv.append(spanHit);
						regdateDiv.append(spanBar2);
						regdateDiv.append(spanReply);
			listLi.append(clearDiv);
			listLi.appendTo('#hotlist');
			
		});
	}
}

$(document).ready(function () {
	$.ajax({
		url: root + "/hotlist",
		type: "post",
		data: {"act" : "listhot"},
		dataType: "xml",
		success: hotlist
	});
});

$(document).ready(function() {
	$('#refresh-memo').click(function(){
		$.ajax({
			url: root + "/hotlist",
			type: "post",
			data: {"act" : "listhot"},
			dataType: "xml",
			success: hotlist
		});
	});
});


///////////////
