

function memolist(xhr) {
	var memoid = $('#memoid').val();
	var listId;
	var listLogTime;
	var listContent;
	
	
	
	$('#memotbody').empty();
		if($(xhr).find("status").text() == "true") {
			$(xhr).find("memo").each(function(idx, memo) {
				listId = $(memo).find("id").text();
				listLogTime = $(memo).find("mtime").text()
				listContent = $(memo).find("mcontent").text()
//				console.log(listId);
//				console.log(listLogTime);
//				console.log(listContent);
				
				
				var li = $('<li>').attr("id","memoli")
					.append($('<div>').attr("class", "fbItem"));
						var fbMeta = $('<div>').attr("class", "fbMeta");
							var authorh3 = $('<h3>').attr("class", "author").html(listId);
							var timeP = $('<p>').attr("class", "time").html(listLogTime);
						var xe_content = $('<div>').attr("class", "xe_content").html(listContent);
						var actionDiv = $('<div>').attr("class", "action").css("text-align", "right");
							var replyA =  $('<a>').attr("class", "replyA").text("답변");
							var modifyA =  $('<a>').attr("href", "javascript: memoModify();").attr("class", "modifyA").text("수정");
							var deleteA = $('<a>').attr("class", "deleteA").text("삭제"); 
							var voteupA =  $('<a>').attr("class", "voteupA").text("추천");
							var votedownA =  $('<a>').attr("class", "votedownA").text("반대");
							var declareA =  $('<a>').attr("class", "declareA").text("신고");
						var fbinsertDiv = $('<div>').attr("class", "fbinsertDiv");
						var modifyMemoDiv = $('<div>').attr("id", "modifyMemoDiv").css("display", "none");
							var modifyInput = $('<input>').attr("id", "modify-hidden-memo")
								.attr("type", "hidden").attr("value", "n");
							var modifyTa = $('<textarea>').attr("id", "modify-content-memo").attr("rows", "8").attr("cols", "42")
								.css("width", "100%").css("height", "100%");
//						var memoBtn = $('<div>').attr("class", "row").css("text-align", "center").append($('<div>').attr("class", "col-md-12").css("text-align", "center"));
//							var modifyMemoBtn = $('<button>').attr("id", "modify-memo").attr("class", "btn btn-default").text("수정");
//							var modify_cancel_memoBtn
//								=$('<button>').attr("id", "modify-cancel-memo").attr("class", "btn btn-default").text("취소");
						var endofDiv = $('<div>').attr("class", "write_author");
						
						fbMeta.append(authorh3);
						fbMeta.append(timeP);
					fbMeta.appendTo(li);
					xe_content.appendTo(li);
				if($(memo).find("id").text() == memoid){

						actionDiv.append(replyA);
						actionDiv.append(modifyA);
						actionDiv.append(deleteA);
				}
						actionDiv.append(voteupA);
						actionDiv.append(votedownA);
						actionDiv.append(declareA);
					actionDiv.appendTo(li);
					fbinsertDiv.appendTo(li);
						modifyMemoDiv.append(modifyInput);
						modifyMemoDiv.append(modifyTa);
					modifyMemoDiv.appendTo(li);
//						memoBtn.append(modifyMemoBtn);
//						memoBtn.append(modify_cancel_memoBtn);
//					memoBtn.appendTo(li);
					endofDiv.appendTo(li);
				li.appendTo('#memotbody');
		});
	}
}

$(document).ready(function () {
	var memoseq = $('#memoseq').val();
	$('#memobtn').on("click", function () {
		var content = $('#mcontent').val(); //선택
		$('#mcontent').val(''); // '' 로 덮어쓰기
		$.ajax({
			url: root + "/memo",
			type: "post",
			data: {"act" : "write", "seq" : memoseq, "mcontent" : content},
			dataType: "xml",
			success: memolist,
			error: function (xhr, status, msg) {
//				alert("상태: " + status + " 메세지: " + msg);
			}
		});
	});
	$.ajax({
		url: root + "/memo",
		type: "post",
		data: {"act" : "list", "seq" : memoseq},
		dataType: "xml",
		success: memolist,
		error: function (xhr, status, msg) {
//			alert("상태: " + status + " 메세지: " + msg);
		}
	});
});

//$('.modifyA').click(function() {
//	alert("222222222222");
//	alert($(this).parent.parent);//.find("#modifyMemoDiv").css("display", "block");
//	
//});

function memoModify() {
//	$('#memoli').find("")
	$(this).parent().parent().find("#modify-content-memo").css("display", "");
}