$(document).ready ->
  height = $(window).height()

  $('.arrow').click ->
    $('#home .row').css('padding-bottom', '0')
    $('.sponsors').slideToggle()
    $('.arrow').slideToggle()
    $('.social').slideToggle()
    $('.stay').slideToggle()

  if height > 815
    padding = (height - 739) / 2
    $('#home .row').css('padding', "#{padding}px 0")
