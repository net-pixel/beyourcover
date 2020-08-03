$(function(){
  $('#menu').on('click', function () {
    $('#menu').toggleClass('change');
    $('#nav').toggleClass('change');
    $('#menu-bg').toggleClass('change-bg');
    $('.subnav').removeClass('change');
  });

  $('#subnav').mouseover(function(){
    $('.subnav').addClass('change')
  });
  $('.subnav').mouseout(function(){
    $('.subnav').toggleClass('change')
  });
})

