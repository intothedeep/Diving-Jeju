var httpRequest;

function getXMLHttpRequest() {
	if(window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				alert("지원하지 않는 브라우저입니다.");
				return null;
			}
		}
	} else if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		alert("지원하지 않는 브라우저입니다.");
		return null;
	}
}

function sendRequest(url, param, callback, method) {
	httpRequest = getXMLHttpRequest();

	var httpMethod = method ? method : "GET";
	if(httpMethod != "GET" && httpMethod != "POST") {
		httpMethod = "GET";
	}
	
	var httpParam = (param == null || param == "") ? null : param;
	var httpUrl = url;
	if(httpMethod == "GET" && httpParam != null) {
		httpUrl = httpUrl + "?" + httpParam;
	}
	//alert(httpUrl);
	httpRequest.onreadystatechange=callback;//callback function
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.send(httpMethod == "POST" ? httpParam : null);
}


















