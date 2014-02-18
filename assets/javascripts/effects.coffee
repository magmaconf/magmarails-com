$(document).ready ->

  height = $(window).height()
  padding = 0
  lst = 0

  $('.arrow').click ->
    $('#home .row').css('padding-bottom', '0')
    $('.sponsors').slideToggle()
    $('.arrow').slideToggle()
    $('.social').slideToggle()
    $('.stay').slideToggle()

  if height > 815
    padding = (height - 739) / 2
    $('#home .row').css('padding', "#{padding}px 0")

  down = (s, max_scroll) ->
    $('#daily').css('margin-top', "-#{s}px") if s < max_scroll

  top = (s) ->
    $('#daily').css('margin-top', "-#{s}px")

    $('.stay:hidden').slideToggle('slow')
    $('.social:hidden').slideToggle('slow')
    $('.arrow:hidden').slideToggle('sow')
    $('.sponsors:hidden').slideToggle('slow')
    $('#home .row').css('padding-bottom', "#{padding}px")

  if $(window).height() > 617 and $(window).width() > 800
    $(window).scroll ->
      max = ($('#daily').height() * 0.05) + $(window).height()
      st = $(@).scrollTop()

      if st > lst then down(st, max) else top(st)
      lst = st

  # Popup
  $('.open_popup').click (e) ->
    e.preventDefault()
    $('#popup').fadeIn()
    $('#policy').slideToggle()

  close_popup = ->
    $('#popup').fadeOut()
    $('#policy').slideToggle()

  $('.close_popup').click (e) ->
    e.preventDefault()
    close_popup()

  $(@).keyup (e) ->
    if (event.which == 27) and ($('#policy').is(':visible'))
	    close_popup()
