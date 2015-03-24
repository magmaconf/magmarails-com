$(document).ready ->

  menuOffset = $(window).width()
  menuHeight = $(document).height()

  isMobileDevice = ->
    menuOffset < 641

  $('#main-menu').css('right': menuOffset, 'height': menuHeight) if isMobileDevice()

  $(window).on "orientationchange", ->
    if isMobileDevice()
      menuOffset = $(window).width()
      menuHeight = $(document).height()
      $('#main-menu').css('right', menuOffset) unless isMainMenuOpen()

  $('#btn-mobile-header').click ->
    showMobileMenu()

  $('#menu').click ->
    showMobileMenu()

  $('#btn-menu').click ->
    hideMobileMenu()

  isMainMenuOpen = ->
    $('#main-menu').css('right') is '0px'

  hideMobileMenu = ->
    $('#main-menu').animate right: menuOffset

  showMobileMenu = ->
    $('#main-menu').animate right: '0'

