isMobile = ->
  $(window).width() < 768

$(document).ready ->
  # Popup
  $('.open-popup').click (e) ->
    e.preventDefault()
    $('#policy').slideToggle()
    $("body").scrollTop(0)
    if isMobile()
      $("#btn-menu").click()

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

  $('.close-policie').click (e) ->
    closePopup()
