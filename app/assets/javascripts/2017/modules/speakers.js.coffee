$ ->
  $('.accordion-heading').on 'touchend, click', ->
    $('.accordion-heading').removeClass('active')
    $('.accordion-body').slideUp()
    $('.accordion-heading p').show()

    if !$(this).next().is(':visible')
      $(this).addClass('active')
      $(this).next().slideDown()
      $(this).find('p').hide()


  $('.more').on 'click', (event) ->
    speakerBox = $($(event.target).parents('.speaker-box')[0] || $(event.target).parents('.speaker-box-large')[0])
    if !speakerBox.hasClass('flipped')
      $('.flipped').removeClass('flipped')
    speakerBox.toggleClass('flipped')


