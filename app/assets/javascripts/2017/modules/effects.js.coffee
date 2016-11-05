$(document).ready ->
  # Popup
  $('.open-popup').click (e) ->
    e.preventDefault()
    $('#policy').slideToggle()
    $("body").scrollTop(0)

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

