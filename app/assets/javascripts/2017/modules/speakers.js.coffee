$ ->
  $('.accordion-heading').on 'touchstart, click', ->
    $('.accordion-heading').removeClass('active')
    $('.accordion-body').slideUp()
    $('.accordion-heading p').show()

    if !$(this).next().is(':visible')
      $(this).addClass('active')
      $(this).next().slideDown()
      $(this).find('p').hide()

  $('.normal-box').on 'click', ->
    if !$(this).hasClass('no-bio')
      if !$(this).parent().parent().hasClass('flipped')
        $('.flipped').removeClass 'flipped'
      $(this).parent().parent().toggleClass 'flipped'

  $('.close-icon').on 'click', (event) ->
    $(this).parent().parent().parent().removeClass('flipped');
  
  $('.no-bio').on 'mouseenter', (event) ->
    $(this).css('cursor', 'default')
    image = $(this).find('.speaker-img')
    $(image).css('cursor', 'default')
