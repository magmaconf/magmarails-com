$(document).ready ->

  $(window).scroll ->

    scrollPosition = $(@).scrollTop() + 60
    elements = ['#days', '#opening']

    if 7476 <= scrollPosition <= 8925
      $('#days').addClass('fixed')
      $('#opening').addClass('fixed')
    else
      $('#days').removeClass('fixed')
      $('#opening').removeClass('fixed')


  $('#left-arrow').css('background-image', 'none')

  $('#left-arrow').click ->
    $('#right-arrow').css('background-image', '')
    if $('#friday').hasClass('active')
      $('#thursday').addClass('active')
      $('#friday').removeClass('active')
    else if $('#thursday').hasClass('active')
      $('#left-arrow').css('background-image', 'none')
      $('#wednesday').addClass('active')
      $('#thursday').removeClass('active')

  $('#right-arrow').click ->
    $('#left-arrow').css('background-image', '')
    if $('#wednesday').hasClass('active')
      $('#thursday').addClass('active')
      $('#wednesday').removeClass('active')
    else
      $('#right-arrow').css('background-image', 'none')
      $('#friday').addClass('active')
      $('#thursday').removeClass('active')