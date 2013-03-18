$(document).ready ->
  setMenuHeight()
  window.addEventListener "orientationchange", (->    
    setMenuHeight()
  ), false

setMenuHeight = ->
  if $(window).height() > $(window).width() && $(window).width() < 500
    $('.contain-to-grid .row').height($(window).height() + 'px')
  else
    $('.contain-to-grid .row').height('10px')