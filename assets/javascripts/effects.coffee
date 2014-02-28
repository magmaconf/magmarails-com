$(document).ready ->

  $('#btn-mobile-header').click ->
    showMobileMenu()

  $('#menu').click ->
    showMobileMenu()

  $('#btn-menu').click ->
    hideMobileMenu()

  hideMobileMenu = ->
    $('body').css
      'left': '0'
      'overflow': 'visible'
    $('#main-menu').css('right', '700px')

  showMobileMenu = ->
    $('#main-menu').css('right', '0')
    $('body').css
      'left': '700px'
      'overflow': 'hidden'

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
