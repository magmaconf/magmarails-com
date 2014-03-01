$(document).ready ->

  $('.accordion-group').click ->
    $(this).find('.accordion-body').slideToggle()
