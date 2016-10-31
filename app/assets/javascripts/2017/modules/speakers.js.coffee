$ ->
  $('.accordion-heading').on 'touchend, click', ->
    $('.accordion-heading').removeClass('active')
    $('.accordion-body').slideUp()
    $('.accordion-heading p').show()

    if !$(this).next().is(':visible')
      $(this).addClass('active')
      $(this).next().slideDown()
      $(this).find('p').hide()

  $('.normal-box').on 'click', ->
    if !$(this).parent().parent().hasClass('flipped')
      $('.flipped').removeClass 'flipped'
    $(this).parent().parent().toggleClass 'flipped'

  $('.close-icon').on 'click', (event) ->
    $(this).parent().parent().parent().removeClass('flipped');
