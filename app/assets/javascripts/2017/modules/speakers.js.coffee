$ ->
  $('.accordion-heading').on 'touchend, click', ->
    $('.accordion-heading').removeClass('active')
    $('.accordion-body').slideUp()
    $('.accordion-heading p').show()

    if !$(this).next().is(':visible')
      $(this).addClass('active')
      $(this).next().slideDown()
      $(this).find('p').hide()


  $('.more').on 'click', ->
    speakerBox = $($(event.target).parents('.speaker-box')[0] or $(event.target).parents('.speaker-box-large')[0])
    if !speakerBox.hasClass('flipped')
      $('.flipped').removeClass 'flipped'
    speakerBox.toggleClass 'flipped'

  $('.speaker-box').on 'click', ->
    if !$(this).hasClass('flipped')
      $('.flipped').removeClass 'flipped'
    $(this).toggleClass 'flipped'

  $('.close-icon').on 'click', (event) ->
    $(this).parent().parent().parent().removeClass('flipped');
