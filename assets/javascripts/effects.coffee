$(document).ready ->
  $('#main-menu a').smoothScroll({offset: -110, exclude: ['a.schedule-link']});
  $('a.schedule-link').smoothScroll({offset: 120});

  $('span#magma-logo').click ->
    $.smoothScroll ->
      scrollElement: $('body'),
      scrollTarget: '#main-section'
    return false;

  height = $(window).height()
  padding = 0
  lst = 0

  $(window).scroll ->
    scrollPosition = $(@).scrollTop()

    if scrollPosition >= 7500 and scrollPosition <= 8886
      $('#schedule #days').addClass('fixed')
    else
      $('#schedule #days').removeClass('fixed')

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

  $('.speaker-box').bind 'touchstart', (ev) ->
    this.classList.toggle('hover')
