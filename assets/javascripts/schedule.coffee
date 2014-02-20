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