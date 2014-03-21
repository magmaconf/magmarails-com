$(document).ready ->


  isMobileDevice = ->
    window.screen.width < 641

  offset = window.screen.width
  $('#main-menu').css('right', offset) if isMobileDevice()

  $(window).on "orientationchange", ->
    if isMobileDevice()
      offset += 8
      deactivateTransitions()
      if isMainMenuOpen()
        $('body').css('left', offset)
      else
        $('#main-menu').css('right', offset)

  $('#btn-mobile-header').click ->
    showMobileMenu()

  $('#menu').click ->
    showMobileMenu()

  $('#btn-menu').click ->
    hideMobileMenu()

  isMainMenuOpen = ->
    $('#main-menu').css('right') is '0px'

  hideMobileMenu = ->
    activateTransitions()
    $('body').css
      'left': '0'
      'overflow': 'visible'
    $('#main-menu').css('right', offset)

  showMobileMenu = ->
    activateTransitions()
    $('#main-menu').css('right', '0')
    $('body').css
      'left': offset
      'overflow': 'hidden'

  deactivateTransitions = ->
    $('body').css('transition-duration', '0s')
    $('#main-menu').css('transition-duration', '0s')

  activateTransitions = ->
    $('body').css('transition-duration', '0.3s')
    $('#main-menu').css('transition-duration', '0.3s')

  # Popup
  $('.open-popup').click (e) ->
    e.preventDefault()
    $('#popup').fadeIn()
    $('#policy').slideToggle()

  closePopup = ->
    $('#popup').fadeOut()
    $('#policy').slideToggle()

  $('.close-popup').click (e) ->
    e.preventDefault()
    closePopup()

  $(@).keyup (e) ->
    if (event.which == 27) and ($('#policy').is(':visible'))
      closePopup()

  $('.speaker-box').bind 'touchstart', (ev) ->
    this.classList.toggle('hover')


  $('#getting-to-manzanillo').click ->
    window.location.href = '/getting-to-manzanillo'
