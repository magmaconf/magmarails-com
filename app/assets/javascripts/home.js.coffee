$(document).ready ->
  setMenuHeight()
  put_img()
  window.addEventListener "orientationchange", (->    
    setMenuHeight() && put_img()
  ), false

setMenuHeight = ->
  if $(window).height() > $(window).width() && $(window).width() < 500
    $('.contain-to-grid .row').height(800)
  else
    $('.contain-to-grid .row').height('10px')

put_img = ->
  if $(window).height() > $(window).width() && $(window).width() < 500 && $('.center.columns ul li').size() == 5
    $('.center.columns ul:first-child').prepend('<li class="img_mobile"><img src="assets/mobile/mobile-menu-image.svg" /></li>')