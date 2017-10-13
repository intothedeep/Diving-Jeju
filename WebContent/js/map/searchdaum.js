$(document).ready(function() {
  initMap();
});

// $(document).ready(function() {
//   $('#keywordbtn').click(function(event) {
//     searchByKeyword($('#keyword').val());
//   });
//   $('#keyword').keypress(function(event) {
//     var keypress = event.which;
//     if (keypress === 13) {
//       searchByKeyword($('#keyword').val());
//     }
//   });
// });

var jeju;
jeju = new daum.maps.LatLng(33.380701, 126.570667);

var mapContainer;
var mapOption;

var map;

function initMap() {
  mapContainer = document.getElementById('map');
  mapOption = {
          center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
          level: 9 // 지도의 확대 레벨
      };
  map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  map.setCenter(jeju);
  map.setKeyboardShortcuts(true);

  // addStyledDrawingPolyline();
  searchKeywordByCategory();
}

//addStyledDrawingPolyline
var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
var clickLine; // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

//
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay;
var contentNode; // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
var markers; // 마커를 담을 배열입니다
var currCategory; // 현재 선택된 카테고리를 가지고 있을 변수입니다
var ps;

//키워드 서치
var keywordInfowindow = new daum.maps.InfoWindow({
    content : null,
    removable : true
});
var psByKeyword;
var markersByKeyword = [];

//사용자 정의 인포윈도우 오버레이
var overlay

//내 위치 구하기
var myLat;
var myLon;
var mySpot;

//게스트하우스 리스트 표시하기
var geocoder = new daum.maps.services.Geocoder();
var guesthouseMarkers = [];
var guesthouseInfowindow;