$(document).ready ->

  $(window).scroll ->

    scrollPosition = $(@).scrollTop()
    screenWidth = window.screen.width

    minScroll = 120
    maxScroll = 1500

    if screenWidth <= 640
      scrollPosition+= 31
      maxScroll = 1065

   # if minScroll <= scrollPosition <= maxScroll
   #  $('#schedule .schedule-container').addClass('fixed')
   # else
   #   $('#schedule .schedule-container').removeClass('fixed')


  $('.js-prev-day').css('display', 'none')

  $('.js-prev-day').click ->
    activeDay = $('.active-day')
    activeDay.swiperight()

  $('.js-next-day').click ->
    activeDay = $('.active-day')
    activeDay.swipeleft()

  $('.js-first-day').swipeleft ->
    swipeToLeft(@, '.js-second-day')
    $('.js-prev-day').css('display', 'block')

  $('.js-second-day').swipeleft ->
    swipeToLeft(@, '.js-third-day'  )
    $('.js-next-day').css('display', 'none')

  $('.js-third-day').swiperight ->
    swipeToRight(@, '.js-second-day')
    $('.js-next-day').css('display', 'block')

  $('.js-second-day').swiperight ->
    swipeToRight(@, '.js-first-day')
    $('.js-prev-day').css('display', 'none')

  swipeToLeft = (hide, show) ->
    $(show).addClass('active-day').css('left', '95%')
    $(hide).removeClass('active-day')
    $(hide).animate
      left: '-70%'
    , 300
    $(show).animate
      left: '17%'
    , 200

  swipeToRight = (hide, show) ->
    $(show).addClass('active-day')
    $(hide).removeClass('active-day')
    $(hide).animate
      left: '100%'
    , 300, ->
      $(hide).css('left', '-100%')
    $(show).animate
      left: if show is '.js-first-day' then '0' else '17%'
    , 250
