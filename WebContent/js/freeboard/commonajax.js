var httpRequest;

function getXMLHttpRequest() {
	if(window.ActiveXObject) {
		try {
			return new ActiveXObjet("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				return new ActiveXObjet("Microsoft.XMLHTTP");
			} catch (e2) {
				alert("지원하지 않는 브라우저입니다.");
				return null;
			}	
		}
	} else if (window.XMLHttpRequest) {// IE 이외의 창
		return new XMLHttpRequest();
	} else {
		alert("지원하지 않는 브라우저입니다.");
		return null;
	}
}

function sendRequest(url, param, callback, method) {
	httpRequest = getXMLHttpRequest();
	
	var httpMethod = method ? method : "GET";
	if (httpMethod != "GET" && httpMethod != "POST") {
		httpMethod = "GET";
	}
	
	var httpParam = (param == null || param == "") ? null : param;
	var httpUrl = url;
	if (httpMethod == "GET" && httpParam != null) {
		httpUrl = httpUrl + "?" + httpParam;
	}
	
	httpRequest.onreadystatechange=callback; //callback function
	httpRequest.open(httpMethod, httpUrl, true);// method default는  got으로 보내도 get으로 간다.
	httpRequest.send(httpMethod == "POST" ? httpParam : null);//post방식은 send로 보낸다.
}