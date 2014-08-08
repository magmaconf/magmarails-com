$ ->
  $('.accordion-heading').on 'touchend, click', ->
    $('.accordion-heading').removeClass('active')
    $('.accordion-body').slideUp()
    $('.accordion-heading p').show()

    if !$(this).next().is(':visible')
      $(this).addClass('active')
      $(this).next().slideDown()
      $(this).find('p').hide()
