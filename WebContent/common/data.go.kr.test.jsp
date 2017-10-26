<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String root = request.getContextPath();%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="+{pageContext.request.contextPath}"/>  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.3.0/mustache.min.js"></script>
		
	<title>Insert title here</title>

</head>
<body>
    <script type="text/javascript">
    /* Javascript 샘플 코드 */


	/* var xhr = new XMLHttpRequest();
    var url = 'http://openapi.jejutour.go.kr:8080/openapi/service/TourMapService/getTourMapList';
    var queryParams = '?' + encodeURIComponent('ServiceKey=uscY8RM2rqv%2BSxyNdJm49Rgf3CDw3yWUce1NhcaUqizhqu6c%2FP0FJDJE%2Bgibt0SrADO4q9V1R44AL2%2FfF%2BqfEQ%3D%3D');
    queryParams += '&' + encodeURIComponent('CAT') + '=' + encodeURIComponent('TUTUTU01');
    xhr.open('GET', url + queryParams);
    xhr.onreadystatechange = function () {
        if (this.readyState == 4) {
            alert('Status: '+this.status+' Headers: '+JSON.stringify(this.getAllResponseHeaders())+' Body: '+this.responseText);
        }
    };

    xhr.send(''); 
 */  

      // $(document).ready(function() {
      //   $.ajax({
      //     url: 'http://openapi.epost.go.kr/postal/retrieveNewAdressAreaCdSearchAllService/retrieveNewAdressAreaCdSearchAllService/getNewAddressListAreaCdSearchAll',
      //     type: 'get',
      //     data: {
      //       'ServiceKey':'uscY8RM2rqv%2BSxyNdJm49Rgf3CDw3yWUce1NhcaUqizhqu6c%2FP0FJDJE%2Bgibt0SrADO4q9V1R44AL2%2FfF%2BqfEQ%3D%3D',
      //       'countPerPage':'10',
      //       'currentPage':'1',
      //       'srchwrd': '행운2길'
      //     },
      //     dataType: 'xml',
      //     success: writeTour,
      //     error: function (xhr, status, msg) {
      //       alert("상태: " + status + " 메세지: " + msg);
      //     }
      //   });
      //
      // });
      //
      // function writeTour (xhr) {
      //   // var obj = JSON.parse(xhr);
      //   // for(i in obj) {
      //   //   $('<p>').html(obj.item[i]).appendTo('.content');
      //   // }
      //   alert(xhr);
      // }
    </script>
</body>
</html>