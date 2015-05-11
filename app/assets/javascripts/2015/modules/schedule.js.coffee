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


  $('#left.arrow').css('background-image', 'none')

  $('#left.arrow').click ->
    activeDay = $('#schedule [class$=active]')
    activeDay.swiperight()

  $('#right.arrow').click ->
    activeDay = $('#schedule [class$=active]')
    activeDay.swipeleft()

  $('.js-first-day').swipeleft ->
    swipeToLeft(@, '.js-second-day')
    $('#left.arrow').css('background-image', '')

  $('.js-second-day').swipeleft ->
    swipeToLeft(@, '.js-third-day'  )
    $('#right.arrow').css('background-image', 'none')

  $('.js-third-day').swiperight ->
    swipeToRight(@, '.js-second-day')
    $('#right.arrow').css('background-image', '')

  $('.js-second-day').swiperight ->
    swipeToRight(@, '.js-first-day')
    $('#left.arrow').css('background-image', 'none')

  swipeToLeft = (hide, show) ->
    $(show).addClass('active').css('left', '95%')
    $(hide).removeClass('active')
    $(hide).animate
      left: '-70%'
    , 300
    $(show).animate
      left: '14.5%'
    , 200

  swipeToRight = (hide, show) ->
    $(show).addClass('active')
    $(hide).removeClass('active')
    $(hide).animate
      left: '100%'
    , 300, ->
      $(hide).css('left', '-100%')
    $(show).animate
      left: if show is '.js-first-day' then '0' else '14.5%'
    , 250
