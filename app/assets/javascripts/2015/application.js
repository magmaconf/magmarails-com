// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate
//= require jquery.masonry.min
//= require jquery.fancybox
//= require jquery.fancybox.pack
//= require jquery.inview
//= require jquery.mobile.custom.min
//= require_tree .

$(document).ready(function(){
  var pathname = location.pathname;

  if(pathname == '/') {
    $('#main-menu, #mobile-header, #footer').addClass('index');
  } else if (pathname == '/about') {
    $('#about-magma-link').addClass('active');
  } else if (pathname == '/schedule') {
    $('#schedule-link').addClass('active');
  } else if (pathname == '/speakers') {
    $('#main-menu, #mobile-header, #footer').addClass('speakers');
    $('#speakers-link').addClass('active');
  } else if (pathname == '/sponsors') {
    $('#main-menu, #mobile-header, #footer').addClass('sponsors');
    $('#sponsors-link').addClass('active');
  } else if (pathname == '/gallery') {
    $('#main-menu, #mobile-header, #footer').addClass('gallery');
  }
});
