$(document).ready(function() {
  $('#mySpot').click(function(event) {
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            myLat = position.coords.latitude;
            myLon = position.coords.longitude;

            mySpot = new daum.maps.LatLng(myLat, myLon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(mySpot, message);

          });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new daum.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }


  });

});




// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(mySpot, message) {

  var imageSrc = '../img/pin_default.png', // 마커이미지의 주소입니다
      imageSize = new daum.maps.Size(30, 50), // 마커이미지의 크기입니다
      imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

  // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
  var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);

  mySpot = new daum.maps.LatLng(myLat, myLon);

  var mySpotMarker = new daum.maps.Marker({
      map: map,
      position: mySpot,
      image: markerImage
  });

  // daum.maps.event.addListener(mySpotMarker, 'click', function() {
  //     alert('마커 오버레이 넣어야 함');
  // });

  var iwContent = message, // 인포윈도우에 표시할 내용
      iwRemoveable = true;

  // 인포윈도우를 생성합니다
  var mySpotInfowindow = new daum.maps.InfoWindow({
      content : iwContent,
      removable : iwRemoveable
  });

  // 인포윈도우를 마커위에 표시합니다
  mySpotInfowindow.open(map, mySpotMarker);

  // 지도 중심좌표를 접속위치로 변경합니다
  map.setCenter(mySpot);

  if($('#mySpot').hasClass('btn-info')) {
    $('#mySpot').removeClass('btn-info').addClass('btn-default');
    mySpotMarker.setMap(null);

  } else {
    $('#mySpot').removeClass('btn-default').addClass('btn-info');
    map.setCenter(mySpot);
    mySpotMarker.setMap(map);
  }
}
