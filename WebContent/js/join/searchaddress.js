$(document).ready(function() {

  $('input').keypress(function(event) {
    if(event.which == 13 || event.keyCode == 13) {
      if ($(this).val().length === 0) {
        alert('123');
      } else {
        searchaddress();
      }
    }
  });

  $('input').focus();

  $('input').focusout(function(event) {

    if ($(this).val().length === 0) {
      $(this).parent().addClass('has-error');
      $(this).parentsUntil('form-group').find('.errormsg').css('display', 'block');
    } else {
      $(this).parent().removeClass('has-error');
      $(this).parentsUntil('form-group').find('.errormsg').css('display', 'none');
    }

  });

  $('input').focusin(function(event) {
    $(this).parent().removeClass('has-error');
  });

  $('li').click(function(event) {

    $('.errormsg').css('display', 'none');
    $('input').parent().removeClass('has-error');
    $('input').val('');

    $('li').removeClass('active');
    $(this).addClass('active');

    if ($(this).text().trim() === "지번 주소".trim()) {

      $('div.jibun').css('display', 'block');
      $('div.doro').css('display', 'none');

    } else {

      $('div.jibun').css('display', 'none');
      $('div.doro').css('display', 'block');

    }
  });

});
