$(document).ready ->
  ticking = false

  $(window).resize ->
    requestTick()

  requestTick = ->
    if !ticking
      requestAnimationFrame(updateMobileMenu)
      ticking = true

  updateMobileMenu = ->
    if window.innerWidth >= 767
      $('#main-menu').css right: 'initial'
    else
      if isMainMenuOpen()
        $('#main-menu').css right: '0'
      else
        $('#main-menu').css right: '100%'

    ticking = false

  $('#btn-menu').click ->
    toggleMobileMenu()

  toggleMobileMenu = ->
    if isMainMenuOpen()
      hideMobileMenu()
    else
      showMobileMenu()

  isMainMenuOpen = ->
    $('#btn-menu').hasClass('active')

  hideMobileMenu = ->
    $('#main-menu').animate right: '100%'
    $('#btn-menu').removeClass('active')

  showMobileMenu = ->
    $('#main-menu').animate right: 0
    $('#btn-menu').addClass('active')
