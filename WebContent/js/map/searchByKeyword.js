// 카카오 코드
$(document).ready(function () {
	
	$('#keywordbtn').click(function () {
		// 키워드로 장소를 검색합니다
		searchPlacesbyKeyword();

	});
	$('#keyword').keypress(function (e) {
		var keyword = e.which;
		if(keyword === 13) {
			searchPlacesbyKeyword();
		}
	});
	
});

//키워드 검색을 요청하는 함수입니다
function searchPlacesbyKeyword() {	
	
	//장소 검색 객체를 생성합니다
	psByKeyword = new daum.maps.services.Places();  

	//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	infowindow = new daum.maps.InfoWindow({
		zIndex:1
	});
	
    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    //키워드 검색 마커 지우기	
	removeMarkersByKeyword();		

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    psByKeyword.keywordSearch(keyword, placesSearchCBByKeyword); 
}

//키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCBByKeyword (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarkerByKeyword (data[i]);    
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarkerByKeyword (place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x) 
    });
    
    // 인포윈도우를 생성합니다
    keywordInfowindow = new daum.maps.InfoWindow({
        content : null,
        removable : true
    });
    
    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
    	keywordInfowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
    	keywordInfowindow.open(map, marker);
    });
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markersByKeyword.push(marker);  // 배열에 생성된 마커를 추가합니다
}

function removeMarkersByKeyword() {
	keywordInfowindow.close();
	for ( var i = 0; i < markersByKeyword.length; i++ ) {
		markersByKeyword[i].setMap(null);
	}   
	markersByKeyword = [];
} 