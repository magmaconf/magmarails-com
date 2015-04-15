$(document).ready ->
  $('#btn-menu').click ->
    toggleMobileMenu()

  toggleMobileMenu = ->
    if isMainMenuOpen()
      hideMobileMenu()
    else
      showMobileMenu()

  isMainMenuOpen = ->
    $('#main-menu').css('right') is '0px'

  hideMobileMenu = ->
    $('#main-menu').animate right: 640
    $('#btn-menu').removeClass('active')

  showMobileMenu = ->
    $('#main-menu').animate right: 0
    $('#btn-menu').addClass('active')

