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
      $('body').css('position', 'auto')
    else
      if isMainMenuOpen()
        $('#main-menu').css right: '12px'
        $('body').css('position', 'fixed')
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
    $('body').css('position', 'auto')
    $("#main-menu").css('overflow-y', 'initial')

  showMobileMenu = ->
    $('#main-menu').animate right: 12
    $('body').css('position', 'fixed')
    $('#btn-menu').addClass('active')
    $("#main-menu").css('overflow-y', 'auto')
