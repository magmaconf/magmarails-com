$(document).ready ->

  $('.accordion-group').click ->
    $('.accordion-group.active').removeClass('active')
    $(this).addClass('active')

    $('.accordion-body').slideUp()

    if !$(this).find('.accordion-body').is(':visible')
      $(this).find('.accordion-body').slideDown()
