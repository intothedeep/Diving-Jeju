// map.setMapTypeId(daum.maps.MapTypeId.SKYVIEW);
// map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
// map.setMapTypeId(daum.maps.MapTypeId.HYBRID);

// map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);
// map.addOverlayMapTypeId(daum.maps.MapTypeId.OVERLAY);
// map.addOverlayMapTypeId(daum.maps.MapTypeId.TERRAIN);
// map.addOverlayMapTypeId(daum.maps.MapTypeId.BICYCLE);
// map.addOverlayMapTypeId(daum.maps.MapTypeId.BICYCLE_HYBRID);
// map.addOverlayMapTypeId(daum.maps.MapTypeId.USE_DISTRICT);
// map.removeOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);
$(document).ready(function() {
  //베이스 맵 바꾸기
  $('.baseMap').click(function(event) {

    if ($(this).is('#normalMap')) {
      $('.baseMap').addClass('btn-default').removeClass('btn-info');
      $(this).removeClass('btn-default').addClass('btn-info');
      map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
    } else if ($(this).is('#skyMap')) {
      $('.baseMap').addClass('btn-default').removeClass('btn-info');
      $(this).removeClass('btn-default').addClass('btn-info');
      map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
    }
  });

  //오버레이 맵 꾸미기
  $('.overlayMap').click(function(event) {
    if($(this).is('#bicycle')) {
      if($(this).hasClass('btn-info')) {
        $(this).removeClass('btn-info').addClass('btn-default');
        map.removeOverlayMapTypeId(daum.maps.MapTypeId.BICYCLE);
      } else {
        $(this).removeClass('btn-default').addClass('btn-info');
        map.addOverlayMapTypeId(daum.maps.MapTypeId.BICYCLE);
      }
    } else if ($(this).is('#traffic')) {
      if($(this).hasClass('btn-info')) {
        $(this).removeClass('btn-info').addClass('btn-default');
        map.removeOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);
      } else {
        $(this).removeClass('btn-default').addClass('btn-info');
        map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);
      }
    }
  });

  //로드 뷰 포시하기
  $('#road').click(function(event) {
    if($(this).hasClass('btn-info')) {
      $(this).removeClass('btn-info').addClass('btn-default');
      map.removeOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);
    } else {
      $(this).removeClass('btn-default').addClass('btn-info');
      map.addOverlayMapTypeId(daum.maps.MapTypeId.ROADVIEW);
    }
  });


});
//
// var currentTypeId;
//
// // 버튼이 클릭되면 호출되는 함수입니다
// function setOverlayMapTypeId(maptype) {
//     var changeMaptype;
//
//     // maptype에 따라 지도에 추가할 지도타입을 결정합니다
//     if (maptype === 'traffic') {
//
//         // 교통정보 지도타입
//         changeMaptype = daum.maps.MapTypeId.TRAFFIC;
//
//     } else if (maptype === 'roadview') {
//
//         // 로드뷰 도로정보 지도타입
//         changeMaptype = daum.maps.MapTypeId.ROADVIEW;
//
//     } else if (maptype === 'terrain') {
//
//         // 지형정보 지도타입
//         changeMaptype = daum.maps.MapTypeId.TERRAIN;
//
//     } else if (maptype === 'use_district') {
//
//         // 지적편집도 지도타입
//         changeMaptype = daum.maps.MapTypeId.USE_DISTRICT;
//     }
//
//     // 이미 등록된 지도 타입이 있으면 제거합니다
//     if (currentTypeId) {
//         map.removeOverlayMapTypeId(currentTypeId);
//     }
//
//     // maptype에 해당하는 지도타입을 지도에 추가합니다
//     map.addOverlayMapTypeId(changeMaptype);
//
//     // 지도에 추가된 타입정보를 갱신합니다
//     currentTypeId = changeMaptype;
// }
//
// var mapTypes = {
//     terrain : daum.maps.MapTypeId.TERRAIN,
//     traffic :  daum.maps.MapTypeId.TRAFFIC,
//     bicycle : daum.maps.MapTypeId.BICYCLE,
//     useDistrict : daum.maps.MapTypeId.USE_DISTRICT
// };
//
// // 체크 박스를 선택하면 호출되는 함수입니다
// function setOverlayMapTypeId() {
//     var chkTerrain = document.getElementById('chkTerrain'),
//         chkTraffic = document.getElementById('chkTraffic'),
//         chkBicycle = document.getElementById('chkBicycle'),
//         chkUseDistrict = document.getElementById('chkUseDistrict');
//
//     // 지도 타입을 제거합니다
//     for (var type in mapTypes) {
//         map.removeOverlayMapTypeId(mapTypes[type]);
//     }
//
//     // 지적편집도정보 체크박스가 체크되어있으면 지도에 지적편집도정보 지도타입을 추가합니다
//     if (chkUseDistrict.checked) {
//         map.addOverlayMapTypeId(mapTypes.useDistrict);
//     }
//
//     // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
//     if (chkTerrain.checked) {
//         map.addOverlayMapTypeId(mapTypes.terrain);
//     }
//
//     // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
//     if (chkTraffic.checked) {
//         map.addOverlayMapTypeId(mapTypes.traffic);
//     }
//
//     // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
//     if (chkBicycle.checked) {
//         map.addOverlayMapTypeId(mapTypes.bicycle);
//     }
//
// }
