// hotlist ajax
$(document).ready(function () {
	var data= {bcode:1};

	$.ajax({
		url: root + "/freeboard/hotlist",
		type: "GET",
		data: data,
		dataType: "json",
		success: function (data) {
			hotlist(data);
		}
	});
});

function hotlist(data) {
	//console.log(data);
	var seq;
	var subject;
	var reply;
	var id;
	var up;
	var hit;
	
	for (i in data) {
		hit = data[i].hit;
		subject = data[i].subject;
		seq = data[i].seq;
		id = data[i].id;
		reply = data[i].reply;
		up = data[i].up;
//		alert(seq + " : " + hit + " : " + id + " : " + reply + " : " + up + " : " + reply);

			var listLi = $("<li>");
				var n_contentWrapDiv = $('<div>').attr("class","n_contentWrap");
					var n_contentsDiv = $('<div>').attr("class","n_contents");
						var titleDiv = $('<div>').attr("class",'title');
							var hrefA = $('<a>').attr("class", "wow").attr("href", "#").attr("data-seq", seq).text(subject);
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
	}
}
