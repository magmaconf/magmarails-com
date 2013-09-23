$(document).ready ->
  $height = $(window).height()

  $('.arrow').click ->
    $('#daily').animate
      'margin-top': '-318px'
    , 500

  if $height > 815
    padding = ($height - 739) / 2
    $('#home .row').css('padding', "#{padding}px 0")
