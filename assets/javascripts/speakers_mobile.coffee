$(document).ready ->

  $('.accordion-group').click ->
    $('.accordion-group.active').removeClass('active')
    $('.accordion-body').slideUp()
    $(this).find('.accordion-heading p').show()
    $('.accordion-heading p').show()

    if !$(this).find('.accordion-body').is(':visible')
      $(this).addClass('active')
      $(this).find('.accordion-body').slideDown()
      $(this).find('.accordion-heading p').hide()
