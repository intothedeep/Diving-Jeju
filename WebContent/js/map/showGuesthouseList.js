$(document).ready(function() {

	$('#guesthouse').click(function(event) {

		if ($(this).hasClass('btn-info')) {
			$(this).addClass('btn-default').removeClass('btn-info');
			removeGuesthouseMarkers();

		} else {
			$(this).removeClass('btn-default').addClass('btn-info');
			showGuesthouseList();
		}

	});
	
	function showGuesthouseList() {
		
		$.ajax({
			type: "GET",
			dataType: "json",
			url : root +"/map/listguesthouse",
			success : function (data) {
				showGuesthouseOnMap(data);		
			}
		});
		
	}
});

//게스트하우스 목록을 지도에 표시
function showGuesthouseOnMap(data) {
	console.log(data);
	var len = data.length;
	
	//for (var i=0; i<len; i++) {
	//	console.log(data[i]);
	//}
	
	// LatLngBounds 객체에 좌표를 추가합니다
	var bounds = new daum.maps.LatLngBounds();
	for(i in data) {
		//console.log(data[i]);
		convertAddressToCoords(data[i], bounds);
	}
	
}

//지오코더로 주소를 좌표로 변환
function convertAddressToCoords(data, bounds) {
	var address = data.addr1 + " " + data.addr2;
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
			var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	        
	        bounds.extend(coords);
	        createGuesthouseMarker(coords, data);
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    }
		
	});
	
}

//마커생성
function createGuesthouseMarker(coords, data) {
	
	var imageSrc = root + '/img/pin_map.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(50, 55), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(15, 20)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption); // 마커가 표시될 위치입니다
	
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords,
    });

    
    // 인포윈도우를 생성합니다
    guesthouseInfowindow = new daum.maps.InfoWindow({
        content : null,
        removable : true
    });
    
    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
    	
    	//인포 윈도으룰 mustache.js를 통해 설계 해보자! ????
    	
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
    	
    	guesthouseInfowindow.setContent(
    			'<div style="">'
        		+ data.name
        		+ '<br>'
        		+ data.addr2
        		+ '<br>'
        		+ data.checkin
        		+ '<br>'
        		+ data.checkout
        		+ '<br>'
        		+ data.tel
        		+ '<br>'
        		+ data.more
        		+ '</div>');
    	guesthouseInfowindow.open(map, marker);
    });
    
    //키워드 검색할 때 쓰는 마커 배열을 사용해 마커 생성
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    guesthouseMarkers.push(marker);  // 배열에 생성된 마커를 추가합니다    
}


function removeGuesthouseMarkers() {
	for ( var i = 0; i < guesthouseMarkers.length; i++ ) {
		guesthouseMarkers[i].setMap(null);
		guesthouseInfowindow.close();
	}   
	guesthouseMarkers = [];
} 


