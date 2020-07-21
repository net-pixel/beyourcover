$(function(){
  $('#menu').on('click', function () {
    $('#menu').toggleClass('change');
    $('#nav').toggleClass('change');
    $('#menu-bg').toggleClass('change-bg');
    $('.subnav').removeClass('change');
  });

  $('#subnav').on('click', function () {
    $('.subnav').toggleClass('change');
  });

  $('.article-body').on('click', function() {
    $('.subnav').removeClass('change');
  });
  $('.article-body__box').on('click', function() {
    $('.subnav').removeClass('change');
  });
  $('.main_bg').on('click', function() {
    $('.subnav').removeClass('change');
  });
  $('.site-title').on('click', function() {
    $('.subnav').removeClass('change');
  });
})

