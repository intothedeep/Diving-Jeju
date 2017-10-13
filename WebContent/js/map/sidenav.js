// function openNav() {
//     document.getElementById("mySidenav").style.width = "20.2%";
//     document.getElementById("map").style.marginLeft = "20%";
//     document.getElementById("map").style.width = "80%";
// }

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("map").style.marginLeft= "0";
    document.getElementById("map").style.width = "100%";

}

$(document).ready(function() {
  $('#sidenavbtn').click(function(event) {

    var sidnavbtn = $('#sidenavbtn');
    var sidenav = $('#mySidenav');

    if (sidenav.hasClass('expand')) {
      sidnavbtn.removeClass('btn-info').addClass('btn-default');
      $('#mySidenav').css('width', '0').removeClass('expand');
      $('.map_wrap').css('margin-left', '0').css('width', '100%');
    } else {
      sidnavbtn.removeClass('btn-default').addClass('btn-info');
      $('#mySidenav').css('width', '20.2%').addClass('expand');
      $('.map_wrap').css('margin-left', '20%').css('width', '80%');
    }

  });
});
