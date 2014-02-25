$(document).ready ->

  $('#btn-menu').click ->
    $('#main-menu .toggle').toggleClass('hidden')
    $('#main-menu ul').toggleClass('hidden')

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
