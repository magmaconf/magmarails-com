$(function() {
  $('.lights').zlayer({mass:15,force:"push",canvas:'#main'});
  $('.floor').zlayer({mass:20,force:"push",confine:"x",canvas:'#main'});
  $('.body').zlayer({mass:50,force:"pull",canvas:'#main'});
  $('.eyes').zlayer({mass:30,force:"pull",canvas:'#main'});
  $('.head').zlayer({mass:80,force:"pull",canvas:'#main'});
  $('.hands').zlayer({mass:30,force:"pull",canvas:'#main'});
  //Delay function
  $.fn.pause = function(duration) {
    $(this).animate({ dummy: 1 }, duration);
    return this;
  };
});

$(document).ready(function () {
	$("h1").pause(1000).fadeIn(1000);
    $("#calltoaction").pause(1400).fadeIn(1000);
    $("#fresh-paint-pic").pause(2000).fadeIn(1000);
    $("#parallax").pause(3000).animate({opacity: '1'},{duration: 1000});
});