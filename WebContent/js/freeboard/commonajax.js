var httpRequest;

function getXMLHttpRequest() {
	if(window.ActiveXObject) {
		try {
			return new ActiveXObjet("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				return new ActiveXObjet("Microsoft.XMLHTTP");
			} catch (e2) {
				alert("�������� �ʴ� �������Դϴ�.");
				return null;
			}	
		}
	} else if (window.XMLHttpRequest) {// IE �̿��� â
		return new XMLHttpRequest();
	} else {
		alert("�������� �ʴ� �������Դϴ�.");
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
	httpRequest.open(httpMethod, httpUrl, true);// method default��  got���� ������ get���� ����.
	httpRequest.send(httpMethod == "POST" ? httpParam : null);//post����� send�� ������.
}